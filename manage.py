from flask_script import Manager, prompt_bool
from app import create_app, db
from app.models import People
from flask_migrate import Migrate, MigrateCommand

from os import environ
from dotenv import load_dotenv

from scraper.db_connector import create_movie
from scraper.imdb import LookUpIMDB, BASE_URL

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
    service = LookUpIMDB(BASE_URL)

    for category in service.look_up_category():
        for film in category.get('films'):
            print(film)
            create_movie(db, film)


if __name__ == '__main__':
    manager.run()
