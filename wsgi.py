from os import environ

from app import create_app, db

app = create_app(environ.get('APP_SETTINGS'))

if __name__ == '__main__':
    app.run()
