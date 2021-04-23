import json
import logging
from itertools import cycle

import requests
from pathlib import Path
from bs4 import BeautifulSoup

from scraper.proxy import proxies

logging.basicConfig(format="Datetime :: %(asctime)s %(message)s", level=logging.INFO)

BASE_URL = 'https://www.imdb.com'
proxy_pool = cycle(proxies)


class LookUpIMDB:

    def __init__(self, url: str, local_path: str = './scraper/html/imdb'):
        self.base_url = url
        self.local_path = local_path
        self.proxy = next(proxy_pool)

        # self.film_lists = self.scrap_film_lists(self._fetch_(self.base_url, 'film-lists'))

    def look_up_category(self):
        Path(f"{self.local_path}/category").mkdir(parents=True, exist_ok=True)
        for category in self.scrap_category(self._fetch_(self.base_url, 'film-lists')):
            yield category

    def look_up_films(self, url, local_path):
        Path(f"{self.local_path}/films").mkdir(parents=True, exist_ok=True)
        for film in self.scrap_films(self._fetch_(f'{self.base_url}{url}', local_path)):
            yield film

    # def look_up_video(self, url):
    #     Path(f"{self.local_path}/videos").mkdir(parents=True, exist_ok=True)
    #     video_local = f"videos/{url.split('?')[0].replace('/video/imdb/', '')}"
    #     return self._fetch_(f'{self.base_url}{url}', video_local)

    def look_up_people(self, url, local_path):
        Path(f"{self.local_path}/people").mkdir(parents=True, exist_ok=True)
        return self.scrap_people(self._fetch_(f'{self.base_url}{url}', local_path))

    def _fetch_(self, url: str, local: str = ''):
        logging.info(f'Request: {url}')
        while True:
            try:
                logging.info(f'Proxy IP: {self.proxy}')
                response = requests.get(
                    url,
                    headers={
                        'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36'},
                    # proxies={"http": self.proxy, "https": self.proxy}
                )
            except:
                logging.info(f"Connection error: Skipping... {self.proxy} IP.")
                self.proxy = next(proxy_pool)
            else:
                logging.info(f"Response Status Code: {response.status_code}")

                if 'CAPTCHA' in response.text or 'captcha' in response.text or 'CheckboxCaptcha' in response.text:
                    logging.info(f"Captcha is activated: Skipping... {self.proxy} IP.")
                    self.proxy = next(proxy_pool)
                    continue

                Path(self.local_path).mkdir(parents=True, exist_ok=True)
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

            yield {
                'title': title_td.a.get_text(),
                'imdb_url': imdb_url,
                'imdb_id': imdb_id,
                'avatar': f'{img.split("._V1_")[0]}._V1_FMjpg_UX1000_.jpg',
                **self.scrap_film(self._fetch_(f'{self.base_url}{imdb_url}', f"films/{imdb_id}"))
            }

    def scrap_film(self, html: str):
        bs = BeautifulSoup(html, features="lxml")
        overview_widget = bs.find('div', {'id': 'title-overview-widget'})

        title_block = overview_widget.find('div', {'class': 'title_block'})
        h1 = title_block.find('h1')
        subtext = title_block.find('div', {'class': 'subtext'})
        a = subtext.find_all('a')
        ratingValue = title_block.find('div', {'class': 'ratingValue'})

        slate_wrapper = overview_widget.find('div', {'class': 'slate_wrapper'})
        video_imdb_url = slate_wrapper.find('div', {'class': 'slate'}).a.get('href')

        # video_html = self.look_up_video(video_imdb_url)
        # bs_video = BeautifulSoup(video_html, features='lxml')
        #
        # video = bs_video.find('video', {'class': 'jw-video'}).get('src')

        plot_summary = overview_widget.find('div', {'class': 'plot_summary'})

        people = plot_summary.find_all('div', {'class': 'credit_summary_item'})

        def get_people(bs):
            for link in bs.find_all('a'):
                if 'name' in link.get('href'):
                    imdb_url = link.get('href').split('/?')[0]
                    imdb_id = imdb_url.replace('/name/', '')
                    yield {
                        'imdb_url': imdb_url,
                        'imdb_id': imdb_id,
                        'full_name': link.get_text(),
                        '_func': lambda: self.look_up_people(imdb_url, f'people/{imdb_id}')
                    }
        details = {}
        for div in bs.find('div', {'id': 'titleDetails'}).find_all('div', {'class': 'txt-block'}):
            detail = div.get_text()
            if ':' in detail:
                key, value = detail.split(':', 1)
                details[key.strip()] = value.strip()

        images = bs.find('div', {'id': 'titleImageStrip'})

        return {
            'title': h1.get_text().strip(),
            'runtime': subtext.time.get_text().strip(),
            'genres': [link.get_text().strip() for link in a[:-1]],
            'year': a[-1].get_text().strip(),  # h1.span.a.get_text(),
            'rating': ratingValue.strong.get('title'),
            'description': plot_summary.find('div', {'class': 'summary_text'}).get_text().strip(),
            'directors': list(get_people(people[0])),
            'writers': list(get_people(people[1])),
            'artists': list(get_people(people[2])),
            # 'trailer': video,
            'photos': [f'{img.get("src").split("._V1_")[0]}._V1_FMjpg_UX1000_.jpg' for img in images.find_all('img')],
            'countries': details.get('Country', '').split('|'),
            'original_lang': details.get('Language'),
            'production_co': details.get('Production Co', '').replace('\nSee more\xa0»', ''),
        }

    def scrap_people(self, html: str):
        bs = BeautifulSoup(html, features="lxml")

        overview_widget = bs.find('div', {'class': 'name-overview-widget'})
        tbody = overview_widget.find('table', {'id': 'name-overview-widget-layout'}).find_all('tr')

        full_name = tbody[0].find('h1').get_text()
        infobar = tbody[0].find('div', {'class': 'infobar'}).find_all('a')
        avatar = tbody[1].find('img', {'id': 'name-poster'}).get('src')
        bio = tbody[2].find_all('div') or []

        return {
            'full_name': full_name,
            'job_categories': [link.get_text().strip() for link in infobar],
            'avatar': f'{avatar.split("._V1_")[0]}._V1_FMjpg_UX1000_.jpg',
            'bio': ''.join(map(str, bio)),
        }


if __name__ == '__main__':
    service = LookUpIMDB(BASE_URL, local_path='./html/imdb')

    for category in service.look_up_category():
        for film in category.get('films'):
            print(json.dumps(film, indent=4, ensure_ascii=False))

    # print(json.dumps(service.film_lists, indent=True))

    # print(json.dumps(service.movies, indent=True))

    # scraper = IMDBScraper()
    # # # # html = ''
    # with open(Path('./html/imdb/people/nm0001104.html'), mode='r') as html:
    #     print(json.dumps(service.scrap_people(html.read()), indent=4, ensure_ascii=False))

