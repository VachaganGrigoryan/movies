import json
import re

import requests
from pathlib import Path
from bs4 import BeautifulSoup

import logging

from scraper.datamodel import MovieData, PeopleData

logging.basicConfig(format="Datetime :: %(asctime)s %(message)s", level=logging.INFO)

BASE_URL = 'https://www.imdb.com'


class LookUpIMDB:

    def __init__(self, url: str, local_path: str = './scraper/html/imdb'):
        self.base_url = url
        self.local_path = local_path
        Path(f"{local_path}/category").mkdir(parents=True, exist_ok=True)
        Path(f"{local_path}/films").mkdir(parents=True, exist_ok=True)
        Path(f"{local_path}/videos").mkdir(parents=True, exist_ok=True)
        Path(f"{local_path}/people").mkdir(parents=True, exist_ok=True)

    def look_up_category(self):
        for category in self.scrap_category(self._fetch_(self.base_url, 'film-lists')):
            yield category

    def look_up_films(self, imdb_url, local_path):
        for film in self.scrap_films(self._fetch_(f'{self.base_url}{imdb_url}', local_path)):
            yield film

    def look_up_film(self, other: MovieData, imdb_url, imdb_id):
        return self.scrap_film(other, self._fetch_(f'{self.base_url}{imdb_url}', f"films/{imdb_id}"))

    def look_up_video(self, other: MovieData, imdb_url):
        imdb_id = imdb_url.split('?')[0].replace('/video/imdb/', '')
        return self.scrap_video(other, self._fetch_(f'{self.base_url}{imdb_url}', f"videos/{imdb_id}"))

    def look_up_people(self, other: PeopleData, imdb_url, imdb_id):
        return self.scrap_people(other, self._fetch_(f'{self.base_url}{imdb_url}', f'people/{imdb_id}'))

    def _fetch_(self, url: str, local: str = ''):
        logging.info(f'Request: {url}')
        response = requests.get(
            url,
            headers={
                'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36'
            },
        )
        response.raise_for_status()
        logging.info(f"Response Status Code: {response.status_code}")

        with open(Path(f'{self.local_path}/{local}.html'), mode='wb') as html:
            html.write(response.content)

        return response.text

    def scrap_category(self, html: str):
        bs = BeautifulSoup(html, features="lxml")
        for link in bs.select_one('span>div>div>ul').find_all('a', {'class': "ipc-list__item"}):
            if '/chart/' in link.get('href'):
                imdb_url = link.get('href')
                yield {
                    'title': link.text.strip(),
                    'imdb_url': imdb_url,
                    'films': self.look_up_films(imdb_url, f"category/{imdb_url.split('?')[0].replace('/', '__')}")
                }

    def scrap_films(self, html: str):
        bs = BeautifulSoup(html, features="lxml")
        for tr in bs.find('tbody').find_all('tr'):  # , {'class': 'lister-list'}
            poster_td = tr.find('td', {'class': 'posterColumn'})
            title_td = tr.find('td', {'class': 'titleColumn'})
            rating_td = tr.find('td', {'class': 'ratingColumn'})
            imdb_url = title_td.a.get('href').split('/?')[0]
            imdb_id = imdb_url.replace('/title/', '')
            img = poster_td.find('img').get('src')

            yield MovieData(
                title=title_td.a.get_text(),
                imdb_id=imdb_id,
                imdb_url=imdb_url,
                avatar=f'{img.split("._V1_")[0]}._V1_FMjpg_UX1000_.jpg',
                look_up_func=self.look_up_film
            )

    def scrap_film(self, other: MovieData, html: str):
        bs = BeautifulSoup(html, features="lxml")
        overview_widget = bs.find('div', {'id': 'title-overview-widget'})
        title_block = overview_widget.find('div', {'class': 'title_block'})

        h1 = title_block.find('h1')
        if h1:
            other.title = h1.get_text().strip()

        subtext = title_block.find('div', {'class': 'subtext'})
        if subtext:
            other.runtime = subtext.time.get_text().strip()

            a = subtext.find_all('a')
            if a:
                other.genres = [link.get_text().strip() for link in a[:-1]]
                other.year = a[-1].get_text().strip()

        rating_value = title_block.find('div', {'class': 'ratingValue'})
        if rating_value:
            other.rating = rating_value.strong.get('title')

        plot_summary = overview_widget.find('div', {'class': 'plot_summary'})
        if plot_summary:
            people = plot_summary.find_all('div', {'class': 'credit_summary_item'})
            if people:
                other.directors = list(self.scrap_peoples(people[0]))
                other.writers = list(self.scrap_peoples(people[1]))
                other.artists = list(self.scrap_peoples(people[2]))

        story_line = bs.find('div', {'id': 'titleStoryLine'})
        if story_line:
            other.description = story_line.find('div', {'class': 'inline canwrap'}).get_text().strip()

        details = {}
        for div in bs.find('div', {'id': 'titleDetails'}).find_all('div', {'class': 'txt-block'}):
            detail = div.get_text()
            if ':' in detail:
                key, value = detail.split(':', 1)
                details[key.strip()] = value.strip()

        other.countries = details.get('Country', '').split('|')
        other.original_lang = details.get('Language')
        other.production_co = details.get('Production Co', '').replace('\nSee more\xa0»', '')

        img = bs.find('div', {'id': 'titleImageStrip'})
        if img:
            other.photos = [f'{i.get("src").split("._V1_")[0]}._V1_FMjpg_UX1000_.jpg' for i in img.find_all('img')]

        slate_wrapper = overview_widget.find('div', {'class': 'slate_wrapper'})
        if slate_wrapper:
            video_imdb_url = slate_wrapper.find('div', {'class': 'slate'}).a.get('href')
            self.look_up_video(other, video_imdb_url)

        return other

    def scrap_peoples(self, bs: BeautifulSoup):
        for link in bs.find_all('a'):
            if 'name' in link.get('href'):
                imdb_url = link.get('href').split('/?')[0]
                imdb_id = imdb_url.replace('/name/', '')
                yield PeopleData(
                    imdb_id=imdb_id,
                    imdb_url=imdb_url,
                    full_name=link.get_text(),
                    look_up_func=self.look_up_people
                )

    @staticmethod
    def scrap_people(other: PeopleData, html: str):
        bs = BeautifulSoup(html, features="lxml")
        overview_widget = bs.find('div', {'id': 'name-overview-widget'})
        tbody = overview_widget.find('table', {'id': 'name-overview-widget-layout'})

        full_name = tbody.find('h1')
        if full_name:
            other.full_name = full_name.get_text()

        info_bar = tbody.find('div', {'class': 'infobar'}).find_all('a')
        other.job_categories = [link.get_text().strip() for link in info_bar]

        img = tbody.find('img', {'id': 'name-poster'})
        if img:
            other.avatar = f'{img.get("src").split("._V1_")[0]}._V1_FMjpg_UX1000_.jpg'

        bio = tbody.find('div', {'id': "name-bio-text"})
        if bio:
            other.bio = bio.get_text().replace('\nSee full bio »', '').strip()

        born_info = tbody.find('div', {'id': 'name-born-info'})
        if born_info:
            other.born_info = ' '.join(map(str.strip, born_info.get_text().strip().split('\n')))

        death_info = tbody.find('div', {'id': 'name-death-info'})
        if death_info:
            other.death_info = ' '.join(map(str.strip, death_info.get_text().strip().split('\n')))

        return other

    @staticmethod
    def scrap_video(other: MovieData, html: str):
        soup = BeautifulSoup(html, features="lxml")

        video_match = re.findall(
            'https://imdb-video.media-imdb.com/[^\\\]+mp4[^\\\]+',
            ''.join(map(str, soup.find_all('script', type='text/javascript')))
        )
        if video_match:
            other.trailer = video_match[0].strip()

        return other

if __name__ == '__main__':
    service = LookUpIMDB(BASE_URL, local_path='./html/imdb')
    #
    # for category in service.look_up_category():
    #     for film in category.get('films'):
    #         film.look_up()
    #         print(film)

    # print(json.dumps(service.film_lists, indent=True))

    # print(json.dumps(service.movies, indent=True))

    # scraper = IMDBScraper()
    # # # # html = ''
    with open(Path('./html/imdb/videos/vi3102711321.html'), mode='r') as html:
        print(service.scrap_video(1, html.read()))
