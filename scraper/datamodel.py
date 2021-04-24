from dataclasses import dataclass, field


@dataclass
class PeopleData:
    imdb_id: str  # = field(default='')
    imdb_url: str  # = field(default='')
    full_name: str  # = field(default='')
    bio: str = field(default='')
    avatar: str = field(default='')
    job_categories: list = field(default_factory=list)
    born_info: str = field(default='')
    death_info: str = field(default='')
    look_up_func: callable = field(default=callable)

    def look_up(self):
        self.look_up_func(self, self.imdb_url, self.imdb_id)


@dataclass
class MovieData:
    imdb_id: str  # = field(default='')
    imdb_url: str  # = field(default='')
    title: str  # = field(default='')
    avatar: str  # = field(default='')
    description: str = field(default='')
    banner: str = field(default='')
    trailer: str = field(default='')
    photos: list = field(default_factory=list)
    countries: list = field(default_factory=list)
    genres: list = field(default_factory=list)
    directors: list = field(default_factory=list)
    writers: list = field(default_factory=list)
    artists: list = field(default_factory=list)
    producers: list = field(default_factory=list)
    year: str = field(default='')
    age: str = field(default='')
    budget: str = field(default='')
    rating: str = field(default='')
    runtime: str = field(default='')
    original_lang: str = field(default='')
    production_co: str = field(default='')
    look_up_func: callable = field(default=callable)

    def look_up(self):
        self.look_up_func(self, self.imdb_url, self.imdb_id)
