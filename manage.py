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
    movie = {
        'title': 'The Shawshank Redemption (1994)',
        'runtime': '2h 22min',
        'genres': 'Drama',
        'age': '+16',
        'year': '1995',
        'rating': '9.3 based on 2,378,994 user ratings'
    }

    create_movie(db, movie)


if __name__ == '__main__':
    manager.run()
