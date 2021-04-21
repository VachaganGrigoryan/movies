
import json
import logging
from itertools import cycle

import requests
from pathlib import Path
from bs4 import BeautifulSoup, SoupStrainer

from proxy import proxies

logging.basicConfig(format="Datetime :: %(asctime)s %(message)s", level=logging.INFO)


BASE_URL = 'https://www.kinopoisk.ru/'
proxy_pool = cycle(proxies)


class LookUpKinoPoisk:

    def __init__(self, url: str, local_path: str = './html/kinopoisk'):
        self.base_url = url
        self.local_path = local_path
        self.proxy = next(proxy_pool)
        self.scraper = KinoPoiskScraper()
        self.film_lists = self.scraper.get_film_lists(self._fetch_(f'{self.base_url}lists/films/', 'film-lists'))

    def _fetch_(self, url: str, local: str = ''):
        logging.info(f'Request: {url}')
        while True:
            try:
                logging.info(f'Proxy IP: {self.proxy}')
                response = requests.get(
                    url,
                    headers={'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36'},
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


class KinoPoiskScraper:

    def __init__(self):
        pass

    def get_film_lists(self, html: str):
        print(html)
        bs = BeautifulSoup(html, features="lxml")
        print(bs.find('div', {"class": "film-lists__content"}))
        return [
            {
                'title': link.text.strip(),
                'link': link.get('href')
            } for link in bs.find('div', {"class": "film-lists__content"}).div.find_all('a', {'class': "film-lists-item"})
        ]


if __name__ == '__main__':
    service = LookUpKinoPoisk(BASE_URL)

    print(json.dumps(service.film_lists, indent=True))

    # scraper = KinoPoiskScraper()
    # html = ''
    # # with open(Path('./html/kinopoisk/film-lists.html'), mode='r') as html:
    # print(json.dumps(scraper.get_film_lists(html), indent=True, ensure_ascii=False))


