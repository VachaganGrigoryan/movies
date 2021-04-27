![logo](app/static/images/logo.png)
# Film Guide 
- This is a movies project. The all content are scraped from [IMDB](www.imdb.com).
- Project wrote using Python 3, Flask and BS4.

# How to install
- clone this repository
- create the python virtual environment.
- install the requirements.txt file

# Run commands
- for scraping - run: `python manage.py imdb_run`
- for web server - run: `python manage.py runserver`

# DB management
- select any DB systems and install.
- create new database for this project.
- updated [.env](.env) configuration file.
```python
DATABASE_URL=postgresql://{user_name}:{user_pass}@localhost:5432/{db_name}
```

