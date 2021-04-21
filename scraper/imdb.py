import json
import logging
from itertools import cycle

import requests
from pathlib import Path
from bs4 import BeautifulSoup

from proxy import proxies

logging.basicConfig(format="Datetime :: %(asctime)s %(message)s", level=logging.INFO)

BASE_URL = 'https://www.imdb.com'
proxy_pool = cycle(proxies)


class LookUpIMDB:

    def __init__(self, url: str, local_path: str = './html/imdb'):
        self.base_url = url
        self.local_path = local_path
        self.proxy = next(proxy_pool)
        self.scraper = IMDBScraper()
        # self.categories = [
        #     {'title': 'Top Box Office (US)', 'link': 'chart/boxoffice/'},
        #     {'title': 'Most Popular Movies', 'link': 'chart/moviemeter'},
        #     {'title': 'Top Rated Movies', 'link': 'chart/top'},
        #     {'title': 'Top Rated English Movies', 'link': 'chart/top-english-movies'},
        #     {'title': 'Most Popular TV Shows', 'link': 'chart/tvmeter'},
        #     {'title': 'Top Rated TV Shows', 'link': 'chart/toptv'},
        #     {'title': 'Top Rated Indian Movies', 'link': 'india/top-rated-indian-movies'},
        #     {'title': 'Lowest Rated Movies', 'link': 'chart/bottom'},
        # ]
        self.film_lists = self.scraper.get_film_lists(self._fetch_(self.base_url, 'film-lists'))

        # self.movies = ({
        #     **category,
        #     'films': self.scraper.get_films(
        #         self._fetch_(f'{self.base_url}{category["link"]}', category['link'].split('?')[0].replace('/', '--'))
        #     )
        # } for category in self.film_lists)

    def look_up_category(self):
        def look_up_films(url, local_path):
            Path(f"{self.local_path}/films").mkdir(parents=True, exist_ok=True)
            for film in self.scraper.get_films(self._fetch_(url, local_path)):
                film_url = f'{self.base_url}{film["url"]}'
                film_local_path = f"films/{film['title']}"
                yield self.scraper.get_film(self._fetch_(film_url, film_local_path))

        Path(f"{self.local_path}/category").mkdir(parents=True, exist_ok=True)
        for category in self.film_lists:
            url = f'{self.base_url}{category["link"]}'
            local_path = f"category/{category['link'].split('?')[0].replace('/', '--')}"
            yield {
                **category,
                'films': look_up_films(url, local_path)
            }

    def _fetch_(self, url: str, local: str = ''):
        logging.info(f'Request: {url}')
        while True:
            try:
                logging.info(f'Proxy IP: {self.proxy}')
                response = requests.get(
                    url,
                    headers={
                        'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36'},
                    proxies={"http": self.proxy, "https": self.proxy}
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


class IMDBScraper:

    def __init__(self):
        pass

    def get_film_lists(self, html: str):
        # print(html)
        bs = BeautifulSoup(html, features="lxml")
        # print([link.get('href') for link in bs.find_all('a', {'class': "ipc-list__item"})])
        for link in bs.select_one('span>div>div>ul').find_all('a', {'class': "ipc-list__item"}):
            if '/chart/' in link.get('href'):
                yield {
                    'title': link.text.strip(),
                    'link': link.get('href')
                }

    def get_films(self, html: str):
        bs = BeautifulSoup(html, features="lxml")
        for tr in bs.find('tbody').find_all('tr'):  # , {'class': 'lister-list'}
            poster_td = tr.find('td', {'class': 'posterColumn'})
            title_td = tr.find('td', {'class': 'titleColumn'})
            rating_td = tr.find('td', {'class': 'ratingColumn'})

            yield {
                'title': title_td.a.get_text(),
                'url': title_td.a.get('href'),
                # 'year': title_td.span.get_text(),
                # 'rating': rating_td.get_text().strip()
            }

    def get_film(self, html: str):
        bs = BeautifulSoup(html, features="lxml")
        title_block = bs.find('div', {'id': 'title-overview-widget'}).find('div', {'class': 'title_block'})

        h1 = title_block.find('h1')
        subtext = title_block.find('div', {'class': 'subtext'})
        a = subtext.find_all('a')
        ratingValue = title_block.find('div', {'class': 'ratingValue'})

        return {
            'title': h1.get_text().strip(),
            'runtime': subtext.time.get_text().strip(),
            'genres': a[0].get_text().strip(),
            'year': a[1].get_text().strip(),  # h1.span.a.get_text(),
            'rating': ratingValue.strong.get('title')
        }

        # return {
        #     'title': title_td.a.get_text(),
        #     'url': title_td.a.get('href'),
        #     # 'year': title_td.span.get_text(),
        #     # 'rating': rating_td.get_text().strip()
        # }


if __name__ == '__main__':
    service = LookUpIMDB(BASE_URL)

    for category in service.look_up_category():
        for film in category.get('films'):
            print(film)

    # print(json.dumps(service.film_lists, indent=True))

    # print(json.dumps(service.movies, indent=True))

    # scraper = IMDBScraper()
    # # # # html = ''
    # with open(Path('./html/imdb/films/The Shawshank Redemption.html'), mode='r') as html:
    #     print(json.dumps(scraper.get_film(html.read()), indent=4, ensure_ascii=False))
