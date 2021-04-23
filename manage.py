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
    movies = [
        {
            "title": "The Shawshank Redemption (1994)",
            "url": "/title/tt0111161",
            "imdb_id": "tt0111161",
            "avatar": "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg",
            "runtime": "2h 22min",
            "genres": [
                "Drama"
            ],
            "year": "14 October 1994 (USA)",
            "rating": "9.3 based on 2,379,389 user ratings",
            "description": "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
            "directors": [
                {
                    "url": "/name/nm0001104",
                    "imdb_id": "nm0001104",
                    "full_name": "Frank Darabont",
                    "_func": {
                        "full_name": " Frank Darabont\n",
                        "job_categories": [
                            "Writer",
                            "Producer",
                            "Director"
                        ],
                        "avatar": "https://m.media-amazon.com/images/M/MV5BNjk0MTkxNzQwOF5BMl5BanBnXkFtZTcwODM5OTMwNA@@._V1_FMjpg_UX1000_.jpg",
                        "bio": "<div id=\"resume-teaser\">\n<div id=\"add-photos-pro\">\n</div>\n<div id=\"resume-links\">\n</div>\n</div><div id=\"add-photos-pro\">\n</div><div id=\"resume-links\">\n</div><div class=\"txt-block\" id=\"name-bio-text\">\n<div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    Three-time Oscar nominee Frank Darabont was born in a refugee camp in 1959 in Montbeliard, France, the son of Hungarian parents who had fled Budapest during the failed 1956 Hungarian revolution. Brought to America as an infant, he settled with his family in Los Angeles and attended Hollywood High School. His first job in movies was as a production...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0001104/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div>\n</div><div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    Three-time Oscar nominee Frank Darabont was born in a refugee camp in 1959 in Montbeliard, France, the son of Hungarian parents who had fled Budapest during the failed 1956 Hungarian revolution. Brought to America as an infant, he settled with his family in Los Angeles and attended Hollywood High School. His first job in movies was as a production...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0001104/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div><div class=\"inline\">\n    Three-time Oscar nominee Frank Darabont was born in a refugee camp in 1959 in Montbeliard, France, the son of Hungarian parents who had fled Budapest during the failed 1956 Hungarian revolution. Brought to America as an infant, he settled with his family in Los Angeles and attended Hollywood High School. His first job in movies was as a production...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0001104/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div><div class=\"txt-block\" id=\"name-born-info\">\n<h4 class=\"inline\">Born:</h4>\n<time datetime=\"1959-1-28\">\n<a href=\"/search/name?birth_monthday=1-28&amp;refine=birth_monthday&amp;ref_=nm_ov_bth_monthday\">January 28</a>, \n     \n<a href=\"/search/name?birth_year=1959&amp;ref_=nm_ov_bth_year\">1959</a>\n</time>\n            in\n            <a href=\"/search/name?birth_place=Montb%C3%A9liard,%20Doubs,%20France&amp;ref_=nm_ov_bth_place\">Montbéliard, Doubs, France</a>\n</div>"
                    }
                }
            ],
            "writers": [
                {
                    "url": "/name/nm0000175",
                    "imdb_id": "nm0000175",
                    "full_name": "Stephen King",
                    "_func": {
                        "full_name": " Stephen King\n(I)\n",
                        "job_categories": [
                            "Writer",
                            "Producer",
                            "Actor"
                        ],
                        "avatar": "https://m.media-amazon.com/images/M/MV5BMjA2ODIxNDM4Nl5BMl5BanBnXkFtZTYwMjkzMzU1._V1_FMjpg_UX1000_.jpg",
                        "bio": "<div id=\"resume-teaser\">\n<div id=\"add-photos-pro\">\n</div>\n<div id=\"resume-links\">\n</div>\n</div><div id=\"add-photos-pro\">\n</div><div id=\"resume-links\">\n</div><div class=\"txt-block\" id=\"name-bio-text\">\n<div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    Stephen Edwin King was born on September 21, 1947, at the Maine General Hospital in Portland. His parents were Nellie Ruth (Pillsbury), who worked as a caregiver at a mental institute, and Donald Edwin King, a merchant seaman. His father was born under the surname \"Pollock,\" but used the last name \"King,\" under which Stephen was born. He has an ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0000175/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div>\n</div><div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    Stephen Edwin King was born on September 21, 1947, at the Maine General Hospital in Portland. His parents were Nellie Ruth (Pillsbury), who worked as a caregiver at a mental institute, and Donald Edwin King, a merchant seaman. His father was born under the surname \"Pollock,\" but used the last name \"King,\" under which Stephen was born. He has an ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0000175/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div><div class=\"inline\">\n    Stephen Edwin King was born on September 21, 1947, at the Maine General Hospital in Portland. His parents were Nellie Ruth (Pillsbury), who worked as a caregiver at a mental institute, and Donald Edwin King, a merchant seaman. His father was born under the surname \"Pollock,\" but used the last name \"King,\" under which Stephen was born. He has an ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0000175/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div><div class=\"txt-block\" id=\"name-born-info\">\n<h4 class=\"inline\">Born:</h4>\n<time datetime=\"1947-9-21\">\n<a href=\"/search/name?birth_monthday=9-21&amp;refine=birth_monthday&amp;ref_=nm_ov_bth_monthday\">September 21</a>, \n     \n<a href=\"/search/name?birth_year=1947&amp;ref_=nm_ov_bth_year\">1947</a>\n</time>\n            in\n            <a href=\"/search/name?birth_place=Portland,%20Maine,%20USA&amp;ref_=nm_ov_bth_place\">Portland, Maine, USA</a>\n</div>"
                    }
                },
                {
                    "url": "/name/nm0001104",
                    "imdb_id": "nm0001104",
                    "full_name": "Frank Darabont",
                    "_func": {
                        "full_name": " Frank Darabont\n",
                        "job_categories": [
                            "Writer",
                            "Producer",
                            "Director"
                        ],
                        "avatar": "https://m.media-amazon.com/images/M/MV5BNjk0MTkxNzQwOF5BMl5BanBnXkFtZTcwODM5OTMwNA@@._V1_FMjpg_UX1000_.jpg",
                        "bio": "<div id=\"resume-teaser\">\n<div id=\"add-photos-pro\">\n</div>\n<div id=\"resume-links\">\n</div>\n</div><div id=\"add-photos-pro\">\n</div><div id=\"resume-links\">\n</div><div class=\"txt-block\" id=\"name-bio-text\">\n<div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    Three-time Oscar nominee Frank Darabont was born in a refugee camp in 1959 in Montbeliard, France, the son of Hungarian parents who had fled Budapest during the failed 1956 Hungarian revolution. Brought to America as an infant, he settled with his family in Los Angeles and attended Hollywood High School. His first job in movies was as a production...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0001104/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div>\n</div><div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    Three-time Oscar nominee Frank Darabont was born in a refugee camp in 1959 in Montbeliard, France, the son of Hungarian parents who had fled Budapest during the failed 1956 Hungarian revolution. Brought to America as an infant, he settled with his family in Los Angeles and attended Hollywood High School. His first job in movies was as a production...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0001104/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div><div class=\"inline\">\n    Three-time Oscar nominee Frank Darabont was born in a refugee camp in 1959 in Montbeliard, France, the son of Hungarian parents who had fled Budapest during the failed 1956 Hungarian revolution. Brought to America as an infant, he settled with his family in Los Angeles and attended Hollywood High School. His first job in movies was as a production...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0001104/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div><div class=\"txt-block\" id=\"name-born-info\">\n<h4 class=\"inline\">Born:</h4>\n<time datetime=\"1959-1-28\">\n<a href=\"/search/name?birth_monthday=1-28&amp;refine=birth_monthday&amp;ref_=nm_ov_bth_monthday\">January 28</a>, \n     \n<a href=\"/search/name?birth_year=1959&amp;ref_=nm_ov_bth_year\">1959</a>\n</time>\n            in\n            <a href=\"/search/name?birth_place=Montb%C3%A9liard,%20Doubs,%20France&amp;ref_=nm_ov_bth_place\">Montbéliard, Doubs, France</a>\n</div>"
                    }
                }
            ],
            "artists": [
                {
                    "url": "/name/nm0000209",
                    "imdb_id": "nm0000209",
                    "full_name": "Tim Robbins",
                    "_func": {
                        "full_name": " Tim Robbins\n(I)\n",
                        "job_categories": [
                            "Actor",
                            "Producer",
                            "Director"
                        ],
                        "avatar": "https://m.media-amazon.com/images/M/MV5BMTI1OTYxNzAxOF5BMl5BanBnXkFtZTYwNTE5ODI4._V1_FMjpg_UX1000_.jpg",
                        "bio": "<div id=\"resume-teaser\">\n<div id=\"add-photos-pro\">\n</div>\n<div id=\"resume-links\">\n</div>\n</div><div id=\"add-photos-pro\">\n</div><div id=\"resume-links\">\n</div><div class=\"txt-block\" id=\"name-bio-text\">\n<div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    Born in West Covina, California, but raised in New York City, Tim Robbins is the son of former <a href=\"/name/nm1892669?ref_=nm_ov_bio_lk1\">The Highwaymen</a> singer <a href=\"/name/nm0730349?ref_=nm_ov_bio_lk2\">Gil Robbins</a> and actress <a href=\"/name/nm0730420?ref_=nm_ov_bio_lk3\">Mary Robbins</a> (née Bledsoe). Robbins studied drama at UCLA, where he graduated with honors in 1981. That same year, he formed the Actors' Gang theater group, an experimental ensemble that expressed radical ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0000209/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div>\n</div><div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    Born in West Covina, California, but raised in New York City, Tim Robbins is the son of former <a href=\"/name/nm1892669?ref_=nm_ov_bio_lk1\">The Highwaymen</a> singer <a href=\"/name/nm0730349?ref_=nm_ov_bio_lk2\">Gil Robbins</a> and actress <a href=\"/name/nm0730420?ref_=nm_ov_bio_lk3\">Mary Robbins</a> (née Bledsoe). Robbins studied drama at UCLA, where he graduated with honors in 1981. That same year, he formed the Actors' Gang theater group, an experimental ensemble that expressed radical ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0000209/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div><div class=\"inline\">\n    Born in West Covina, California, but raised in New York City, Tim Robbins is the son of former <a href=\"/name/nm1892669?ref_=nm_ov_bio_lk1\">The Highwaymen</a> singer <a href=\"/name/nm0730349?ref_=nm_ov_bio_lk2\">Gil Robbins</a> and actress <a href=\"/name/nm0730420?ref_=nm_ov_bio_lk3\">Mary Robbins</a> (née Bledsoe). Robbins studied drama at UCLA, where he graduated with honors in 1981. That same year, he formed the Actors' Gang theater group, an experimental ensemble that expressed radical ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0000209/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div><div class=\"txt-block\" id=\"name-born-info\">\n<h4 class=\"inline\">Born:</h4>\n<time datetime=\"1958-10-16\">\n<a href=\"/search/name?birth_monthday=10-16&amp;refine=birth_monthday&amp;ref_=nm_ov_bth_monthday\">October 16</a>, \n     \n<a href=\"/search/name?birth_year=1958&amp;ref_=nm_ov_bth_year\">1958</a>\n</time>\n            in\n            <a href=\"/search/name?birth_place=West%20Covina,%20California,%20USA&amp;ref_=nm_ov_bth_place\">West Covina, California, USA</a>\n</div>"
                    }
                },
                {
                    "url": "/name/nm0000151",
                    "imdb_id": "nm0000151",
                    "full_name": "Morgan Freeman",
                    "_func": {
                        "full_name": " Morgan Freeman\n(I)\n",
                        "job_categories": [
                            "Actor",
                            "Producer",
                            "Director"
                        ],
                        "avatar": "https://m.media-amazon.com/images/M/MV5BMTc0MDMyMzI2OF5BMl5BanBnXkFtZTcwMzM2OTk1MQ@@._V1_FMjpg_UX1000_.jpg",
                        "bio": "<div id=\"resume-teaser\">\n<div id=\"add-photos-pro\">\n</div>\n<div id=\"resume-links\">\n</div>\n</div><div id=\"add-photos-pro\">\n</div><div id=\"resume-links\">\n</div><div class=\"txt-block\" id=\"name-bio-text\">\n<div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    With an authoritative voice and calm demeanor, this ever popular American actor has grown into one of the most respected figures in modern US cinema. Morgan was born on June 1, 1937 in Memphis, Tennessee, to Mayme Edna (Revere), a teacher, and Morgan Porterfield Freeman, a barber. The young Freeman attended Los Angeles City College before serving ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0000151/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div>\n</div><div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    With an authoritative voice and calm demeanor, this ever popular American actor has grown into one of the most respected figures in modern US cinema. Morgan was born on June 1, 1937 in Memphis, Tennessee, to Mayme Edna (Revere), a teacher, and Morgan Porterfield Freeman, a barber. The young Freeman attended Los Angeles City College before serving ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0000151/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div><div class=\"inline\">\n    With an authoritative voice and calm demeanor, this ever popular American actor has grown into one of the most respected figures in modern US cinema. Morgan was born on June 1, 1937 in Memphis, Tennessee, to Mayme Edna (Revere), a teacher, and Morgan Porterfield Freeman, a barber. The young Freeman attended Los Angeles City College before serving ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0000151/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div><div class=\"txt-block\" id=\"name-born-info\">\n<h4 class=\"inline\">Born:</h4>\n<time datetime=\"1937-6-1\">\n<a href=\"/search/name?birth_monthday=6-1&amp;refine=birth_monthday&amp;ref_=nm_ov_bth_monthday\">June 1</a>, \n     \n<a href=\"/search/name?birth_year=1937&amp;ref_=nm_ov_bth_year\">1937</a>\n</time>\n            in\n            <a href=\"/search/name?birth_place=Memphis,%20Tennessee,%20USA&amp;ref_=nm_ov_bth_place\">Memphis, Tennessee, USA</a>\n</div>"
                    }
                },
                {
                    "url": "/name/nm0348409",
                    "imdb_id": "nm0348409",
                    "full_name": "Bob Gunton",
                    "_func": {
                        "full_name": " Bob Gunton\n",
                        "job_categories": [
                            "Actor",
                            "Soundtrack"
                        ],
                        "avatar": "https://m.media-amazon.com/images/M/MV5BMjUyZDQ0NjktZmM5ZS00NzcxLTliMWYtNWUxNDcyMmExZjU0XkEyXkFqcGdeQXVyMTE1MjA4NzM@._V1_FMjpg_UX1000_.jpg",
                        "bio": "<div id=\"resume-teaser\">\n<div id=\"add-photos-pro\">\n</div>\n<div id=\"resume-links\">\n<a class=\"view-resume\" href=\"/name/nm0348409/resume?ref_=nm_ov_res\">View Resume</a>\n<span class=\"ghost\">|</span> <a href=\"/name/nm0348409/resumephotos?ref_=nm_ov_resph\">Official Photos</a>\n                »\n            </div>\n</div><div id=\"add-photos-pro\">\n</div><div id=\"resume-links\">\n<a class=\"view-resume\" href=\"/name/nm0348409/resume?ref_=nm_ov_res\">View Resume</a>\n<span class=\"ghost\">|</span> <a href=\"/name/nm0348409/resumephotos?ref_=nm_ov_resph\">Official Photos</a>\n                »\n            </div><div class=\"txt-block\" id=\"name-bio-text\">\n<div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    Bob Gunton is an American actor, primarily known for portraying strict and authoritarian characters in popular films. His better known roles include chief George Earle in \"Demolition Man\" (1993), prison warden Samuel Norton in \"The Shawshank Redemption\" (1994), medical school dean Dr. Walcott in \"Patch Adams\" (1998), and politician Cyrus Vance in ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0348409/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div>\n</div><div class=\"name-trivia-bio-text\">\n<div class=\"inline\">\n    Bob Gunton is an American actor, primarily known for portraying strict and authoritarian characters in popular films. His better known roles include chief George Earle in \"Demolition Man\" (1993), prison warden Samuel Norton in \"The Shawshank Redemption\" (1994), medical school dean Dr. Walcott in \"Patch Adams\" (1998), and politician Cyrus Vance in ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0348409/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div> </div><div class=\"inline\">\n    Bob Gunton is an American actor, primarily known for portraying strict and authoritarian characters in popular films. His better known roles include chief George Earle in \"Demolition Man\" (1993), prison warden Samuel Norton in \"The Shawshank Redemption\" (1994), medical school dean Dr. Walcott in \"Patch Adams\" (1998), and politician Cyrus Vance in ...            <span class=\"see-more inline nobr-only\">\n<a href=\"/name/nm0348409/bio?ref_=nm_ov_bio_sm\">See full bio</a> »\n            </span>\n</div><div class=\"txt-block\" id=\"name-born-info\">\n<h4 class=\"inline\">Born:</h4>\n<time datetime=\"1945-11-15\">\n<a href=\"/search/name?birth_monthday=11-15&amp;refine=birth_monthday&amp;ref_=nm_ov_bth_monthday\">November 15</a>, \n     \n<a href=\"/search/name?birth_year=1945&amp;ref_=nm_ov_bth_year\">1945</a>\n</time>\n            in\n            <a href=\"/search/name?birth_place=Santa%20Monica,%20California,%20USA&amp;ref_=nm_ov_bth_place\">Santa Monica, California, USA</a>\n</div>"
                    }
                }
            ],
            "photos": [
                "https://m.media-amazon.com/images/S/sash/LcDGvOC9oM0y1al.png._V1_FMjpg_UX1000_.jpg",
                "https://m.media-amazon.com/images/S/sash/LcDGvOC9oM0y1al.png._V1_FMjpg_UX1000_.jpg",
                "https://m.media-amazon.com/images/S/sash/LcDGvOC9oM0y1al.png._V1_FMjpg_UX1000_.jpg",
                "https://m.media-amazon.com/images/S/sash/LcDGvOC9oM0y1al.png._V1_FMjpg_UX1000_.jpg",
                "https://m.media-amazon.com/images/S/sash/LcDGvOC9oM0y1al.png._V1_FMjpg_UX1000_.jpg",
                "https://m.media-amazon.com/images/S/sash/LcDGvOC9oM0y1al.png._V1_FMjpg_UX1000_.jpg"
            ],
            "countries": [
                "USA"
            ],
            "original_lang": "English",
            "production_co": "Castle Rock Entertainment "
        }
    ]
    # for movie in movies:
    #     create_movie(db, movie)

    service = LookUpIMDB(BASE_URL)
    #
    for category in service.look_up_category():
        for film in category.get('films'):
            print(film)
            create_movie(db, film)


if __name__ == '__main__':
    manager.run()
