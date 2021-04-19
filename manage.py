from flask_script import Manager, prompt_bool
from app import create_app, db
from app.models import People
from flask_migrate import Migrate, MigrateCommand

from os import environ
from dotenv import load_dotenv

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


if __name__ == '__main__':
    manager.run()
