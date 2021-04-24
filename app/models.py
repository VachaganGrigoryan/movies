from app import db


genre_identifier = db.Table('genre_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('genre_id', db.Integer, db.ForeignKey('genre.id'))
)
job_identifier = db.Table('job_identifier',
    db.Column('people_id', db.Integer, db.ForeignKey('people.id')),
    db.Column('job_id', db.Integer, db.ForeignKey('job.id'))
)
country_identifier = db.Table('country_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('country_id', db.Integer, db.ForeignKey('country.id'))
)
director_identifier = db.Table('director_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('director_id', db.Integer, db.ForeignKey('people.id'))
)
producer_identifier = db.Table('producer_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('producer_id', db.Integer, db.ForeignKey('people.id'))
)
writer_identifier = db.Table('writer_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('writer_id', db.Integer, db.ForeignKey('people.id'))
)
artist_identifier = db.Table('artist_identifier',
    db.Column('movie_id', db.Integer, db.ForeignKey('movie.id')),
    db.Column('artist_id', db.Integer, db.ForeignKey('people.id'))
)


class Country(db.Model):
    __tablename__ = 'country'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False)

    def __repr__(self):
        return f"Country('{self.name}')"

    def __str__(self):
        return self.name


class JobCategories(db.Model):
    __tablename__ = 'job'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False)

    def __repr__(self):
        return f"JobCategories('{self.name}')"

    def __str__(self):
        return self.name


class Genre(db.Model):
    __tablename__ = 'genre'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False)

    def __repr__(self):
        return f"Genre('{self.name}')"

    def __str__(self):
        return self.name


class People(db.Model):
    __tablename__ = 'people'

    id = db.Column(db.Integer, primary_key=True)
    imdb_id = db.Column(db.String(), unique=True)
    imdb_url = db.Column(db.String(), unique=True)
    full_name = db.Column(db.String(), nullable=False)
    bio = db.Column(db.Text(convert_unicode=True), nullable=False)
    avatar = db.Column(db.String(), nullable=False, default='default_avatar.png')
    job_categories = db.relationship(JobCategories, backref='job', lazy=True, secondary=job_identifier)
    born_info = db.Column(db.String())
    death_info = db.Column(db.String())

    def __init__(self, imdb_id, imdb_url, full_name, bio, avatar, born_info, death_info):
        self.imdb_id = imdb_id
        self.imdb_url = imdb_url
        self.full_name = full_name
        self.bio = bio
        self.avatar = avatar
        self.born_info = born_info
        self.death_info = death_info

    def __repr__(self):
        return f"<People ('{self.full_name}')>"


class Movie(db.Model):
    __tablename__ = 'movie'

    id = db.Column(db.Integer, primary_key=True)
    imdb_id = db.Column(db.String(), unique=True)
    imdb_url = db.Column(db.String(), unique=True)
    title = db.Column(db.String(), nullable=False)
    description = db.Column(db.Text())
    avatar = db.Column(db.String(), nullable=False, default='default_avatar.jpg')
    banner = db.Column(db.String(), nullable=True, default='default_banner.jpg')
    trailer = db.Column(db.String(), nullable=True)
    photos = db.relationship('Photo', backref='photos', lazy=True, uselist=True)
    countries = db.relationship(Country, backref='countries', lazy=True, secondary=country_identifier)
    genres = db.relationship(Genre, backref=db.backref('genres'), lazy=True, secondary=genre_identifier)
    directors = db.relationship(People, backref='directors', lazy=True, secondary=director_identifier)
    writers = db.relationship(People, backref='writers', lazy=True, secondary=writer_identifier)
    artists = db.relationship(People, backref='artists', lazy=True, secondary=artist_identifier)
    producers = db.relationship(People, backref='producers', lazy=True, secondary=producer_identifier)
    year = db.Column(db.String())
    age = db.Column(db.String())
    budget = db.Column(db.String())
    rating = db.Column(db.String())
    runtime = db.Column(db.String())
    original_lang = db.Column(db.String())
    production_co = db.Column(db.String())

    def to_dict(self):
        return self.__dict__

    def __repr__(self):
        return f"<Movie ('{self.title}')>"


class Photo(db.Model):
    __tablename__ = 'photo'

    id = db.Column(db.Integer, primary_key=True)
    image = db.Column(db.String(), nullable=False)
    movie_id = db.Column(db.Integer, db.ForeignKey('movie.id'))

    def __repr__(self):
        return f"<Photo ('{self.image}')>"
