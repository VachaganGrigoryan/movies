from flask_script import Manager, prompt_bool
from app import create_app, db
from app.models import People
from flask_migrate import Migrate, MigrateCommand

from os import environ
from dotenv import load_dotenv

from scraper.db_connector import create_movie

load_dotenv('.env')

app = create_app(environ.get('APP_SETTINGS'))

migrate = Migrate(app, db)
manager = Manager(app)

manager.add_command('db', MigrateCommand)


@manager.command
def dropdb():
    """ Drop db """
    if prompt_bool("Are you sure you want to lose all your data"):
        db.drop_all()


@manager.command
def imdb_run():
    movies = [
        {'title': 'The Shawshank Redemption\xa0(1994)', 'url': '/title/tt0111161', 'imdb_id': 'tt0111161',
         'runtime': '2h 22min', 'genres': ['Drama'], 'year': '14 October 1994 (USA)',
         'rating': '9.3 based on 2,379,048 user ratings',
         'avatar': 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@'},
        {'title': 'The Godfather\xa0(1972)', 'url': '/title/tt0068646', 'imdb_id': 'tt0068646', 'runtime': '2h 55min',
         'genres': ['Crime', 'Drama'], 'year': '24 March 1972 (USA)', 'rating': '9.2 based on 1,648,105 user ratings',
         'avatar': 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@'},
        {'title': 'The Godfather: Part II\xa0(1974)', 'url': '/title/tt0071562', 'imdb_id': 'tt0071562',
         'runtime': '3h 22min', 'genres': ['Crime', 'Drama'], 'year': '18 December 1974 (USA)',
         'rating': '9.0 based on 1,147,411 user ratings',
         'avatar': 'https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@'}
    ]

    for movie in movies:
        create_movie(db, movie)


if __name__ == '__main__':
    manager.run()
