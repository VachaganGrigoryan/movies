from flask_script import Manager
from app import create_app, db
from app.models import Result
from flask_migrate import Migrate, MigrateCommand

from os import environ
from dotenv import load_dotenv

load_dotenv('.env')

app = create_app(environ.get('APP_SETTINGS'))

migrate = Migrate(app, db)
manager = Manager(app)

manager.add_command('db', MigrateCommand)
# manager.add_command("db", db_manager)


if __name__ == '__main__':
    manager.run()
