
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

        self.movies = ({
            **category,
            'films': self.scraper.get_films(
                self._fetch_(f'{self.base_url}{category["link"]}', category['link'].replace('/', ''))
            )
        } for category in self.film_lists)

    def _fetch_(self, url: str, local: str = ''):
        logging.info(f'Request: {url}')
        while True:
            try:
                logging.info(f'Proxy IP: {self.proxy}')
                response = requests.get(
                    url,
                    headers={'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36'},
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


class IMDBScraper:

    def __init__(self):
        pass

    def get_film_lists(self, html: str):
        # print(html)
        bs = BeautifulSoup(html, features="lxml")
        # print([link.get('href') for link in bs.find_all('a', {'class': "ipc-list__item"})])
        return [
            {
                'title': link.text.strip(),
                'link': link.get('href')
            } for link in bs.select_one('span>div>div>ul').find_all('a', {'class': "ipc-list__item"})
            if '/chart/' in link.get('href')
        ]

    def get_films(self, html: str):
        bs = BeautifulSoup(html, features="lxml")
        res = []
        for tr in bs.find('tbody', {'class': 'lister-list'}).find_all('tr'):
            poster_td= tr.find('td', {'class': 'posterColumn'})
            title_td = tr.find('td', {'class': 'titleColumn'})
            rating_td = tr.find('td', {'class': 'ratingColumn'})

            res.append({
                'url': title_td.a.get('href'),
                'title': title_td.a.get_text(),
                'rating': rating_td.get_text().strip()
            })
        return res




if __name__ == '__main__':
    # service = LookUpIMDB(BASE_URL)

    # print(json.dumps(service.film_lists, indent=True))

    # print(json.dumps(list(service.movies), indent=True))

    scraper = IMDBScraper()
    # # html = ''
    with open(Path('./html/imdb/chartmoviemeter?ref_=nv_mv_mpm.html'), mode='r') as html:
        print(json.dumps(list(scraper.get_films(html.read())), indent=True, ensure_ascii=False))


