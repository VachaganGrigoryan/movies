--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS movies;
--
-- Name: movies; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE movies WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE movies OWNER TO postgres;

\connect movies

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: artist_identifier; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.artist_identifier (
    movie_id integer,
    artist_id integer
);


ALTER TABLE public.artist_identifier OWNER TO movies;

--
-- Name: country; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.country (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.country OWNER TO movies;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: movies
--

CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO movies;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: movies
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: country_identifier; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.country_identifier (
    movie_id integer,
    country_id integer
);


ALTER TABLE public.country_identifier OWNER TO movies;

--
-- Name: director_identifier; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.director_identifier (
    movie_id integer,
    director_id integer
);


ALTER TABLE public.director_identifier OWNER TO movies;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.genre (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.genre OWNER TO movies;

--
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: movies
--

CREATE SEQUENCE public.genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_seq OWNER TO movies;

--
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: movies
--

ALTER SEQUENCE public.genre_id_seq OWNED BY public.genre.id;


--
-- Name: genre_identifier; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.genre_identifier (
    movie_id integer,
    genre_id integer
);


ALTER TABLE public.genre_identifier OWNER TO movies;

--
-- Name: job; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.job (
    id integer NOT NULL,
    name character varying(120) NOT NULL
);


ALTER TABLE public.job OWNER TO movies;

--
-- Name: job_id_seq; Type: SEQUENCE; Schema: public; Owner: movies
--

CREATE SEQUENCE public.job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_id_seq OWNER TO movies;

--
-- Name: job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: movies
--

ALTER SEQUENCE public.job_id_seq OWNED BY public.job.id;


--
-- Name: job_identifier; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.job_identifier (
    people_id integer,
    job_id integer
);


ALTER TABLE public.job_identifier OWNER TO movies;

--
-- Name: movie; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.movie (
    id integer NOT NULL,
    imdb_id character varying,
    imdb_url character varying,
    title character varying NOT NULL,
    description text,
    avatar character varying NOT NULL,
    banner character varying,
    trailer character varying,
    year character varying,
    age character varying,
    budget character varying,
    rating character varying,
    runtime character varying,
    original_lang character varying,
    production_co character varying
);


ALTER TABLE public.movie OWNER TO movies;

--
-- Name: movie_id_seq; Type: SEQUENCE; Schema: public; Owner: movies
--

CREATE SEQUENCE public.movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_id_seq OWNER TO movies;

--
-- Name: movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: movies
--

ALTER SEQUENCE public.movie_id_seq OWNED BY public.movie.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.people (
    id integer NOT NULL,
    imdb_id character varying,
    imdb_url character varying,
    full_name character varying NOT NULL,
    bio text NOT NULL,
    avatar character varying NOT NULL,
    born_info character varying,
    death_info character varying
);


ALTER TABLE public.people OWNER TO movies;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: movies
--

CREATE SEQUENCE public.people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_id_seq OWNER TO movies;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: movies
--

ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    image character varying NOT NULL,
    movie_id integer
);


ALTER TABLE public.photo OWNER TO movies;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: movies
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO movies;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: movies
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: producer_identifier; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.producer_identifier (
    movie_id integer,
    producer_id integer
);


ALTER TABLE public.producer_identifier OWNER TO movies;

--
-- Name: writer_identifier; Type: TABLE; Schema: public; Owner: movies
--

CREATE TABLE public.writer_identifier (
    movie_id integer,
    writer_id integer
);


ALTER TABLE public.writer_identifier OWNER TO movies;

--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: genre id; Type: DEFAULT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.genre ALTER COLUMN id SET DEFAULT nextval('public.genre_id_seq'::regclass);


--
-- Name: job id; Type: DEFAULT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.job ALTER COLUMN id SET DEFAULT nextval('public.job_id_seq'::regclass);


--
-- Name: movie id; Type: DEFAULT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.movie ALTER COLUMN id SET DEFAULT nextval('public.movie_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Data for Name: artist_identifier; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.artist_identifier (movie_id, artist_id) FROM stdin;
1	3
1	4
1	5
2	8
2	9
2	10
3	9
3	11
3	12
4	15
4	16
4	17
5	20
5	21
5	22
6	26
6	27
6	28
7	32
7	33
7	34
8	37
8	38
8	39
9	42
9	43
9	44
10	32
10	34
10	45
11	49
11	50
11	51
12	55
12	56
12	57
13	58
13	59
13	60
14	32
14	34
14	33
15	64
15	65
15	66
16	69
16	70
16	71
17	11
17	74
17	75
18	79
18	80
18	81
19	84
19	85
19	86
20	4
20	49
20	88
21	89
21	91
21	92
22	97
22	98
22	99
23	103
23	104
23	105
24	109
24	110
24	111
25	55
25	113
25	114
26	64
26	65
26	66
27	55
27	116
27	117
28	119
28	120
28	121
29	122
29	123
29	124
30	126
30	127
30	128
31	130
31	131
31	132
32	135
32	136
32	137
33	142
33	143
33	144
34	88
34	147
34	148
35	152
35	153
35	154
36	157
36	158
36	159
37	161
37	162
37	163
38	50
38	159
38	166
39	167
39	168
39	169
40	172
40	173
40	174
41	178
41	179
41	180
42	58
42	113
42	79
43	167
43	183
43	184
44	186
44	187
44	188
45	192
45	193
45	194
46	197
46	198
46	199
47	15
47	200
47	201
48	20
48	203
48	204
49	208
49	209
49	210
50	212
50	213
50	214
51	109
51	217
51	218
52	220
52	221
52	222
53	224
53	8
53	12
54	225
54	71
54	226
55	167
55	168
55	227
56	65
56	228
56	229
57	230
57	231
57	58
58	233
58	234
58	235
59	238
59	239
59	240
60	242
60	244
60	245
61	248
61	249
61	250
62	173
62	11
62	253
63	79
63	254
63	255
64	260
64	261
64	262
65	265
65	266
65	267
66	269
66	270
66	271
67	276
67	277
67	278
68	282
68	283
68	284
69	286
69	287
69	288
70	290
70	291
70	292
71	15
71	293
71	123
72	11
72	296
72	297
73	299
73	300
73	301
74	220
74	303
74	304
75	308
75	309
75	310
76	260
76	311
76	262
77	314
77	315
77	316
78	88
78	319
78	320
79	321
79	323
79	324
80	84
80	327
80	135
81	55
81	329
81	330
82	333
82	334
82	335
83	338
83	339
83	340
84	342
84	343
84	344
85	49
85	345
85	346
86	349
86	113
86	348
87	64
87	65
87	66
88	352
88	338
88	353
89	354
89	355
89	356
90	358
90	359
90	360
91	363
91	364
91	365
92	368
92	369
92	370
93	109
93	373
93	374
94	377
94	378
94	379
95	382
95	383
95	384
96	385
96	387
96	388
97	338
97	392
97	393
98	396
98	397
98	398
99	400
99	403
99	404
100	167
100	405
100	406
101	410
101	411
101	412
102	414
102	415
102	416
103	85
103	417
103	418
104	420
104	49
104	421
105	423
105	424
105	425
106	9
106	428
106	429
107	431
107	432
107	433
108	435
108	436
108	437
109	440
109	441
109	442
110	11
110	103
110	444
111	446
111	447
111	448
112	55
112	329
112	449
113	452
113	453
113	454
114	458
114	459
114	460
115	463
115	464
115	465
116	466
116	467
116	468
117	470
117	471
117	472
118	42
118	44
118	474
119	472
119	476
119	477
120	481
120	482
120	483
121	485
121	486
121	487
122	65
122	489
122	490
123	9
123	11
123	492
124	88
124	172
124	225
125	33
125	499
125	500
126	504
126	505
126	506
127	104
127	509
127	510
128	15
128	513
128	514
129	84
129	515
129	135
130	84
130	517
130	518
131	521
131	522
131	523
132	527
132	528
132	529
133	531
133	532
133	533
134	135
134	534
134	535
135	42
135	537
135	4
136	538
136	539
136	470
137	541
137	542
137	543
138	545
138	546
138	547
139	11
139	548
139	75
140	58
140	551
140	552
141	172
141	556
141	365
142	560
142	561
142	562
143	564
143	565
143	566
144	569
144	570
144	571
145	574
145	575
145	576
146	579
146	580
146	581
147	582
147	583
147	584
148	11
148	587
148	75
149	588
149	589
149	590
150	208
150	593
150	594
151	596
151	217
151	597
152	58
152	600
152	262
153	602
153	603
153	604
154	167
154	605
154	606
155	608
155	609
155	610
156	79
156	612
156	591
157	615
157	616
157	617
158	619
158	132
158	620
159	622
159	623
159	624
160	628
160	629
160	630
161	104
161	222
161	634
162	636
162	637
162	638
163	504
163	640
163	641
164	293
164	644
164	645
165	647
165	648
165	649
166	652
166	187
166	653
167	657
167	658
167	659
168	382
168	556
168	662
169	667
169	668
169	669
170	670
170	671
170	672
171	676
171	677
171	678
172	126
172	680
172	681
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.country (id, name) FROM stdin;
1	USA
2	USA\n
3	\nUK
4	New Zealand\n
5	\nUSA
6	Italy\n
7	\nSpain\n
8	\nWest Germany\n
9	Germany\n
10	Japan
11	Italy
12	Brazil\n
13	\nFrance\n
14	\nGermany
15	Japan\n
16	\nUK\n
17	\nCanada
18	South Korea
19	France\n
20	UK\n
21	\nPoland\n
22	\nGermany\n
23	\nMalta\n
24	\nMorocco
25	\nHong Kong
26	France
27	\nFrance
28	\nMexico
29	Lebanon\n
30	\nUSA\n
31	\nCyprus\n
32	\nQatar\n
33	West Germany
34	India
35	\nCzechoslovakia\n
36	\nItaly
37	Denmark\n
38	\nSweden
39	Germany
40	India\n
41	\nAustralia\n
42	\nKenya\n
43	\nNamibia
44	Soviet Union
45	\nIndia\n
46	\nCanada\n
47	\nChina
48	Canada\n
49	Iran\n
50	\nAustralia
51	UK
52	\nWest Germany
53	\nAustria\n
54	Iran
55	Mexico\n
56	\nSpain
57	Argentina\n
58	Turkey
59	Sweden
60	Spain\n
\.


--
-- Data for Name: country_identifier; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.country_identifier (movie_id, country_id) FROM stdin;
1	1
2	1
3	1
4	2
4	3
5	1
6	1
7	4
7	5
8	1
9	6
9	7
9	8
9	5
10	4
10	5
11	9
11	5
12	1
13	2
13	3
14	4
14	5
15	2
15	3
16	1
17	1
18	1
19	10
20	1
21	11
22	12
22	13
22	14
23	1
24	1
25	1
26	2
26	3
27	1
28	15
28	5
29	2
29	16
29	17
30	18
31	19
31	5
32	10
33	1
34	2
34	14
35	20
35	13
35	21
35	22
35	5
36	1
37	1
38	1
39	1
40	2
40	16
40	23
40	24
41	1
42	2
42	25
43	1
44	1
45	26
46	15
46	5
47	20
47	5
48	6
48	5
49	1
50	6
50	27
51	1
52	20
52	5
53	1
54	1
55	1
56	1
57	1
58	9
58	27
59	1
60	1
61	1
62	2
62	17
63	20
63	5
64	1
65	1
66	1
67	1
68	18
69	15
69	5
70	20
70	5
71	20
71	5
72	6
72	5
73	10
74	20
74	5
75	2
75	28
76	1
77	29
77	30
77	13
77	31
77	32
77	3
78	1
79	1
80	10
81	1
82	33
83	34
84	2
84	13
84	35
84	36
85	2
85	14
86	1
87	2
87	3
88	34
89	1
90	20
90	5
91	1
92	37
92	38
93	1
94	39
95	1
96	1
97	40
97	30
97	16
97	41
97	42
97	43
98	44
99	1
100	1
101	11
102	20
102	5
103	10
104	20
104	5
105	1
106	1
107	20
107	5
108	2
108	16
108	45
108	7
108	46
108	47
109	48
109	27
110	1
111	49
111	13
111	50
112	1
113	1
114	51
115	19
115	14
116	39
117	1
118	6
118	7
118	52
119	1
120	1
121	1
122	2
122	3
123	1
124	1
125	2
125	47
126	1
127	20
127	27
128	2
128	3
129	10
130	10
131	51
132	9
132	53
132	36
133	54
134	15
134	27
135	1
136	1
137	15
137	5
138	1
139	2
139	27
140	1
141	1
142	1
143	55
143	56
144	1
145	57
145	56
146	1
147	51
148	1
149	10
150	2
150	28
151	1
152	1
153	20
153	5
154	1
155	58
156	1
157	2
157	28
158	2
158	16
158	14
159	1
160	1
161	2
161	3
162	59
163	1
164	1
165	1
166	60
166	16
166	5
167	51
168	1
169	1
170	1
171	44
172	18
\.


--
-- Data for Name: director_identifier; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.director_identifier (movie_id, director_id) FROM stdin;
1	1
2	6
3	6
4	13
5	18
6	23
7	29
8	35
9	40
10	29
11	46
12	52
13	13
14	29
15	61
16	67
16	68
17	72
18	76
19	82
20	46
21	89
22	93
22	94
23	100
24	106
25	23
26	115
27	1
28	118
29	13
30	125
31	129
32	133
33	138
33	139
34	145
35	149
36	155
37	52
38	164
39	167
40	170
41	175
42	72
43	167
44	185
45	189
45	190
46	195
47	13
48	40
49	205
50	211
51	175
52	170
53	6
54	13
55	167
56	23
57	35
58	232
59	236
60	241
61	246
62	251
63	236
64	256
64	257
65	263
66	263
67	272
67	273
68	279
69	118
70	236
71	13
72	40
73	298
74	155
75	305
75	306
76	256
76	257
77	312
78	317
79	321
80	82
81	328
82	331
83	336
84	76
85	35
86	347
87	350
88	338
88	351
89	35
90	236
91	361
92	366
93	175
94	375
95	380
96	385
97	389
98	394
99	399
99	400
100	167
101	407
102	236
103	82
104	419
105	175
106	426
107	236
108	317
109	438
110	72
111	445
112	305
113	450
114	455
115	461
116	375
117	263
118	40
119	263
120	478
121	247
121	484
122	23
123	491
124	493
125	496
126	501
127	507
128	13
129	82
130	82
131	519
131	520
132	524
133	530
134	82
135	42
136	263
137	118
138	544
139	72
140	72
141	553
142	557
143	563
144	567
145	572
146	577
147	419
148	72
149	118
150	591
151	175
152	72
153	601
154	167
155	607
156	149
157	613
157	614
158	618
159	247
159	621
160	625
161	631
162	635
163	639
164	642
165	23
166	650
166	651
167	654
168	660
169	663
169	664
170	246
170	305
171	673
172	125
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.genre (id, name) FROM stdin;
1	Drama
2	Crime
3	Action
4	Biography
5	History
6	Adventure
7	Western
8	Romance
9	Sci-Fi
10	Fantasy
11	Mystery
12	Comedy
13	Thriller
14	Family
15	War
16	Animation
17	Music
18	Horror
19	Film-Noir
20	Musical
21	Sport
\.


--
-- Data for Name: genre_identifier; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.genre_identifier (movie_id, genre_id) FROM stdin;
1	1
2	2
2	1
3	2
3	1
4	3
4	2
4	1
5	2
5	1
6	4
6	1
6	5
7	3
7	6
7	1
8	2
8	1
9	7
10	3
10	6
10	1
11	1
12	1
12	8
13	3
13	6
13	9
14	3
14	6
14	1
15	3
15	6
15	10
16	3
16	9
17	4
17	2
17	1
18	1
19	3
19	6
19	1
20	2
20	1
20	11
21	12
21	1
21	8
22	2
22	1
23	2
23	1
23	13
24	1
24	14
24	10
25	1
25	15
26	3
26	6
26	10
27	2
27	1
27	10
28	16
28	6
28	14
29	6
29	1
29	9
30	12
30	1
30	13
31	3
31	2
31	1
32	3
32	1
32	11
33	16
33	6
33	1
34	2
34	11
34	13
35	4
35	1
35	17
36	3
36	9
37	6
37	12
37	9
38	1
39	12
39	1
39	14
40	3
40	6
40	1
41	18
41	11
41	13
42	2
42	1
42	13
43	12
43	1
43	8
44	1
44	17
45	4
45	12
45	1
46	16
46	1
46	15
47	1
47	11
47	9
48	7
49	1
49	8
49	15
50	1
50	8
51	11
51	13
52	18
52	9
53	1
53	11
53	15
54	11
54	13
55	12
55	1
55	15
56	3
56	6
57	1
57	7
58	1
58	11
58	13
59	1
59	15
60	4
60	1
60	5
61	16
61	6
61	14
62	2
62	1
62	13
63	1
63	18
64	3
64	6
64	9
65	1
65	19
66	2
66	1
66	11
67	16
67	3
67	6
68	3
68	1
68	11
69	16
69	3
69	6
70	12
71	3
71	6
72	2
72	1
73	16
73	1
73	10
74	3
74	6
74	9
75	16
75	6
75	14
76	3
76	6
76	1
77	1
78	1
79	4
79	1
79	5
80	2
80	1
80	11
81	16
81	6
81	12
82	6
82	1
82	13
83	12
83	1
84	4
84	1
84	5
85	6
85	1
85	15
86	1
86	8
87	3
87	6
87	10
88	1
88	14
89	2
89	1
89	13
90	6
90	9
91	1
92	1
93	11
93	8
93	13
94	2
94	11
94	13
95	1
95	8
95	9
96	1
96	11
97	3
97	4
97	1
98	1
98	13
98	15
99	12
99	20
99	8
100	12
100	1
100	14
101	1
102	1
102	15
103	1
104	12
104	2
105	6
105	11
105	13
106	2
106	1
107	2
107	1
107	9
108	1
108	13
108	15
109	1
109	11
109	15
110	2
110	1
111	1
112	16
112	6
112	12
113	12
113	2
113	1
114	6
114	4
114	1
115	12
115	8
116	1
116	9
117	12
117	1
117	8
118	7
119	2
119	1
119	19
120	2
120	1
121	16
121	6
121	12
122	3
122	6
123	2
123	1
123	13
124	2
124	1
124	11
125	4
125	12
125	1
126	3
126	13
127	1
128	3
128	6
129	3
129	1
129	13
130	2
130	1
130	11
131	6
131	12
131	10
132	4
132	1
132	5
133	1
133	14
133	21
134	3
134	1
134	15
135	1
135	7
136	12
136	17
136	8
137	16
137	6
137	14
138	1
139	2
139	1
140	4
140	2
140	1
141	4
141	1
142	6
142	1
142	5
143	1
143	10
143	15
144	1
145	1
145	11
145	8
146	1
146	15
147	3
147	12
147	2
148	4
148	1
148	21
149	16
149	14
149	10
150	6
150	1
150	7
151	2
151	13
152	11
152	13
153	12
153	2
153	1
154	6
154	12
154	1
155	1
155	14
156	1
156	11
156	13
157	2
157	1
157	13
158	3
158	1
158	9
159	16
159	6
159	12
160	18
160	11
160	9
161	4
161	1
162	1
162	10
162	5
163	1
163	11
163	13
164	3
164	1
164	21
165	3
165	6
165	9
166	16
166	6
166	12
167	1
168	12
168	1
169	1
169	5
169	8
170	16
170	6
170	12
171	1
171	9
172	2
172	1
172	11
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.job (id, name) FROM stdin;
1	Writer
2	Producer
3	Director
4	Actor
5	Soundtrack
6	Editorial Department
7	Casting Department
8	Actress
9	Second Unit Director or Assistant Director
10	Additional Crew
11	Cinematographer
12	Script and Continuity Department
13	Transportation Department
14	Composer
15	Animation Department
16	Art Department
17	Music Department
18	Production Designer
19	Production Manager
20	Sound Department
21	Editor
22	Make-Up Department
23	Stunts
24	Costume and Wardrobe Department
25	Costume Designer
26	Visual Effects
\.


--
-- Data for Name: job_identifier; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.job_identifier (people_id, job_id) FROM stdin;
1	1
1	2
1	3
2	1
2	2
2	4
3	4
3	2
3	3
4	4
4	2
4	3
5	4
5	5
6	2
6	3
6	1
7	1
8	4
8	5
8	3
9	4
9	2
9	3
10	4
10	5
10	3
11	4
11	2
11	5
12	4
12	2
12	5
13	1
13	2
13	3
14	2
14	1
14	3
15	4
15	2
15	6
16	4
16	3
16	5
17	4
17	2
17	5
18	3
18	2
18	1
19	1
19	2
20	4
20	2
20	5
21	4
21	3
21	5
22	4
23	2
23	1
23	3
24	1
24	4
25	1
25	2
25	3
26	4
26	2
26	5
27	4
27	3
27	2
28	4
28	5
28	2
29	2
29	3
29	1
30	1
30	5
31	1
31	7
31	2
32	4
32	2
32	5
33	4
33	5
33	2
34	4
34	5
34	1
35	1
35	4
35	2
36	1
36	2
36	3
37	4
37	5
37	2
38	8
38	5
38	2
39	4
39	2
39	5
40	9
40	1
40	3
41	1
41	4
41	2
42	4
42	2
42	3
43	4
43	2
43	10
44	4
44	5
45	4
45	2
45	5
46	2
46	3
46	1
47	1
47	4
47	2
48	1
48	2
48	4
49	2
49	4
49	5
50	4
50	2
50	1
51	4
51	5
51	2
52	2
52	1
52	3
53	1
53	4
54	2
54	1
54	10
55	2
55	4
55	5
56	8
56	2
56	3
57	4
57	2
57	3
58	4
58	2
58	5
59	4
59	2
59	5
60	4
60	2
60	5
61	3
61	11
61	4
62	1
62	5
63	1
63	2
63	3
64	4
64	5
64	2
65	4
65	1
65	2
66	8
66	10
66	5
67	1
67	2
67	3
68	1
68	2
68	3
69	4
69	2
69	5
70	4
70	2
70	3
71	8
71	2
72	2
72	3
72	4
73	1
73	2
74	4
74	2
74	5
75	4
75	5
76	3
76	1
76	4
77	4
77	1
78	1
78	2
78	12
79	4
79	5
79	2
80	8
81	4
81	2
81	13
82	1
82	3
82	9
83	1
83	3
83	2
84	4
84	2
84	3
85	4
86	8
86	12
87	1
87	4
87	10
88	4
88	2
88	5
89	4
89	1
89	3
90	1
90	5
90	4
91	8
91	2
92	4
93	2
93	3
93	1
94	3
94	1
94	9
95	1
95	3
95	4
96	1
96	2
96	12
97	4
98	4
99	4
99	5
99	3
100	3
100	2
100	1
101	1
102	1
102	10
102	4
103	8
103	3
103	2
104	4
104	5
104	14
105	4
106	3
106	1
106	2
107	1
107	5
108	1
108	4
108	5
109	4
109	5
109	3
110	8
110	5
111	4
111	3
111	5
112	1
112	2
112	10
113	2
113	4
113	5
114	4
114	2
114	1
115	1
115	2
115	3
116	4
116	5
116	2
117	4
117	3
117	2
118	15
118	3
118	16
119	8
119	5
120	8
120	5
121	4
121	5
122	4
122	2
122	5
123	8
123	5
123	2
124	8
124	2
124	5
125	1
125	2
125	3
126	4
127	4
128	8
129	1
129	2
129	3
130	4
131	4
131	2
131	5
132	8
132	2
132	5
133	3
133	1
133	9
134	1
135	4
135	5
136	4
136	5
137	8
138	1
138	16
138	3
139	2
139	3
139	15
140	1
140	12
140	10
141	1
141	2
141	10
142	4
142	5
142	3
143	4
143	5
143	2
144	4
144	5
145	2
145	3
145	4
146	1
146	2
146	3
147	4
147	2
147	1
148	4
148	1
148	2
149	3
149	4
149	1
150	1
150	4
150	2
151	14
151	5
151	17
152	4
152	2
152	1
153	4
154	4
155	1
155	2
155	3
156	1
156	4
156	2
157	4
157	2
157	3
158	8
158	5
159	4
159	2
159	5
160	1
160	3
160	2
161	4
161	2
161	10
162	4
162	5
163	8
163	3
163	2
164	3
164	11
164	2
165	1
165	2
166	8
166	5
166	2
167	5
167	1
167	4
168	8
168	5
168	2
169	4
169	9
169	10
170	2
170	3
170	18
171	1
171	2
171	3
172	4
172	5
172	2
173	4
173	2
173	5
174	8
174	2
175	3
175	2
175	1
176	10
176	1
176	2
177	1
177	10
178	4
178	5
178	3
179	8
179	5
179	10
180	8
180	5
181	1
181	2
181	3
182	3
182	4
182	1
183	8
184	8
184	1
185	1
185	2
185	3
186	4
186	2
186	5
187	4
187	5
188	8
188	5
188	3
189	2
189	3
189	1
190	2
190	3
190	1
191	1
192	4
192	3
192	5
193	4
193	1
193	2
194	8
194	1
194	3
195	3
195	1
195	10
196	1
196	4
197	4
198	8
199	8
200	4
200	5
200	2
201	8
201	5
201	2
202	1
202	4
202	9
203	4
204	8
204	5
205	3
205	4
205	1
206	1
206	2
207	1
207	2
208	4
208	5
208	2
209	8
209	5
209	2
210	3
210	4
210	2
211	1
211	3
211	2
212	4
212	5
212	10
213	4
214	8
214	19
215	1
215	2
216	1
217	8
217	5
217	2
218	4
218	5
219	1
219	10
219	4
220	8
220	5
220	2
221	4
221	3
221	2
222	4
222	5
223	1
223	2
223	3
224	4
224	2
224	5
225	4
225	5
225	3
226	4
226	2
226	1
227	4
227	5
228	8
228	3
228	5
229	4
230	4
230	2
230	1
231	4
231	3
231	2
232	3
232	1
232	2
233	4
233	3
234	8
234	5
235	4
235	5
236	3
236	1
236	2
237	1
238	4
238	2
238	5
239	4
239	5
239	2
240	4
240	5
240	2
241	3
241	2
241	1
242	5
242	4
242	2
243	1
243	2
243	10
244	8
244	5
244	10
245	4
245	5
245	2
246	1
246	4
246	3
247	2
247	1
247	3
248	20
248	21
248	10
249	8
249	10
250	4
250	2
250	3
251	2
251	3
251	1
252	1
252	3
252	2
253	8
254	2
254	8
254	1
255	4
256	2
256	3
256	1
257	2
257	3
257	1
258	1
258	2
258	4
259	1
259	2
259	4
260	4
260	2
260	5
261	4
261	2
261	5
262	4
262	2
262	5
263	1
263	3
263	2
264	1
264	2
265	4
265	5
266	8
266	5
266	2
267	4
267	1
267	3
268	1
269	4
269	5
269	2
270	5
270	8
270	17
271	4
271	5
271	1
272	15
272	16
272	3
273	16
273	3
273	9
274	2
274	1
274	3
275	1
275	2
275	3
276	4
276	5
277	4
277	2
277	1
278	8
278	5
278	2
279	2
279	3
279	1
280	1
281	1
282	4
283	4
283	3
283	1
284	8
285	1
285	2
285	4
286	4
287	8
288	8
288	22
288	5
289	1
289	4
289	2
290	4
290	1
290	5
291	4
291	3
291	2
292	4
292	1
292	5
293	4
293	2
293	1
294	1
295	1
295	9
295	12
296	4
296	2
296	3
297	8
297	1
297	2
298	1
298	16
298	3
299	4
300	8
301	4
302	2
302	1
302	4
303	4
303	2
303	3
304	8
305	6
305	21
305	10
306	10
306	1
306	15
307	15
307	16
307	1
308	4
308	5
309	4
309	2
309	1
310	4
310	2
310	5
311	4
311	2
311	5
312	8
312	3
312	1
313	1
314	4
315	8
316	8
317	2
317	3
317	10
318	2
318	1
318	10
319	8
319	5
320	8
320	2
320	5
321	4
321	2
321	3
322	1
322	2
322	3
323	8
323	3
323	1
324	4
324	2
324	3
325	1
325	3
326	1
326	2
327	4
328	2
328	1
328	3
329	4
329	2
329	10
330	4
330	5
331	3
331	2
331	1
332	1
332	4
332	3
333	4
333	2
333	5
334	4
334	14
334	5
335	4
336	1
336	21
336	2
337	1
337	4
337	14
338	4
338	2
338	5
339	4
339	1
339	2
340	8
340	2
341	1
341	17
341	10
342	4
342	5
343	4
343	5
343	2
344	8
345	8
345	2
346	2
346	4
346	1
347	3
347	2
347	4
348	2
348	4
348	1
349	4
349	5
349	1
350	3
350	2
350	1
351	4
351	1
351	3
352	4
353	8
353	1
353	2
354	4
354	2
354	5
355	4
355	2
355	5
356	4
356	2
356	1
357	1
357	4
357	16
358	4
358	5
359	4
359	5
360	4
361	2
361	3
361	1
362	1
362	4
363	8
363	2
363	5
364	4
364	2
364	5
365	8
366	3
366	1
366	4
367	1
367	3
367	2
368	4
368	10
368	1
369	4
369	23
370	8
371	1
371	10
372	1
372	3
373	8
373	24
373	5
374	8
374	5
375	3
375	1
375	2
376	1
376	3
377	4
377	5
377	1
378	8
379	8
380	3
380	1
380	2
381	1
381	2
381	10
382	4
382	1
382	2
383	8
383	2
383	5
384	4
384	5
385	4
385	3
385	1
386	1
386	2
386	4
387	4
387	5
387	1
388	8
388	5
389	1
389	3
389	2
390	1
390	9
391	1
391	17
391	5
392	8
392	10
393	8
394	3
394	4
394	1
395	1
396	4
397	8
398	4
399	3
399	10
399	2
400	5
400	4
400	10
401	5
401	1
401	17
402	5
402	1
402	17
403	4
403	5
403	3
404	8
404	5
404	2
405	8
406	4
406	5
406	10
407	4
407	3
407	1
408	1
408	3
408	2
409	1
410	4
411	4
412	8
412	1
413	1
413	2
413	12
414	4
414	2
414	3
415	4
415	10
415	2
416	4
416	2
416	5
417	4
418	4
419	1
419	3
419	2
420	4
420	2
420	23
421	4
421	2
421	3
422	1
422	2
422	5
423	4
423	5
423	2
424	8
424	2
424	5
425	4
425	2
425	1
426	3
426	1
426	2
427	2
427	3
427	1
428	8
428	5
428	2
429	4
429	2
429	5
430	12
430	1
430	5
431	4
431	2
431	5
432	4
433	4
434	1
435	4
436	4
436	5
437	4
438	3
438	1
438	21
439	1
439	4
439	3
440	8
441	8
442	4
443	1
443	3
443	5
444	8
444	2
444	5
445	1
445	3
445	2
446	4
446	1
446	3
447	8
447	25
447	18
448	8
449	8
449	5
449	1
450	3
450	4
450	1
451	1
451	3
451	10
452	4
452	2
452	3
453	2
453	4
453	3
454	4
454	1
454	5
455	21
455	3
455	1
456	1
457	1
457	3
457	4
458	4
458	5
458	2
459	4
459	5
459	1
460	4
460	2
460	5
461	3
461	1
461	2
462	1
462	4
463	8
463	5
463	22
464	4
464	3
464	2
465	4
466	8
467	4
467	3
467	10
468	4
468	3
468	1
469	1
469	2
469	5
470	4
470	5
470	2
471	8
471	5
471	1
472	4
472	5
472	2
473	2
473	1
474	4
474	3
474	1
475	1
475	4
476	8
476	5
477	4
477	5
477	1
478	3
478	2
478	4
479	1
479	2
479	10
480	1
480	4
480	2
481	4
481	2
481	5
482	4
483	4
483	10
484	4
484	1
484	10
485	4
485	2
485	5
486	4
487	4
487	3
487	5
488	1
488	2
488	3
489	4
489	2
489	5
490	8
491	2
491	1
491	3
492	4
492	5
492	2
493	3
493	2
493	1
494	1
494	2
494	4
495	1
495	3
495	2
496	2
496	1
496	3
497	4
497	2
497	3
498	4
498	1
498	2
499	4
499	2
500	8
500	2
500	5
501	3
501	2
501	1
502	1
502	4
503	1
503	2
503	3
504	4
504	5
504	2
505	4
505	5
505	1
506	8
506	5
507	1
507	3
507	2
508	1
508	5
508	2
509	8
509	5
509	2
510	4
510	1
510	2
511	1
511	10
511	16
512	1
512	2
512	3
513	4
513	2
513	5
514	4
514	2
514	5
515	4
515	5
516	1
517	8
517	5
518	4
518	5
519	1
519	4
519	15
520	1
520	4
520	5
521	1
521	4
521	5
522	4
522	1
522	2
523	4
523	1
523	5
524	3
524	4
524	2
525	2
525	1
525	4
526	10
526	1
526	3
527	4
527	3
527	11
528	8
529	4
530	3
530	1
530	4
531	4
532	4
533	8
534	4
534	2
535	4
536	1
536	21
536	3
537	4
537	5
537	2
538	5
538	8
538	1
539	4
539	5
539	2
540	1
541	8
541	5
542	4
542	5
543	4
544	1
544	2
544	3
545	8
545	5
545	22
546	8
546	5
546	2
547	4
547	5
547	1
548	8
548	2
548	5
549	2
549	1
549	4
550	2
550	1
550	4
551	4
551	2
551	1
552	8
552	2
553	4
553	2
553	3
554	2
554	1
554	3
555	1
555	10
556	4
556	2
556	3
557	3
557	2
557	21
558	1
559	1
559	2
559	3
560	4
560	2
560	5
561	4
561	2
561	5
562	4
562	2
562	3
563	1
563	2
563	3
564	8
565	8
565	3
565	1
566	4
566	5
567	3
567	1
567	2
568	1
568	2
569	4
569	17
569	5
570	4
570	5
570	2
571	4
571	5
572	1
572	3
572	4
573	1
574	4
574	2
574	3
575	8
575	5
576	4
577	2
577	3
577	10
578	1
578	2
578	3
579	4
579	5
580	4
580	2
580	10
581	4
581	2
581	5
582	4
582	2
582	5
583	4
583	3
583	1
584	4
584	1
584	2
585	4
585	1
585	10
586	1
587	8
587	5
588	4
589	8
589	5
590	8
591	4
591	3
591	1
592	1
592	4
593	4
593	5
594	4
594	5
595	1
596	4
596	3
596	5
597	4
597	3
597	5
598	1
598	2
598	12
599	2
599	1
599	4
600	8
600	1
600	2
601	1
601	3
601	2
602	8
602	2
602	5
603	4
603	2
603	5
604	4
604	2
604	5
605	4
605	3
606	4
607	3
607	1
607	18
608	4
609	4
610	4
611	1
611	2
611	4
612	8
612	2
612	3
613	2
613	1
613	3
614	2
614	1
614	3
615	4
615	3
615	5
616	4
616	2
616	5
617	4
617	2
617	3
618	3
618	9
618	2
619	4
619	5
619	2
620	4
620	1
620	3
621	15
621	16
621	10
622	8
622	2
622	1
623	4
623	1
623	2
624	4
624	2
624	1
625	5
625	1
625	14
626	1
626	4
626	2
627	1
628	4
628	2
628	5
629	4
629	23
630	4
630	5
630	2
631	1
631	3
631	2
632	1
632	4
633	1
633	3
633	4
634	8
634	5
634	3
635	1
635	3
635	4
636	4
636	10
636	5
637	4
637	5
638	4
638	3
638	9
639	2
639	3
639	1
640	4
640	5
640	2
641	8
641	2
641	5
642	2
642	3
642	1
643	1
643	2
643	4
644	4
644	2
644	5
645	4
645	2
645	1
646	1
646	2
646	3
647	4
647	2
647	3
648	8
648	2
648	1
649	4
649	5
649	1
650	15
650	1
650	2
651	26
651	3
651	15
652	4
652	5
652	17
653	8
653	2
653	5
654	3
654	2
654	4
655	1
655	4
655	2
656	1
656	4
656	2
657	4
657	1
657	2
658	4
658	2
658	5
659	4
659	3
659	5
660	3
660	1
660	2
661	1
661	3
661	2
662	8
662	2
662	10
663	3
663	11
663	2
664	3
664	10
664	9
665	1
665	10
666	1
667	4
667	5
667	2
668	8
668	5
668	1
669	4
669	1
669	5
670	4
670	1
670	3
671	2
671	1
671	8
672	4
673	1
673	3
673	4
674	1
675	1
676	8
676	17
677	4
677	3
677	1
678	4
679	1
680	4
681	4
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.movie (id, imdb_id, imdb_url, title, description, avatar, banner, trailer, year, age, budget, rating, runtime, original_lang, production_co) FROM stdin;
1	tt0111161	/title/tt0111161	The Shawshank Redemption (1994)	Chronicles the experiences of a formerly successful banker as a prisoner in the gloomy jailhouse of Shawshank after being found guilty of a crime he did not commit. The film portrays the man's unique way of dealing with his new, torturous life; along the way he befriends a number of fellow prisoners, most notably a wise long-term inmate named Red.\nWritten by\nJ-S-Golden	https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3877612057/1434659607842-pgv4ql-1616202333253.mp4?Expires=1619378153&Signature=UyRyiP6AI-Q8VxY7CWn7lqt6EUU6kvoiyS546DTaO2EPjxfZZqJA6eIqERt94aORlG5r66Hvl-LNmdq7Vb-sgfgWc7XnpBb-nuCNiQRHO-qNtzt6cLdctpNk3LdLULeSJ1iM7Zyx1jOtLJwCNAynFuxDnhCKT2wY6TvEpL1N4a-wGHWHojCtZ1Ww~x8-ZOUzEZyBNpOmBJ2z~0ORqjNvLZFTeePKz28iSndC656cEt1XXtrS5IbjKZVA5WcLHht9lNeweDimKasenQ5Pj6htFWQgtrZCd9ZHkLHFs6MhKDYpAkPnR1F6iJTRxuptjmDLI-RPUzGdFHBr~OL-s~3xIg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	14 October 1994 (USA)			9.3 based on 2,379,854 user ratings	2h 22min	English	Castle Rock Entertainment 
2	tt0068646	/title/tt0068646	The Godfather (1972)	The Godfather "Don" Vito Corleone is the head of the Corleone mafia family in New York. He is at the event of his daughter's wedding. Michael, Vito's youngest son and a decorated WW II Marine is also present at the wedding. Michael seems to be uninterested in being a part of the family business. Vito is a powerful man, and is kind to all those who give him respect but is ruthless against those who do not. But when a powerful and treacherous rival wants to sell drugs and needs the Don's influence for the same, Vito refuses to do it. What follows is a clash between Vito's fading old values and the new ways which may cause Michael to do the thing he was most reluctant in doing and wage a mob war against all the other mafia families which could tear the Corleone family apart.\nWritten by\nsrijanarora-152-448595	https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1348706585/1434659607842-pgv4ql-1616202346191.mp4?Expires=1619378186&Signature=tSZPc1SE1fFtvgnNMvePtAYdV74ULIZYT-QCfpIkib7giPi7qdgnNXH8ERkJTmLsYmg86yNMbvgYJq~LFWe7kp1zFIIRhs1tc1Pwl-4PQfXbZdopBHk0CHpfMJzXhm5BDDKCedOiXpB46vbWkcyhs~-FXeo1AWUquM42Pnn4r0Y8tauFONDpghEGVJT1N0Y9GYZjuhQkLqAQDNcoxviQuADHdiIVLuXbqH5AKgQmrB9MVtAJYBVFxCfgP3BPVNJSTTqzjNys2OFkrevQxDKggD8CyO0WPGg8qqy0yYZbbJPRsmZZ-D6eL5hK--eok16NQ1feOc9VngxFApvy98gHMw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	24 March 1972 (USA)			9.2 based on 1,648,799 user ratings	2h 55min	English\n|\nItalian\n|\nLatin	Paramount Pictures, Alfran Productions 
3	tt0071562	/title/tt0071562	The Godfather: Part II (1974)	The continuing saga of the Corleone crime family tells the story of a young Vito Corleone growing up in Sicily and in 1910s New York; and follows Michael Corleone in the 1950s as he attempts to expand the family business into Las Vegas, Hollywood and Cuba.\nWritten by\nKeith Loh <loh@sfu.ca>	https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi696162841/1434659607842-pgv4ql-1564159556047.mp4?Expires=1619378204&Signature=VuAc4lrfTuqgnAuSAV3QUcbN8dwZOZ7iY7erKKNEtzX-oo6K1JHeqozhtZ5Yw7pH~ydjxQhRD7ff9nd0O0pzOOWea3gLRrjJ~6S15ZlL~bbyPYAFDPuRBb12F8Vy2DhfpcfgFcE7rWIc0nmax37btCWPDbqrFzxgXOjZcyMzulwMTNSJxB3XAuS8jtOKXHgL41RdZBpA2HBdQ~3uvkDJ5aXTlLfM1Zsm5hABjeIi-ohbkO96-U6ZkcLLvaB9flNpsL9InfoAiCBJ9IoRgLnktJA5Qjqmgw4UXrhp-zFlFliVyuAiorMCnqwOHGcjkBmRpBbq1HUGMDqG-kcxd2glog__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	18 December 1974 (USA)			9.0 based on 1,147,802 user ratings	3h 22min	English\n|\nItalian\n|\nSpanish\n|\nLatin\n|\nSicilian	Paramount Pictures, The Coppola Company, American Zoetrope 
4	tt0468569	/title/tt0468569	The Dark Knight (2008)	Set within a year after the events of Batman Begins (2005), Batman, Lieutenant James Gordon, and new District Attorney Harvey Dent successfully begin to round up the criminals that plague Gotham City, until a mysterious and sadistic criminal mastermind known only as "The Joker" appears in Gotham, creating a new wave of chaos. Batman's struggle against The Joker becomes deeply personal, forcing him to "confront everything he believes" and improve his technology to stop him. A love triangle develops between Bruce Wayne, Dent, and Rachel Dawes.\nWritten by\nLeon Lombardi	https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi324468761/1434659607842-pgv4ql-1563712918369.mp4?Expires=1619378213&Signature=WdH7n9KolaTDovQVgUy0P23HjrjjMycCpujo0wft~mQMMuEzuMkM3vVmM6I6DxVS0XRiaWKRx1F7VxC0DRt77aQNZeC8sdGrZK5myot2I9A1C5e1iGL4xG9bqgSUlabO6ukPqVCzuC9F04Yii7eWWDjQaVQdDK~U4q1YNTDSlfPZPwME4MxtRQQCJ8tgwb9McjTzVMXYE4fULP0XFHkppWUvoMs2CVP8cdouBM2oaQernfS8hS4fEuZJHakX6db0lehbGnYiI6e~i8iAeAbFBzdnSxch1AlTqmaP4qPtP0VQTS9cPMSW73NxxHvm-p44dXaRDNR4aXGKFjT6GzFDWA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	28 August 2008 (Armenia)			9.0 based on 2,343,654 user ratings	2h 32min	English\n|\nMandarin	Warner Bros., Legendary Entertainment, Syncopy 
5	tt0050083	/title/tt0050083	12 Angry Men (1957)	The defense and the prosecution have rested, and the jury is filing into the jury room to decide if a young man is guilty or innocent of murdering his father. What begins as an open-and-shut case of murder soon becomes a detective story that presents a succession of clues creating doubt, and a mini-drama of each of the jurors' prejudices and preconceptions about the trial, the accused, AND each other. Based on the play, all of the action takes place on the stage of the jury room.\nWritten by\npjk <PETESID@VNET.IBM.COM>	https://m.media-amazon.com/images/M/MV5BMWU4N2FjNzYtNTVkNC00NzQ0LTg0MjAtYTJlMjFhNGUxZDFmXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3452609817/1434659607842-pgv4ql-1563707769168.mp4?Expires=1619378230&Signature=NKEbGL9BFpmBSGLCr9xdhtp7qPifb9RHpVO9ReTBUbKHFXVaT~L2NXIkTDG-p5zrIAZAPcgDeXF~onV0GtshV0seJ4YV4VmoAMPDpPGApBwXRnpgKA2n430Zb9hARq1X7Wm0oa~zmnT7sWD27ZK05tDSEnfbnPpmJIuauKP6KJtLjwsK3SNtYgbT3~wC7AgxYxTQYzxR71j5w6DIgrYhSumLtcOaqpkVkMecYsIPrcQr~NlV5wWOD1v5XWD3ffcP-Rm2pB20~lmlZEBnEcp76HoHos49v5Zn1eZLaawu4uKZ9nfp8E2tBMyQs7J0iLi2vFdFO2WrpE6WnahtS3zGfg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	10 April 1957 (USA)			9.0 based on 702,670 user ratings	1h 36min	English	Orion-Nova Productions 
6	tt0108052	/title/tt0108052	Schindler's List (1993)	Oskar Schindler is a vain and greedy German businessman who becomes an unlikely humanitarian amid the barbaric German Nazi reign when he feels compelled to turn his factory into a refuge for Jews. Based on the true story of Oskar Schindler who managed to save about 1100 Jews from being gassed at the Auschwitz concentration camp, it is a testament to the good in all of us.\nWritten by\nHarald Mayr <marvin@bike.augusta.de>	https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1158527769/1434659607842-pgv4ql-1564710232825.mp4?Expires=1619378244&Signature=C7PO7I6hWnQJIGoA~KO5Pdfhq4Fcr8FB3pG5bZuTed34oXZ6JPZxbE9MwmuOgY6g1r~DJTxlWdy1Ls8N1zWHhzd2U5RA6Tc2DT0eqkfvhL1chScr-CU8APazUv4tE0YUfabP9NVFte1OALGR-fuawsCu6zOg1BdAi1HWLgwYAb4mDO70z7uk3MkkHYavudKb9PUlnndfsigQj1m5eNsWcDxAWcF~ojwFzI82yHREmwaq1bh7qUT6LQ-A2sMpBWhv3rjQ4fFrkAqzvlUgScn9ltDSpHhlHYcqf8m6A29SN9MQqWBdKWkNegHVT8UIeC--9wdmKIB1ZB6DHqNmlfn80w__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	4 February 1994 (USA)			8.9 based on 1,230,675 user ratings	3h 15min	English\n|\nHebrew\n|\nGerman\n|\nPolish\n|\nLatin	Universal Pictures, Amblin Entertainment 
7	tt0167260	/title/tt0167260	The Lord of the Rings: The Return of the King (2003)	The final confrontation between the forces of good and evil fighting for control of the future of Middle-earth. Frodo and Sam reach Mordor in their quest to destroy the One Ring, while Aragorn leads the forces of good against Sauron's evil army at the stone city of Minas Tirith.\nWritten by\nJwelch5742	https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2073101337/1434659607842-pgv4ql-1616202358820.mp4?Expires=1619378262&Signature=NHTw4w3MicRkF0-gZooMdIgLR9RzD1xSQzojMPlYCx9~WqWaXyyW72K49qhbrHTi~2q~jjehkQrYZb8A3Lh1XCC2FJBMqy9RdBIIGmp4CJNMP4p8H5QeaBA4MI8gDXIxr8Gdgvx3MfBENpGpk4E-doB-PfkGhSIh1cH3~2v-lfkNFcV34-syhwxW2sUdVYZmSu0cwXkjHwfP1tohiZS~DsXHczjlQsr015q3c~~lk6P0GEf8~RGwYMB2J5GVml0y-rI2deXXZH6zpDy~YdBJrTq4fHxBhanQFNA8CCbblaa3LTpvJ3WiinvIhPGolcEE--Q39q01~otiESLyaAw8cQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	17 December 2003 (USA)			8.9 based on 1,665,323 user ratings	3h 21min	English\n|\nQuenya\n|\nOld English\n|\nSindarin	New Line Cinema, WingNut Films, The Saul Zaentz Company 
8	tt0110912	/title/tt0110912	Pulp Fiction (1994)	Jules Winnfield (Samuel L. Jackson) and Vincent Vega (John Travolta) are two hit men who are out to retrieve a suitcase stolen from their employer, mob boss Marsellus Wallace (Ving Rhames). Wallace has also asked Vincent to take his wife Mia (Uma Thurman) out a few days later when Wallace himself will be out of town. Butch Coolidge (Bruce Willis) is an aging boxer who is paid by Wallace to lose his fight. The lives of these seemingly unrelated people are woven together comprising of a series of funny, bizarre and uncalled-for incidents.\nWritten by\nSoumitra	https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2620371481/1434659607842-pgv4ql-1450205469045.mp4?Expires=1619378286&Signature=oYkaGfnWhQ4PRpXxF5jxLmLQU5TJ7mV4VSzX9RMqnEmzuqYNDNrlMyg4phGwiWnkFB7XckyG55cKwBa2saT1ua9ZAt7oYtIujETAA5WTZ4dcDztJXjAiVZAkQMXchljY4UQjDzG1oCxvJkMjC-a0A-M~bNpWmxcDG7GpJ886Y-~aPxdavUz8aTNul534r5-IAxwKtVXCmYxqLxNqrASvJoqeZ1mb-RPSWQLzZDh2lu2H2MXw81iGRmLWRRZIOAdOD7dKJObn5H92qyQ2KgGZf0Gnbe1lMeZBo9CZWHzU5uQyuJ7-~iCr3RaCz8~uMszpz1XNEseavSCfmoqRV~tRHg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	14 October 1994 (USA)			8.9 based on 1,853,917 user ratings	2h 34min	English\n|\nSpanish\n|\nFrench	Miramax, A Band Apart, Jersey Films 
9	tt0060196	/title/tt0060196	Il buono, il brutto, il cattivo (1966)	Blondie (The Good) (Clint Eastwood) is a professional gunslinger who is out trying to earn a few dollars. Angel Eyes (The Bad) (Lee Van Cleef) is a hitman who always commits to a task and sees it through, as long as he is paid to do so. And Tuco (The Ugly) (Eli Wallach) is a wanted outlaw trying to take care of his own hide. Tuco and Blondie share a partnership together making money off of Tuco's bounty, but when Blondie unties the partnership, Tuco tries to hunt down Blondie. When Blondie and Tuco come across a horse carriage loaded with dead bodies, they soon learn from the only survivor, Bill Carson (Antonio Casale), that he and a few other men have buried a stash of gold in a cemetery. Unfortunately, Carson dies and Tuco only finds out the name of the cemetery, while Blondie finds out the name on the grave. Now the two must keep each other alive in order to find the gold. Angel Eyes (who had been looking for Bill Carson) discovers that Tuco and Blondie met with Carson and knows ...\nWritten by\nJeremy Thomson	https://m.media-amazon.com/images/M/MV5BOTQ5NDI3MTI4MF5BMl5BanBnXkFtZTgwNDQ4ODE5MDE@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3416964889/1434659607842-pgv4ql-1568221418682.mp4?Expires=1619378304&Signature=PXX2qztDbLg68OwNP9DEHWOBHFsNgxXrlPa0fDluVL7JvMv2ea8Kzt6vn7DDzG0HHWkXu9oP30yneoesLPUSyGT4Duw6PQ7VK34qsMWqyoWK9VJ62UFZCRgxY7EkkVMCBtICz2bCRU~ewPBk-5xMer6ZUK-WtWOADHR~-zmzMeqdZwyJjsqRS8DExGxr~uMKYWid6BO8mJTbF9WozE1pNOqIBnkT2fl-F9weIEHG4WT~yYy--hd7y0tm8eGTcgRMlGvNhytqbQ9RKJcda9P3r-hSXQTEBjbrzkS~gNYbyIMMfPWHV8cFVP5hdLNbfvEi~0FbAFP28uw4GY1RUQQ1Kw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	23 December 1966 (Italy)			8.8 based on 697,577 user ratings	2h 41min	Italian	Produzioni Europee Associate (PEA), Arturo González Producciones Cinematográficas, Constantin Film 
10	tt0120737	/title/tt0120737	The Lord of the Rings: The Fellowship of the Ring (2001)	An ancient Ring thought lost for centuries has been found, and through a strange twist of fate has been given to a small Hobbit named Frodo. When Gandalf discovers the Ring is in fact the One Ring of the Dark Lord Sauron, Frodo must make an epic quest to the Cracks of Doom in order to destroy it. However, he does not go alone. He is joined by Gandalf, Legolas the elf, Gimli the Dwarf, Aragorn, Boromir, and his three Hobbit friends Merry, Pippin, and Samwise. Through mountains, snow, darkness, forests, rivers and plains, facing evil and danger at every corner the Fellowship of the Ring must go. Their quest to destroy the One Ring is the only hope for the end of the Dark Lords reign.\nWritten by\nPaul Twomey <toomsp@hotmail.com>	https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2073101337/1434659607842-pgv4ql-1616202358820.mp4?Expires=1619378319&Signature=Wv6XIaKjk2p4BHT20KTL9MMNA4Gp9XMsNdqFJ3x-NpkKjKQNl~RqudYm4-QfzFHTBmwkhZRMysxN~eO~Qm7GmwcocsBJdXUD2DPhBajEuZHSOR4NbaJAp5QnoVQgs7B1o09o1e5kqMgrGfLTEwnz8sOXTfYFENfc0rRuytFxsSFKHKUb0kw37z4GV5y~qcn-MEQwKWNZibqpnq4HPn5n~cGB8nF3V46uTM9jpLDdInObloEcec2fBpSHPEbJ2J1AYuaZUPyxKDsaLNI6z5Qr1PnAl-1W4AS9Q0Co0hw3OQ75-rGylcGF7KO4wGKNoKEsz4h5bzEubLpAAOf2siMHAw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	19 December 2001 (USA)			8.8 based on 1,685,558 user ratings	2h 58min	English\n|\nSindarin	New Line Cinema, WingNut Films, The Saul Zaentz Company 
11	tt0137523	/title/tt0137523	Fight Club (1999)	A nameless first person narrator (Edward Norton) attends support groups in attempt to subdue his emotional state and relieve his insomniac state. When he meets Marla (Helena Bonham Carter), another fake attendee of support groups, his life seems to become a little more bearable. However when he associates himself with Tyler (Brad Pitt) he is dragged into an underground fight club and soap making scheme. Together the two men spiral out of control and engage in competitive rivalry for love and power.\nWritten by\nRhiannon	https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi781228825/1434659607842-pgv4ql-1563680941480.mp4?Expires=1619378325&Signature=L8ezBDvaBPPBkJQ-hByMdG7tbeBODdTOg-IwWySMC~N6GJmTkZxZHXVNt1qxOqqXEr8SFogug9MrQuJpAmZxEw7xYKr~UFdFYlPXnKSAmrpRgxVtvIlX-uLguKZe3p12XkxfavCUFzAlpyDop8kQWdhho381D8egiezND9wyJihCp7eEU5faMtfLweRkINXl~vHibr-YEY0Xy8x1oz-olPW1Fb83kqpoBQFpPIXfVUuErgqj~Uf8CWySk18ibW~-mQa3UCv19KXQCohVuUmveExO2GJoWuXej6s0ZqBLPL1j4AuHqofexpE9KMMgkq7Ei~ZYlIUofupT49fmKyc8OA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	15 October 1999 (USA)			8.8 based on 1,883,085 user ratings	2h 19min	English	Fox 2000 Pictures, New Regency Productions, Linson Films 
12	tt0109830	/title/tt0109830	Forrest Gump (1994)	Forrest Gump is a simple man with a low I.Q. but good intentions. He is running through childhood with his best and only friend Jenny. His 'mama' teaches him the ways of life and leaves him to choose his destiny. Forrest joins the army for service in Vietnam, finding new friends called Dan and Bubba, he wins medals, creates a famous shrimp fishing fleet, inspires people to jog, starts a ping-pong craze, creates the smiley, writes bumper stickers and songs, donates to people and meets the president several times. However, this is all irrelevant to Forrest who can only think of his childhood sweetheart Jenny Curran, who has messed up her life. Although in the end all he wants to prove is that anyone can love anyone.\nWritten by\naliw135	https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3567517977/1434659607842-pgv4ql-1564505606861.mp4?Expires=1619378341&Signature=mXq1hI~hdWdB~WFbIJrpBADdNvCQA~pc34r-3LZFg6AVVhZVlXhoWaxB4WkIw-WjbwdVXEh~x-euNCTIUn~wLBSPF9t2nS2kkFrMYpW4~TKh93pWQkFiKlc8ogBfDh4yOt5wZlqjYrdVOdPw-zxEI2gf~ml5SqzyBbPNx1PMWFcN-U7qAxJ6NOVCLQr98Blx02eNA8hlOT5BXNglpWkh9W5EaucRAzCkXAx7fpJRxMzl8q6VFPtuu9Ms~WrEgnvRz2tfwU-dGlLY9Eh2OFlyetrcS50ZhMSQRGTuxKcnZYtmb14verZyPrt-9PeU354I-ghOJutkVd8sK1cf15CdhA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	6 July 1994 (USA)			8.8 based on 1,840,969 user ratings	2h 22min	English	Paramount Pictures, The Steve Tisch Company, Wendy Finerman Productions 
13	tt1375666	/title/tt1375666	Inception (2010)	Dom Cobb is a skilled thief, the absolute best in the dangerous art of extraction, stealing valuable secrets from deep within the subconscious during the dream state, when the mind is at its most vulnerable. Cobb's rare ability has made him a coveted player in this treacherous new world of corporate espionage, but it has also made him an international fugitive and cost him everything he has ever loved. Now Cobb is being offered a chance at redemption. One last job could give him his life back but only if he can accomplish the impossible, inception. Instead of the perfect heist, Cobb and his team of specialists have to pull off the reverse: their task is not to steal an idea, but to plant one. If they succeed, it could be the perfect crime. But no amount of careful planning or expertise can prepare the team for the dangerous enemy that seems to predict their every move. An enemy that only Cobb could have seen coming.\nWritten by\nWarner Bros. Pictures	https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2959588889/1434659607842-pgv4ql-1596404706743.mp4?Expires=1619378357&Signature=CdQFmeq6BIXrZ~H5R6wiRWBlda7Ijq5m3V8H-2SkMb1ycmx17KBgIasurko8L2X5FQDfmDarZo2buWLzcELSocD-p2HYfwO-dvwm2lekkBObT6FzX9yjT4sEP7D0S~nTfJOPDLoVu~Sknkhw3O6WDGfVWyKTw6mx-53NICpEMik~RFF034WFrUOfZkshlK51at6M9nmBVXlCgtVeIN4EDSkO9x8OH-KEwoibkpM0w564YVgrT2i~H4UO4u~KZsmaEVHxEL6u3rb6FscXRuCp9baJKGuJGrOYgH1kHvCZLeZERuXoxCz4U3Qg~jqL940Duxrlf53bxlLGDcJu4O~85Q__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	10 August 2010 (Armenia)			8.8 based on 2,102,029 user ratings	2h 28min	English\n|\nJapanese\n|\nFrench	Warner Bros., Legendary Entertainment, Syncopy 
14	tt0167261	/title/tt0167261	The Lord of the Rings: The Two Towers (2002)	The continuing quest of Frodo and the Fellowship to destroy the One Ring. Frodo and Sam discover they are being followed by the mysterious Gollum. Aragorn, the Elf archer Legolas, and Gimli the Dwarf encounter the besieged Rohan kingdom, whose once great King Theoden has fallen under Saruman's deadly spell.\nWritten by\nJwelch5742	https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2073101337/1434659607842-pgv4ql-1616202358820.mp4?Expires=1619378370&Signature=BuVu4OUfhDw4dCKaFEKVWGgBUPy4rnvJx6TRUF9HImV4cvwy4Xd8mVGaN2qEZIzIbxA7Mu~oAdWtmHUBQfms4Qn4XdaRgRs22VaxM0SSfethmnPw4YB--L8bRlN2szbjWFqA13hl4qjvfdXyg9onOQBKMlkZkOnoLQUHgvFXa7fk9qhubpIPOCdDwuKYIn~bt5bofY1URLG4PZOKhvk4eaXl-F2KJ6t6HLyrmhC1qkdRaziOOfjxGTfrDGc8uFBg7J66Pt1Li88Lk7UWDi6sFydsmLPXfBjNfMGzWB~Icq0ID2ZfqypZXbzLUKuiChwGg8U8NSl0n6aQ1IBeBbCmaw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	18 December 2002 (USA)			8.7 based on 1,505,916 user ratings	2h 59min	English\n|\nSindarin\n|\nOld English	New Line Cinema, WingNut Films, The Saul Zaentz Company 
15	tt0080684	/title/tt0080684	Star Wars: Episode V - The Empire Strikes Back (1980)	Luke Skywalker, Han Solo, Princess Leia and Chewbacca face attack by the Imperial forces and its AT-AT walkers on the ice planet Hoth. While Han and Leia escape in the Millennium Falcon, Luke travels to Dagobah in search of Yoda. Only with the Jedi Master's help will Luke survive when the Dark Side of the Force beckons him into the ultimate duel with Darth Vader.\nWritten by\nJwelch5742	https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi221753881/1434659607842-pgv4ql-1449789138097.mp4?Expires=1619378373&Signature=pRA7J4E6PVzHgCGa5SNIvtMTvnoAoGf3fvg-ldpkzM9LbM8W6m8c-vcWutthNcv42jftMiBlcVx27-3Va84hJ78lurIhNWtzlNc2Wap8Lv5gakLgzMhhvPX7ymIT0B8lJlW1I2tKyftUxakvfP26ZqwvEnH3zOvUXa2EVyvEHBT62TOuHs-tNHzMtR2P3eNG5I6dh0rN7tMBqHao69jUB9Iw9ewDbz~KYamIDYW-bL9Ee15mwwkzLdNFAedPQb8zXpe~uHQhVWU~G5oXy2Dg~oHE-cybTY7PjpM5wE-4XYq4gF2Crp~N1j~ROxOXwS8QmSnx-stfs5EKzSXC7BOV0g__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	21 May 1980 (UK)			8.7 based on 1,174,091 user ratings	2h 4min	English	Lucasfilm 
16	tt0133093	/title/tt0133093	The Matrix (1999)	Thomas A. Anderson is a man living two lives. By day he is an average computer programmer and by night a hacker known as Neo. Neo has always questioned his reality, but the truth is far beyond his imagination. Neo finds himself targeted by the police when he is contacted by Morpheus, a legendary computer hacker branded a terrorist by the government. As a rebel against the machines, Neo must confront the agents: super-powerful computer programs devoted to stopping Neo and the entire human rebellion.\nWritten by\nredcommander27	https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1032782617/1434659607842-pgv4ql-1606954147857.mp4?Expires=1619378391&Signature=iaSdVL9Tf92BwU3UTpcpHZ5qubF9JZaV306Pnlzb13kWsWsfff3ozpS4Smjn6jTfy4~YqZRkwR4SMMOQVGxmTBLM9ZhLpfF7KK4jQ4Cj6SY25iI~wTGmmNX0-6-i7WK8dX6Nl50SM4hnNlPGMED9s1p0DLoPuGTpvH3ryewL7WsuEqb4XKC5vVy9kp5GISM~nHehBdVqM3KBo~wnOn38aGufmQCBhPvlITSuicXbOcWe4xNVQyeisc3fvN-xQPxDIclRcDxxv0VjICaerKsyng~abJ07yXIW~eFIV~FtaVGGg1iNVY8aLOM-vAskWpCWlOUqn5GpKijFdqn5tHhKYw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	31 March 1999 (USA)			8.7 based on 1,702,149 user ratings	2h 16min	English	Warner Bros., Village Roadshow Pictures, Groucho Film Partnership 
17	tt0099685	/title/tt0099685	Goodfellas (1990)	Henry Hill might be a small time gangster, who may have taken part in a robbery with Jimmy Conway and Tommy De Vito, two other gangsters who might have set their sights a bit higher. His two partners could kill off everyone else involved in the robbery, and slowly start to think about climbing up through the hierarchy of the Mob. Henry, however, might be badly affected by his partners' success, but will he consider stooping low enough to bring about the downfall of Jimmy and Tommy?\nWritten by\nColin Tinto <cst@imdb.com>	https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2673654553/1434659607842-pgv4ql-1536960216608.mp4?Expires=1619378408&Signature=qLjgB-eJEFjZEjEfuy1a6HgiYoAUarHA2yGXosXoyAs-RelBcdYLqOhCzuuRMa09CwtbOdcf6wD687ADVkS9d-TiY9yyS9v03RBHUQd8V-7ePWmMSp398HX6U-PGFWudBjCrHEMasQsuNRyS86tPINWoCoxdjn~M4lTEafIlTLwkYNBshDVfsD0neIiDX0v7LwHKyL-boPe329733MkIoqcYoT9ajKamIFZTuX-1O81xYJ0KCi6IVuS~4ZA8lstYK0vYMa7i1tT0DUZJamHjLlWNKKT8BYgloxYrFSo5osI0eZ95BmluhuwdisqIEgr5E66uWQ8mN6vSNe2YT7ho0Q__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	21 September 1990 (USA)			8.7 based on 1,037,586 user ratings	2h 26min	English\n|\nItalian	Warner Bros. 
18	tt0073486	/title/tt0073486	One Flew Over the Cuckoo's Nest (1975)	McMurphy has a criminal past and has once again gotten himself into trouble and is sentenced by the court. To escape labor duties in prison, McMurphy pleads insanity and is sent to a ward for the mentally unstable. Once here, McMurphy both endures and stands witness to the abuse and degradation of the oppressive Nurse Ratched, who gains superiority and power through the flaws of the other inmates. McMurphy and the other inmates band together to make a rebellious stance against the atrocious Nurse.\nWritten by\nJacob Oberfrank	https://m.media-amazon.com/images/M/MV5BZjA0OWVhOTAtYWQxNi00YzNhLWI4ZjYtNjFjZTEyYjJlNDVlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3943282969/1434659607842-pgv4ql-1504835882703.mp4?Expires=1619378421&Signature=VTQYaa7lMhl84zuYGLcSBs5z1J9~XSk-fR81rFadS1mx8ork6aHo88DQ8iHJ0olc2qDrxiG3tyJaEhd5j3oJkxToi~Lcz7FH-1Aze5ZPAlrWJglrpgGLhLm2oUVG7zRbhJBvcqVwTA~0X1DbzVU0LC8fGXqmihgiStliVJqHDAMX7YaoFS0d4eDYzLLfKTVuFop080lYUGOSK9NYdHh2BrGFiHs2veYrZCbXQxXDwenyjHmX5scvbsEswCmqOmFdenP0dN0ZxvqjQSFCAHFHX7FxU2iTb487VJJQIeLr07EeXFh0LcnALI9b-9v6xoz4RaSeB10ScTDhu1Avseemlg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	19 November 1975 (USA)			8.7 based on 929,804 user ratings	2h 13min	English	Fantasy Films 
19	tt0047478	/title/tt0047478	Shichinin no samurai (1954)	A veteran samurai, who has fallen on hard times, answers a village's request for protection from bandits. He gathers 6 other samurai to help him, and they teach the townspeople how to defend themselves, and they supply the samurai with three small meals a day. The film culminates in a giant battle when 40 bandits attack the village.\nWritten by\nColin Tinto <cst@imdb.com>	https://m.media-amazon.com/images/M/MV5BOWE4ZDdhNmMtNzE5ZC00NzExLTlhNGMtY2ZhYjYzODEzODA1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_FMjpg_UX1000_.jpg			26 April 1954 (Japan)			8.6 based on 320,098 user ratings	3h 27min	Japanese	Toho Company 
20	tt0114369	/title/tt0114369	Se7en (1995)	A film about two homicide detectives' (Morgan Freeman and Brad Pitt) desperate hunt for a serial killer who justifies his crimes as absolution for the world's ignorance of the Seven Deadly Sins. The movie takes us from the tortured remains of one victim to the next as the sociopathic "John Doe" (Kevin Spacey) sermonizes to Detectives Somerset and Mills -- one sin at a time. The sin of Gluttony comes first and the murderer's terrible capacity is graphically demonstrated in the dark and subdued tones characteristic of film noir. The seasoned and cultured but jaded Somerset researches the Seven Deadly Sins in an effort to understand the killer's modus operandi while the bright but green and impulsive Detective Mills (Pitt) scoffs at his efforts to get inside the mind of a killer...\nWritten by\nMark Fleetwood <mfleetwo@mail.coin.missouri.edu>	https://m.media-amazon.com/images/M/MV5BOTUwODM5MTctZjczMi00OTk4LTg3NWUtNmVhMTAzNTNjYjcyXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2508831257/1434659607842-pgv4ql-1540843135385.mp4?Expires=1619378448&Signature=IHhiYi4z9OoO9MXDrkNGyh~ScaslvVj1gAd7Q-bwwgi7QxUe2f2j2jzsY~UPTjbY13djAiGuMTW~ercpQbD7YWbgUTH29zYcVyXYB~U~z0HMamSJiKDoGnkiwhiNjKojc5wxpSKTyiAVV83Gyunbb1O1BZqWvnaLQseYtOLTSFuXzR2jCr9Qii2Cmc9Ks2h9O8u0JDw1wNYw49Oe~CaF~8c68-IQQbSlCmFO4-2HkN3~IbTBjlbY0PO97DXsArbp4hwC6uubS6bAUo5gy~eOLfI3jwTaR469FkacnQJ9YZd0jyTBxIcTLENk9f24CiE9nfuDlFmBCsBzmLFFX~MxCQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	22 September 1995 (USA)			8.6 based on 1,469,391 user ratings	2h 7min	English	Cecchi Gori Pictures, Juno Pix, New Line Cinema 
21	tt0118799	/title/tt0118799	La vita è bella (1997)	In 1930s Italy, a carefree Jewish book keeper named Guido starts a fairy tale life by courting and marrying a lovely woman from a nearby city. Guido and his wife have a son and live happily together until the occupation of Italy by German forces. In an attempt to hold his family together and help his son survive the horrors of a Jewish Concentration Camp, Guido imagines that the Holocaust is a game and that the grand prize for winning is a tank.\nWritten by\nAnthony Hughes <husnock31@hotmail.com>	https://m.media-amazon.com/images/M/MV5BYmJmM2Q4NmMtYThmNC00ZjRlLWEyZmItZTIwOTBlZDQ3NTQ1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2332801561/1434659607842-pgv4ql-1548604686311.mp4?Expires=1619378457&Signature=rxC3t3eenh0Ji1pmeFQGlj49op~Oj-folz69detC-yp18H970K5z~zG2NApUyHeTjBFDe~n~Y-PG-bc7ribfgnTBlSYGSzMzZ70W9-odpMadSHbEsTBrTiCKahuBqivb7bw86EFRv9oUOfR0cXVMOSj7vDTlAhPqBSHEtO7YWMxuH95RQkA9vnRRFRTRNj4TybDMilL-xjPDRhw9-FQuxpVluKyYPhbNlj13lgtn8oBBzZJq0m2budXizlLO1MH5ItLehjHvPDKDlTuXVZvi3yUuFvFMNig-AqdAuJE9mFjTEMDBV7wgRx9YJuB~-ng2Q6pLuo9TNIUKrSB5~hfphg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	20 December 1997 (Italy)			8.6 based on 633,772 user ratings	1h 56min	Italian\n|\nGerman\n|\nEnglish	Melampo Cinematografica, Cecchi Gori Group Tiger Cinematografica 
22	tt0317248	/title/tt0317248	Cidade de Deus (2002)	Brazil, 1960s, City of God. The Tender Trio robs motels and gas trucks. Younger kids watch and learn well...too well. 1970s: Li'l Zé has prospered very well and owns the city. He causes violence and fear as he wipes out rival gangs without mercy. His best friend Bené is the only one to keep him on the good side of sanity. Rocket has watched these two gain power for years, and he wants no part of it. he keeps getting swept up in the madness. All he wants to do is take pictures. 1980s: Things are out of control between the last two remaining gangs...will it ever end? Welcome to the City of God.\nWritten by\nJeff Mellinger <jeffmellinger@astound.net>	https://m.media-amazon.com/images/M/MV5BOTMwYjc5ZmItYTFjZC00ZGQ3LTlkNTMtMjZiNTZlMWQzNzI5XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1783208985/1434659607842-pgv4ql-1563947141179.mp4?Expires=1619378468&Signature=oOXvl8HtAXgG-IEZv70VOc5HxrjyHnNla8BR3j~6H7Uad1CyrQln1Wu2~iqEYqSeO2zdVpA0JqjZAGuhUYMBnq3iQrTlyFuT-sv2sXFFe0wO63ak2BY-Oh4S9PZfxjAq3zIsc~O9WjGiaRdRq0BmF8frN5rBmqKHIQqudwZhp2-pQqJwJvcCxN-BFZehcLPveB~I0Qx7oE5EgQ6D3nJroQICCMvm2epWX2gRVgOEuyYMCEq8nKn2PAfJLMtytKUrP6PwyXfsGj83EdPEvshn9-wVb7PtBbs6z741kstaxyWLM1qPuNB8CqRt~EIu91OQulQw0lMhmPoqb6xnFG1bgg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	30 August 2002 (Brazil)			8.6 based on 706,976 user ratings	2h 10min	Portuguese	O2 Filmes, VideoFilmes, Globo Filmes 
23	tt0102926	/title/tt0102926	The Silence of the Lambs (1991)	F.B.I. trainee Clarice Starling (Jodie Foster) works hard to advance her career, while trying to hide or put behind her West Virginia roots, of which if some knew, would automatically classify her as being backward or white trash. After graduation, she aspires to work in the agency's Behavioral Science Unit under the leadership of Jack Crawford (Scott Glenn). While she is still a trainee, Crawford asks her to question Dr. Hannibal Lecter (Sir Anthony Hopkins), a psychiatrist imprisoned, thus far, for eight years in maximum security isolation for being a serial killer who cannibalized his victims. Clarice is able to figure out the assignment is to pick Lecter's brains to help them solve another serial murder case, that of someone coined by the media as "Buffalo Bill" (Ted Levine), who has so far killed five victims, all located in the eastern U.S., all young women, who are slightly overweight (especially around the hips), all who were drowned in natural bodies of water, and all who ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3377380121/1434659607842-pgv4ql-1537473620563.mp4?Expires=1619378486&Signature=KkNkwuDLPYCoHKYME~1~ypiLrN8TTHbHb8j4MHBrhgKB9yPwNtiQwiUzs3OA5XaNAarBcVTnEuVekiR1JpNFNNadbYO2S0wxw1UDGR2uB~IrsRPcX-Rp6j8MO3pqaYMhCoUpKx0zBdD4kcXbcD-j5kl3aj3rendXuv7e0IwsdzI3SNiKt8U4s2Or1mJRD0FZTmh3J6iuVrqu-wxQi6Gab~OUD0bgQjXji8QBUobsEC6AW0LeQ2vctJjlJY2ZKv4ilJAB6GuCflPXE90-puyHaj2M6iYfheCbL73jaas6ESq3ZRjKYDpUbvP9mGW8oHdJ15YX8t3dB-dHW48mxyTwWw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	14 February 1991 (USA)			8.6 based on 1,291,732 user ratings	1h 58min	English\n|\nLatin	Strong Heart/Demme Production, Orion Pictures 
24	tt0038650	/title/tt0038650	It's a Wonderful Life (1946)	George Bailey has spent his entire life giving of himself to the people of Bedford Falls. He has always longed to travel but never had the opportunity in order to prevent rich skinflint Mr. Potter from taking over the entire town. All that prevents him from doing so is George's modest building and loan company, which was founded by his generous father. But on Christmas Eve, George's Uncle Billy loses the business's $8,000 while intending to deposit it in the bank. Potter finds the misplaced money and hides it from Billy. When the bank examiner discovers the shortage later that night, George realizes that he will be held responsible and sent to jail and the company will collapse, finally allowing Potter to take over the town. Thinking of his wife, their young children, and others he loves will be better off with him dead, he contemplates suicide. But the prayers of his loved ones result in a gentle angel named Clarence coming to earth to help George, with the promise of earning his ...\nWritten by\nalfiehitchie	https://m.media-amazon.com/images/M/MV5BZjc4NDZhZWMtNGEzYS00ZWU2LThlM2ItNTA0YzQ0OTExMTE2XkEyXkFqcGdeQXVyNjUwMzI2NzU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1101988121/1434659607842-pgv4ql-1564594359395.mp4?Expires=1619378501&Signature=VN2qrupxTg3ADb14G8AEvz8isd13-jxDDj6~yDW-ekHavUNt7k5bCUoC8XxU7c-QjytAf27Jya9j5w~ZVSoei1LXKwIkQjRibm2ve9961svOCrnaU5kTG~l-yjSbIiHH~psdvUhLsuZtPggOgIldrAqwffFxKSM8jQYkx05KTvJDLpNZ0t41V76A2JiLlnFWlohWOTEztdPUcY7qhMBaaIDlMSKR3MWymm4ttjqmiWEkHnJNa2e~ILc1~MDChpG85J2LzuEqAR~XzqtUV-DUXmhltZL5NzpiNG4Or1~kk0zYeRUIbLPC4AR4QxbUrk~QE3zrRnSrcic-av7KPlZtcw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	7 January 1947 (USA)			8.6 based on 411,016 user ratings	2h 10min	English\n|\nFrench	Liberty Films (II) 
25	tt0120815	/title/tt0120815	Saving Private Ryan (1998)	Opening with the Allied invasion of Normandy on 6 June 1944, members of the 2nd Ranger Battalion under Cpt. Miller fight ashore to secure a beachhead. Amidst the fighting, two brothers are killed in action. Earlier in New Guinea, a third brother is KIA. Their mother, Mrs. Ryan, is to receive all three of the grave telegrams on the same day. The United States Army Chief of Staff, George C. Marshall, is given an opportunity to alleviate some of her grief when he learns of a fourth brother, Private James Ryan, and decides to send out 8 men (Cpt. Miller and select members from 2nd Rangers) to find him and bring him back home to his mother...\nWritten by\nJ.Zelman	https://m.media-amazon.com/images/M/MV5BZjhkMDM4MWItZTVjOC00ZDRhLThmYTAtM2I5NzBmNmNlMzI1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1701906201/1434659607842-pgv4ql-1563548133010.mp4?Expires=1619378518&Signature=KWzoE9TR~QMtk78B6BvcmUiKJJdRbRoUFZ5W-PwuDctGW2IRJRXFy7gyF69R5iz0tau5xz-oIdy-g4HAGCX17QbywwLQBytQPcWHDqf~O7lyyni7J7-L2QWczO8o--OmwsogzCfgOAp6p1fSqTwR1TqruC-yr5FTBWOWeEwC-3vorUCA-bh4njrS8~U3loJ2TrWjZ17MHjKIXjAeql6Hexjrz9uSs0gJ16bNCuucokob3ZJqLgdnXkc7reQ6-cmGtAfBvdbfSqoSsNs38kRrHTHVnGhbccASV9~vN0VDOQftnJuUMZo79Fh02aNXeWUXBEqiFDsS0gvHzvZTV0f5pQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	24 July 1998 (USA)			8.6 based on 1,255,571 user ratings	2h 49min	English\n|\nFrench\n|\nGerman\n|\nCzech	Dreamworks Pictures, Paramount Pictures, Amblin Entertainment 
26	tt0076759	/title/tt0076759	Star Wars (1977)	The Imperial Forces, under orders from cruel Darth Vader, hold Princess Leia hostage in their efforts to quell the rebellion against the Galactic Empire. Luke Skywalker and Han Solo, captain of the Millennium Falcon, work together with the companionable droid duo R2-D2 and C-3PO to rescue the beautiful princess, help the Rebel Alliance and restore freedom and justice to the Galaxy.\nWritten by\nJwelch5742	https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1317709849/1434659607842-pgv4ql-1616202535791.mp4?Expires=1619378531&Signature=GMfUuTX22OZP71~GdsUMILk82GamCJ07C0LgS42ETr4BsTHnB3tjix1xeA4iHt17mz1YHGfCv0h1WBXNYunwoMK6b3uif73WzaOiD5rTopi5a~PfmYh5smdNoRsvDyiPTaOKqdPSSrs4-tJZwKPUDk0zSvAtDOwPcj1ewAwOFbDSAz0z~mUbEBRVEPrfXweWeK2-CODtl6e8RJppXoRSmgOgO2BGPeNL9KIEAaI4Yx~gjNlXMvsnhjQ6bSgkGtJrIDQjt5bCjz5LwfNk1~Kfehoynf647MpRsxzPiFpRk7FYoOQYTQVE2CCxB~5EQGtIDcHECspMSfwrlUI7ZHTjsQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 May 1977 (USA)			8.6 based on 1,246,090 user ratings	2h 1min	English	Lucasfilm, Twentieth Century Fox 
27	tt0120689	/title/tt0120689	The Green Mile (1999)	Death Row guards at a penitentiary, in the 1930's, have a moral dilemma with their job when they discover one of their prisoners, a convicted murderer, has a special gift.\nWritten by\nGuy Johns	https://m.media-amazon.com/images/M/MV5BMTUxMzQyNjA5MF5BMl5BanBnXkFtZTYwOTU2NTY3._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi552796441/1434659607842-pgv4ql-1563977441652.mp4?Expires=1619378536&Signature=WyO8WLOoTmsB5Nn0FeHWVT8Jxr3Ji9ysu-yj2jqYYaxd3u9PyNkavJwNhl4WpJKRkAWvaSQ3FbTujv6duJUp0~TPHSLEccxoEqO~Siko~XhC2nQ8fA7oqi-nyUn8JLR2XJrinnWaHeGV-XEQBEiY30x3xzHTUVT50un6hP9VMalGjyEwTskR48p2vZWYJPq821eONAoG0L0kWInnfZDxge7yCaDWmaivxsVo7~~Opry6Nga~slbdvvBvS3drJCawRcc5BOJk2KOBR04c46DVZ-3PS78rSfytdZEv9pFuCjv9RQH0FAIZ34khzIlvTqJISRaCyeUtsmv92enPTey8Rg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	10 December 1999 (USA)			8.6 based on 1,167,465 user ratings	3h 9min	English\n|\nFrench	Castle Rock Entertainment, Darkwoods Productions, Warner Bros. 
28	tt0245429	/title/tt0245429	Sen to Chihiro no kamikakushi (2001)	Chihiro and her parents are moving to a small Japanese town in the countryside, much to Chihiro's dismay. On the way to their new home, Chihiro's father makes a wrong turn and drives down a lonely one-lane road which dead-ends in front of a tunnel. Her parents decide to stop the car and explore the area. They go through the tunnel and find an abandoned amusement park on the other side, with its own little town. When her parents see a restaurant with great-smelling food but no staff, they decide to eat and pay later. However, Chihiro refuses to eat and decides to explore the theme park a bit more. She meets a boy named Haku who tells her that Chihiro and her parents are in danger, and they must leave immediately. She runs to the restaurant and finds that her parents have turned into pigs. In addition, the theme park turns out to be a town inhabited by demons, spirits, and evil gods. At the center of the town is a bathhouse where these creatures go to relax. The owner of the bathhouse ...\nWritten by\nZachary Harper	https://m.media-amazon.com/images/M/MV5BMjlmZmI5MDctNDE2YS00YWE0LWE5ZWItZDBhYWQ0NTcxNWRhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3619684633/1434659607842-pgv4ql-1564585734687.mp4?Expires=1619378543&Signature=Pd9JFxxl2Rv-VLDvQUsPft5tuVnZmAnFIIxhVaZfOFeLhUxtPjj9QncZ45qWL3m46ZeiE5Gvvxw9z0iL-iLTdC7BfiUf1M2U89ATLWAPuSVV9cXFavnDMihrYrZIYovq8KI0IdB8B7BjYzAt6rzUiQP3KmxGDjCy60gX~LbfXscjz2tXcmqYkS-8PnzFb3kyr~WeePvxCP7OxQMa~H5XbBURT18g3qWz16xmu2SVLTYFFzUQrCgO~Po0lo9Ebo-RF78g45ApWr3YNcCjCW0lGJvrkF-RR8Dde~EHf4hvDCWEP7Ssdm23z1wO7z3XNLoLrOU24S8bmXjFcSEpIv1mTA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	20 July 2001 (Japan)			8.6 based on 665,978 user ratings	2h 5min	Japanese	Tokuma Shoten, Studio Ghibli, Nippon Television Network (NTV) 
29	tt0816692	/title/tt0816692	Interstellar (2014)	Earth's future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind's survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.\nWritten by\nahmetkozan	https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1586278169/1434659607842-pgv4ql-1616202363366.mp4?Expires=1619378555&Signature=DRj0s5fHaFv~U0ay0oR0pgAXagE54Jq-eH83wiIiU2FX~-Ni6Ovszn0j3VCG7v5EVNpvoSBO5gic~zBLRyVhWHTORiMqifjmc2EKmQVgHiDRR5XpvqOKBfsgsoAmfLHlUitUZp3XNIsru9VvTPjRgPXf5uEjjwoiA72ljlCC56z9cp5sDpd4IUlfSaICS9VJcJfRiJ-Ja8Q21cSDAd1lTxNRTCO2MAQ~LA0sobxIGg4Qp12RQIYrKMChsX37aQZH1IrrT7YDQfX6nlHJMlVXrBfoJUTkHN5Fr7VUeMAHee1T77wpZmPez6GRBRLHfukeuTZJ2k6HD0xdLDfbuFpZ3g__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	6 November 2014 (Armenia)			8.6 based on 1,546,382 user ratings	2h 49min	English	Paramount Pictures, Warner Bros., Legendary Entertainment 
30	tt6751668	/title/tt6751668	Gisaengchung (2019)	The Kims - mother and father Chung-sook and Ki-taek, and their young adult offspring, son Ki-woo and daughter Ki-jung - are a poor family living in a shabby and cramped half basement apartment in a busy lower working class commercial district of Seoul. Without even knowing it, they, especially Mr. and Mrs. Kim, literally smell of poverty. Often as a collective, they perpetrate minor scams to get by, and even when they have jobs, they do the minimum work required. Ki-woo is the one who has dreams of getting out of poverty by one day going to university. Despite not having that university education, Ki-woo is chosen by his university student friend Min, who is leaving to go to school, to take over his tutoring job to Park Da-hye, who Min plans to date once he returns to Seoul and she herself is in university. The Parks are a wealthy family who for four years have lived in their modernistic house designed by and the former residence of famed architect Namgoong. While Mr. and Mrs. Park ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1015463705/1434659607842-pgv4ql-1606954080073.mp4?Expires=1619378570&Signature=Jn~dHPBHHNUvvOIm9RDCTqby1-1T0BAhPizM8nuTrFJ8BrsJ7rrejV0xM0u-21c4x2mvtn8Gepmp0lTaGg4dveeZdPlaw9XWRZ-blxtU6BOcmucrkA5ePPhm0M~ihrcHyHqhZlEgbkRkN5w-ULhqmf0mZCM--oGgzBU-1EoQvkbY3VKwNYY4MoJ9eotaEZabHnf-gRjTzzBR5HUk9at~k6-MtqQQNnPTYcjSW0MOyaq7wydA7BOAQXyYaRADa~PTUwynLOurmzkS56dGOACNyYa79bZZy1p~OhTCmiAzH8xQJpMG6sj6zpf9gWINoY1uLRGsnN-d7nzJpZBG1M3x3g__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	30 May 2019 (South Korea)			8.6 based on 593,497 user ratings	2h 12min	Korean\n|\nEnglish	Barunson E&A, CJ Entertainment 
31	tt0110413	/title/tt0110413	Léon (1994)	After her father, step-mother, step-sister and little brother are killed by her father's employers, the 12-year-old daughter of an abject drug dealer manages to take refuge in the apartment of a professional hitman who at her request teaches her the methods of his job so she can take her revenge on the corrupt DEA agent who ruined her life by killing her beloved brother.\nWritten by\nJ. S. Golden	https://m.media-amazon.com/images/M/MV5BODllNWE0MmEtYjUwZi00ZjY3LThmNmQtZjZlMjI2YTZjYmQ0XkEyXkFqcGdeQXVyNTc1NTQxODI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2744254745/1434659607842-pgv4ql-1564588687772.mp4?Expires=1619378583&Signature=hvxIC~gHU1O75a4e0c48lerIwkiaWRUztjJwMZveUrZOqQ061SumgNXwrFTWojGsj-q0T1rPVkR~Jf1fN7oPJfdb8EAZFZm1rAVEkVJK1h6lo0S0Z1~YvMlIZP5oPZyzzQMxuYCH4-5xLz7tbxv~mwTGxS7wmhTmz5WKi~V1VWLBhaxGdMbgix3xvTgUZ8yKIzdOou1~kkOt8JbeU3OKdqwYJ6NfBzvodSP3bkH-8-CgpsRn6ntSpSh6oaakbvRpKE4zFTnIjCUVb1kjjpZyv8mGLPaTZ9GvFM3qt-4fhXCfA1m68FMvAwrOfavKKGFv46reoOatnxI66ah6MpnAbQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	14 September 1994 (France)			8.5 based on 1,051,229 user ratings	1h 50min	English\n|\nItalian\n|\nFrench	Gaumont, Les Films du Dauphin, Columbia Pictures 
32	tt0056058	/title/tt0056058	Seppuku (1962)	Peace in 17th-century Japan causes the Shogunate's breakup of warrior clans, throwing thousands of samurai out of work and into poverty. An honorable end to such fate under the samurai code is ritual suicide, or hara-kiri (self-inflicted disembowelment). An elder warrior, Hanshiro Tsugumo (Tatsuya Nakadai) seeks admittance to the house of a feudal lord to commit the act. There, he learns of the fate of his son-in-law, a young samurai who sought work at the house but was instead barbarically forced to commit traditional hara-kiri in an excruciating manner with a dull bamboo blade. In flashbacks the samurai tells the tragic story of his son-in-law, and how he was forced to sell his real sword to support his sick wife and child. Tsugumo thus sets in motion a tense showdown of revenge against the house.\nWritten by\nKevin Rayburn <kprayb01@homer.louisville.edu>	https://m.media-amazon.com/images/M/MV5BYjBmYTQ1NjItZWU5MS00YjI0LTg2OTYtYmFkN2JkMmNiNWVkXkEyXkFqcGdeQXVyMTMxMTY0OTQ@._V1_FMjpg_UX1000_.jpg			16 September 1962 (Japan)			8.6 based on 44,340 user ratings	2h 13min	Japanese	Shochiku 
33	tt0110357	/title/tt0110357	The Lion King (1994)	A young lion prince is cast out of his pride by his cruel uncle, who claims he killed his father. While the uncle rules with an iron paw, the prince grows up beyond the Savannah, living by a philosophy: No worries for the rest of your days. But when his past comes to haunt him, the young prince must decide his fate: Will he remain an outcast or face his demons and become what he needs to be?\nWritten by\nfemaledragon1234	https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3764362265/1434659607842-pgv4ql-1474413579826.mp4?Expires=1619378610&Signature=lyUCIdRIx-wA5jZbyItW6CZhzYjSBU4ZACkdbGHi8N43FHJWe3Wwn4Xsv~vvfqoa8maglnA~Fm4ycgUkqyV3G~a~7CgAyz7LMtVXJEJrTNFRiKJn~dwtato4icHKIJ97sJdxeHCJdmcV9kBD6bWqjs4st68QP6Iz~gEU9sWX2nt~czvM7RtxvOKe-jEBuD9sPRVc8tFJs8rE4MGTwkLB765-o5LcCtT36-icDXW55MszO8fTkyzP0SeEaI~2aMkDQGM9iDt2GiejQvYeytCx3FQWx-xxtOz-j-dPR1jVMN2sLA4sXX4ddCLVFpcEAzC8h2Yf6CzJMEEaNkgPEl6qIQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	24 June 1994 (USA)			8.5 based on 956,912 user ratings	1h 28min	English\n|\nSwahili\n|\nXhosa\n|\nZulu	Walt Disney Pictures, Walt Disney Animation Studios 
34	tt0114814	/title/tt0114814	The Usual Suspects (1995)	Following a truck hijack in New York, five criminals are arrested and brought together for questioning. As none of them are guilty, they plan a revenge operation against the police. The operation goes well, but then the influence of a legendary mastermind criminal called Keyser Söze is felt. It becomes clear that each one of them has wronged Söze at some point and must pay back now. The payback job leaves 27 men dead in a boat explosion, but the real question arises now: Who actually is Keyser Söze?\nWritten by\nSoumitra	https://m.media-amazon.com/images/M/MV5BYTViNjMyNmUtNDFkNC00ZDRlLThmMDUtZDU2YWE4NGI2ZjVmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2717188377/1434659607842-pgv4ql-1564025456200.mp4?Expires=1619378628&Signature=OKvHo2ujgdGSBXo3lCdxU26eoQfwm0WwQdvZ9hd5~QOaQAUSgVyT-L-1WFGA~~cmvuiLbEqPKPe6OfGjEwaYF2AKKyQK8sPhS9LqJLqmaum~U492Z7u~uy5vtA7b~5NETivG9ZkBB-PntfOY6LVxnryW~o~mD0fPLUuX97lzTU8XZSUf8ARkZUUgEbQV3B9hjDW3dhCw5NUEM3sI-cbBy2vsrjkTEbBNOiAesw0wt4-pAfFJLPXGW3PIVrxqL8vf1PCOdzuQOcAw22Rd4FrfKOcKpPDGDDKosCZjFvr4EeJcIUytDavE3NS7wJXYHKsMrVeZoK9C1Cz-w1HB5dsixg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	16 August 1995 (USA)			8.5 based on 1,003,570 user ratings	1h 46min	English\n|\nHungarian\n|\nSpanish\n|\nFrench	PolyGram Filmed Entertainment, Spelling Films International, Blue Parrot 
35	tt0253474	/title/tt0253474	The Pianist (2002)	In this adaptation of the autobiography "The Pianist: The Extraordinary True Story of One Man's Survival in Warsaw, 1939-1945," Wladyslaw Szpilman, a Polish Jewish radio station pianist, sees Warsaw change gradually as World War II begins. Szpilman is forced into the Warsaw Ghetto, but is later separated from his family during Operation Reinhard. From this time until the concentration camp prisoners are released, Szpilman hides in various locations among the ruins of Warsaw.\nWritten by\nJwelch5742	https://m.media-amazon.com/images/M/MV5BOWRiZDIxZjktMTA1NC00MDQ2LWEzMjUtMTliZmY3NjQ3ODJiXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi988938521/1434659607842-pgv4ql-1563966673223.mp4?Expires=1619378641&Signature=XRmPLcltyTA2e9Plv8atRUxSoBTJZMvw-jUANlUrNkESGGcGXIcwAA14iQk04yEGD7OvFMbfX0I3NEsxyzTNGDbmUf7zG0xk8eE8oH58F6~62GgXKMOLkr8Bm7v2ajoW2GCePZlgL6pJTvhauco3x0BZfO8mH3Bu996nNzB2Jt-YnHnuzVOmmGSsFE5m8Zz~LQj6fWfUg9A1rIvIsEdALQo4DahKPG8Sl-k5QrW7EyhR4HNuq32g5oFhByc6Oj1tYWd-5Ka1gYNNMWfRClJF1A8CWmBfaJvb4C6y41cUgCHJSLN4EJIsQ4rizM~7v2hwoGJHDMCRKVExLR96RShvGg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 September 2002 (France)			8.5 based on 744,147 user ratings	2h 30min	English\n|\nGerman\n|\nRussian	R.P. Productions, Heritage Films, Studio Babelsberg 
36	tt0103064	/title/tt0103064	Terminator 2: Judgment Day (1991)	Over 10 years have passed since the first machine called The Terminator tried to kill Sarah Connor and her unborn son, John. The man who will become the future leader of the human resistance against the Machines is now a healthy young boy. However, another Terminator, called the T-1000, is sent back through time by the supercomputer Skynet. This new Terminator is more advanced and more powerful than its predecessor and its mission is to kill John Connor when he's still a child. However, in the Internet and John do not have to face the threat of the T-1000 alone. Another Terminator (identical to the same model that tried and failed to kill Sarah Connor in 1984) is also sent back through time to protect them. Now, the battle for tomorrow has begun.\nWritten by\nEric ggg	https://m.media-amazon.com/images/M/MV5BMGU2NzRmZjUtOGUxYS00ZjdjLWEwZWItY2NlM2JhNjkxNTFmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2748889369/1434659607842-pgv4ql-1498868672528.mp4?Expires=1619378657&Signature=AimjEj0577fioJql2T-6n2U-ik-DGvlMpZcH8Z5o7gV9Rfi2f5TiKxqVZUEo1kVXrADUXiQeTXbenZbytwecVeKKuF17ZEmm-UUgT-5jy8qIBgDz~QP5BHQbKIe2eFvUOhchsUUK4SPmO4oQyrl1F-rFO~BSJoUpFg2gANG~haFMjv3Nz3~CXCTsiRXgD1mRjNpmfoOCzWonbXHCiQOBiktBudHMjXo4dcrIbwgVGnhwzyGTOM2jwaYa3-4Rnzj01riAD44GH1Wmdq-rlajkWPq7Z-g5QK4vLLmCu-2NCOMeUS3~PpJ9J8cTUQNWF~OcUyNW6AjMaKdTSXK7IFy-Bw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	3 July 1991 (USA)			8.5 based on 1,006,939 user ratings	2h 17min	English\n|\nSpanish	Carolco Pictures, Pacific Western, Lightstorm Entertainment 
37	tt0088763	/title/tt0088763	Back to the Future (1985)	Marty McFly, a typical American teenager of the Eighties, is accidentally sent back to 1955 in a plutonium-powered DeLorean "time machine" invented by a slightly mad scientist. During his often hysterical, always amazing trip back in time, Marty must make certain his teenage parents-to-be meet and fall in love - so he can get back to the future.\nWritten by\nRobert Lynch <docrlynch@yahoo.com>	https://m.media-amazon.com/images/M/MV5BZmU0M2Y1OGUtZjIxNi00ZjBkLTg1MjgtOWIyNThiZWIwYjRiXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi252380953/1434659607842-pgv4ql-1563638328576.mp4?Expires=1619378670&Signature=MTfFoN-Mu~8Ra1WufRATlhQc0MXiYJwmylWnK0F-8P~vpDThrg-J0PfKyCrh4ixKTJT5kw43WwBbz8zCJiGfiuvbyyqdr5wJ3RsTITdNiBjXFqMWpJRAKLJojdppIpyVww0bNqQ0vg74Wt5CXO0bHzpvc5VNBzTotphZEts3wP2~Ze4NHfPt395tEpjffLSqyGYCbBxqqVMe81F2urvECagEeb75RYnsnXGIn5IYB~aqFkfEXIlex4WGw7njW90dsJ-P03fekQYwR81TyO~TeoeYo8dyJKtYZOw0j10wtd5wo529XnxOTERgEoPpGXtFOrOBq-2e9-2Urb70uomwNA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	3 July 1985 (USA)			8.5 based on 1,075,769 user ratings	1h 56min	English	Universal Pictures, Amblin Entertainment, U-Drive Productions 
155	tt0476735	/title/tt0476735	Babam ve Oglum (2005)	Sadik is one of the rebellious youth who has been politically active as a university student and became a left-wing journalist in the 70's, despite his father's expectations of him becoming an agricultural engineer and taking control of their family farm in an Aegean village. On the dawn of September 12, 1980, when a merciless military coup hits the country, they cannot find access to any hospital or a doctor and his wife dies while giving birth to their only child, Deniz. After a long-lasting period of torture, trials, and jail time, Sadik returns to his village with 7-8 years old Deniz, knowing that it will be hard to correct things with his father, Huseyin.\nWritten by\nAli Riza Bolukbasi	https://m.media-amazon.com/images/M/MV5BNjAzMzEwYzctNjc1MC00Nzg5LWFmMGItMTgzYmMyNTY2OTQ4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg			18 November 2005 (Turkey)			8.3 based on 80,436 user ratings	1h 52min	Turkish	Avsar Film 
38	tt0120586	/title/tt0120586	American History X (1998)	Derek Vineyard is paroled after serving 3 years in prison for brutally killing two black men who tried to break into/steal his truck. Through his brother's, Danny Vineyard, narration, we learn that before going to prison, Derek was a skinhead and the leader of a violent white supremacist gang that committed acts of racial crime throughout L.A. and his actions greatly influenced Danny. Reformed and fresh out of prison, Derek severs contact with the gang and becomes determined to keep Danny from going down the same violent path as he did.\nWritten by\nNitesh D.(nmxpa7@msn.com)	https://m.media-amazon.com/images/M/MV5BZTJhN2FkYWEtMGI0My00YWM4LWI2MjAtM2UwNjY4MTI2ZTQyXkEyXkFqcGdeQXVyNjc3MjQzNTI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi854001177/1434659607842-pgv4ql-1564093940605.mp4?Expires=1619378683&Signature=CMbGFCLTUnHbMrYyjLmZZH-5~svmiYXLtFe42bpj8JaEp-l5Lcy~6y-vLd5hlJ5Ke9jNxl-4KOgnU9KaCVoSiYY9jqTGuyEqnEqWKRQehcaHxRtixmaMuDIJoj5eKdy0tg1tCB~sjVdrBkQWoGxYzuaBS0cyDLRnXNM9L0T4vyhRSROnV4nGC5aGaBEMecp8ph6pWHuC6uumuS8w3VwbhIU84KMDQYkhl9spwly~zEldkyAVxO73LrW-Pe28Nd3aTBXZOCM9v4UXWtEZMakUfJNy~kRmqMFCr3TpTBUlkoL~4NtJ9OOjMYavcBXchyydLK~Fku8ZSs9AnqFmYkeVSw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	20 November 1998 (USA)			8.5 based on 1,046,077 user ratings	1h 59min	English	New Line Cinema, Savoy Pictures, The Turman-Morrissey Company 
39	tt0027977	/title/tt0027977	Modern Times (1936)	Chaplin's last 'silent' film, filled with sound effects, was made when everyone else was making talkies. Charlie turns against modern society, the machine age, (The use of sound in films ?) and progress. Firstly we see him frantically trying to keep up with a production line, tightening bolts. He is selected for an experiment with an automatic feeding machine, but various mishaps leads his boss to believe he has gone mad, and Charlie is sent to a mental hospital - When he gets out, he is mistaken for a communist while waving a red flag, sent to jail, foils a jailbreak, and is let out again. We follow Charlie through many more escapades before the film is out.\nWritten by\nColin Tinto <cst@imdb.com>	https://m.media-amazon.com/images/M/MV5BYjJiZjMzYzktNjU0NS00OTkxLWEwYzItYzdhYWJjN2QzMTRlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg			25 February 1936 (USA)			8.5 based on 221,591 user ratings	1h 27min	English	Charles Chaplin Productions 
40	tt0172495	/title/tt0172495	Gladiator (2000)	Maximus is a powerful Roman general, loved by the people and the aging Emperor, Marcus Aurelius. Before his death, the Emperor chooses Maximus to be his heir over his own son, Commodus, and a power struggle leaves Maximus and his family condemned to death. The powerful general is unable to save his family, and his loss of will allows him to get captured and put into the Gladiator games until he dies. The only desire that fuels him now is the chance to rise to the top so that he will be able to look into the eyes of the man who will feel his revenge.\nWritten by\nChris "Morphy" Terry	https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2628367897/1434659607842-pgv4ql-1473794595177.mp4?Expires=1619378697&Signature=Bv0rxZ24H5CguPBVcA86XT2lKUWaCqXwucehd2fZIcNsgHgq09yG6~~WSpzmLCq5ySetgg6LN5ZFlsKaTTgSbRCXXmPvWFgS5uNuwkg9cAih-8BegZDheWu2igUfwBCBGNsrPdEiP8r685fst6LkNTVs9YPfmeZtQNymRBwLafOSlmRqmwJ7KQbIgTDkvQ~slu-C91Qu2kwIxqkQzp76t55A3mkDcvsbAm2SwppPnb7lVb~bXB9qi6V75XjFx7LDJAKoXdsaYgcOUU3xLvqew1apMqKd1rB33xjhQbocgztFlSEjR22gsuhFdkXAl-ayzcVHwTkpWEzf3vFxgdsR5Q__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	3 June 2000 (Armenia)			8.5 based on 1,360,041 user ratings	2h 35min	English	Dreamworks Pictures, Universal Pictures, Scott Free Productions 
41	tt0054215	/title/tt0054215	Psycho (1960)	Phoenix office worker Marion Crane is fed up with the way life has treated her. She has to meet her lover Sam in lunch breaks, and they cannot get married because Sam has to give most of his money away in alimony. One Friday, Marion is trusted to bank forty thousand dollars by her employer. Seeing the opportunity to take the money and start a new life, Marion leaves town and heads towards Sam's California store. Tired after the long drive and caught in a storm, she gets off the main highway and pulls into the Bates Motel. The motel is managed by a quiet young man called Norman who seems to be dominated by his mother.\nWritten by\nCol Needham <col@imdb.com>	https://m.media-amazon.com/images/M/MV5BNTQwNDM1YzItNDAxZC00NWY2LTk0M2UtNDIwNWI5OGUyNWUxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi607099161/1434659607842-pgv4ql-1564572857335.mp4?Expires=1619378713&Signature=XYwGczFc7oFKqXYNbIlCFW2AM0atLrRG03zgM0nTQsnhPjtwS12jA8ReE81UhJxXxFxVEfMZtD10BJuNJ2gXdtJo2TjJrILoVpqfPFrv39D3RdEg8Xwl8N-jFsdBS5~2gBBLLafnGFI4yycZArMvWondJdJhGVzfDToEg1hUdXFe8CI4OeqoOtJoB5iNo-vBrI0oQJSsEN9mDPlqss36XFb3-5zdG2JFla67UfTKaTli~f4BJgO9qcQXXrGnskV68tDHtBtXSaGVbgojDZru86x-WY-nVeWCM-cIs-NJHvQFRwolUVbHr1G0sbmhZplm5muCpRTN6D~sINmeEcTLow__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	8 September 1960 (USA)			8.5 based on 612,933 user ratings	1h 49min	English	Shamley Productions 
42	tt0407887	/title/tt0407887	The Departed (2006)	In this crime-action tour de force, the South Boston state police force is waging war on Irish-American organized crime. Young undercover cop Billy Costigan is assigned to infiltrate the mob syndicate run by gangland chief Frank Costello. While Billy quickly gains Costello's confidence, Colin Sullivan, a hardened young criminal who has infiltrated the state police as an informer for the syndicate is rising to a position of power in the Special Investigation Unit. Each man becomes deeply consumed by their double lives, gathering information about the plans and counter-plans of the operations they have penetrated. But when it becomes clear to both the mob and the police that there is a mole in their midst, Billy and Colin are suddenly in danger of being caught and exposed to the enemy - and each must race to uncover the identity of the other man in time to save themselves. But is either willing to turn on their friends and comrades they've made during their long stints undercover?\nWritten by\nAnonymous	https://m.media-amazon.com/images/M/MV5BMTI1MTY2OTIxNV5BMl5BanBnXkFtZTYwNjQ4NjY3._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2760573209/1434659607842-pgv4ql-1563532402193.mp4?Expires=1619378728&Signature=Ba0RYWCacGCKQJKz4pwbZZXLUIWpc-W~LviVj9hE1j8libwk23rp-Qd41HNl8-P8pBdZWKpjfFBOf5LDXJalH3iRum6EN3N0xakDQJ04o5CkkYV99BRm30J-mFXPGkftm~BCoBcc5pT5pqcjWExiYuzdjE5TTa2Vp~QK6My39RJAhdfpuwPrMA70i949GaARMhP~WTsJ0XcslP7eYkYk5q8iss3MtI-XicuF382SiopFFKZMZaR5MevrlHt2PiFV2HlVOsijmWzujrk-lJjU1J9gCVVhHUtfNpRHtplS4f3RfTR~XiCWzd7S8GuFmNqNAkOQUWwkLAUAypPto8XpaQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	6 October 2006 (USA)			8.5 based on 1,207,410 user ratings	2h 31min	English\n|\nCantonese	Warner Bros., Plan B Entertainment, Initial Entertainment Group (IEG) 
43	tt0021749	/title/tt0021749	City Lights (1931)	A tramp falls in love with a beautiful blind girl. Her family is in financial trouble. The tramp's on-and-off friendship with a wealthy man allows him to be the girl's benefactor and suitor.\nWritten by\nJohn J. Magee <magee@helix.mgh.harvard.edu>	https://m.media-amazon.com/images/M/MV5BY2I4MmM1N2EtM2YzOS00OWUzLTkzYzctNDc5NDg2N2IyODJmXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg			7 March 1931 (USA)			8.5 based on 170,381 user ratings	1h 27min	None\n|\nEnglish	Charles Chaplin Productions 
44	tt2582802	/title/tt2582802	Whiplash (2014)	Nineteen year old Andrew Niemann wants to be the greatest jazz drummer in the world, in a league with Buddy Rich. This goal is despite not coming from a pedigree of greatest, musical or otherwise, with Jim, his high school teacher father, being a failed writer. Andrew is starting his first year at Shaffer Conservatory of Music, the best music school in the United States. At Shaffer, being the best means being accepted to study under Terence Fletcher and being asked to play in his studio band, which represents the school at jazz competitions. Based on their less than positive first meeting, Andrew is surprised that Fletcher asks him to join the band, albeit in the alternate drummer position which he is more than happy to do initially. Andrew quickly learns that Fletcher operates on fear and intimidation, never settling for what he considers less than the best each and every time. Being the best in Fletcher's mind does not only entail playing well, but knowing that you're playing well ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BOTA5NDZlZGUtMjAxOS00YTRkLTkwYmMtYWQ0NWEwZDZiNjEzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi4006456345/1434659607842-pgv4ql-1616202354600.mp4?Expires=1619378738&Signature=ffJpjeBXTkIz9J8eVpejP0TFVxehT1-2Qc4Y6Lx7EygmUOTo9tK7NleX73lSe0yawfUuAeSqh6jf0kcrd8w0xOSHSCcTqmK3BDrW26RexsIUNVETek0fxLmf04NBYiK~B5yl59b3HXTNn0z7YBAaEDj1uVpjlKh7q7fokm0S~-vQybB9~AE3b12DtLAwWDYmd2q442o3BRX9eRnnqZtJEMYQt7wWl1QYBLP5NwdroRkLs-eRedoV6ktRBnKxO6RC1xvLhq64fQpSqiN9t-8IO0JoIWQWk7cFUsuxmVFe6FoWfz95Zs7zWZ9YzPgKhNDwE678iRJFjP8iGZvrr~0qHw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	15 October 2014 (Philippines)			8.5 based on 733,399 user ratings	1h 46min	English	Bold Films, Blumhouse Productions, Right of Way Films 
45	tt1675434	/title/tt1675434	The Intouchables (2011)	In Paris, the aristocratic and intellectual Philippe is a quadriplegic millionaire who is interviewing candidates for the position of his carer, with his red-haired secretary Magalie. Out of the blue, Driss cuts the line of candidates and brings a document from the Social Security and asks Phillipe to sign it to prove that he is seeking a job position so he can receive his unemployment benefit. Philippe challenges Driss, offering him a trial period of one month to gain experience helping him. Then Driss can decide whether he would like to stay with him or not. Driss accepts the challenge and moves to the mansion, changing the boring life of Phillipe and his employees.\nWritten by\nClaudio Carvalho, Rio de Janeiro, Brazil	https://m.media-amazon.com/images/M/MV5BMTYxNDA3MDQwNl5BMl5BanBnXkFtZTcwNTU4Mzc1Nw@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi59285529/1434659607842-pgv4ql-1616202345202.mp4?Expires=1619378750&Signature=br6CCyttDdPyBt1EFN2EueefYxKDLeEuZte5Ni1nUkdur9Y-hy5udQT-YrL1VwqtFm3eyD5BQFPo7aOkYePRH2JJFEhKW5FBx~bPbH9Fj8sUYWhSId0OWKXeVne-WqgfJpe3fWcJTPWyLFgPrX1RYQO1OzuTBt3UpkWe2oroHPhiKHghb9JcrxO201jE6uLHCvcp7ykgAsw8AW9SLStBYlqGQ-oOG8rTh-KaGEC5fWZtK53Aztxm6zjkyUP-Lp4HdWSau1GnlkIN6OS5HhLz9AmuyQ~RgyUFzuSaOvSwqE1~-8Nu9CLbJ1dWF3z3nbAI6YwTJSVAz3SmPXduqBQCTA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	2 November 2011 (France)			8.5 based on 774,439 user ratings	1h 52min	French\n|\nEnglish	Quad Productions, Ten Films, Canal+ 
46	tt0095327	/title/tt0095327	Hotaru no haka (1988)	The story of Seita and Setsuko, two young Japanese siblings, living in the declining days of World War II. When an American firebombing separates the two children from their parents, the two siblings must rely completely on one another while they struggle to fight for their survival.\nWritten by\nKyle Perez	https://m.media-amazon.com/images/M/MV5BZmY2NjUzNDQtNTgxNC00M2Q4LTljOWQtMjNjNDBjNWUxNmJlXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1377679385/1434659607842-pgv4ql-1563669166430.mp4?Expires=1619378764&Signature=rZLgKPNamnbJgr7YH5ZKktZ8JS~MISyg3zBvxp1Qbxm4vI7iJSaZVTlSWgy1g3UUkMNPoNL9QpU6mb09pHe7uKCJRAZNTZrKXsnmleBP3g91DXwoBycxT~XThVuu0UBUwJXdNc3hU5j~barEjaTbU1DCo-NETHtERjPdagslSWZLA336mJ3a2XsDpCxnXyDy0lVTGekGYDp1CQ3YVlP0RsCBItg-2iuGNdAXBiGL~rZzI9lIOcpAz2vGoIwdaFRXJmLGn9cNwlWQRA4MtqRByxDnZguPqIdy5dWD-inZctDnnnAceMKVO~2hwJRnmm425Ywvs0WC8EbKHxLk2NurmA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	16 April 1988 (Japan)			8.5 based on 241,044 user ratings	1h 29min	Japanese	Shinchosha Company, Studio Ghibli 
47	tt0482571	/title/tt0482571	The Prestige (2006)	In the end of the nineteenth century, in London, Robert Angier, his beloved wife Julia McCullough, and Alfred Borden are friends and assistants of a magician. When Julia accidentally dies during a performance, Robert blames Alfred for her death, and they become enemies. Both become famous and rival magicians, sabotaging the performance of the other on the stage. When Alfred performs a successful trick, Robert becomes obsessed trying to disclose the secret of his competitor with tragic consequences.\nWritten by\nClaudio Carvalho, Rio de Janeiro, Brazil	https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2885334553/1434659607842-pgv4ql-1477505989007.mp4?Expires=1619378774&Signature=rxE3koSKot9qt2OlGVpjx8rD-nxD4cs9cqpoOxMHJgb2cxSbWE5kWjPfJu6uQNB48leVG0cogxOzTR0u3jhObiJhDi-W002po97MfoFs~QOyI2oQG9lFmNwdBG1z2IbVEAIRfGI0IipLTcBhW5TK-6H4YtRd1pfER5eoiFlDxFbqGKl9VxvwZ3-wTM07zShhFH2BLQUN5sOGxA6dVZZ4dIAPkTX7zN5X1Dva-6M0ELfcLAF36i73kPpG1sbQl93w92SZkg9pctdzeDMVEqlt7ekC40~fUpw9jsYR6HSk-LK9Z3rix9b~nd91MZE0mWn6Y6wStWNLdXDuhVQscsiLFg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	20 October 2006 (USA)			8.5 based on 1,209,347 user ratings	2h 10min	English	Touchstone Pictures, Warner Bros., Newmarket Productions 
48	tt0064116	/title/tt0064116	Once Upon a Time in the West (1968)	Jill McBain travels to the wild frontier; Utah - where she and her new husband planned to settle down. Upon arrival, she finds him and his children dead. There's a lot of land, and potential, but there's those who want to take it - at any cost. Even if it means killing a man and his kids.\nWritten by\nDrGoodBeat	https://m.media-amazon.com/images/M/MV5BZGI5MjBmYzYtMzJhZi00NGI1LTk3MzItYjBjMzcxM2U3MDdiXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi239075865/1434659607842-pgv4ql-1564621591982.mp4?Expires=1619378782&Signature=P-lq~iKelijuT86-WOJKZjEX-d4HqwAnZk4rEH6VagxRXK3f0aYT-QCxBBFwD0QJwvtCxyTpv2kvSG5rATJL9N3sTjNiTVKHh17~gF5E9LwuEyU3RqKvt7rAXBEu6Ast8sf-sbUNchbjQ3vcSz~UaZZoEjr4w~t3dY69U5L9zewEEx6A-kEc4GUJlsxeIPyWyeh7ozfalJC4KGZo92YGUnisck4KJ~Jp9ScpiQDp97v0YchH391R3obFuZWm4C0B6ElgKnLg~gPBYH4t7EfDGJ5SnntUiYbWK3iQ4NL3xJRiiZF07wl87RSE2ClFEgDPXipZjJle~eCl494NoZDp1g__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	21 December 1968 (Italy)			8.5 based on 306,690 user ratings	2h 45min	English\n|\nItalian\n|\nSpanish	Rafran Cinematografica, San Marco, Paramount Pictures 
49	tt0034583	/title/tt0034583	Casablanca (1942)	The story of Rick Blaine, a cynical world-weary ex-patriate who runs a nightclub in Casablanca, Morocco during the early stages of WWII. Despite the pressure he constantly receives from the local authorities, Rick's cafe has become a kind of haven for refugees seeking to obtain illicit letters that will help them escape to America. But when Ilsa, a former lover of Rick's, and her husband, show up to his cafe one day, Rick faces a tough challenge which will bring up unforeseen complications, heartbreak and ultimately an excruciating decision to make.\nWritten by\nKyle Perez	https://m.media-amazon.com/images/M/MV5BY2IzZGY2YmEtYzljNS00NTM5LTgwMzUtMzM1NjQ4NGI0OTk0XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi6095897/1434659607842-pgv4ql-1616202585787.mp4?Expires=1619378790&Signature=GQZumw1dijxKzgTRt-16BcBB~tVuzHVlTI3hYMai9aLiK3-8Bag4b7SN5A9I0UMzlGXmKmSOVgseac1JbATy4Hso5ecMS2nRimBPVRpU5CmIyc~gEUbQCvGtvhG2QIp26Gl1tHpjJtXRUEnQvPicACVGEQ2tRNNe0b-J-qPdYEeg~mEbQTGtLXNBibiWpdkadfk9GNKCu-20cMTloRi7ScnSJjc0kpUbYYyTYXcbbgXNRKQ7~eVP80Z3OgTZieNKN8DYi-Ded3dtU3yVAs30era5~YfpLPKpGCeQ0-tt7rRAprEm6ZIcZomGQs3ySk1qL1L8V~Atqv2nxQip5rRrgw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	23 January 1943 (USA)			8.5 based on 528,641 user ratings	1h 42min	English\n|\nFrench\n|\nGerman\n|\nItalian	Warner Bros. 
50	tt0095765	/title/tt0095765	Nuovo Cinema Paradiso (1988)	A boy who grew up in a native Sicilian Village returns home as a famous director after receiving news about the death of an old friend. Told in a flashback, Salvatore reminiscences about his childhood and his relationship with Alfredo, a projectionist at Cinema Paradiso. Under the fatherly influence of Alfredo, Salvatore fell in love with film making, with the duo spending many hours discussing about films and Alfredo painstakingly teaching Salvatore the skills that became a stepping stone for the young boy into the world of film making. The film brings the audience through the changes in cinema and the dying trade of traditional film making, editing and screening. It also explores a young boy's dream of leaving his little town to foray into the world outside.\nWritten by\nClarisse P.	https://m.media-amazon.com/images/M/MV5BM2FhYjEyYmYtMDI1Yy00YTdlLWI2NWQtYmEzNzAxOGY1NjY2XkEyXkFqcGdeQXVyNTA3NTIyNDg@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2800655897/1434659607842-pgv4ql-1563887365515.mp4?Expires=1619378805&Signature=Ox~--MmUhuZZP~ywCjzG9Ad2MabYXlrcbCPkzH4MpCg63hU2DgK0uqa1OhMdiF-NSoVj6tR-sE9MbqwvT3eprN7PQX~t1wmEHFNY8-0HMmAuhttIvN-xRdEQcTzHh-vTEVpmx6vHOxw9DRQV0~fy0M0B11OVGrPslUaA2YTFll0gufOjapSRc9m1lFYu77wXa4msfeqsLhmSxVdNj7RdIRMvG6MIsBZNyMFBsUUsQerj8xJHHsK-cr8G3TfG8i8Vb4vpz-ibnIPHqIJLzD1MdKqHzqSilHel1VbownmfAN1bj-QG~PG-P6aV2Hdzj8LTeFCiDoTiWE1HSg9a5jaYdw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	17 November 1988 (Italy)			8.5 based on 235,036 user ratings	2h 35min	Italian	Cristaldifilm, Les Films Ariane, Rai 3 
51	tt0047396	/title/tt0047396	Rear Window (1954)	Professional photographer L.B. "Jeff" Jefferies breaks his leg while getting an action shot at an auto race. Confined to his New York apartment, he spends his time looking out of the rear window observing the neighbors. He begins to suspect that a man across the courtyard may have murdered his wife. Jeff enlists the help of his high society fashion-consultant girlfriend Lisa Freemont and his visiting nurse Stella to investigate.\nWritten by\nCol Needham <col@imdb.com>	https://m.media-amazon.com/images/M/MV5BNGUxYWM3M2MtMGM3Mi00ZmRiLWE0NGQtZjE5ODI2OTJhNTU0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2391784473/1434659607842-pgv4ql-1556297856924.mp4?Expires=1619378818&Signature=lokSxUvBOkmD7F7COBDN1-GdJCJPmxXyNDsTC9S-MDkNOPcklGgAkSJ5pbi0czDA00FFrxXQUI-EcgCsTdFTh0TYtY9yqZ4okbau4OZw9mwaG9OycCU1U-BansZWKnTPX4aabDj2aCgQRG8vnbgFE69l4mSsDuGN0t8PEamq3kOFRCqvOqE--iqg3hJczfyXYgA6R5SzOZwKrPTiO1CnAHfRFA5XuiLfGFpmqlYK4-YBnvI~ODXevsmg4hRRSro2AoOARk81hnwuTUDB1D7hsAPdL3unJVDIjbIF7~idjIfttLpR9SFJd2IIkhdxKeUBgYVYPkmTjcoB2M2NLJucNQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	1 September 1954 (USA)			8.4 based on 450,024 user ratings	1h 52min	English	Alfred J. Hitchcock Productions 
52	tt0078748	/title/tt0078748	Alien (1979)	In the distant future, the crew of the commercial spaceship Nostromo are on their way home when they pick up a distress call from a distant moon. The crew are under obligation to investigate and the spaceship descends on the moon afterwards. After a rough landing, three crew members leave the spaceship to explore the area on the moon. At the same time as they discover a hive colony of some unknown creature, the ship's computer deciphers the message to be a warning, not a distress call. When one of the eggs is disturbed, the crew realizes that they are not alone on the spaceship and they must deal with the consequences.\nWritten by\nblazesnakes9	https://m.media-amazon.com/images/M/MV5BMmQ2MmU3NzktZjAxOC00ZDZhLTk4YzEtMDMyMzcxY2IwMDAyXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1497801241/1434659607842-pgv4ql-1616202526026.mp4?Expires=1619378827&Signature=ds1fOOiOcj--zoZu08PfB0aLsc3e1aYDOA~BQjJBzPFgveM7F5IgD1aYT3kILAY7qBSzgdN-I6k~A64QjOiAxzZtiNpfY0xrqBISzqn1lv629kB8kYM9fkyfoJRgWeEINnj9epAMm7JNaNefD2TBbAPfsSdudyhe7dNnLq3ltjeIZmTUhGxNofpl5~zDZq-nPxf03iHKge1Y5GUWSTjHgZBvxTm5bW~yTuhvlJL37LmYYWnPDyVRi6YfSpusguLVAWHhxDkIEVDVpi5E-TdB~2puNw192Wftf~v0xJk9zvjJH~dL4OfnZXZGE99VEMisRX4~v3SIheLF~XXW4p-irg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	22 June 1979 (USA)			8.4 based on 799,200 user ratings	1h 57min	English	Brandywine Productions 
53	tt0078788	/title/tt0078788	Apocalypse Now (1979)	It is the height of the war in Vietnam, and U.S. Army Captain Willard is sent by Colonel Lucas and a General to carry out a mission that, officially, 'does not exist - nor will it ever exist'. The mission: To seek out a mysterious Green Beret Colonel, Walter Kurtz, whose army has crossed the border into Cambodia and is conducting hit-and-run missions against the Viet Cong and NVA. The army believes Kurtz has gone completely insane and Willard's job is to eliminate him. Willard, sent up the Nung River on a U.S. Navy patrol boat, discovers that his target is one of the most decorated officers in the U.S. Army. His crew meets up with surfer-type Lt-Colonel Kilgore, head of a U.S Army helicopter cavalry group which eliminates a Viet Cong outpost to provide an entry point into the Nung River. After some hair-raising encounters, in which some of his crew are killed, Willard, Lance and Chef reach Colonel Kurtz's outpost, beyond the Do Lung Bridge. Now, after becoming prisoners of Kurtz, will...\nWritten by\nDerek O'Cain	https://m.media-amazon.com/images/M/MV5BMDdhODg0MjYtYzBiOS00ZmI5LWEwZGYtZDEyNDU4MmQyNzFkXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3543773721/1434659607842-pgv4ql-1564496837882.mp4?Expires=1619378839&Signature=d3r3Cw~ih9J05glAI3MGaRqdiVtGBzzJfe7jLa-zwJ4kt~S~myGaLteH768Yn76l6cGOSTbyMzO~LDWVp2s~mYTRp~aFFkKJXp0Io20kXFDxhpQ3GT~HUL5hTUrMWDS8YqwqGQcTIlzc-AkQiJ2ma4aTep-m3kKPq0JKS5OufqgiBl5P5X~nOKvNDHUCfMGDG2wzXo1gDbYlG2jCbGakL66pAQ7Ngj6OK0Uf0v03lVXaM3CXLhOKPM~sAxjNruu~jZccb8WUSsrBaYzP75l8dzrNtBDEmZhobuXzJoogsqpgrIt5HJh0wvOMI5ubtFMARJ2aEWdTeKzJ3Qb0OBGuYw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	15 August 1979 (USA)			8.4 based on 614,946 user ratings	2h 27min	English\n|\nFrench\n|\nVietnamese	American Zoetrope, Zoetrope Studios 
54	tt0209144	/title/tt0209144	Memento (2000)	Memento chronicles two separate stories of Leonard, an ex-insurance investigator who can no longer build new memories, as he attempts to find the murderer of his wife, which is the last thing he remembers. One story line moves forward in time while the other tells the story backwards revealing more each time.\nWritten by\nScion013	https://m.media-amazon.com/images/M/MV5BZTcyNjk1MjgtOWI3Mi00YzQwLWI5MTktMzY4ZmI2NDAyNzYzXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3220356889/1434659607842-pgv4ql-1570813812356.mp4?Expires=1619378848&Signature=dPxS1TTOSZmf3fy9JaN3dakgZtY8aeaD7RwGb-oLJyj-3HF~UbL-Lr2H7nWb44aDPtQCQBOSZ5Be~ZphbKEzOBhGWzfldL6i8XREoRoxxHYXqPDVierq81Dj5iqEGBhvHiu9FDmA8aDA~9JJ8tVD6HprPixJQQ~wWHfrlAi~UUXuylolAFopo0kevRTFFTFO8Q5cHza7nzyp3JH0ikpWpwxjTYOe2chgPHrXkYE1P-bmtB5o8DjaQfPZ684z1f6VT~s7wJqjzgjoUiBTlRXHtE6~ylxdSo9jf9thUUlGdQz0vFqOZqpxY9G9iUbG1pNe3R3A~2DVDZhYaKKenj8LdQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 May 2001 (USA)			8.4 based on 1,140,168 user ratings	1h 53min	English	Newmarket Capital Group, Team Todd, I Remember Productions 
55	tt0032553	/title/tt0032553	The Great Dictator (1940)	20 years after the end of WWI, in which the nation of Tomainia was on the losing side, Adenoid Hynkel has risen to power as the ruthless dictator of the country. He believes in a pure Aryan state and the decimation of the Jews. This situation is unknown to a simple Jewish Tomainian barber who has been hospitalized since a WWI battle. Upon his release the barber, who had been suffering from memory loss about the war, is shown the new persecuted life of the Jews by many living in the Jewish ghetto, including a washerwoman named Hannah with whom he begins a relationship. The barber is ultimately spared such persecution by Commander Schultz, whom he saved in that WWI battle. The lives of all Jews in Tomainia are eventually spared with a policy shift by Hynkel himself, who is doing so for ulterior motives. But those motives include a desire for world domination, starting with the invasion of neighboring Osterlich, which may be threatened by Benzino Napaloni, the dictator of neighboring ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BMmExYWJjNTktNGUyZS00ODhmLTkxYzAtNWIzOGEyMGNiMmUwXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3851590681/1434659607842-pgv4ql-1563753017363.mp4?Expires=1619378856&Signature=JX3Agm6ymKNccMfAiBOXGCtTGl3-ZYqq9IYrdnrARK27Z61stQIAIcu9Nkm170ArTvPyIyYAni1a7OfWwRPjaytRnh0awW-YHmjoHs1PqGq-mTIBItE5JEiv3ppZ9uOJQK5FYr94mJPsjYiwXHKqmEWXB89n2QKW9A~lffw6QsymTFt6RUFQlVfZ3Ovg-KxS~1VfFYd~NzxD845vyyKNPEdLa94dqzlMPHUAPgzhV2SwFuIQBIDy47ZY7uH-bvLcrO6zaoBovC58PwSXhnUQGZhPSifVqwQUPG6wUajS-qjO2-9PVR26hUcDWrA2~4BSwMbg0DwWz9NoybODSdEEwA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	7 March 1941 (USA)			8.4 based on 206,035 user ratings	2h 5min	English\n|\nEsperanto	Charles Chaplin Productions, One Production Company 
56	tt0082971	/title/tt0082971	Raiders of the Lost Ark (1981)	The year is 1936. An archeology professor named Indiana Jones is venturing in the jungles of South America searching for a golden statue. Unfortunately, he sets off a deadly trap but miraculously escapes. Then, Jones hears from a museum curator named Marcus Brody about a biblical artifact called The Ark of the Covenant, which can hold the key to humanly existence. Jones has to venture to vast places such as Nepal and Egypt to find this artifact. However, he will have to fight his enemy Rene Belloq and a band of Nazis in order to reach it.\nWritten by\nJohn Wiggins	https://m.media-amazon.com/images/M/MV5BMjA0ODEzMTc1Nl5BMl5BanBnXkFtZTcwODM2MjAxNA@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3747396377/1434659607842-pgv4ql-1536964032506.mp4?Expires=1619378861&Signature=o8EfKzSyBEkfQaYtEkeehqXItUy4-gyk5hf2UfUtdIZIcc9zGww71BnuO16D8qXeahoWazlbwCejKD9wvyNAGmrULKo9ZMFfUfWtSt5uAA9M4IY6ukyIhhtn5bS92UGOg3WeOKaCad31Kdbq6nzM7UQfqB6hMQzh-yyx6fIUQT2gPGQry2CzzioP481xB0EYAbjaKgIXy3wnYDaELYBExfpadq895cWBCI1feKGMl1IUiEmEsOY~vHYh3iCC8xXGvKA91~9siqi54UMvbuynMaxcyWSgBK7KdQQs-12rnI2S2IfCi41DsWvcwfUn-Z9KdterEbUqEi2UBSOV~Wy2sQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	12 June 1981 (USA)			8.4 based on 893,982 user ratings	1h 55min	English\n|\nGerman\n|\nHebrew\n|\nSpanish\n|\nArabic\n|\nNepali	Paramount Pictures, Lucasfilm 
57	tt1853728	/title/tt1853728	Django Unchained (2012)	In 1858, a bounty-hunter named King Schultz seeks out a slave named Django and buys him because he needs him to find some men he is looking for. After finding them, Django wants to find his wife, Broomhilda, who along with him were sold separately by his former owner for trying to escape. Schultz offers to help him if he chooses to stay with him and be his partner. Eventually they learn that she was sold to a plantation in Mississippi. Knowing they can't just go in and say they want her, they come up with a plan so that the owner will welcome them into his home and they can find a way.\nWritten by\nrcs0411@yahoo.com	https://m.media-amazon.com/images/M/MV5BMjIyNTQ5NjQ1OV5BMl5BanBnXkFtZTcwODg1MDU4OA@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2291574553/1434659607842-pgv4ql-1616202424410.mp4?Expires=1619378869&Signature=tCynv3bbRuxfwDYkeOOISj8IDFM9iLQSZBbPHZIGfELXg-AiW1Kc4v3Bkw-9JPXvlPvfde6bsJ~CKPbGgoMxspwD-fDnSce2VS4N~Lh0KIb5E3~6~kUsGztMxR5DR3QIpJqPI4rupy8QTv9dr6nUIx~i5BU59B5qOyyWd-6Xsvh7SehPHMgnTK4sSTZiHammx4t3UKUHbY0dVfj9ifyQHwuLkvv59bIHhx8mzrvhXvxMEMntUbLrNakPyW1vbhs0KKHVgGecJQ3MYVQHSztkg6canAdndnAqogdmPFh-bSwuLYLDb9NWn8S3JF9Zt4ktHJLjSynj2BAtQJuRs~yegg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 December 2012 (USA)			8.4 based on 1,381,488 user ratings	2h 45min	English\n|\nGerman\n|\nFrench\n|\nItalian	The Weinstein Company, Columbia Pictures 
58	tt0405094	/title/tt0405094	The Lives of Others (2006)	Gerd Wiesler is an officer with the Stasi, the East German secret police. The film begins in 1984 when Wiesler attends a play written by Georg Dreyman, who is considered by many to be the ultimate example of the loyal citizen. Wiesler has a gut feeling that Dreyman can't be as ideal as he seems, and believes surveillance is called for. The Minister of Culture agrees but only later does Wiesler learn that the Minister sees Dreyman as a rival and lusts after his partner Christa-Maria. The more time he spends listening in on them, the more he comes to care about them. The once rigid Stasi officer begins to intervene in their lives, in a positive way, protecting them whenever possible. Eventually, Wiesler's activities catch up to him and while there is no proof of wrongdoing, he finds himself in menial jobs - until the unbelievable happens.\nWritten by\ngarykmcd	https://m.media-amazon.com/images/M/MV5BOThkM2EzYmMtNDE3NS00NjlhLTg4YzktYTdhNzgyOWY3ZDYzXkEyXkFqcGdeQXVyNzQzNzQxNzI@._V1_FMjpg_UX1000_.jpg			23 March 2006 (Germany)			8.4 based on 363,849 user ratings	2h 17min	German	Wiedemann & Berg Filmproduktion, Bayerischer Rundfunk (BR), ARTE 
59	tt0050825	/title/tt0050825	Paths of Glory (1957)	The futility and irony of the war in the trenches in WWI is shown as a unit commander in the French army must deal with the mutiny of his men and a glory-seeking general after part of his force falls back under fire in an impossible attack.\nWritten by\nKeith Loh <loh@sfu.ca>	https://m.media-amazon.com/images/M/MV5BNjViMmRkOTEtM2ViOS00ODg0LWJhYWEtNTBlOGQxNDczOGY3XkEyXkFqcGdeQXVyMDI2NDg0NQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi763627801/1434659607842-pgv4ql-1564143477293.mp4?Expires=1619378885&Signature=Ndj2Ugmu8TIeNo0cDgos7e9Yeb5aD5THRJvbqfyjJdShaF7bpRV4g4YO45BINQKnG-~-h6dq-Dixkpr42Qx-KT3nv87N-45Blcp7QbzAtInohJuqpQkN5PcJ5NdvBDvFV94PuAgrq96bo7U1j8OwoRz2MPfw65A2GgYatlv9fHaGDK9nbSawLpl7sCSygOuHircT6joodJeNIyBAwW3kropbPSUTc4ifLTPgxZlhDm8lIQ~E3GwdjM7hT3dQx1N756v8sIaKG1qki~2Nl4vZ5Fxq-O4bCQnVrkyq7rhWj7gOT0txP77qWQiqOko0HoFMLVGmY8whlrTg4mpYr4Todw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 December 1957 (USA)			8.4 based on 181,180 user ratings	1h 28min	English\n|\nGerman\n|\nLatin	Bryna Productions 
60	tt8503618	/title/tt8503618	Hamilton (2020)	"Hamilton" is the story of America then, told by America now. Featuring a score that blends hip-hop, jazz, R&B, and show tunes, "Hamilton" has taken the story of American founding father Alexander Hamilton and created a revolutionary moment in theater--a musical that has had a profound impact on culture, politics, and education. Captured at the Richard Rodgers Theater on Broadway in June 2016, the film transports its audience into the world of the Broadway show in a uniquely intimate way.\nWritten by\nThe Walt Disney Studios	https://m.media-amazon.com/images/M/MV5BNjViNWRjYWEtZTI0NC00N2E3LTk0NGQtMjY4NTM3OGNkZjY0XkEyXkFqcGdeQXVyMjUxMTY3ODM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3591880217/1434659607842-pgv4ql-1593365257815.mp4?Expires=1619378900&Signature=mjHYAWg3HNHliK21I-FMIV-y2G~XIhg2ciFBZ2hvbQiDrMhQxVqA~IDXuYtsmtG1DlRfMIsZmwtS~lV1FCPOK-RnaD9bpucgjtOgHtmgfkF63bSYOYrmCfypYD52i5~B8B4LPRQ-32Tx1dIvCmA6akwg1H7pWd~lJ6T-L7KqXRmRqnqBe78zut8lBHfVuQDB-tZjzBI1YVOsU1PNExMlstZYvW5oJkEADZsOBY52jAd-U3VYAdTwBj6N0LTxitStYEbHblATCgpROoeusBPBM39HbvUfJbfkMuE9WzAgyPMiByVI9V8PWM-qkO7mQH1ja~-6gOMVsteuDnAJHekOpQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	3 July 2020 (USA)			8.5 based on 62,616 user ratings	2h 40min	English	Walt Disney Pictures, 5000 Broadway Productions, Nevis Productions 
61	tt0910970	/title/tt0910970	WALL·E (2008)	In a distant, but not so unrealistic, future where mankind has abandoned earth because it has become covered with trash from products sold by the powerful multi-national Buy N Large corporation, WALL-E, a garbage collecting robot has been left to clean up the mess. Mesmerized with trinkets of Earth's history and show tunes, WALL-E is alone on Earth except for a sprightly pet cockroach. One day, EVE, a sleek (and dangerous) reconnaissance robot, is sent to Earth to find proof that life is once again sustainable. WALL-E falls in love with EVE. WALL-E rescues EVE from a dust storm and shows her a living plant he found amongst the rubble. Consistent with her "directive", EVE takes the plant and automatically enters a deactivated state except for a blinking green beacon. WALL-E, doesn't understand what has happened to his new friend, but, true to his love, he protects her from wind, rain, and lightning, even as she is unresponsive. One day a massive ship comes to reclaim EVE, but WALL-E, ...	https://m.media-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2192703769/1434659607842-pgv4ql-1616203103302.mp4?Expires=1619378914&Signature=YialD0Js1Tptn4J0War-6XpjBrMxpDOthE-YC-AZCxqLT2pmlsqIZELsqCD0ygkqeAcztVNwdEl7zUY95X3mmcZ9NfL~CGcoVLe2ioVDdNJXX~k2wq8htHSsJ5ykQqjnzbrtayRXFZ~~beI7sQ4fRq6qnYnupugaLLvJheJzfbm1eB1eZcbo3xMmw-mSrX5brAsOmr~S84KKrc27hk1zsv302FfppXTYhShHyWe8zyRZxxHCkYwC-HA39d6eUZTLcUGOG978ysjDXOEsg5PDFoDdsXg8-2CvPFmhrFN0vWKlu0neovVX6CE0gG50GDsZ0L6nLhUhKj5eIj1maVgXgQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	27 June 2008 (USA)			8.4 based on 1,014,371 user ratings	1h 38min	English	FortyFour Studios, Pixar Animation Studios, Walt Disney Pictures 
62	tt7286456	/title/tt7286456	Joker (2019)	Arthur Fleck works as a clown and is an aspiring stand-up comic. He has mental health issues, part of which involves uncontrollable laughter. Times are tough and, due to his issues and occupation, Arthur has an even worse time than most. Over time these issues bear down on him, shaping his actions, making him ultimately take on the persona he is more known as...Joker.\nWritten by\ngrantss	https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1723318041/1434659607842-pgv4ql-1567008550851.mp4?Expires=1619378931&Signature=B4JEVxZOaHIFUfbZ~JPt66VLQiEarcGtjrpJitGnnXWWg5Pii7~aPGmbusktdfAthRjI40H-iBBfK8uvBXNqLHlU74bg7nRufkUDO9tB9l~Ji9HduDztiSZ20P2BlI3OZRJoUbzeDyKj3eYtDGrFd1b2CUmDh~BOI-hOjU8u9O43OrI1AQumLug1cJh9zVscY4Rd~Epm3lBLDyH2Yncl44AJCdIGi9elGAL3JU~RoLVypG0A~QmNvq9Bg70UPDbdlYLkwI2wjetvycqStkyTeIQ3VP8YBzXvReuUlenqPN3SftFst7W3UuJ06QhzkbQ-F5srKmPNknww2wZusjuFzg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	4 October 2019 (USA)			8.4 based on 984,188 user ratings	2h 2min	English	Warner Bros., Village Roadshow Pictures, Village Roadshow Pictures 
63	tt0081505	/title/tt0081505	The Shining (1980)	Haunted by a persistent writer's block, the aspiring author and recovering alcoholic, Jack Torrance, drags his wife, Wendy, and his gifted son, Danny, up snow-capped Colorado's secluded Overlook Hotel after taking up a job as an off-season caretaker. As the cavernous hotel shuts down for the season, the manager gives Jack a grand tour, and the facility's chef, the ageing Mr Hallorann, has a fascinating chat with Danny about a rare psychic gift called "The Shining", making sure to warn him about the hotel's abandoned rooms, and, in particular, the off-limits Room 237. However, instead of overcoming the dismal creative rut, little by little, Jack starts losing his mind, trapped in an unforgiving environment of seemingly endless snowstorms, and a gargantuan silent prison riddled with strange occurrences and eerie visions. Now, the incessant voices inside Jack's head demand sacrifice. Is Jack capable of murder?\nWritten by\nNick Riganas	https://m.media-amazon.com/images/M/MV5BZWFlYmY2MGEtZjVkYS00YzU4LTg0YjQtYzY1ZGE3NTA5NGQxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2689121305/1434659607842-pgv4ql-1565975357540.mp4?Expires=1619378940&Signature=WM2MoOPx1aXXC9xZvQMCMNM549uAZ45LJa3fQiZuHXYJ0Q~d5eSESYEqPmWeKncktHQtET912PxpCDzgPb6sZIbc5vFziYK7iNaBPaTtBirZSX86EdH1TlzwNbjDeLyBRra9gknuXW1NYzbL1UUVdsBb1YuK5W~KfGzH3BwuPFm-Sju1qMe-6uyQu9wxq7vdN-zhEneQt77~CagVeVHW8bRwsBiwTwS0sI5CXk-6fuAUTd7XfN1MmtD7ycv1UybnHf0~7a-6Lpbnu2bOMholKvxnNibJ9NuSMC6DS-DUNN51v-5znYugaXW9ve82xdTi1vbxj0ouVwFKNjad1fT5VQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	13 June 1980 (USA)			8.4 based on 912,728 user ratings	2h 26min	English	Warner Bros., Hawk Films, Peregrine 
64	tt4154756	/title/tt4154756	Avengers: Infinity War (2018)	As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment, the fate of Earth and existence has never been more uncertain.\nWritten by\nMarvel Studios	https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi528070681/1434659607842-pgv4ql-1523121356094.mp4?Expires=1619378948&Signature=ACzeRYOgWnW8LCab1iY8NYYha0vfKnxQgh7jIpukDHpOYy625gbhDni5vhfWhWkATWc9C8rQFv139Rdf5DAN5V2QFs5vJXcMryJ7dDp-SiFNMItcksD2snansaBlO3jw0Bn~FrBDC2MNulEnutwCDh5-mFEAZlnS5PS96XtOOxpygH6abes1YjdkaKjALpW902A2-xBZQNnKuajmhcl5Hz5eWsAzbW5SAdkDvBedCegcJinex7tLr0HzT37ovupkseqSttOAvOW8Ou5PpoBBK~C3C3P7WZIZmVnAywKzLvFweQ7KmyFOsuJHLpjKFNk~OQEkSCH~OXp8KvDEE23tiw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	27 April 2018 (USA)			8.4 based on 867,366 user ratings	2h 29min	English	Marvel Studios, Jason Roberts Productions, South Pictures 
65	tt0043014	/title/tt0043014	Sunset Blvd. (1950)	In Hollywood of the 50's, the obscure screenplay writer Joe Gillis is not able to sell his work to the studios, is full of debts and is thinking in returning to his hometown to work in an office. While trying to escape from his creditors, he has a flat tire and parks his car in a decadent mansion in Sunset Boulevard. He meets the owner and former silent-movie star Norma Desmond, who lives alone with her butler and driver Max Von Mayerling. Norma is demented and believes she will return to the cinema industry, and is protected and isolated from the world by Max, who was her director and husband in the past and still loves her. Norma proposes Joe to move to the mansion and help her in writing a screenplay for her comeback to the cinema, and the small-time writer becomes her lover and gigolo. When Joe falls in love for the young aspirant writer Betty Schaefer, Norma becomes jealous and completely insane and her madness leads to a tragic end.\nWritten by\nClaudio Carvalho, Rio de Janeiro, Brazil	https://m.media-amazon.com/images/M/MV5BMTU0NTkyNzYwMF5BMl5BanBnXkFtZTgwMDU0NDk5MTI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2388460569/1434659607842-pgv4ql-1616203164916.mp4?Expires=1619378973&Signature=N4WSIlklYcDjK-2Dm8RoWFWq90JpVbTfgYH700tCju0SsD0XSzF-ZtQeXawFA4EA53VSVoJWh3RQXdfBzvWI878zVIVsgGt9YD7MFnGI~rFih1kb6ILaVxvBc8kn2WSqTPAv~kx11ZvvKhAIh2sleBml1sr7W4ZU9ffgq-pHwWCmGRhRJwK2SPKVhWL5aw4ZwqF9NN0lMt45SA6Q71miGbduDZO2lxBrQxpZisiGKtAhja9ApCANmvFf0qTDrGnRV6RLaozugyIA-Kp9TW7M0lwYkcV9agVNAxNG56w~sbue1swA5mVab6KMg7UlJAugQGXatuzSGBczn5VyKmaSyw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	29 September 1950 (Australia)			8.4 based on 204,530 user ratings	1h 50min	English	Paramount Pictures 
66	tt0051201	/title/tt0051201	Witness for the Prosecution (1957)	Ailing barrister Sir Wilfrid Robarts is thrust back into the courtroom in what becomes one of the most unusual and eventful murder case of the lawyer's career when he finds himself defending Leonard Vole, a man being tried for the murder of a wealthy woman. With Robarts choosing to represent him, the two find themselves up against Leonard's cold-hearted wife, Christine - who, in a surprising turn of events, chooses to appear in court against her husband.\nWritten by\nKyle Perez	https://m.media-amazon.com/images/M/MV5BNDQwODU5OWYtNDcyNi00MDQ1LThiOGMtZDkwNWJiM2Y3MDg0XkEyXkFqcGdeQXVyMDI2NDg0NQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi421183001/1434659607842-pgv4ql-1593515498091.mp4?Expires=1619378986&Signature=ggTmIChF9-wi4ZUU1pr5NhvGmiiIBAykIgtOekDwoK2lu8vqyl8Ud81sSwy-ZVruv7QSLx6N80i6Dkh00IBaKkgf5j9GLjbmOab7DxpTJSo6D2WaQKd6~zwlHkNeRnjLttLYhewRSRL5e87rBd8~s6zU6cO38DZZbldZEk1MPn~7nmLeU8Hn0ZIRx57~RZhiMZ3TZQJs3lRC0wAoPNxhE169DqRmMplY-iIwuaZZkXDc~Gw~Gq-WoGFgA01lcneNC0mq8s7GIfupm2BxuJoS1xznk03lmXMoUWNkG~8aETpj3kTChKfwIeJC4RPt7mRnHAUwJOBkAl84~2Gesb5cGg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	6 February 1958 (USA)			8.4 based on 111,209 user ratings	1h 56min	English\n|\nGerman	Edward Small Productions 
67	tt4633694	/title/tt4633694	Spider-Man: Into the Spider-Verse (2018)	Phil Lord and Christopher Miller, the creative minds behind The Lego Movie and 21 Jump Street, bring their unique talents to a fresh vision of a different Spider-Man Universe, with a groundbreaking visual style that's the first of its kind. "Spider-Man(TM): Into the Spider-Verse" introduces Brooklyn teen Miles Morales (Shameik Moore), and the limitless possibilities of the Spider-Verse, where more than one can wear the mask.\nWritten by\nSony Pictures	https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1489877529/1434659607842-pgv4ql-1544728633786.mp4?Expires=1619379001&Signature=bMsG-4Vm~CLHAlBnX8QW0MSeq4DRf2S0ruYxugn7~9kXsuZGQyH~Gzuk347zRK~o5Faf3YHwUeINhpNQf-xswJ3EZdsorSCsnQm9sGfxAxNELG-btDFCO2C12RShq8HCZJA7z-Q7k5OWaQE~YLqima7SfwKMP9VHlERmRaQgtraXt8ujBwnkxzo3WpvN9ffwzLvXw7dP9QZwBPN~0gcVEsxn-8dEclnVBdfuA8R10z9cfHSPF2aQb1xm5g8MyAbHU-Uu6IRi4PSsmnu648fb1QCBSaLVtavFlt~gESDTeuHYX06F6cKpp-pj8AqMKzPVItvVnUUczInYvV88N-Aagw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	14 December 2018 (USA)			8.4 based on 393,764 user ratings	1h 57min	English\n|\nSpanish	Sony Pictures Entertainment (SPE), Columbia Pictures, Marvel Entertainment 
68	tt0364569	/title/tt0364569	Oldeuboi (2003)	Abducted on a rainy night in 1988, the obnoxious drunk, Oh Dae-Su, much to his surprise, wakes up locked in a windowless and dilapidated hotel room, for an unknown reason. There, his invisible and pitiless captors will feed him, clothe him, and sedate him to avert a desperate suicide--and as his only companion and a window to the world is the TV in his stark cell--the only thing that helps Oh Dae-Su keep going is his daily journal. Then, unexpectedly, after fifteen long years in captivity, the perplexed prisoner is deliberately released, encouraged to track down his tormentor to finally get his retribution. However, who would hate Oh Dae-Su so much he would deny him of a quick and clean death?\nWritten by\nNick Riganas	https://m.media-amazon.com/images/M/MV5BMTI3NTQyMzU5M15BMl5BanBnXkFtZTcwMTM2MjgyMQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3130917145/1434659607842-pgv4ql-1564200111125.mp4?Expires=1619379023&Signature=cqoKknI4OPojjk32EhynYFByMsSytwTA-8yo7NUnCbEmkr-wUe9ClvTqYfnS1BgjF61fGbs7YzlGEHvlSQRLgRoOe57O8jpR2LRrpizIKLeVK0baM9wDSiBdUW7Ro3Ylq7yLdO07m4PlsRIvRhtx2ixvdL3QmbZ85JM8MvlJnJ5p8oHHgG8Cap~VMHi-2f9VSiUTeragXx64lX8Rx~G03uwSQ34vTJWvj~Sb5-5SgyqYReXliL2xqPzGska86y8FWql6sttjjTyT7dmOL0Z5d25qoC~6DnzPkMoPfF1xugRndQ6x541cIPP~~oIe2XTyFceDdPNsX64smm598RwcRQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	21 November 2003 (South Korea)			8.4 based on 524,096 user ratings	2h	Korean	Show East, Egg Films 
69	tt0119698	/title/tt0119698	Mononoke-hime (1997)	While protecting his village from rampaging boar-god/demon, a confident young warrior, Ashitaka, is stricken by a deadly curse. To save his life, he must journey to the forests of the west. Once there, he's embroiled in a fierce campaign that humans were waging on the forest. The ambitious Lady Eboshi and her loyal clan use their guns against the gods of the forest and a brave young woman, Princess Mononoke, who was raised by a wolf-god. Ashitaka sees the good in both sides and tries to stem the flood of blood. This is met by animosity by both sides as they each see him as supporting the enemy.\nWritten by\nChristopher Taguchi	https://m.media-amazon.com/images/M/MV5BNGIzY2IzODQtNThmMi00ZDE4LWI5YzAtNzNlZTM1ZjYyYjUyXkEyXkFqcGdeQXVyODEzNjM5OTQ@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2563293465/1434659607842-pgv4ql-1605705895521.mp4?Expires=1619379038&Signature=pbPIAykhgtvBamuchhjgi4T9HRrGfUtU7d4UZGikeZjDVbG~Dm7zaZvXKHFHWkCeYd6O7xnCqG4A2fFkCAa4NZnSBZ3GZpKOm62V41DO8ywW4aHPK1d4a5ISidorJ~fWMYlp3~yAzdj2pQAh9nwsBN-hNXULLB7YwcxPBlDZX4ZjwvwxSDPyXP7Ozi62ODoJ35zyFZrLyr~~jap4vR6fZ4lrfM8CtNxDL5beglNuNYQ144o~gOcjPNa0VT2I36dMs2qgzzrRBk7GYtGQj9OIpcyXsG8WIEdEVEvoR-hQe0N7H88ckEUJ0WNmCTmFzhwktwCU4hNStSq3ynUTiJDTcA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	12 July 1997 (Japan)			8.4 based on 350,401 user ratings	2h 14min	Japanese	DENTSU Music And Entertainment, Nibariki, Nippon Television Network (NTV) 
70	tt0057012	/title/tt0057012	Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb (1964)	Paranoid Brigadier General Jack D. Ripper of Burpelson Air Force Base, believing that fluoridation of the American water supply is a Soviet plot to poison the U.S. populace, is able to deploy through a back door mechanism a nuclear attack on the Soviet Union without the knowledge of his superiors, including the Chair of the Joint Chiefs of Staff, General Buck Turgidson, and President Merkin Muffley. Only Ripper knows the code to recall the B-52 bombers and he has shut down communication in and out of Burpelson as a measure to protect this attack. Ripper's executive officer, RAF Group Captain Lionel Mandrake (on exchange from Britain), who is being held at Burpelson by Ripper, believes he knows the recall codes if he can only get a message to the outside world. Meanwhile at the Pentagon War Room, key persons including Muffley, Turgidson and nuclear scientist and adviser, a former Nazi named Dr. Strangelove, are discussing measures to stop the attack or mitigate its blow-up into an all ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BZWI3ZTMxNjctMjdlNS00NmUwLWFiM2YtZDUyY2I3N2MxYTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3726294553/1434659607842-pgv4ql-1593536731678.mp4?Expires=1619379050&Signature=sGYpSCHDO-C8BH3oAXTi07evwAKP7Vxnb3-SD-0ENGLEiY5dKfcYlddk9g2WgnzW~UMLPDEDZEWah6bXHIdA9AaA6QvM7gatdumaMTMuUpVskmU04a~N~6F~Yn4v6AR7sqC4FRRt0IzKO2pvcxW4nDj~~xW8JsM4BvF-rMynfeNUOI3a2KbHq6HagivALOgdfktniYgR6evOv65Scjb2w9KoD~fVi3LeDjMgzcFz2xIRuvr6-Cygl4-Js7~jU9yzbaV1ppNxl0xKav00fHZibZr7kU2dSgsSh0VaqE8ayYxPJPWs00PBXHQM4SkwkF6-eO-4TauQfSFIXHYe6tfu2g__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	29 January 1964 (UK)			8.4 based on 455,809 user ratings	1h 35min	English\n|\nRussian	Columbia Pictures, Hawk Films 
71	tt1345836	/title/tt1345836	The Dark Knight Rises (2012)	Despite his tarnished reputation after the events of The Dark Knight (2008), in which he took the rap for Dent's crimes, Batman feels compelled to intervene to assist the city and its Police force, which is struggling to cope with Bane's plans to destroy the city.\nWritten by\nWellardRockard	https://m.media-amazon.com/images/M/MV5BMTk4ODQzNDY3Ml5BMl5BanBnXkFtZTcwODA0NTM4Nw@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2376312089/1434659607842-pgv4ql-1616202648651.mp4?Expires=1619379062&Signature=Kn-MI8ivRMe-jhvB2lgWFPxMvnmdSlTcRlZVhNLVHZIclr7d0plHzbR4S0q39zTkGczpCsEBd8TcuyPfza4iug-JHJZLobF5KX8lKNyN1EywR36p7HS6ExvAMmpYcF-ywjDKKz5c1BouQeiaqu652Ol8Zh5sue4uQTvXdBVAZFulDX~w-WBIDc9ADgrpDEYxXJMpgSfO~cCgN8FiNUKa-aWmNPEp9GkQFlWnQtarhOWfia5wVW8n9jbDulQm7h83tvCIef0wAHdXEG705OEoB6WFFVdPTbANPRQb9KwgtjbitH2T9kaTgMpUSB41sioUHNzxAkqzWzXJBgLdJ3AA6w__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	10 August 2012 (Armenia)			8.4 based on 1,537,926 user ratings	2h 44min	English\n|\nArabic	Warner Bros., Legendary Entertainment, DC Entertainment 
72	tt0087843	/title/tt0087843	Once Upon a Time in America (1984)	With the vivid memory of his long-gone childhood friends, Max, Patsy, and Cockeye, etched in his mind, his ferociously loyal partners-in-crime during their rise to prominence in New York's Prohibition-era Lower East Side, the defeated, penniless, and guilt-ridden former gangster, David "Noodles" Aaronson, returns to Manhattan. Not knowing what to expect, while on a mission to shed light on his opaque past, grizzled Noodles reunites with his only living friend, Fat Moe, after thirty-five haunted years of self-exile. However, the relentless, piercing sound of culpability stands in the way of finding closure, as the inscrutable content of a well-worn leather suitcase further complicates matters. And now, against the backdrop of a torn conscience, the sad and bittersweet recollections of more than fifty years of love, death, and everything in between, become inextricably intertwined, leading to even more puzzling questions. But, what are a man's options when he is left with nothing?\nWritten by\nNick Riganas	https://m.media-amazon.com/images/M/MV5BMGFkNWI4MTMtNGQ0OC00MWVmLTk3MTktOGYxN2Y2YWVkZWE2XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2777395225/1434659607842-pgv4ql-1564167155574.mp4?Expires=1619379068&Signature=PLk4yb2uQCDhlqbWQgNNDhtcUiGWAWzgvBRhfTg3GTSdUdF5nSzcA7eNss-AEuOixjtUauqghvWQ6UnaHV~49C3X0jXi5ZNVTbHZqZdPhF110ilqnRs8~lzsp2ZJEQXv5AsVBE~jYs0f8pjhccccnurIltXj9Vv-CpHkG1oz2Gvayj7FYSk61tDeV-2rMKTpclTNwGzJK3KPXpkYWSBGIUZ~MvRdN7IWmYvG5AXDCJ918t7W2ygEaRnhwfppyjTha52qAQMQwnfm1bTQORg61dP0jDHWM89ThXvCzIYj0nsBwnPerH7JbvJGbdF3syLfrj9BpnVPqDbcpquW1ijVcA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	1 June 1984 (USA)			8.4 based on 316,719 user ratings	3h 49min	English\n|\nItalian\n|\nFrench\n|\nYiddish\n|\nHebrew	The Ladd Company, Warner Bros., Producers Sales Organization (PSO) 
73	tt5311514	/title/tt5311514	Kimi no na wa. (2016)	Mitsuha is the daughter of the mayor of a small mountain town. She's a straightforward high school girl who lives with her sister and her grandmother and has no qualms about letting it be known that she's uninterested in Shinto rituals or helping her father's electoral campaign. Instead she dreams of leaving the boring town and trying her luck in Tokyo. Taki is a high school boy in Tokyo who works part-time in an Italian restaurant and aspires to become an architect or an artist. Every night he has a strange dream where he becomes...a high school girl in a small mountain town.\nWritten by\nHappy_Evil_Dude	https://m.media-amazon.com/images/M/MV5BODRmZDVmNzUtZDA4ZC00NjhkLWI2M2UtN2M0ZDIzNDcxYThjL2ltYWdlXkEyXkFqcGdeQXVyNTk0MzMzODA@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1705097753/1434659607842-pgv4ql-1563607790143.mp4?Expires=1619379077&Signature=fNJhvzTBqXDU4H~vRpbr2l7pYK52Ob2yZYH4f9c-I2Ocs-tHHO~Okqx2BfJ0NnL4~~nQZZfm13llfg-z3gJ8jJ6CFcJj5fdOqtUoe2EolhoJFOy8GuAt4L4QEerqbLvTCHDAy~W6XZSSXxublCeZC1HDCmmidvZEPCFmMyLHP~9LT8s8D6Np0yTj-pMjNIHclZwXMohNenaLUz2ZfEHI8~fGtrMVzBG38WvDjtQ0Db~yrJEGmmRWiAbmhptRfzFfbsgL-A7xYUYLd12DCQqnPrjyMjTdBeEwdLQUDAeimaYmXnlY5g9520y8TAvnsKurMmUqkBx~fpC~OdJ2BPbWvQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	26 August 2016 (Japan)			8.4 based on 205,240 user ratings	1h 46min	Japanese	Amuse, CoMix Wave Films, East Japan Marketing & Communications Inc. 
74	tt0090605	/title/tt0090605	Aliens (1986)	57 years after Ellen Ripley had a close encounter with the reptilian alien creature from the first movie, she is called back, this time, to help a group of highly trained colonial marines fight off against the sinister extraterrestrials. But this time, the aliens have taken over a space colony on the moon LV-426. When the colonial marines are called upon to search the deserted space colony, they later find out that they are up against more than what they bargained for. Using specially modified machine guns and enough firepower, it's either fight or die as the space marines battle against the aliens. As the Marines do their best to defend themselves, Ripley must attempt to protect a young girl who is the sole survivor of the nearly wiped out space colony.\nWritten by\nblazesnakes9	https://m.media-amazon.com/images/M/MV5BZGU2OGY5ZTYtMWNhYy00NjZiLWI0NjUtZmNhY2JhNDRmODU3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi368744473/1434659607842-pgv4ql-1564125888284.mp4?Expires=1619379089&Signature=b7ir6x9-fd9nrt-b7nXnLqE6drrciLkSylunQkvEq3MInSUkL-fiYzLR1NiwAv8RxGRqAJvs2bB~BVUPG2tA0y~9biTun06GEAY7uuSmHrrhT9nFOJYsKLQ0U-wHkOBIZY1jKz75CxCVH6o9En80A4PkVl4FqDTrjX8VBYA2srXl~Vkln4M1VlNFQXA23no1A7Y4ABKCPBYJWNC2EyOnvT55ZVqNAw5HWf-Y-KyXSuHwNcrVVoDiMWUl2npx0HZQSrWvdMLizjL~ie32DnePcdsHfGGUxVHVPuKYJzHjOD~Rr7Qc2rv9x2cA09BoEyarjp33qy3x9ZHhk1K8jdkhOw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	18 July 1986 (USA)			8.3 based on 660,330 user ratings	2h 17min	English	Twentieth Century Fox, Brandywine Productions, Pinewood Studios 
75	tt2380307	/title/tt2380307	Coco (2017)	Despite his family's baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel's family history.\nWritten by\nDisney/Pixar	https://m.media-amazon.com/images/M/MV5BYjQ5NjM0Y2YtNjZkNC00ZDhkLWJjMWItN2QyNzFkMDE3ZjAxXkEyXkFqcGdeQXVyODIxMzk5NjA@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi4249729305/1434659607842-pgv4ql-1509989696666.mp4?Expires=1619379098&Signature=IUshMO5mPUahesbZSgY-X2hJs~LXUobsP15FY0RRaoySdDvm1iw3zh9Qn1HIZIe3BuPlCbJ25AlSnoSRwPMnjZm3NyeK0aGXXCKbTEgv1HyF15IWjnwj2f3ZQbykBoP20XGNgOUP-hABVnOABecfJr-y~wxodk68iNidxdN97Pvbd21tFCLnNwOZfasp5hvQVpAZgPtbcz72y4S5Njqj1~FXLOqMNTXsJMekYmkhMAzmyLG3iO03GPhrHyBgXACXS90222hk9HRetAvNOa8AuexpPZKi-nLLBM~1rjGTrOUnWhWiV2I1HMLD3KiU~H2eOw~d4ptJ2irc7jY98SLHgA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	23 November 2017 (Armenia)			8.4 based on 400,396 user ratings	1h 45min	English\n|\nSpanish	Walt Disney Pictures, Pixar Animation Studios 
76	tt4154796	/title/tt4154796	Avengers: Endgame (2019)	After the devastating events of Avengers: Infinity War (2018), the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos's actions and undo the chaos to the universe, no matter what consequences may be in store, and no matter who they face...	https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2163260441/1434659607842-pgv4ql-1556354704370.mp4?Expires=1619379114&Signature=TEitQtEFqnhexjBBkrH51OnymEgt6BmsnM461NRHdw7glfadxCwFDrZ6LeibmilmhtZA7bQLin0XeF4-E9R4lxhyw5tnXzQ4pe0dO53HsQeen3oM2Dzy-RSVnSaecIOGyaiVGX0IfgKpKTXkFhRKo4z~sk8kd20ImhVRIihMIc9RkVQWlBYv5VRa~2rfj-3sBEgsXo79CBdv-5pH21pw7UQcFOvEjolhSCHvEb9edt8WI-kL8AYjhyMHTJnGhZXGF0Vhx-1GleEIoJ0vnkjSsA1UY8GUGpZddCq~DwwJJ3sHmb2prpMHuezJByLWk4lOjBQSjl4kUvGsCh22tFHhPA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	28 April 2019 (Armenia)			8.4 based on 859,381 user ratings	3h 1min	English\n|\nJapanese\n|\nXhosa\n|\nGerman	Marvel Studios, Walt Disney Pictures 
77	tt8267604	/title/tt8267604	Capharnaüm (2018)	Capernaüm ("Chaos") tells the story of Zain (Zain al-Rafeea), a Lebanese boy who sues his parents for the "crime" of giving him life. The film follows Zain as he journeys from gutsy, streetwise child to hardened 12-year-old "adult" fleeing his negligent parents, surviving through his wits on the streets, where he meets Ethiopian migrant worker Rahil, who provides him with shelter and food, as Zain takes care of her baby son Yonas in return. Zain later gets jailed for committing a violent crime, and finally seeks justice in a courtroom.	https://m.media-amazon.com/images/M/MV5BMmExNzU2ZWMtYzUwYi00YmM2LTkxZTQtNmVhNjY0NTMyMWI2XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1667873305/1434659607842-pgv4ql-1550250715192.mp4?Expires=1619379119&Signature=sPXzZ0eycyXvpDe2O3AtdmCJzIX1JjxgPg2XBwxul7~AKRR5oqkUnJzyB8OhmwFKRzwQRarjfKyeKb9Q~Rdp0g1E8bBjf6eHeBOyWf0n~p7PNOEIbnxSOfJGEb5ZMbNdk5I6dV4Ik5OAYkfysLUGqsQLJprR1ATlMop1YwrXkkqph8dD~cJu5AoDpiOZXWnVRSAz0I654p5l5HkkMTDd9fiWonBwPH0MbMDD4~rUPTJIU7kXCrOpgH7v1e1TuINadtAaw3p5ywMuyFJt2d~vwOInH1gUUTdCq-~iYN5Fk0RUPSCwS~a704nfw9tt8tq7FjRu~WvScv2BGBF56OecNQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	20 September 2018 (Lebanon)			8.4 based on 67,402 user ratings	2h 6min	Arabic\n|\nAmharic	Mooz Films, Cedrus Invest Bank, Sunnyland Film 
78	tt0169547	/title/tt0169547	American Beauty (1999)	After his death sometime in his forty-third year, suburbanite Lester Burnham tells of the last few weeks of his life, during which he had no idea of his imminent passing. He is a husband to real estate agent Carolyn Burnham and father to high school student Janie Burnham. Although Lester and Carolyn once loved each other, they now merely tolerate each other. Typical wallflower Janie too hates both her parents, the three who suffer individually in silence in their home life. Janie tries to steer clear of both her parents. Carolyn, relatively new to the real estate business, wants to create the persona of success to further her career, she aspiring to the professional life of Buddy Kane, the king of the real estate business in their neighborhood. Lester merely walks mindlessly through life, including at his job in advertising. His company is downsizing, and he, like all the other employees, has to justify his position to the newly hired efficiency expert to keep his job. Things change ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BNTBmZWJkNjctNDhiNC00MGE2LWEwOTctZTk5OGVhMWMyNmVhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi788506137/1434659607842-pgv4ql-1616202357192.mp4?Expires=1619379129&Signature=ZS6tyzVayNnzHHQOy4DK1a49rf18PbnLZ3Z2wxp1tHw0JfvvNeLdpWnYTgXkMKzV4QWjgoCTe2IwpgwDi~WDCgtXNRhXUtQFKbujOTfz2hvYKYdF3KYd5EUNrErAyv8v~tOEqT1SFSKVXDFX2tbrfrK00u11mrl-tPDJZylYbHjxk9SSfMnn5R8jDaKV3p9CKTV7e~Uu2J-ZBq~3sK73VylW-KheLYup~7Un~TG-2akpBjfx6b5Tj0lGzrNQKuMHYmb9eqvvE-80sL5cw2-2GjFYMzIB0yq2cWpG4zQhRdo9P1uPsiKsRjOjxpFM33e4bGCh4QbfrSzfzmnLZoko7Q__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	1 October 1999 (USA)			8.3 based on 1,081,273 user ratings	2h 2min	English	Dreamworks Pictures, Jinks/Cohen Company 
79	tt0112573	/title/tt0112573	Braveheart (1995)	William Wallace is a Scottish rebel who leads an uprising against the cruel English ruler Edward the Longshanks, who wishes to inherit the crown of Scotland for himself. When he was a young boy, William Wallace's father and brother, along with many others, lost their lives trying to free Scotland. Once he loses another of his loved ones, William Wallace begins his long quest to make Scotland free once and for all, along with the assistance of Robert the Bruce.\nWritten by\nAnonymous	https://m.media-amazon.com/images/M/MV5BMzkzMmU0YTYtOWM3My00YzBmLWI0YzctOGYyNTkwMWE5MTJkXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2874063641/1434659607842-pgv4ql-1537469491566.mp4?Expires=1619379147&Signature=RlCsLQpk3-QNYj6vCQMR6hcWbx19g-rBHG5j0l5r9quEA624wdcBxPnWcd32b~wFdEt3KFHdBSjphaOnkF8gCcOoGDGB~p8YifaHglCNfMuRCfE-c5~nI6HHIOy6A7EP3YsxQAyGAI~3oyp6b~BgRoxfBd821M~XZFzWPG2LJVPFLU7fYwtXPs-673RRBpD7SUgErlIZJ0iRdjBUzv5WtpSlRHDc1s3ip3mmzMsTZrzLg6SSiteuuxI6d62m3ajTRgC5KU2iEKfcXN6yd6vlMPmizxnThvogPbhpyv31evt1EkiBTrzz-QUyh5HDg1Bp~LyL4dscuUm6otgZYyazPw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	24 May 1995 (USA)			8.3 based on 969,627 user ratings	2h 58min	English\n|\nFrench\n|\nLatin\n|\nScottish Gaelic\n|\nItalian	Icon Entertainment International, The Ladd Company, B.H. Finance C.V. 
80	tt0057565	/title/tt0057565	Tengoku to jigoku (1963)	A wealthy businessman is told his son has been kidnapped and he will have to pay a very large sum for him to be returned safely. It is then discovered that his son is safe at home: the kidnapper took his chauffeur's son by accident. The kidnapper says this makes no difference: pay up or the child dies. This leaves him with a moral dilemma, as he really needs the money to conclude a very important business deal.\nWritten by\ngrantss	https://m.media-amazon.com/images/M/MV5BOTI4NTNhZDMtMWNkZi00MTRmLWJmZDQtMmJkMGVmZTEzODlhXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2921184793/1434659607842-pgv4ql-1593716777927.mp4?Expires=1619379158&Signature=S~53pt2IHcFARELuoDTjX7u9HEoUpsL36d5hWyZFX6nYgMMQTUyBK9AdCFsDqNf-lE6Wrve9Au42Aw-O2ZVDHBgXcoLd4ruOUTuaV2BddynvEFgA6sxtd-zbDdaxYzL7x~~yOHQMgohzKzQwQ~OWiBEDrRetjYVqmbspt7HiTfD90-8-hMJq3EJDP-kUutthmMstIEmvHcuyYethnsf505q3ljMntNJWUB8Dv1wkAwkOW1JWoMQ8GPon0OypwUKdc9QKeq7ph4MkkayXaaSOl-lzvBQMAk9vmj5nvmWu30rsXkaQxA539hvAoJoML6URdrptaXoS3j~uavy897W-yQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	1 March 1963 (Japan)			8.4 based on 36,102 user ratings	2h 23min	Japanese	Kurosawa Production Co., Toho Company 
81	tt0114709	/title/tt0114709	Toy Story (1995)	A little boy named Andy loves to be in his room, playing with his toys, especially his doll named "Woody". But, what do the toys do when Andy is not with them, they come to life. Woody believes that his life (as a toy) is good. However, he must worry about Andy's family moving, and what Woody does not know is about Andy's birthday party. Woody does not realize that Andy's mother gave him an action figure known as Buzz Lightyear, who does not believe that he is a toy, and quickly becomes Andy's new favorite toy. Woody, who is now consumed with jealousy, tries to get rid of Buzz. Then, both Woody and Buzz are now lost. They must find a way to get back to Andy before he moves without them, but they will have to pass through a ruthless toy killer, Sid Phillips.\nWritten by\nJohn Wiggins	https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2052129305/MV5BNjQzMDM2MzQyNV5BMTFeQW1wNF5BbWU3MDI1MDk3OTY@.mp4?Expires=1619379167&Signature=XLxinB67O0ajkx~8V9fGYxL4Ro8hygZUjyBm3RI2BWj0jHeaz7vBm2N0Ws0NmZzHpDhw~1agCLG--ypRlk4DmC4P-EaWxWADmPED2e8Gl6jEYYL7SdPE7SaqKD2sDb2IyMR~HIDwdRpKs45hgWB3oc6DywSA5HqfivbTWp8oD5fcMC-z~pwekvAcIdqI5g4BNMznIsyOa6f7R0Xlr6rlf1znAcCWDB-rD15WVUPJUgiEHAKKxaQXDwJ9cfVRRUMXYIyjeMuYgCyyv5wzvjAFDi1TR8NOZimljroS2Z27XGF6~-VCo8Yyo9v1UHw0EaM7cXqH7kmGmfc8zGfLEeCtWQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	22 November 1995 (USA)			8.3 based on 900,493 user ratings	1h 21min	English	Walt Disney Pictures, Pixar Animation Studios 
82	tt0082096	/title/tt0082096	Das Boot (1981)	It is 1942 and the German submarine fleet is heavily engaged in the so-called "Battle of the Atlantic" to harass and destroy British shipping. With better escorts of the destroyer class, however, German U-boats have begun to take heavy losses. "Das Boot" is the story of the crew of one such U-Boat, with the film examining how these submariners maintained their professionalism as soldiers and attempted to accomplish impossible missions, all the while attempting to understand and obey the ideology of the government under which they served.\nWritten by\nAnthony Hughes <husnock31@hotmail.com>	https://m.media-amazon.com/images/M/MV5BOGZhZDIzNWMtNjkxMS00MDQ1LThkMTYtZWQzYWU3MWMxMGU5XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi4153458201/1434659607842-pgv4ql-1584464604857.mp4?Expires=1619379184&Signature=IDzgVR7r6rPrPkwXwKvQchgAGibyEnE9xpm~H6FTW6aSuflAImJ1HfoBr3dYCbhlorGsjlPs~9SLYaOS-HMswdJd6Q11CUxOiuXVloZu7zEw3ZFleQfGZ3GrkToifFC4fvQTeJc-C2pVeknIMv3JgWczacg5P~6jfZClQDKMyJGQ6GJY445qsG5oiLNOqVebD6NQ-YTlBfBMUh32VuIhUdOsIu8wdjgpx~Bok1RCYaCsMfrC05gbxoGBdoEOwyehlb~i3pakeU-LKrHcQ2ccKF5H467lM52zVdh0SXVXjnIgLLOr6xtDAJfi6oo6-D2ndrMnOfOApt7MpXIFi1QL1Q__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	17 September 1981 (West Germany)			8.3 based on 234,758 user ratings	2h 29min	German	Bavaria Film, Twin Bros. Productions, Radiant Film GmbH 
83	tt1187043	/title/tt1187043	3 Idiots (2009)	Farhan Qureshi and Raju Rastogi want to re-unite with their fellow collegian, Rancho, after faking a stroke aboard an Air India plane, and excusing himself from his wife - trouser less - respectively. Enroute, they encounter another student, Chatur Ramalingam, now a successful businessman, who reminds them of a bet they had undertaken 10 years ago. The trio, while recollecting hilarious antics, including their run-ins with the Dean of Delhi's Imperial College of Engineering, Viru Sahastrabudhe, race to locate Rancho, at his last known address - little knowing the secret that was kept from them all this time.\nWritten by\nrAjOo (gunwanti@hotmail.com)	https://m.media-amazon.com/images/M/MV5BNTkyOGVjMGEtNmQzZi00NzFlLTlhOWQtODYyMDc2ZGJmYzFhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3086596889/1434659607842-pgv4ql-1529667039250.mp4?Expires=1619379198&Signature=cYi07hSAqjeGDEf96rbHBGS3EYpIXEkTWMOYoVGwhP35uF2J5xeL3NrxvrY5byLtWRCXl~fA2fwPTwj8uxzKYWxak2076c2BEQB0dWGKd~BAKB7bP13~KqHf7LJdly3FqZDGTnEmvrFK6nebnIJDT~BisR96To-jDsUSS5CSFkEC3ttbl-VR-VuMSFSmRJjq0uLifBu85xbt6Vp4qaTBJ52w2l75XEi0rnic38cEDJERMZcupdncl4~e04moM9mttLJ5dCB2jnpcYIS0cplj7EvmiOnBqLF-q85o0gYS~bIE68sYyS6VvWdCpmbbIhUx3chFhIK8twdqb7oZSjovUA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 December 2009 (India)			8.4 based on 350,956 user ratings	2h 50min	Hindi\n|\nEnglish	Vinod Chopra Productions 
84	tt0086879	/title/tt0086879	Amadeus (1984)	Antonio Salieri believes that Wolfgang Amadeus Mozart's music is divine and miraculous. He wishes he was himself as good a musician as Mozart so that he can praise the Lord through composing. He began his career as a devout man who believes his success and talent as a composer are God's rewards for his piety. He's also content as the respected, financially well-off, court composer of Austrian Emperor Joseph II. But he's shocked to learn that Mozart is such a vulgar creature, and can't understand why God favored Mozart to be his instrument. Salieri's envy has made him an enemy of God whose greatness was evident in Mozart. He is ready to take revenge against God and Mozart for his own musical mediocrity.\nWritten by\nKhaled Salem	https://m.media-amazon.com/images/M/MV5BNWJlNzUzNGMtYTAwMS00ZjI2LWFmNWQtODcxNWUxODA5YmU1XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2535496985/1434659607842-pgv4ql-1564471972600.mp4?Expires=1619379216&Signature=S1iYF1VHcSNL-J1-kNwBZASKcN~UwToA0kMwtrJPsYghygXIk3loLsTD4OzUenGruiql87WURl1XYDWEFDRsI1FijxBwF9osPHSkykff6NBwYCYAvGidspRZA0dl6gvALHoc~UhjxB9SToSg0CRJ2qApZKeiwV8mzWRuShXSeLPBtSHDmP5jDeVJ04H1V0Q~dEAftM1w0jthvVYum2BMuzqhJQeb3jQQEizvfNhEei~otXFmnY4n7ZMeD3tg9LIeGsKloBqALJ2e~qAzDux4-1VohcGGjjJwH1Ow7zTaA1F82O1MFrdRVmMUIplT9C4kBLTXJ1u7pCmN2OGhC7wqPw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	19 September 1984 (USA)			8.3 based on 373,541 user ratings	2h 40min	English\n|\nItalian\n|\nLatin\n|\nGerman	AMLF, The Saul Zaentz Company 
85	tt0361748	/title/tt0361748	Inglourious Basterds (2009)	In German-occupied France, young Jewish refugee Shosanna Dreyfus witnesses the slaughter of her family by Colonel Hans Landa. Narrowly escaping with her life, she plots her revenge several years later when German war hero Fredrick Zoller takes a rapid interest in her and arranges an illustrious movie premiere at the theater she now runs. With the promise of every major Nazi officer in attendance, the event catches the attention of the "Basterds", a group of Jewish-American guerrilla soldiers led by the ruthless Lt. Aldo Raine. As the relentless executioners advance and the conspiring young girl's plans are set in motion, their paths will cross for a fateful evening that will shake the very annals of history.\nWritten by\nThe Massie Twins	https://m.media-amazon.com/images/M/MV5BOTJiNDEzOWYtMTVjOC00ZjlmLWE0NGMtZmE1OWVmZDQ2OWJhXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3738173977/1434659607842-pgv4ql-1616202372085.mp4?Expires=1619379229&Signature=EX6i4caHl-gE3duMXo~mSoJ~BS9Q3T1KY4q8hhE7Buj6i51cOmv-0mzDR0MgqZK-Nek3b2aMMELAYxCpUCDF5apaAsuq97KvsBGo3eqPRqollVOly457cYEC8CDvVgFCRFJXmJst8QK72nZE8n9KM2w-4AauBCWVPeYB7BTjaUpk-cJy-n3vUHxr8ohHgmLyCCPPC6wq3VXEFshAPFcZ0Qrt3GHIAkVixgJ1QZvXsDpNvi4i0WLr2JJ6y1V-mw~~H16brFGxk-C0O6sylVQKONnQw12Y859k~rMiPBL6Z67DxCym4yCEgvOoiiG1aCZ6QIHp6n24Z4n7ox7sNFz2Xw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	20 August 2009 (Germany)			8.3 based on 1,290,557 user ratings	2h 33min	English\n|\nGerman\n|\nFrench\n|\nItalian	Universal Pictures, The Weinstein Company, A Band Apart 
86	tt0119217	/title/tt0119217	Good Will Hunting (1997)	A touching tale of a wayward young man who struggles to find his identity, living in a world where he can solve any problem, except the one brewing deep within himself, until one day he meets his soul mate who opens his mind and his heart.\nWritten by\nDima & Danielle	https://m.media-amazon.com/images/M/MV5BOTI0MzcxMTYtZDVkMy00NjY1LTgyMTYtZmUxN2M3NmQ2NWJhXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1281211929/1434659607842-pgv4ql-1597770213160.mp4?Expires=1619379236&Signature=GotH832m1neMW80eGV5n2xwN3A8KGZCCEDYBu2wmLZd1iBfpK0bz1tUfm71DpPcLXqJieun9PH91QNc2qTmKJMY73OJMGSKhX~KHX2X0Vj2hMzd2VUzLw86t7G-0ZkpKByMKCJoTcJe0ZXumlvEIsrfyVmVL~oil0eaIsv8ygJ2jqaZL2f9BGoFDVjk6yxO3aHttkFKJVBrDjGJ0WUrqJfCaShNmenBJvijruvsr0jBLLWZ~i~SGGojXznoN~C00gdoHf6XY~2~5UxKs1yBvADrELDViIG0wWReGNSHldSHNkIu88Kx-gWhCMQfyzL9X~W8CeXU0l47pzHurTBJPkQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	9 January 1998 (USA)			8.3 based on 875,224 user ratings	2h 6min	English	Be Gentlemen Limited Partnership, Lawrence Bender Productions, Miramax 
87	tt0086190	/title/tt0086190	Star Wars: Episode VI - Return of the Jedi (1983)	Luke Skywalker battles Jabba the Hutt and Darth Vader to save his comrades in the Rebel Alliance and triumph over the Galactic Empire. Han Solo and Princess Leia reaffirm their love, and team with Chewbacca, Lando Calrissian, the Ewoks, and droids C-3PO and R2-D2 to aid in the disruption of the Dark Side, and the defeat of the evil emperor.\nWritten by\nJwelch5742	https://m.media-amazon.com/images/M/MV5BOWZlMjFiYzgtMTUzNC00Y2IzLTk1NTMtZmNhMTczNTk0ODk1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1702936345/1434659607842-pgv4ql-1569604579809.mp4?Expires=1619379247&Signature=dwNCVgg88i9bpEpailAke3hGGDQzzxzYsLAXiJtc4UxjEfMLl9SAwXmMdPdMl9nBrGxgT3zTvBIXlo52uqFbIVCEdPRfF-xz4ZGkkRkBmEi0CovNAj3ekbKvgPwB12U8KNclwuWD9qgk3grkw6JYXxIncxzZNsXgICrhZPvT173B7aVZImAuFtlYFKDMkMCKT-OpuMMhKDU9HEj9BTr3QdJN7d5JOzIHnmh5kDHH9~sYHbpItq1kZX0MFk6jYyucxjpwABZvnzHyBGYSK425Mq9clhlWjo53I6KhdPASZEHpfElHaqjCxPhZfBLQpR54f8BdYacclvKac84xB5iOkg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 May 1983 (USA)			8.3 based on 962,334 user ratings	2h 11min	English	Lucasfilm 
88	tt0986264	/title/tt0986264	Taare Zameen Par (2007)	Ishaan Awasthi is an eight-year-old child whose world is filled with wonders that no one else seems to appretiate are just not important in the world of adults, who are much more interested in things like homework, marks and neatness. And Ishaan just cannot seem to get anything right in class. When he gets into far more trouble than his parents can handle, he is packed off to a boarding school to 'be disciplined'. Things are no different at his new school, and Ishaan has to contend with the added trauma of separation from his family. One day a new art teacher bursts onto the scene, Ram Shankar Nikumbh, who infects the students with joy and optimism. He breaks all the rules of 'how things are done' by asking them to think, dream and imagine, and all the children respond with enthusiasm, all except Ishaan. Nikumbh soon realizes that Ishaan is very unhappy, and he sets out to discover why. With time, patience and care, he ultimately helps Ishaan find himself.	https://m.media-amazon.com/images/M/MV5BMDhjZWViN2MtNzgxOS00NmI4LThiZDQtZDI3MzM4MDE4NTc0XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1834943001/1434659607842-pgv4ql-1563657987957.mp4?Expires=1619379255&Signature=eV6FYpsVHKTy0uNX~QL58IFYxgHqt5GiBUiVIerTA9IjEUFC-omyjVFjF0SpQh~zk9xEGV1czjFGHgOChJJ~eJFzf0tsOBbMrv5v0-oeczeCqlJoN-wcBcaKGoJ3qA838NE~d73Tzer4KDf8T3YRSfUn7JfwyEbhxDco5d1UzBjESBS8E2K8bTWLf4mQ-s6ruT~uow~4J89LyzDP937iK6HAf154zDIthrP3qf07pe8hpbBSWS94qxVRx5Fb~d3NSaPgyInytx1F7XBETwFHjJWYoqJG9nvP38G0GsjKa5OsT4cu1udSAmJIye9qyFSNkJjtyv4ZF2UJAHyS2SNudQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	21 December 2007 (India)			8.4 based on 172,829 user ratings	2h 45min	Hindi	Aamir Khan Productions, PVR Pictures 
89	tt0105236	/title/tt0105236	Reservoir Dogs (1992)	Six criminals, who are strangers to each other, are hired by a crime boss, Joe Cabot, to carry out a diamond robbery. Right at the outset, they are given false names with the intention that they won't get too close and will concentrate on the job instead. They are completely sure that the robbery is going to be a success. But, when the police show up right at the time and the site of the robbery, panic spreads amongst the group members, and two of them are killed in the subsequent shootout, along with a few policemen and civilians. When the remaining people assemble at the premeditated rendezvous point (a warehouse), they begin to suspect that one of them is an undercover cop.\nWritten by\nSoumitra	https://m.media-amazon.com/images/M/MV5BZmExNmEwYWItYmQzOS00YjA5LTk2MjktZjEyZDE1Y2QxNjA1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3028484377/1434659607842-pgv4ql-1563527574320.mp4?Expires=1619379262&Signature=pgEw8WYQWDgbjq0bSGHwfeJ9xkxXpkULnpxBO5H4RwJl7PFH0z3oJOQ1P4nOO--EDk6rJbi12SZUOg-Xy7pXhQHKfI6C0aqobqOOFH4zGmxjJezJW8aq54-VkHXVNzSmntl4VB30QKKhTnyeJDVPJG3zn6PBE2xoS2HMnBM7vJE0kmz2Y1vN5H-J8wqj0oiAOUPLoKdolMfRzS1LLhwfgxqw-jLuzDLrgA7eQN7wBat8qcjP5THcjr0ZlUfxyCZyah4SH-yNDEH-pTF8RNsQ2R1VjvTdz~fg45vdLxi8ZkKRutfwkTQjxOmto4b1YIaH5p3P-Z~77bFuyKifrJ3JWw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	2 September 1992 (France)			8.3 based on 931,642 user ratings	1h 39min	English	Live Entertainment, Dog Eat Dog Productions Inc. 
90	tt0062622	/title/tt0062622	2001: A Space Odyssey (1968)	"2001" is a story of evolution. Sometime in the distant past, someone or something nudged evolution by placing a monolith on Earth (presumably elsewhere throughout the universe as well). Evolution then enabled humankind to reach the moon's surface, where yet another monolith is found, one that signals the monolith placers that humankind has evolved that far. Now a race begins between computers (HAL) and human (Bowman) to reach the monolith placers. The winner will achieve the next step in evolution, whatever that may be.\nWritten by\nLarry Cousins	https://m.media-amazon.com/images/M/MV5BMmNlYzRiNDctZWNhMi00MzI4LThkZTctMTUzMmZkMmFmNThmXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2674767897/1434659607842-pgv4ql-1524260381054.mp4?Expires=1619379275&Signature=GZtWG3x6avT7FFmdpvGpCpZLjcufTHELSj94tlIQWysaiYZoyhyEoVx2kiseEc8ENwQGX1FEhvRKWJD56xryhGq0fAUNlh0UTYM7FwUxxIAjvbdxFWAkBAreNiCKRltigRUCoFeG9aLwq2Fv5WixoKw5gwpQd9kAxnCtPrg4b1fMZuA16tkWIBVJb05VwkzfCfukkK7Buyj~u3b8TgIj9lJhCiEhZBOgP0MF2UagANjHsriZZ4vcpU6zFBkJSy57Di1swzRppBWperC299FcyWda5MIV-KdIfrlLfb9Iy~kWoLS2gPHEE4LV3f~qleFJch-mdMxJFXCTn0ih0leAng__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	12 May 1968 (UK)			8.3 based on 611,899 user ratings	2h 29min	English\n|\nRussian	Metro-Goldwyn-Mayer (MGM), Stanley Kubrick Productions 
91	tt0180093	/title/tt0180093	Requiem for a Dream (2000)	Sara Goldfarb (Ellen Burstyn) is a retired widow, living in a small apartment. She spends most of her time watching TV, especially a particular self-help show. She has delusions of rising above her current dull existence by being a guest on that show. Her son, Harry (Jared Leto) is a junkie but along with his friend Tyrone (Marlon Wayans) has visions of making it big by becoming a drug dealer. Harry's girlfriend Marion (Jennifer Connelly) could be fashion designer or artist but is swept along in Harry's drug-centric world. Meanwhile Sara has developed an addiction of her own. She desperately wants to lose weight and so goes on a crash course involving popping pills, pills which turn out to be very addictive and harmful to her mental state.\nWritten by\ngrantss	https://m.media-amazon.com/images/M/MV5BOTdiNzJlOWUtNWMwNS00NmFlLWI0YTEtZmI3YjIzZWUyY2Y3XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2156069145/1434659607842-pgv4ql-1563544118857.mp4?Expires=1619379286&Signature=Ih3SjwiKuDLsfl-CKVZU0WUI158Gb2yPAx~wPJ~5~b8md~EWXShtFobsDXA-kqoOncPSKcLK9qdwEuqmDRVqdUCnWjBQrQawk1Vd3qbdg~syPVL~i5~XI7tGLKxUYjpt9WUHlLgmEMc9W2XpSNUM6UYjNXzgK2kyKiOGqIVo3PjCAq036KQeSzo60IXceat0O8HjQsuFsYBkk0oimgtFqQ83Q6yRhdTVZnx6DJxHN7VwkgXr4-WjRynOqhFts6kLraNXnK2SERY64CL5oq1xmvMUJBMa98~SuhyCWfTxAd~-lPQLVuaL0z1bnD6PcGTzK-PRCOdlpJvvGsaTjn~Znw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	15 December 2000 (USA)			8.3 based on 777,117 user ratings	1h 42min	English	Artisan Entertainment, Thousand Words, Sibling Productions 
92	tt2106476	/title/tt2106476	Jagten (2012)	Lucas is a Kindergarten teacher who takes great care of his students. Unfortunately for him, young Klara has a run-away imagination and concocts a lie about her teacher. Before Lucas is even able to understand the consequences, he has become the outcast of the town. The hunt is on to prove his innocence before it's taken from him for good.\nWritten by\nnapierslogs	https://m.media-amazon.com/images/M/MV5BMTg2NDg3ODg4NF5BMl5BanBnXkFtZTcwNzk3NTc3Nw@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2244519449/1434659607842-pgv4ql-1616202358043.mp4?Expires=1619379302&Signature=JyCygPYUg5aDg65TdyB--yfK0jfg~700Cw1ER5qXKaBTMN6fozhyhi0JlO-x6yzpaTNB~qx4NmH184GY8~5FAM5hPjmOMV9bUb3L8gQCG1Zjp9D~KBQjCe2n8fgbICaXyjPdKqapIGVPA9npRPTnmjDoQ4~EjM54K2JoFSA8-l7nYlAUinR3-UvwW2viFXGk3u5Jz4B4GoLfkELA57DMx51Z~IWbBmgECZFZ6j1ZdhIHMeY7ErSxO-SC-HE82B55Kl6Ls6C~TNozrifa4A6DCirCs5MnAAL6kKBlv2hH0WLJuIPhxjPhqSamBATfZRmHSuQJ--KEV8oh1zp4jKyqYQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	10 January 2013 (Denmark)			8.3 based on 289,553 user ratings	1h 55min	Danish\n|\nEnglish\n|\nPolish	Danmarks Radio (DR), Det Danske Filminstitut, Eurimages 
93	tt0052357	/title/tt0052357	Vertigo (1958)	Following his early retirement as a detective from the San Francisco Police Department, John Ferguson - Scottie to his friends - becomes obsessed with two women in succession, those obsessions which trouble his long time friend and former fiancée, Midge Wood, a designer of women's undergarments. The first is wealthy and elegant platinum blonde Madeleine Elster, the wife of his college acquaintance Gavin Elster, who hires John to follow her in Gavin's belief that she may be a danger to herself in thinking that she has recently been possessed by the spirit of Carlotta Valdes, Madeleine's great-grandmother who she knows nothing about, but who Gavin knows committed suicide in being mentally unbalanced when she was twenty-six, Madeleine's current age. The second is Judy Barton, who John spots on the street one day. Judy is a working class girl, but what makes John obsessed with her is that, despite her working class style and her brunette hair, she is the spitting image of Madeleine, into ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BYTE4ODEwZDUtNDFjOC00NjAxLWEzYTQtYTI1NGVmZmFlNjdiL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi216072473/1434659607842-pgv4ql-1564539842710.mp4?Expires=1619379314&Signature=C~g23DIWNYTwpZDYmzQ760Umr0OiJTPYD24wea0S-Lb-DgbMphJDh9mS~QhICPRsXLLShM2Y0jul9-ZtWZxJSPZ6sdFlbpJk0xC4imbwG9vclozHIgR7BQtRm2OpR~u5jsLM0TwKrgPk7roWEWW~RiX5I9AtGVChYK7kC9ReemqwxkRxmHftt8T6mKenAFfD54u2tlHEmWlOyHwumC01UNip7BApiUzgttsT0Ou34l7nXxF6Iu-EF4dZx5n92p0xBqm1h~GVvyLGzrMIMDq1pMpoPiry1--ApHZ1lDKutOEd6flszwRn--5PPia57ULx03Vh-RoIAzT5C2jL4m1ZhA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	22 May 1958 (UK)			8.3 based on 369,737 user ratings	2h 8min	English	Alfred J. Hitchcock Productions 
94	tt0022100	/title/tt0022100	M - Eine Stadt sucht einen Mörder (1931)	In Germany, Hans Beckert is an unknown killer of girls. He whistles Edvard Grieg's 'In The Hall of the Mountain King', from the 'Peer Gynt' Suite I Op. 46 while attracting the little girls for death. The police force pressed by the Minister give its best effort trying unsuccessfully to arrest the serial killer. The organized crime has great losses due to the intense search and siege of the police and decides to chase the murderer, with the support of the beggars association. They catch Hans and briefly judge him.\nWritten by\nClaudio Carvalho, Rio de Janeiro, Brazil	https://m.media-amazon.com/images/M/MV5BODA4ODk3OTEzMF5BMl5BanBnXkFtZTgwMTQ2ODMwMzE@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi605863449/1434659607842-pgv4ql-1593616284461.mp4?Expires=1619379324&Signature=lSBhWSEZcfRei0jCLtydMzAw4MbKTS0wYNhE0LMIm5Oz6tStAyyJU~eNpUgJhoItI01N5Y3~nkKY06072BJsmXHNfiH7lC240QkH7-RB76jyBimWIB3Wedeu8Vhqpbs7pMPNfyE6qi-Z-ZGy6J0Lb5LpkPy-2u332OtXJEiDzYcuewsd43~7gRcUsTNdvxRkfdYUDMtsi4t0DGBPmrNP1JZ1Y~KSbK48Sjt1~6mLPkUZ1PJTQMxezkEVJZrZpIz4f1Z-FgPr-H-22hSnx1qhK~iiu3yQ-0oy7GgYAV8vbc4M~n5v87hyRis2LSX0har0YTx0D1RI0GroewbXV5A1rg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	31 August 1931 (Sweden)			8.3 based on 145,699 user ratings	1h 57min	German	Nero-Film AG 
95	tt0338013	/title/tt0338013	Eternal Sunshine of the Spotless Mind (2004)	Much to his surprise, timid Joel Barish is shocked to discover that the love of his life, sparky Clementine, has had him erased from her memory. To pay her back in the same coin, poor Joel summons up the courage to undergo a painless but intricate medical procedure to do the same, utterly unaware that darkness is an essential part of the light. Now, as hurt and angry Joel's ugly recollections of Clementine gradually fade away, giving way to a soulless black void, suddenly, he begins having second thoughts, toying with the idea of stopping the irreversible process. In the end, is ignorance really bliss?\nWritten by\nNick Riganas	https://m.media-amazon.com/images/M/MV5BMTY4NzcwODg3Nl5BMl5BanBnXkFtZTcwNTEwOTMyMw@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2292515097/1434659607842-pgv4ql-1564107806804.mp4?Expires=1619379335&Signature=bSCD6-KjwqYdY6eGwceCsHY4btE3xdE5WmBYCRL7UxhPERvzGwWFvcqbRiPOml2yagr5SpzhCEa~tEhdH~nsm~Vpeayh9s0voMMxPWeFnB9M~3noGS9oVBwjRtMon4Ze3YTc~JS3qWlYbWpmMZ7HcmPm8CATz9e5zRbGdJfa-IVuck38iiG~tCLl10SvOGZp3j5kdJz2gmip3E0kMjkS5LFooon3hdbSye2fNh1OtC3UOEDLU2Qw5jxw5b~dr4fwLxrt-iVJ2j3Zi1nMqtXjyaEfduQoSXM8-FuxfaKyccLAFHbR7eWxqXXhBW3xMoPSMpoDnIG-m2eNq8GMXoC7cw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	19 March 2004 (USA)			8.3 based on 923,289 user ratings	1h 48min	English	Focus Features, Anonymous Content, This Is That Productions 
96	tt0033467	/title/tt0033467	Citizen Kane (1941)	A group of reporters are trying to decipher the last word ever spoken by Charles Foster Kane, the millionaire newspaper tycoon: "Rosebud". The film begins with a news reel detailing Kane's life for the masses, and then from there, we are shown flashbacks from Kane's life. As the reporters investigate further, the viewers see a display of a fascinating man's rise to fame, and how he eventually fell off the top of the world.\nWritten by\nZack H.	https://m.media-amazon.com/images/M/MV5BYjBiOTYxZWItMzdiZi00NjlkLWIzZTYtYmFhZjhiMTljOTdkXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi568630553/1434659607842-pgv4ql-1616202584903.mp4?Expires=1619379350&Signature=htq09CmjktGzZqsoQMVbDD8kp0ODvxTuSK5iwtX0jxV~mrYgq1c-UCtZ8QWhjd8D4FnZy1Kqtaf9EPRhnJSCGj5f3egACKf~W5ACB4De45GTWIsfcSUOvqVvH6Bb53l4~t-ZRpgdSejgWQSYGzmI7y6kg4yuuJ3iMeuF8q4~sXGXi3MDxLBCHJAPXeoojtvIqbpQ4O4H9m2homTJuv-jYmtZLizeWtk-U6js89Mogx7CcJe~rZhWkzwxQPSBrCu1VehsM7WQCq7RjYm1YXjt1qi6F1d7debr0Ekcsu9fw5xsbT1Ac8m96rmYx13YoxIZPzd863Oz1abOAxuZlIo2pA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	5 September 1941 (USA)			8.3 based on 410,249 user ratings	1h 59min	English\n|\nItalian	RKO Radio Pictures, Mercury Productions 
97	tt5074352	/title/tt5074352	Dangal (2016)	Biopic of Mahavir Singh Phogat, who taught wrestling to his daughters Babita Kumari and Geeta Phogat. Geeta Phogat was India's first female wrestler to win at the 2010 Commonwealth Games, where she won the gold medal (55 kg) while her sister Babita Kumari won the silver (51 kg).\nWritten by\nDibyayan_Chakravorty	https://m.media-amazon.com/images/M/MV5BMTQ4MzQzMzM2Nl5BMl5BanBnXkFtZTgwMTQ1NzU3MDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2094904857/1434659607842-pgv4ql-1480442703628.mp4?Expires=1619379361&Signature=qVoT5cSjMwNLIaREdhVxLBg2xrzGTt5O9XYbfPYY0yeakat~rTn00Mke0RgcZP1Zup0KSlzPHd3CkGicma-G26PavRFY5teAmtAzrqbbpKaUJgthbjAE4PM3UXjCxXoROTw9JdojtXjwfss8-suwkfu3GuwuHb0k~~kwydLCRTlNahIuCk78CHVOeJ1gTFpLsrRS0GfigWS~8aeKbgqWdcvcJhE1ujwCnmS9tjZyvUAQ3wRx6CQzDea0hBLW7mkXrvf-GxVRHa0j7dVeOKrJS7oT8Coemgd-csJn5PM0zDkcnMTEejGUew5aQhPuY3Cnr835cj1SZBbtmeWIveDVGw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	21 December 2016 (USA)			8.4 based on 161,023 user ratings	2h 41min	Hindi\n|\nEnglish	Aamir Khan Productions, UTV Motion Pictures, Walt Disney Pictures 
98	tt0091251	/title/tt0091251	Idi i smotri (1985)	The feature film directed by Elem Klimov, shot in the genre of military drama. The action takes place on the territory of Belarus in 1943. In the center of the story is a Belarusian boy, who witnesses the horrors of the Nazi punitive action, turning from a cheerful teenager into a gray-haired old man for two days.\nWritten by\nPeter-Patrick76 (peter-patrick@mail.com)	https://m.media-amazon.com/images/M/MV5BODM4Njg0NTAtYjI5Ny00ZjAxLTkwNmItZTMxMWU5M2U3M2RjXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi129958169/1434659607842-pgv4ql-1564134907107.mp4?Expires=1619379394&Signature=p-26aalNo127-gHwar-ycB-f69QhwmWiifNl9t38y8n1VlgtPOYdY9T5qg1OUOy8RYYGTkLMiUPjkFmMB31u8X~~WVhF1hAzt5YH3Klovgp84q1~OcSSIq4Tvvpsw5nvsNYHSyVLwALt2jE-b~Q4Car72KhVHmwWoFv15ExVd2OKm2s3pyVE86S4MfjTHx27Qk2qTmHGsyVEKVtz20VbnUdrr-lkLBx0wD0a5-uoU5pCM6-Y64OWfpapO5IfuAePDHSzzsylWBmjelM-YjTF2x9Iomk8YPOS21-8zU~geS~RRDyFGKLeWpx1XpymOX9sX2am7R2Yd-Uyaqt2r45NUQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	17 October 1985 (Hungary)			8.3 based on 61,815 user ratings	2h 22min	Russian\n|\nBelarusian\n|\nGerman	Belarusfilm, Mosfilm 
109	tt1255953	/title/tt1255953	Incendies (2010)	A mother's last wishes send twins Jeanne and Simon on a journey to the Middle East in search of their tangled roots. Adapted from Wajdi Mouawad's acclaimed play, Incendies tells the powerful and moving tale of two young adults' voyage to the core of deep-rooted hatred, never-ending wars and enduring love.\nWritten by\nMylène Chollet	https://m.media-amazon.com/images/M/MV5BMWE3MGYzZjktY2Q5Mi00Y2NiLWIyYWUtMmIyNzA3YmZlMGFhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi722049561/1434659607842-pgv4ql-1616202395703.mp4?Expires=1619379527&Signature=BJbqSWDngX0YoB7YnuyEsPCDSVQpa1lBDvTX0~6mJHMMIufbm6y6nUgE49qTW2jNPR503Ltd8j2xyp4icrgstyAJ4USOInr5i1hSh57iwYtJvYwLdsRH0McXZGVR1UmXhn0rcHpzX4m8GmOezmKsGjy2cQb7~uS9klKVjxrnh8kN~SfeVkpPGWbSk~pIW8ZVTI~05i77l~Vsyf-nToNk1yT70C-FYR7Baa~0ITW8tCXXcGRpsmyjE5x3LLiyb4uWrgdMClvTqR9XnGnPVV652Z6C4WnzE4ieKLwtopjOE6mOoZo3uMbcfShH7tvZelc2cWKAx4ZXmBdxWH1ywfuMOQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	12 January 2011 (France)			8.3 based on 154,131 user ratings	2h 11min	French\n|\nArabic\n|\nEnglish	micro_scope, TS Productions, Phi Group 
99	tt0045152	/title/tt0045152	Singin' in the Rain (1952)	1927 Hollywood. Monumental Pictures' biggest stars, glamorous on-screen couple Lina Lamont and Don Lockwood, are also an off-screen couple if the trade papers and gossip columns are to be believed. Both perpetuate the public perception if only to please their adoring fans and bring people into the movie theaters. In reality, Don barely tolerates her, while Lina, despite thinking Don beneath her, simplemindedly believes what she sees on screen in order to bolster her own stardom and sense of self-importance. R.F. Simpson, Monumental's head, dismisses what he thinks is a flash in the pan: talking pictures. It isn't until The Jazz Singer (1927) becomes a bona fide hit which results in all the movie theaters installing sound equipment that R.F. knows Monumental, most specifically in the form of Don and Lina, have to jump on the talking picture bandwagon, despite no one at the studio knowing anything about the technology. Musician Cosmo Brown, Don's best friend, gets hired as Monumental's ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BZDRjNGViMjQtOThlMi00MTA3LThkYzQtNzJkYjBkMGE0YzE1XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2086470681/1434659607842-pgv4ql-1616202994632.mp4?Expires=1619379405&Signature=JVri8jNVKRCpREVOTuqd7CetRUdaRSHem~1RJS~6Ied~sJQVPc6kBzDbvuDmECIQevm734GV0T7tLOqKejl6x0vj7AfjhH52Bkh5g0uR71jB9jaC8682l8J6ON325PEMpPZN85FERqNoGqO65EsAeL8O7DB6tESilxcScj~p-W571m-6Rok4mdbVUByTkEZ7NvKXs5FipRjF7H5LjxQ6IIA8Oa~ZOC~sM4nU7SeCOARst11BWFCAzL1-gd3Kd78l9ynxKZR20P2lnzjkUpadgnysw5o48D7koZXR8AAT4D6nr8Svpdr8u9GKWaqanBkw9KXwAl7H7Rep2yi46u780g__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	11 April 1952 (USA)			8.3 based on 222,161 user ratings	1h 43min	English	Metro-Goldwyn-Mayer (MGM) 
100	tt0012349	/title/tt0012349	The Kid (1921)	The opening title reads: "A comedy with a smile--and perhaps a tear". As she leaves the charity hospital and passes a church wedding, Edna deposits her new baby with a pleading note in a limousine and goes off to commit suicide. The limo is stolen by thieves who dump the baby by a garbage can. Charlie the Tramp finds the baby and makes a home for him. Five years later Edna has become an opera star but does charity work for slum youngsters in hope of finding her boy. A doctor called by Edna discovers the note with the truth about the Kid and reports it to the authorities who come to take him away from Charlie. Before he arrives at the Orphan Asylum Charlie steals him back and takes him to a flophouse. The proprietor reads of a reward for the Kid and takes him to Edna. Charlie is later awakened by a kind policeman who reunites him with the Kid at Edna's mansion.\nWritten by\nEd Stephan <stephan@cc.wwu.edu>	https://m.media-amazon.com/images/M/MV5BZjhhMThhNDItNTY2MC00MmU1LTliNDEtNDdhZjdlNTY5ZDQ1XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_FMjpg_UX1000_.jpg			6 February 1921 (USA)			8.3 based on 115,672 user ratings	1h 8min	None\n|\nEnglish	Charles Chaplin Productions 
101	tt0040522	/title/tt0040522	Ladri di biciclette (1948)	Ricci, an unemployed man in the depressed post-WWII economy of Italy, gets at last a good job - for which he needs a bike - hanging up posters. But soon his bicycle is stolen. He and his son walk the streets of Rome, looking for the bicycle. Ricci finally manages to locate the thief but with no proof, he has to abandon his cause. But he and his son know perfectly well that without a bike, Ricci won't be able to keep his job.\nWritten by\njolusoma	https://m.media-amazon.com/images/M/MV5BNmI1ODdjODctMDlmMC00ZWViLWI5MzYtYzRhNDdjYmM3MzFjXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi36354073/1434659607842-pgv4ql-1563524477079.mp4?Expires=1619379426&Signature=LuIBXYL10XGrP~ReHUI3Jl-pIHoUC3dvygrZY4GQDlJWFSMHRV0yhGEaeF0ZRe6HfUxxn9EnX5gCoZVgIQPyvjzwFXTYBtv4QF16w4FSzw879D1BEsG3KXyxAeIiqDjQwgLB1Rj~hCuTkBA5i4XpzKbzUaqlbcv7s~6LUDkWZI-05CDpvsS94meRVLDOqAc8sQWGovrzms0Ok0iL6T0TCINY1YuJBRw8uDvGUVIGNwheclSIM42gguO~yp72Qo1hQMmD7f58rJoSQujZLfcxZpGcriKYaQdLNfEhRYvDd53NcOQvgkAmz7EJCuLjQcFsVMvasqjj7nWtVqYKXkr5Bw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	24 November 1948 (Italy)			8.3 based on 149,187 user ratings	1h 29min	Italian\n|\nEnglish\n|\nGerman	Produzioni De Sica (PDS), Produzioni De Sica 
102	tt0093058	/title/tt0093058	Full Metal Jacket (1987)	A two-segment look at the effect of the military mindset and war itself on Vietnam era Marines. The first half follows a group of recruits in boot camp under the command of the punishing Gunnery Sergeant Hartman. The second half shows one of those recruits, Joker, covering the war as a correspondent for Stars and Stripes, focusing on the Tet offensive.\nWritten by\nScott Renshaw <as.idc@forsythe.stanford.edu>	https://m.media-amazon.com/images/M/MV5BNzkxODk0NjEtYjc4Mi00ZDI0LTgyYjEtYzc1NDkxY2YzYTgyXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3225663513/1434659607842-pgv4ql-1525383962118.mp4?Expires=1619379441&Signature=EfAp-kOVS~HaVX1b14iIdCUKfAr3f3AGbrpVXrj~WS5g63FIuFu2nniogeeEQGbBfePHfcwI-5HBn9NjVq1UOZu7hw-YdeefX1uuBIPOJTTOTm3HVlh-7l1LzDHPX9-1774nbNpvuPallwKyy1pFvTKA6Dl2hrLF-wzxfgbheNoqu6r7rmisYSla6uADlop1jcAKulwZxT1DH25na1dV0xMfN7ad4CExydaEUK17xbHTaLq9ytRJFgTH2Ez~BvK5ZdYohB~BOdQdo8BDuwD9J8FaMLrD9omzy0ECzF383~pA-VYc7TGB5~hbLGpZHclviE4Xvws8HRkxpqOQk8FPcA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	10 July 1987 (USA)			8.3 based on 683,666 user ratings	1h 56min	English\n|\nVietnamese	Natant, Stanley Kubrick Productions, Warner Bros. 
103	tt0044741	/title/tt0044741	Ikiru (1952)	Kanji Watanabe is a civil servant. He has worked in the same department for 30 years. His life is pretty boring and monotonous, though he once used to have passion and drive. Then one day he discovers that he has stomach cancer and has less than a year to live. After the initial depression he sets about living for the first time in over 20 years. Then he realises that his limited time left is not just for living life to the full but to leave something meaningful behind...\nWritten by\ngrantss	https://m.media-amazon.com/images/M/MV5BZmM0NGY3Y2MtMTA1YS00YmQzLTk2YTctYWFhMDkzMDRjZWQzXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi626900505/1434659607842-pgv4ql-1597765349270.mp4?Expires=1619379454&Signature=rtUTYiTr5WYnNJT-PUsThoeVNAz-PX0rIdLd5tKAnFY1pQR2NQ4W19CGogL3WMbvjNm1aMLwFUQH6NDDVcQnN6AE4xM~B-G2kMDOgM9iATzo9Lghp1lXIgYONI4nH75q2hiZ8XBs8e-eRr8MitC2nBjXO5IyGhe7tK2Ae0V4zcfR7SuREytJ7GDsoQFQAWnhMdcVUhCXdYBoVx1lM6QiOhRLwv7-xwNs6oKyovszB4Aa6dgNNu9Q35TYE9j7SYFmZUJ-LL2pCN7Dces2GX9mVU3wOxRqLCx1FDmWZLVpt76VtQJ7F3DlGaEJoQwR04BSM-vchTDatlKDwUlbK0fBkw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	9 October 1952 (Japan)			8.3 based on 70,112 user ratings	2h 23min	Japanese	Toho Company 
104	tt0208092	/title/tt0208092	Snatch (2000)	Turkish and his close friend/accomplice Tommy get pulled into the world of match fixing by the notorious Brick Top. Things get complicated when the boxer they had lined up gets badly beaten by Mickey, a 'pikey' ( slang for an Irish Gypsy)- who comes into the equation after Turkish, an unlicensed boxing promoter wants to buy a caravan off the Irish Gypsies. They then try to convince Mickey not only to fight for them, but to lose for them too. Whilst all this is going on, a huge diamond heist takes place, and a fistful of motley characters enter the story, including 'Cousin Avi', 'Boris The Blade', 'Franky Four Fingers' and 'Bullet Tooth Tony'. Things go from bad to worse as it all becomes about the money, the guns, and the damned dog.\nWritten by\nFilmtwob <webmaster@filmfreak.co.za>	https://m.media-amazon.com/images/M/MV5BMTA2NDYxOGYtYjU1Mi00Y2QzLTgxMTQtMWI1MGI0ZGQ5MmU4XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1558577433/1434659607842-pgv4ql-1563962549758.mp4?Expires=1619379461&Signature=LLhRF1kYfAUT70HxuWZKHTs-4FguoiDRWQv9ru5C8LQAqlC43pu-zbHJDhBHzCZSdXTq6JEv-2bbDwjXZRUdWsad0HRxHXbdOdaQuz6OGAJaIo1Nzcc8NoiGTbPAb2oLLVHlRSvkmzteXfLE1c17Yxra7yIWJZMrA8ABGCzYstm7LzvFnAzDgqqJY4Mih3JHF6BzdUCfct8bMTWu92BpO5GzXjPjRY8nqlYXLqlugo3rTnzImmtyo-0uxEhkBeTdNn47j5UNI3XnXf5F4Zn~71M1Ru6kGFAbQWYV3hIJs45-mhqiybuCj9X0iM3uDEL7ijsWVjnVGX2lPi2TC2SOuw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	1 September 2000 (UK)			8.3 based on 791,381 user ratings	1h 44min	English\n|\nRussian	Columbia Pictures, SKA Films 
105	tt0053125	/title/tt0053125	North by Northwest (1959)	Madison Avenue advertising man Roger Thornhill finds himself thrust into the world of spies when he is mistaken for a man by the name of George Kaplan. Foreign spy Philip Vandamm and his henchman Leonard try to eliminate him but when Thornhill tries to make sense of the case, he is framed for murder. Now on the run from the police, he manages to board the 20th Century Limited bound for Chicago where he meets a beautiful blond, Eve Kendall, who helps him to evade the authorities. His world is turned upside down yet again when he learns that Eve isn't the innocent bystander he thought she was. Not all is as it seems however, leading to a dramatic rescue and escape at the top of Mt. Rushmore.\nWritten by\ngarykmcd	https://m.media-amazon.com/images/M/MV5BZDA3NDExMTUtMDlhOC00MmQ5LWExZGUtYmI1NGVlZWI4OWNiXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi473956889/1434659607842-pgv4ql-1563823500465.mp4?Expires=1619379470&Signature=LmLAhfLwyP67WqcitvEHGApXoiVlODUxglh6buF~3GU~miwRdvSNL~7y9BBFTNu2vo1jmRilwwwM5hlDmqne-vwDO-c-GAZDFagLz7YM3CiiUM~v6iqlfADtmPakAHf~Iv2yT8CKl4ellWa8QiKntheXtpo84iAdePsE16xRXbcoZNtj~UEtCpkWevU9bizKazdOg6mh5C-sdraXVAqhZxt87q96iRHVvPXsDSWmsVbPf62kyw3uhdSQhAM0msJup3XKNfwSvu8ZcBcznFCS1tMMvYQ47KofeNDKtuWWJxgSeYw7Kq~niDwFusJtxt0fBcPi~csfCkxvfABlJ7~ANQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	18 December 1959 (USA)			8.3 based on 302,842 user ratings	2h 16min	English\n|\nFrench	Metro-Goldwyn-Mayer (MGM) 
106	tt0086250	/title/tt0086250	Scarface (1983)	Tony Montana manages to leave Cuba during the Mariel exodus of 1980. He finds himself in a Florida refugee camp but his friend Manny has a way out for them: undertake a contract killing and arrangements will be made to get a green card. He's soon working for drug dealer Frank Lopez and shows his mettle when a deal with Colombian drug dealers goes bad. He also brings a new level of violence to Miami. Tony is protective of his younger sister but his mother knows what he does for a living and disowns him. Tony is impatient and wants it all however, including Frank's empire and his mistress Elvira Hancock. Once at the top however, Tony's outrageous actions make him a target and everything comes crumbling down.\nWritten by\ngarykmcd	https://m.media-amazon.com/images/M/MV5BNjdjNGQ4NDEtNTEwYS00MTgxLTliYzQtYzE2ZDRiZjFhZmNlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3939802137/1434659607842-pgv4ql-1563767372555.mp4?Expires=1619379482&Signature=B4Th-ZfqywZxWrS79m~hW0BbUUsHM6LKj4B3ND55TJNb6ZNSWZI88VOYiTXsTQ8xKoi6Z1lcHNXIGcpU1G8Uey0tbMqgHdxh1W-XoQguyWfFN~8yn5qb-blgABF46vJDmtEOvLU3KCoJhflxf8fQqdsw3Ca4UylCZAtjJz0itTjrNhHYg5~RqUWu5NooIkRHAxmMWiM~O7BFIweY2fwWb6Fu0sbEZaOlByGdKea3IytGD7Icw3-1SZdPnGB-UER~beZzwVEQqRPsu5nErVGQAQ7OZ3~6inIGUxslgWVuz2q5jNHoh69o2M99MxWAApUkTKzgcSg2CYfUw9cGyz~vCQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	9 December 1983 (USA)			8.3 based on 753,866 user ratings	2h 50min	English\n|\nSpanish	Universal Pictures 
107	tt0066921	/title/tt0066921	A Clockwork Orange (1971)	Protagonist Alex DeLarge is an "ultraviolent" youth in futuristic Britain. As with all luck, his eventually runs out and he's arrested and convicted of murder. While in prison, Alex learns of an experimental program in which convicts are programmed to detest violence. If he goes through the program, his sentence will be reduced and he will be back on the streets sooner than expected. But Alex's ordeals are far from over once he hits the streets of Britain..\nWritten by\nNikki Carlyle	https://m.media-amazon.com/images/M/MV5BMTY3MjM1Mzc4N15BMl5BanBnXkFtZTgwODM0NzAxMDE@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi4030506521/1434659607842-pgv4ql-1564515807733.mp4?Expires=1619379493&Signature=OYp9M7dWrFjd5mTH70JAjycmEZrE2SoQKF4Ef2Z4Itmm~VPRnL53QSxEePsAkhTsWLABG2HBW6rUtw266WrfTZop6DgLf~sBJFFb35viCp2FUQx2FOIgGaIK5LVLpLi2ACsKZBPgxsXVvf~xsyqAQRJGjVXep-ZE1DerjHcUCTSpPY28ZVy7pvJzumxYfvHkDGyJ4XEKMtrNehf0H-Fo6M9iy7li62T68Dv3nUTFkBbuQ4tSm1zsUGrANXUkZJbfLB3mFXgWfOEka0ZjxvhFtAXdrIjHxPubyLs9aDj4nTVSIGlp1enZOZq0u8UpIwEmJclLzmh4YE0yQTsnsPLVaA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	13 January 1972 (UK)			8.3 based on 767,073 user ratings	2h 16min	English	Warner Bros., Polaris Productions, Hawk Films 
108	tt8579674	/title/tt8579674	1917 (2019)	April 1917, the Western Front. Two British soldiers are sent to deliver an urgent message to an isolated regiment. If the message is not received in time the regiment will walk into a trap and be massacred. To get to the regiment they will need to cross through enemy territory. Time is of the essence and the journey will be fraught with danger.\nWritten by\ngrantss	https://m.media-amazon.com/images/M/MV5BOTdmNTFjNDEtNzg0My00ZjkxLTg1ZDAtZTdkMDc2ZmFiNWQ1XkEyXkFqcGdeQXVyNTAzNzgwNTg@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi4095655705/1434659607842-pgv4ql-1576688989348.mp4?Expires=1619379516&Signature=WORGyt7vo8a07ZNkzUJ2MK~~eybINaYRCoDI50oEIegbJAaF395ZvDe54tqXXqhqOxbLQ2sFm0wUgyAIutDb2pPZT-ADzy9DGXisPSsUdnzMaRJG1iVoM0A8uy~vAgFO1N0SLvXUAf2PcB4Ijq2RyOo1gb5rtOnFzloCex57FDIZhGNsumqyu-EEYvSQ7JReLryR0oeHWeRMXrluds~1Rzdme6rSMcdk9FwCH~VWB2VCrKCzpUDVZbF9clE~nFInTXNqE56gTCrgX5lEZFlrPvWjBn3VjDVbeUYEqyN6pnIY8hfKyE~x2XSIuxJpGcK5qqiakbBnuvkayVTZGx5L9g__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	10 January 2020 (USA)			8.3 based on 452,979 user ratings	1h 59min	English\n|\nFrench\n|\nGerman	Dreamworks Pictures, Reliance Entertainment, New Republic Pictures 
110	tt0075314	/title/tt0075314	Taxi Driver (1976)	Travis Bickle is an ex-Marine and Vietnam War veteran living in New York City. As he suffers from insomnia, he spends his time working as a taxi driver at night, watching porn movies at seedy cinemas during the day, or thinking about how the world, New York in particular, has deteriorated into a cesspool. He's a loner who has strong opinions about what is right and wrong with mankind. For him, the one bright spot in New York humanity is Betsy, a worker on the presidential nomination campaign of Senator Charles Palantine. He becomes obsessed with her. After an incident with her, he believes he has to do whatever he needs to make the world a better place in his opinion. One of his priorities is to be the savior for Iris, a twelve-year-old runaway and prostitute who he believes wants out of the profession and under the thumb of her pimp and lover Matthew.\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BM2M1MmVhNDgtNmI0YS00ZDNmLTkyNjctNTJiYTQ2N2NmYzc2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi474987289/1434659607842-pgv4ql-1537480368139.mp4?Expires=1619379538&Signature=ivRB840-uGWzD2w0eeZXaUOXHbwofHxGhaagOBNi2vS2OAw7wswb0MtNH-VxgZIZSgGVx9ZORCaHWdYp2Mj94~Z2wqJexWd9n71aJs03qKI53X0rcbS99UCgrYW3uYxwxl46goOnIMPcJTPdek6970~LMQwcDv5ieetcD2EWBN0lrdc5pBDDKLcZGHjmevZTZ5m3EJsugwn1WnHImNL1XlZOgbKN3Wx-tDAMGuUZ8ncsxp5nBtXEFfnA0cUD~N1dW3X5mI96I6gbK6C73YjACYEVOAdmLppxG~nPRy4n7-yZOR2eew~n3hS9rLiaDasfhbobQebz6XBNKaRYq8FeFw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	9 February 1976 (USA)			8.2 based on 737,319 user ratings	1h 54min	English\n|\nSpanish	Columbia Pictures, Columbia Pictures, Bill/Phillips 
111	tt1832382	/title/tt1832382	Jodaeiye Nader az Simin (2011)	Nader (Payman Maadi) and Simin (Leila Hatami) argue about living abroad. Simin prefers to live abroad to provide better opportunities for their only daughter, Termeh. However, Nader refuses to go because he thinks he must stay in Iran and take care of his father (Ali-Asghar Shahbazi), who suffers from Alzheimers. However, Simin is determined to get a divorce and leave the country with her daughter.\nWritten by\nAmin Davoodi	https://m.media-amazon.com/images/M/MV5BN2JmMjViMjMtZTM5Mi00ZGZkLTk5YzctZDg5MjFjZDE4NjNkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2758057497/1434659607842-pgv4ql-1616202688193.mp4?Expires=1619379546&Signature=FwhE~fkLnysPOtjqiYfr9KPZamXnhzrf4s9czdI~XBoBvpR3Udids9vkmjtnXCI8NwyEQOvFvQMTqihiczuXvg8lSA-9uT0S78Ma~Micy4o1~8-Wy9UNg~r~LkumIENKnLR-W5xJI-yajoT2ccfOWE4Zwh7QuFZdLv~gfRJhdmA79IHjp~ccxvjSuVINvc4MEcOZKB6vzLB1Lfj4ZKD9Cc03~l5NBJIT-k4uxLj2Hki8b3UA8jhY7RDrGy3~FutCeMP5jk5RtOxlsR-RPz2wwhUCz7EExZo1AQqNQBDNwRXSxMezGF8atvDQLlUVUi1mBTuy6K3RXXHGG8kAYiZ3GQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	16 March 2011 (Iran)			8.3 based on 223,922 user ratings	2h 3min	Persian	Asghar Farhadi Productions, Dreamlab Films, MPA APSA Academy Film Fund 
112	tt0435761	/title/tt0435761	Toy Story 3 (2010)	Woody, Buzz and the whole gang are back. As their owner Andy prepares to depart for college, his loyal toys find themselves in daycare where untamed tots with their sticky little fingers do not play nice. So, it's all for one and one for all as they join Barbie's counterpart Ken, a thespian hedgehog named Mr. Pricklepants and a pink, strawberry-scented teddy bear called Lots-o'-Huggin' Bear to plan their great escape.\nWritten by\nWalt Disney Studios	https://m.media-amazon.com/images/M/MV5BMTgxOTY4Mjc0MF5BMl5BanBnXkFtZTcwNTA4MDQyMw@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3676898329/1434659607842-pgv4ql-1616203302774.mp4?Expires=1619379558&Signature=kELpGdZGEhjCSECAkZzSE8Q30MDv6SJKtr1FP3Mzy0sG6TYVY~fRv-3BDF8qbYpXxLi5r1zd0XEcf78jO-Xcuymw8bs~PU0zabB68ONnAKx2T5qDCqGgGh63evNlVK1j9xuv1sMMZ7t1bFiNA4GMfII-kVsoc~AYlXC0rJoOT1eiDMhnkI2nfWx86TV97YSLgaGrZ8L0Tp3oiYBB4y6zeLE5bUAn8n5IZY1HZV2Lpl3slt0KnBnjW-n3Y9LOmkLkz7calUWGn5vmEkmzscalYjO8ujlStSjbEOGch3h2flXKHi39Gv-ach8AzIhdh1cqM95aXxPuESyIAaIbZ7bZHA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	16 August 2010 (Armenia)			8.2 based on 766,721 user ratings	1h 43min	English\n|\nSpanish	Walt Disney Pictures, Pixar Animation Studios 
113	tt0070735	/title/tt0070735	The Sting (1973)	Johnny Hooker, a small time grifter, unknowingly steals from Doyle Lonnegan, a big time crime boss, when he pulls a standard street con. Lonnegan demands satisfaction for the insult. After his partner, Luther, is killed, Hooker flees, and seeks the help of Henry Gondorff, one of Luther's contacts, who is a master of the long con. Hooker wants to use Gondorff's expertise to take Lonnegan for an enormous sum of money to even the score, since he admits he "doesn't know enough about killing to kill him." They devise a complicated scheme and amass a talented group of other con artists who want their share of the reparations. The stakes are high in this game, and our heroes must not only deal with Lonnegan's murderous tendencies, but also other side players who want a piece of the action. To win, Hooker and Gondorff will need all their skills...and a fair amount of confidence.\nWritten by\nheadlessannie	https://m.media-amazon.com/images/M/MV5BNGU3NjQ4YTMtZGJjOS00YTQ3LThmNmItMTI5MDE2ODI3NzY3XkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2717122841/1434659607842-pgv4ql-1563832025441.mp4?Expires=1619379562&Signature=W5YZABKTuBIAHFB2F8T01q1DerR~MhIuhoC5pEel9KnIzkyRCHghZ3fqGVngJs0P7clhfGKANQN0aHLwDUF2YdoukDVFwoskLIlk67ZieuDONUYjVkgXk9~bHau-uMqd3jgv729HAH5wjk2CePOV7q8Ve3s1DWCLThB6l9ghORozkeFtvlSqIwSkPrc61ZBa5jKaowmkwO5XTiTNKGgCEEi2PEEefdCqo3tZZp~QLa59k9qWM28T~Cz9DhDTMaf137AtfBnsax-I2mMOVh3SJwrzi3HXbnHFJGc4LE0VTEB1IfrugHcDu2U8QSxMHi1GQmcI~r5JEVREwQA4opg0Ww__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 December 1973 (USA)			8.3 based on 244,421 user ratings	2h 9min	English	Zanuck/Brown Productions, Universal Pictures 
114	tt0056172	/title/tt0056172	Lawrence of Arabia (1962)	Due to his knowledge of the native Bedouin tribes, British Lieutenant T.E. Lawrence is sent to Arabia to find Prince Faisal and serve as a liaison between the Arabs and the British in their fight against the Turks. With the aid of native Sherif Ali, Lawrence rebels against the orders of his superior officer and strikes out on a daring camel journey across the harsh desert to attack a well-guarded Turkish port.\nWritten by\nJwelch5742	https://m.media-amazon.com/images/M/MV5BYWY5ZjhjNGYtZmI2Ny00ODM0LWFkNzgtZmI1YzA2N2MxMzA0XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1481310233/1434659607842-pgv4ql-1616205470684.mp4?Expires=1619379575&Signature=c87pONQrBgIQHxHSTijQeL80vrP-6Dm-wtW5TlWZl371i~SwoPMvUizs8~gGkOyqOgER1zBxkqP8rtliIcDZxL9Yx8OaRzAlUy5KVtQc2yDGp-vwRsPN8E1xbFhfJaaMztgGAgkhk9i3-KIoZhsghJFkZ-q6HOyk4QeOuutqMz1msRjFzG7cYbIms2FZp~5ZKnoX-WOss6Ayh-Eg0LGNLdTw1TPyewbDz~-5T5hKrO-WRhUuhJr5Owh38N4bQAAwiXCAggGEXYnvMDsOP21XtO9MJvCEmpg1HuNndrSpmv7aHqrV8E6sUmVzRD4WM4v-ogGeew-XPnCUw2sQIL-Qaw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	11 December 1962 (UK)			8.3 based on 271,609 user ratings	3h 48min	English\n|\nArabic\n|\nTurkish	Horizon Pictures (II) 
115	tt0211915	/title/tt0211915	Amélie (2001)	Amélie is a story about a girl named Amélie whose childhood was suppressed by her Father's mistaken concerns of a heart defect. With these concerns Amélie gets hardly any real life contact with other people. This leads Amélie to resort to her own fantastical world and dreams of love and beauty. She later on becomes a young woman and moves to the central part of Paris as a waitress. After finding a lost treasure belonging to the former occupant of her apartment, she decides to return it to him. After seeing his reaction and his new found perspective - she decides to devote her life to the people around her. Such as, her father who is obsessed with his garden-gnome, a failed writer, a hypochondriac, a man who stalks his ex girlfriends, the "ghost", a suppressed young soul, the love of her life and a man whose bones are as brittle as glass. But after consuming herself with these escapades - she finds out that she is disregarding her own life and damaging her quest for love. Amélie then ...\nWritten by\nspragg_s	https://m.media-amazon.com/images/M/MV5BNDg4NjM1YjMtYmNhZC00MjM0LWFiZmYtNGY1YjA3MzZmODc5XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1406515737/1434659607842-pgv4ql-1543510067942.mp4?Expires=1619379589&Signature=sQ4pXxnKPPXdL2L92To-r7shloJJ3BCT7m-W5cSv6SmP99onc7--McaOycUsSuF6nWL5d4VOXAywa~pB3LTaYdqmD3EZQMp9J2D02vLMdRuI6VVjzhc2WbXJjaqvl6iArfGDEtA1lf-z5OtjyFcM-L3fubGRDZ8sei4zfsmcPF2IsMYPwACEg~ijzb-kBXeZACNWauYpFym~ofqe9kYCzNGW~u3vbpms2hWbTN8ugmJWr-prYNv42vV1GijvETWqv7yR5J7QPGxV8Mn-piGQhcHu8la1HBPSirUZrrZEF3Y0tn4nmCN46-dNkThN8jgbcytzCTHJZLPxYnyfR~4njg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 April 2001 (France)			8.3 based on 711,301 user ratings	2h 2min	French\n|\nRussian\n|\nEnglish	Claudie Ossard Productions, Union Générale Cinématographique (UGC), Victoires Productions 
116	tt0017136	/title/tt0017136	Metropolis (1927)	Sometime in the future, the city of Metropolis is home to a Utopian society where its wealthy residents live a carefree life. One of those is Freder Fredersen. One day, he spots a beautiful woman with a group of children, she and the children quickly disappear. Trying to follow her, he is horrified to find an underground world of workers who apparently run the machinery that keeps the Utopian world above ground functioning. One of the few people above ground who knows about the world below is Freder's father, John Fredersen, who is the founder and master of Metropolis. Freder learns that the woman is called Maria, who espouses the need to join the "hands" - the workers - to the "head" - those in power above - by a mediator who will act as the "heart". Freder wants to help the plight of the workers in their struggle for a better life. But when John learns of what Maria is advocating and that Freder has joined their cause, with the assistance of an old colleague. an inventor called ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BMTg5YWIyMWUtZDY5My00Zjc1LTljOTctYmI0MWRmY2M2NmRkXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1050609177/1434659607842-pgv4ql-1616202683899.mp4?Expires=1619379602&Signature=IkLE0Ce2l8FxiyTAR7p4HS9qYX3yfmHGWNI82hjoIH8IMce-bW~ajjWpRUPV8pMIg~OYoj6q0pVRIpekz~V8205PpI6OpsYWaAex9n8BzsXxymzzEjrebU~PFrLq9w93dg7jYiI4zLOem1mdw6yppKsfTOwG5cWANiOCu-nFbditJVXmqrxnRQH7NBvDCUk9GLDy2M96FyPwHpb-Cbfgdj8uB10XC3fYMP-WDzUXjeWI8YIlKqhj5guemn6SrTuybVINroRwtXyB-Jbys0dmb9GHp41KkZmGY4naC-HlO2CrQXGbjqZ7L0rYxg0y4BQUfXKNxSVs9Loym6BGNiQ32g__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	6 February 1927 (France)			8.3 based on 162,195 user ratings	2h 33min	None\n|\nGerman	Universum Film (UFA) 
117	tt0053604	/title/tt0053604	The Apartment (1960)	As of November 1, 1959, mild mannered C.C. Baxter has been working at Consolidated Life, an insurance company, for close to four years, and is one of close to thirty-two thousand employees located in their Manhattan head office. To distinguish himself from all the other lowly cogs in the company in the hopes of moving up the corporate ladder, he often works late, but only because he can't get into his apartment, located off of Central Park West, since he has provided it to a handful of company executives - Mssrs. Dobisch, Kirkeby, Vanderhoff and Eichelberger - on a rotating basis for their extramarital liaisons in return for a good word to the personnel director, Jeff D. Sheldrake. When Baxter is called into Sheldrake's office for the first time, he learns that it isn't just to be promoted as he expects, but also to add married Sheldrake to the list to who he will lend his apartment. Dobisch, Kirkeby, Vanderhoff and Eichelberger are now feeling neglected as Baxter no longer needs ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BNzkwODFjNzItMmMwNi00MTU5LWE2MzktM2M4ZDczZGM1MmViXkEyXkFqcGdeQXVyNDY2MTk1ODk@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3878732057/1434659607842-pgv4ql-1606258716443.mp4?Expires=1619379611&Signature=dYfCSwp7fOSNUMHZoVe6ictHOsrxdYwIeBoL0GxT2M~W3UwE7wDwy-Poymn3DTPGdjOCiLzI~VhhaAntnDddWBus-8-5by1gP2UMDCqGeYNM-YNgW~QEwDiIlTKK5wpgmWv7TZcPW66GW4paNy6pHzHkMf5rWpplJNgp0wgQ80lNrOLn8zCGWu7bnEzltQn11MTxdGcsxcxdPOwjLA54n2NV-sefIn-PemrAh-8M9CdU9AcYhhxIWETGg9qUIjIwXQmdeDx8AhEl95YdhTRviexfvHFY6ZlxQBoIzK5kg75fnV-znLs18Xrmzx6V~KlZr9IdV2Ra861KRPqf1h2pSA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	29 June 1960 (Canada)			8.3 based on 166,956 user ratings	2h 5min	English	The Mirisch Corporation 
118	tt0059578	/title/tt0059578	Per qualche dollaro in più (1965)	Drifting from town to town, the poncho-clad Man with No Name and the lightning-fast right hand rides into the town of El Paso, in search of the maniacal escaped convict, El Indio. It's been eighteen short months since the deadly confrontation in Per un pugno di dollari (1964), and this time, the solitary stranger, now a professional bounty hunter, will have to go against his beliefs and do the unthinkable: join forces with the hawk-eyed marksman, Colonel Douglas Mortimer, to collect the hefty reward. Now, as El Indio and his cut-throats have already set their sights on robbing the crammed-with-cash Bank of El Paso, the stage is set for a bloody showdown at high noon, against the backdrop of silent double-crosses and fragile allegiances. But, is it worth dicing with death for a few dollars more?\nWritten by\nNick Riganas	https://m.media-amazon.com/images/M/MV5BNWM1NmYyM2ItMTFhNy00NDU0LThlYWUtYjQyYTJmOTY0ZmM0XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi773831705/1434659607842-pgv4ql-1562946166609.mp4?Expires=1619379625&Signature=BBeencE9t7BO2wAu798WlrZ6ZyKG9wWIYUGOaVV~6J~W6saeajxpsHmovtlZwH3AxSPODZPpPXu2yili7XNCwL9rlNtSu6-T2WkWlDIhBWoFuYtru4x8UlpvgzifrV91B7rAz5WDoiPDApOdK3sK4ct9nceyaEA0KUnShZEUtrsW25Bl11p3li890g0BiMb4wYKx~bzvAjfazSnL6EoKNVoamdUR7gcVy1Q50l9WV1yoaNokYdRn~NHkQE5Niea7-GEo~Lt3YwY1-TOXBXjYKofW1Cx6vrx4~gcWPwpXfUElqXKgHJ5R440PGgII76ihWocD05qQxciFSgbEaZ0CBA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	20 December 1965 (Greece)			8.2 based on 235,989 user ratings	2h 12min	Italian\n|\nEnglish	Produzioni Europee Associate (PEA), Arturo González Producciones Cinematográficas, Constantin Film 
119	tt0036775	/title/tt0036775	Double Indemnity (1944)	In 1938, Walter Neff, an experienced salesman of the Pacific All Risk Insurance Co., meets the seductive wife of one of his clients, Phyllis Dietrichson, and they have an affair. Phyllis proposes to kill her husband to receive the proceeds of an accident insurance policy and Walter devises a scheme to receive twice the amount based on a double indemnity clause. When Mr. Dietrichson is found dead on a train track, the police accept the determination of accidental death. However, the insurance analyst and Walter's best friend Barton Keyes does not buy the story and suspects that Phyllis has murdered her husband with the help of another man.\nWritten by\nClaudio Carvalho, Rio de Janeiro, Brazil	https://m.media-amazon.com/images/M/MV5BOTdlNjgyZGUtOTczYi00MDdhLTljZmMtYTEwZmRiOWFkYjRhXkEyXkFqcGdeQXVyNDY2MTk1ODk@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2244780569/1434659607842-pgv4ql-1564491724838.mp4?Expires=1619379634&Signature=uNDBjGcNickFLonOJXxkfRDnlAOjOdXZhg~z7i9iMTpGLwwm8OZ~0G0PIwlMD55AHDyQ7lPDYmJiJd-Wr1YQ~wbxDBU-XhC5YHDnYMtgRqYhmyqqFQih0mBlLXny4zJUxnFPUUK2~~g~pJuNy7B6AV7Ulfuv-z9oJRrBjFAS~zx1faf9SNQMZeYK~ztPMnvq7eIG5b~k6QUPMiP6WFpide02~WyHpmcbWFPNxblcRJMsBMR4PM8-Q7Cj7rq5l2DBS1YILWZyZF1NYuEgGWXxkPs5waBQ0A4s5d3u8-UmMFd3oK6pCN7p117kI3GW-rbrtnSHVhn-CgTXswYkefyKtQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	6 July 1944 (USA)			8.3 based on 145,656 user ratings	1h 47min	English	Paramount Pictures 
120	tt0056592	/title/tt0056592	To Kill a Mockingbird (1962)	Small-town Alabama, 1932. Atticus Finch (played by Gregory Peck) is a lawyer and a widower. He has two young children, Jem and Scout. Atticus Finch is currently defending Tom Robinson, a black man accused of raping a white woman. Meanwhile, Jem and Scout are intrigued by their neighbours, the Radleys, and the mysterious, seldom-seen Boo Radley in particular.\nWritten by\ngrantss	https://m.media-amazon.com/images/M/MV5BNmVmYzcwNzMtMWM1NS00MWIyLThlMDEtYzUwZDgzODE1NmE2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1222941977/1434659607842-pgv4ql-1616202919506.mp4?Expires=1619379643&Signature=ZHn7-tTy5GfGl90h-3VUFkqpEm5tpQhAIb7bGxKWAdGDJmqvpUIUqSbQXOT8F0KuKr2yT16UPg2uWMtutZjZG9~EPbrRkFfEMUaP~MxcI5XtN25Erkg9CIVhHSAtzFa~-s-HeOOoHn8Wv7ImLsD9lCQTJo1jGXjzuMsGLTr9JAZz5tYAN1XOhnCrp8wUpNuWRf5wHrZSxpyTbbF0dF7FdOnWz5EjKaPraisPSy64ICLwSrEAOs7LDXY4uAFEpaOWUn5JWkqoCJ9HJHnR14BwpRUozcpVMbRrsWfhyRmBXlrOv-XIbXjz4J6o3gF08Gfnh0A-J9qgwScg~JhbYWgnnQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	16 March 1963 (USA)			8.2 based on 296,713 user ratings	2h 9min	English	Pakula-Mulligan, Brentwood Productions 
121	tt1049413	/title/tt1049413	Up (2009)	As a boy, Carl Fredricksen wanted to explore South America and find the forbidden Paradise Falls. About 64 years later he gets to begin his journey along with Boy Scout Russell by lifting his house with thousands of balloons. On their journey, they make many new friends including a talking dog, and figure out that someone has evil plans. Carl soon realizes that this evildoer is his childhood idol.	https://m.media-amazon.com/images/M/MV5BMTk3NDE2NzI4NF5BMl5BanBnXkFtZTgwNzE1MzEyMTE@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2557280793/1434659607842-pgv4ql-1616202516390.mp4?Expires=1619379660&Signature=Eaob295SzCMCjfj9pTV9-YuUdDfxYIefFZp8d7ZRzSv~BgCnyyPluuICOAKsTL3dPm7rkonubIbEcYECjbqIXs2K-W97mfdANjZcdU1k1fd-CTHnJl~m5DXjLRNOlx0FG1hTVdi3Mmbxrfn6lDNECrGlvSar5htAS1gGFUI-RYQ2eFsNvQrhTc9FJPuTnrEZlOC93H0xcScf7KcUgy~itN5BTltFRCMR5bOTjwogHoJ2y7nzK4QbRYxo367pLGFjSJRvLmQTTMh7mQRUeYjhLc1oXvpqXKaD0BCyFXHWlPhbhMW7bgVaaCLcSc7UljQqd2XiitcY5pRie6VBXDXPeA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	29 May 2009 (USA)			8.2 based on 949,012 user ratings	1h 36min	English	Pixar Animation Studios, Walt Disney Pictures 
122	tt0097576	/title/tt0097576	Indiana Jones and the Last Crusade (1989)	An art collector appeals to Indiana Jones to embark on a search for the Holy Grail. He learns that another archaeologist has disappeared while searching for the precious goblet, and the missing man is his own father, Dr. Henry Jones. The artifact is much harder to find than they expected, and its powers are too much for those impure of heart.\nWritten by\nJwelch5742	https://m.media-amazon.com/images/M/MV5BMjNkMzc2N2QtNjVlNS00ZTk5LTg0MTgtODY2MDAwNTMwZjBjXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2007669529/1434659607842-pgv4ql-1564105104691.mp4?Expires=1619379676&Signature=hot9XM~w82Q0jz8DUoCeajZKX30TcBLBeFNmCZx2NsDnOlBHLxs11l9RKfyrhLU0Hv6s822ZPRJV9LiSpehIqPIZ6tCwPicdzTmX3T4mnEPNVXWaCgqgQWIRkRLC3lmHPThItcMWADzoUzKS6MltrCumpequmY9LJC21iLgmYzQvgF2ZmESz6lRLAbvyfqIy2Oirio1Df5OYzrfroDPw-oAiFTMZnojr6Tjk3wSXr7jYVwdOX-nZRHlzwniqc0ir32p5Z06ViRw38yyQGywXuydSN2mdUGsXXwkVpGOFZ6epENLrgfKHKp4RwhF2Nw4pLMWzl5q9Sg6RIIKrNEXYbw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	24 May 1989 (USA)			8.2 based on 699,638 user ratings	2h 7min	English\n|\nGerman\n|\nGreek\n|\nArabic	Paramount Pictures, Lucasfilm 
123	tt0113277	/title/tt0113277	Heat (1995)	Hunters and their prey--Neil and his professional criminal crew hunt to score big money targets (banks, vaults, armored cars) and are, in turn, hunted by Lt. Vincent Hanna and his team of cops in the Robbery/Homicide police division. A botched job puts Hanna onto their trail while they regroup and try to put together one last big 'retirement' score. Neil and Vincent are similar in many ways, including their troubled personal lives. At a crucial moment in his life, Neil disobeys the dictum taught to him long ago by his criminal mentor--'Never have anything in your life that you can't walk out on in thirty seconds flat, if you spot the heat coming around the corner'--as he falls in love. Thus the stage is set for the suspenseful ending....\nWritten by\nTad Dibbern <DIBBERN_D@a1.mscf.upenn.edu>	https://m.media-amazon.com/images/M/MV5BNGMwNzUwNjYtZWM5NS00YzMyLWI4NjAtNjM0ZDBiMzE1YWExXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi664516889/1434659607842-pgv4ql-1564147797582.mp4?Expires=1619379686&Signature=Z~RjUxjl3767k91tY5bEQvie8F1Nuh-v1tpQLoeQ5doo4a9Xwa75Ht4klEZ9j7g4jVolMKAyi6ViYSbSagPPy5RtZ4PQKvPWktoMF0CWIG~Jtx5yfbC7rJF1b32RXNr~WbKZBuWOOaCJuGKn0GhVvxDDy7Kb9EEI8~kKHrc9y7UwHEMfuE1UYtpY8ezFJgfY2k-m8BvC6IFf4j~hXsFJHUXIJqlIenHxbmGHgy~-72xp1NrVcZKLyKTZd61LQ5CHq8k8XLVn5thY3EfULmGJDP1BvaaAsr6dB7NtBszeMJh7xAG2ev9ub8awphSxr955YLfjDVdFBuCcqVPd-Avq3g__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	15 December 1995 (USA)			8.2 based on 586,909 user ratings	2h 50min	English\n|\nSpanish	Warner Bros., New Regency Productions, Forward Pass 
149	tt0096283	/title/tt0096283	Tonari no Totoro (1988)	Two young girls, 10-year-old Satsuki and her 4-year-old sister Mei, move into a house in the country with their father to be closer to their hospitalized mother. Satsuki and Mei discover that the nearby forest is inhabited by magical creatures called Totoros (pronounced toe-toe-ro). They soon befriend these Totoros, and have several magical adventures.\nWritten by\nChristopher E. Meadows <cmeadows@nyx.cs.du.edu>	https://m.media-amazon.com/images/M/MV5BYzJjMTYyMjQtZDI0My00ZjE2LTkyNGYtOTllNGQxNDMyZjE0XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3871916313/1434659607842-pgv4ql-1605706096871.mp4?Expires=1619379991&Signature=DFKN~jHrmlX66MYvAXuSIhXqebegl13gTfBgQQ5k8yM4UHuulLcptt3tU1F2e9lYg1e9o~6Mu8aCw0Unac65kCSgjLhXBtMaDz~qtwuUUzAKeA4IBiCsmDsBDfZoRFNY7lIoxXG9hDbITbDkO-FLVpCAFggOevK9YUg4zQaFnpWcby5Izrcea73F9qchDn1PmCEMnE0YpKvZA-HII6yicUSJLRx~kncRCSF3ADxN25z0030jXVr9GpQoiJcK5QZZzrw5Xp~DrG6rqAttg5GOVSSIVrxogDUTcHT5EJJTogz3lDZEgpvG1Rl~jjJ4-~sCa4APYBhAFHr4wXUSj2CKCA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	16 April 1988 (Japan)			8.2 based on 298,175 user ratings	1h 26min	Japanese	Tokuma Japan Communications, Studio Ghibli, Nibariki 
124	tt0119488	/title/tt0119488	L.A. Confidential (1997)	1950's Los Angeles is the seedy backdrop for this intricate noir-ish tale of police corruption and Hollywood sleaze. Three very different cops are all after the truth, each in their own style: Ed Exley, the golden boy of the police force, willing to do almost anything to get ahead, except sell out; Bud White, ready to break the rules to seek justice, but barely able to keep his raging violence under control; and Jack Vincennes, always looking for celebrity and a quick buck until his conscience drives him to join Exley and White down the one-way path to find the truth behind the dark world of L.A. crime.\nWritten by\nGreg Bole <bole@life.bio.sunysb.edu>	https://m.media-amazon.com/images/M/MV5BMDQ2YzEyZGItYWRhOS00MjBmLTkzMDUtMTdjYzkyMmQxZTJlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1124073497/1434659607842-pgv4ql-1564065044444.mp4?Expires=1619379694&Signature=Mr4peuvOQijkYUrRdYR7b5EoCTwUP1wHWIk8JIPTTNun9meI7nikV6QvCqLr4MV6sGY7byg6ETpVLcK~f8KbSRWtOoNeYPgDn8oCVgxH~wLoj3n5u~5le7Dyz27VSn~yYymwRmzKJNO-EQEqnGd~SBhBHkxttn~bShxJCkl7dffsxxpFI3Q3EDNVe8mKgwJ91yJNNjgSsl~GrQlkwo0nCK~i6n5TMvSZasewtYB4jowKYsIHgALSLqV~0~3xxGWAZo67CFcZfTz0a6DRsA9pSEZwNKGFs9TbPLU29D1NH~ME-i57co2uOq1NCXKumjphenaYea3kmUwSifZAMMrueA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	19 September 1997 (USA)			8.2 based on 538,419 user ratings	2h 18min	English	New Regency Productions, The Wolper Organization, Warner Bros. 
125	tt6966692	/title/tt6966692	Green Book (2018)	In 1962, Tony "Tony Lip" Vallelonga, a tough bouncer, is looking for work when his nightclub is closed for renovations. The most promising offer turns out to be the driver for the African-American classical pianist Don Shirley for a concert tour into the Deep South states. Although hardly enthused at working for a black man, Tony accepts the job and they begin their trek armed with The Negro Motorist Green Book, a travel guide for safe travel through America's racial segregation. Together, the snobbishly erudite pianist and the crudely practical bouncer can barely get along with their clashing attitudes to life and ideals. However, as the disparate pair witness and endure America's appalling injustices on the road, they find a newfound respect for each other's talents and start to face them together. In doing so, they would nurture a friendship and understanding that would change both their lives.\nWritten by\nKenneth Chisholm (kchishol@rogers.com)	https://m.media-amazon.com/images/M/MV5BYzIzYmJlYTYtNGNiYy00N2EwLTk4ZjItMGYyZTJiOTVkM2RlXkEyXkFqcGdeQXVyODY1NDk1NjE@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi824752921/1434659607842-pgv4ql-1534255695298.mp4?Expires=1619379702&Signature=eKOdAmcCS-T9Wj48TJXVG68GokzJZRxCPOqLDGRsN5fYbYP20VaMp6JWcOS~17Lm-IH9TlDZI17cJ9STeUtzF2TgQ1PpzVq6mvE4A3qUPSAkq7cnE8NF4gyXEwmfhHwsbHjJXmY6tkCtVF0XX3QBE2yg2NRwTLR-jHb7fh-wK~WgDVpB3OAnI5nCWlZ-j~fwphTk2uFCNGV0RZepVfgrW12IF0UmoFnhVU4SpD~4ZjfXS8iYlClAwRIArbykJJzmax8nXbXSsizDI9YBM90NXdtwhGQ~gn-RaK9fttz5IGRQMU81svQlAzwyF0yQxgBpwAkoJrxb~30t1tLJJQCNeg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	16 November 2018 (USA)			8.2 based on 398,175 user ratings	2h 10min	English\n|\nItalian\n|\nRussian\n|\nGerman	Participant, Dreamworks Pictures, Innisfree Pictures 
126	tt0095016	/title/tt0095016	Die Hard (1988)	NYPD cop John McClane goes on a Christmas vacation to visit his wife Holly in Los Angeles where she works for the Nakatomi Corporation. While they are at the Nakatomi headquarters for a Christmas party, a group of robbers led by Hans Gruber take control of the building and hold everyone hostage, with the exception of John, while they plan to perform a lucrative heist. Unable to escape and with no immediate police response, John is forced to take matters into his own hands.\nWritten by\nSam	https://m.media-amazon.com/images/M/MV5BZjRlNDUxZjAtOGQ4OC00OTNlLTgxNmQtYTBmMDgwZmNmNjkxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3895704089/1434659607842-pgv4ql-1545252622590.mp4?Expires=1619379715&Signature=JVIP8FoSVsiGvEgkc560tISzN29QYDs5t4VS4zMA9TZjG9SvEtJUNRWzCOeY8tVMzsxY-sCNNsrPuMNW~luu2cnF~BlpX0munJS3QgXgXGnQPSIlazJmzwkW~j5AKzjRSNyit6o3rXRvB4JsDCGd8-9pH~Xa25i-GBme-URG1R8og6xFHBxq4SgA~0HhWW0Fknu~irnmnJQlbn-J5knzAioqqL5sGcoXCmm7EEGXcKKzZ3AAqYf-UMd4hilGyqhQ~sJwI5Z-xG5wAXr39M4IweJKi8TYkEacKwSjabnKUW9QEvu37yrs3zBgJqoGuhAlPJ5y2bVSmVHtBWPw4oShMA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	20 July 1988 (USA)			8.2 based on 801,704 user ratings	2h 12min	English\n|\nGerman\n|\nItalian\n|\nJapanese	Twentieth Century Fox, Gordon Company, Silver Pictures 
127	tt10272386	/title/tt10272386	The Father (2020)	A man refuses all assistance from his daughter as he ages. As he tries to make sense of his changing circumstances, he begins to doubt his loved ones, his own mind and even the fabric of his reality.	https://m.media-amazon.com/images/M/MV5BZGJhNWRiOWQtMjI4OS00ZjcxLTgwMTAtMzQ2ODkxY2JkOTVlXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi279101721/1434659607842-pgv4ql-1600102820675.mp4?Expires=1619379731&Signature=cKQpyf91tEyIyVVYA5wAHX72SK4j64HJIo4Z7w-JEtl2zmF7WpN5ptlplia9USi~8NrH7~Rq~bUXQEg2dPB5TMsCP6B87XFAZd3pdLWU-bcKY2elqnGW1mxplXRJzcSm5ZwQBmp6yRDTFUUuCNy~P8DjRESVw~M1eWPykwidOmpBPG~jE3W6Rup1EQNZvxuX9I~iTWWMkUqEOVr7-c4464AJbahmEqZk7O1icmZcG6cu7PBNcwC3pVSaY8N24fQRhN66aVfEPjkP4WhOSCAHj~lMdPhhckn8UVn6TMdHcR33VINAL~cWozPUI8IYnw7kt-xft8pLX4wUKwz32797Zg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	11 June 2021 (UK)			8.3 based on 36,016 user ratings	1h 37min	English	Trademark Films, Cine@, AG Studios NYC 
128	tt0372784	/title/tt0372784	Batman Begins (2005)	When his parents are killed, billionaire playboy Bruce Wayne relocates to Asia, where he is mentored by Henri Ducard and Ra's Al Ghul in how to fight evil. When learning about the plan to wipe out evil in Gotham City by Ducard, Bruce prevents this plan from getting any further and heads back to his home. Back in his original surroundings, Bruce adopts the image of a bat to strike fear into the criminals and the corrupt as the icon known as "Batman". But it doesn't stay quiet for long.\nWritten by\nkonstantinwe	https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2992219161/1434659607842-pgv4ql-1563902194963.mp4?Expires=1619379744&Signature=hSgf0gK7PYmMX6qWenEre8oO43VbHDFcch1er3JGf54hQDHJQ3vrpS~2gexzyp92TBX7sMh~eIPsweLgBCYRIcWqeo9Of-yA-GiyfkUuqgxA1Ho-8-jH7u~nn56147Ntk8G4GdPBWjRTBsdvJ4Npm7kQQ5HyPu7ZzAimgBNZJRAqUS-MA5rPVMPOxGBFrmuQvSkmvUMYYiApjGkibjM4uPeJNL06HXRCDmQAO-st13uRJCz27Y0sVIVlJ6bISf20OvPxwuTMB1r8PqzHvu7XRTArY1dqQ4pdD3tWZ618gkst-NJrgNLQFgenZp5hdMNtYYenY31SNLqaRxaaEaP69Q__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	15 June 2005 (USA)			8.2 based on 1,326,658 user ratings	2h 20min	English\n|\nMandarin	Warner Bros., Syncopy, DC Comics 
129	tt0055630	/title/tt0055630	Yojinbo (1961)	Sanjuro, a wandering samurai enters a rural town in nineteenth century Japan. After learning from the innkeeper that the town is divided between two gangsters, he plays one side off against the other. His efforts are complicated by the arrival of the wily Unosuke, the son of one of the gangsters, who owns a revolver. Unosuke has Sanjuro beaten after he reunites an abducted woman with her husband and son, then massacres his father's opponents. During the slaughter, the samurai escapes with the help of the innkeeper; but while recuperating at a nearby temple, he learns of innkeeper's abduction by Unosuke, and returns to the town to confront him.\nWritten by\nBernard Keane <BKeane2@email.dot.gov.au>	https://m.media-amazon.com/images/M/MV5BZThiZjAzZjgtNDU3MC00YThhLThjYWUtZGRkYjc2ZWZlOTVjXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1659814169/1434659607842-pgv4ql-1603925934889.mp4?Expires=1619379765&Signature=TleHkUkWQB7OOXHBgtkgZKOd-hMAPUA7WZGQPqeSX3fyG0l9bvwBa23i76QhzhNDJbpcx4gQCbvOp~MfvD2~zh6RUgmg6tCPKQ9yOTDB5PuEMIqF1nOWZMlg8yw4HH7xzuo3nOkN1E6n2ul1rWwM8Mu2wH1eEa3T6i152yBET0mHHZWRUqdM3q4-iSKz4EJ3xSSEvJKmAM0tcwjaTOJKqB0V9ErhKXWdoU7LdwXz7y41oGGaQbiCpklItOwAhJaoboAvfDYS2rfOCGCCAUWN6nwnTNosrnG0YkWm-TPNv2QjRolaVPmRfVRnXN5gs0Dox7-apttc7qcsOrhVoeWRug__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 April 1961 (Japan)			8.2 based on 113,140 user ratings	1h 50min	Japanese	Kurosawa Production Co., Toho Company 
130	tt0042876	/title/tt0042876	Rashomon (1950)	A priest, a woodcutter and another man are taking refuge from a rainstorm in the shell of a former gatehouse called Rashômon. The priest and the woodcutter are recounting the story of a murdered samurai whose body the woodcutter discovered three days earlier in a forest grove. Both were summoned to testify at the murder trial, the priest who ran into the samurai and his wife traveling through the forest just before the murder occurred. Three other people who testified at the trial are supposedly the only direct witnesses: a notorious bandit named Tajômaru, who allegedly murdered the samurai and raped his wife; the white veil cloaked wife of the samurai; and the samurai himself who testifies through the use of a medium. The three tell a similarly structured story - that Tajômaru kidnapped and bound the samurai so that he could rape the wife - but which ultimately contradict each other, the motivations and the actual killing being what differ. The woodcutter reveals at Rashômon that he ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BMjEzMzA4NDE2OF5BMl5BanBnXkFtZTcwNTc5MDI2NQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi240959001/1434659607842-pgv4ql-1597668565287.mp4?Expires=1619379771&Signature=EaiJk02okEIgJr9zcWQUFcqD75jN00cA8jWRutLITrvcnyZv67SMzH1on0iHbfMVFvBpfpUEUzgKHIcmVMmfkUP44HdzU~uRoSHl~RgH8vxHqrBqJOyB4p-QNdLlXCL9IZixVGU-jlPdn7-eAUXsY0YTadIGOBVuZKlydw1ZcvYWnMB-GsEc3jI3Z~pkAte38QR50tIJse~Smo6bxOdJKbtpdBZOUJFhbxAwZoqyGNpFogiNOfctMCOYYF8qjP8avZBMOkrJbTemAwimOJdMMJKKLhzGMWqbJ1biNl~Jj1c3uT8Zr7znnYtM25ysM~Se5adBHuQReaoXOpGQ8qt2Pw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	26 August 1950 (Japan)			8.2 based on 155,059 user ratings	1h 28min	Japanese	Daiei 
131	tt0071853	/title/tt0071853	Monty Python and the Holy Grail (1975)	History is turned on its comic head when, in tenth-century England, King Arthur travels the countryside to find knights who will join him at the Round Table in Camelot. Gathering up the men is a tale in itself but after a bit of a party at Camelot, many decide to leave only to be stopped by God, who sends them on a quest: to find the Holy Grail. After a series of individual adventures, the knights are reunited but must face a wizard named Tim the Enchanter, killer rabbits and lessons in the use of holy hand grenades. Their quest comes to an end however when the Police intervene - just what you would expect in a Monty Python movie.\nWritten by\ngarykmcd	https://m.media-amazon.com/images/M/MV5BN2IyNTE4YzUtZWU0Mi00MGIwLTgyMmQtMzQ4YzQxYWNlYWE2XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3159408409/1434659607842-pgv4ql-1580301576149.mp4?Expires=1619379779&Signature=HolTfNUtZg9MuhEzNDMQiVUD~-6RgMHl-ZGPhfcCSQytUdLoJiweoXN1KchvdiIUm1ZhzqiOfDAvxe55ikdDmKdD3SPhBkQ9uEf1fKSWb-qcfbYAMQ51qS6PsVygai3lZusK4CB0G7ApQ7tw0NhnHSWg9s-T-pdI26w96zc~MYg44aq4jKWFetN-Xc8KS7D5lzjrCi5h0Wy5AeMnICNrz~4ubgIcRBnBpLfc~cOs~4Om~VIZbtx68dWWOeLsquazzhyQeXJwp~OtsA-PiBa9LhrRVEGnysxGfDKOwke9GlGwkQPPWQkwdXkGEw5yv0vJ-Ji6ToqGBa826s1NITm8HQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 May 1975 (UK)			8.2 based on 505,930 user ratings	1h 31min	English\n|\nFrench\n|\nLatin	Python (Monty) Pictures, Michael White Productions, National Film Trustee Company 
132	tt0363163	/title/tt0363163	Der Untergang (2004)	In April of 1945, Germany stands at the brink of defeat with the Soviet Armies closing in from the west and south. In Berlin, capital of the Third Reich, Adolf Hitler proclaims that Germany will still achieve victory and orders his Generals and advisers to fight to the last man. "Downfall" explores these final days of the Reich, where senior German leaders (such as Himmler and Goring) began defecting from their beloved Fuhrer, in an effort to save their own lives, while still others (Joseph Goebbels) pledge to die with Hitler. Hitler, himself, degenerates into a paranoid shell of a man, full of optimism one moment and suicidal depression the next. When the end finally does comes, and Hitler lies dead by his own hand, what is left of his military must find a way to end the killing that is the Battle of Berlin, and lay down their arms in surrender.\nWritten by\nAnthony Hughes {husnock31@hotmail.com}	https://m.media-amazon.com/images/M/MV5BMTU0NTU5NTAyMl5BMl5BanBnXkFtZTYwNzYwMDg2._V1_FMjpg_UX1000_.jpg			16 September 2004 (Germany)			8.2 based on 335,029 user ratings	2h 36min	German\n|\nRussian\n|\nFrench\n|\nEnglish	Constantin Film, Norddeutscher Rundfunk (NDR), Westdeutscher Rundfunk (WDR) 
133	tt0118849	/title/tt0118849	Bacheha-Ye aseman (1997)	Zahra's shoes are gone; her older brother Ali lost them. They are poor, there are no shoes for Zahra until they come up with an idea: they will share one pair of shoes, Ali's. School awaits. Will the plan succeed?\nWritten by\nEileen Berdon <eberdon@aol.com>	https://m.media-amazon.com/images/M/MV5BZTYwZWQ4ZTQtZWU0MS00N2YwLWEzMDItZWFkZWY0MWVjODVhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2901319193/1434659607842-pgv4ql-1564499323131.mp4?Expires=1619379810&Signature=RPyG~btvysamnFpuuWvxDaafdKZCOGRmuklHnSmepgWG3O32qfA7SL2Q5M9I4ouo89NkfS4iTACrjSkgb55pUVwAI5U6PP55ovYzspcuP0szUeGN03zEuBYm6zshnCgHkBMVStc1TuTZx6Y5DyI0dfAsuXO8TA75KWuabE4pF8xC-RtieeDfeEgTdBuT9KdmD36YAIkxOfQqCWzcdHKk53D7iB1wgbCYU3cAJ~FkcnHqJhzoJcOO9G0oQTpkjxacr2l8oLYDjJG3e4tvbooUnCqbMNVqc-NDaSP5n-AzYq4Hv~DMtPaYXoJuVQkSp3DfwfHGnOA3u-rGnBRs45vESw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	1997 (Iran)			8.3 based on 66,904 user ratings	1h 29min	Persian	Kanun parvaresh fekri 
134	tt0089881	/title/tt0089881	Ran (1985)	Japanese warlord Hidetori Ichimonji decides the time has come to retire and divide his fiefdom among his three sons. His eldest and middle sons - Taro and Jiro - agree with his decision and promise to support him for his remaining days. The youngest son Saburo disagrees with all of them arguing that there is little likelihood the three brothers will remain united. Insulted by his son's brashness, the warlord banishes Saburo. As the warlord begins his retirement, he quickly realizes that his two eldest sons selfish and have no intention of keeping their promises. It leads to war and only banished Saburo can possibly save him.\nWritten by\ngarykmcd	https://m.media-amazon.com/images/M/MV5BZDBjZTM4ZmEtOTA5ZC00NTQzLTkyNzYtMmUxNGU2YjI5YjU5L2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3567629593/1434659607842-pgv4ql-1563512641226.mp4?Expires=1619379819&Signature=nOFyyFSZYPMSpwysgkLkUHGJ5hpZT6-4BPDPPDjZJeA3jBUjEvdr07u6YkUbkG7ey52mTTmRDVlCiGYnyBrYi4L~OW2UXOaLTzKVtpLb4eSM8JPFspMjcchdITvtSD6NtsB845xa4e2yD66xNCjV9LOOmleVuFG2CIK8SgU-Ji8X~LPIWE6vIABQYEfTfJGHT91fJyN0JhdSI038V5W-XCeAAQxAOV0Amlt1H3-WZgHcBr8J~cX6mT24qWM55Z9YLA966Ye7XUUYXmUkN~SxjMSpIfO8-Yqkv1FkbKfwnUcuTi3K8UFETcUln49uGlnR~Ua9QImDe6cfmraTlThrvA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	1 June 1985 (Japan)			8.2 based on 114,709 user ratings	2h 42min	Japanese	Greenwich Film Productions, Herald Ace, Nippon Herald Films 
135	tt0105695	/title/tt0105695	Unforgiven (1992)	After escaping death by the skin of her teeth, the horribly disfigured prostitute, Delilah Fitzgerald, and her appalled and equally furious co-workers summon up the courage to seek retribution in 1880s Wyoming's dangerous town of Big Whiskey. With a hefty bounty on the perpetrators' heads, triggered by the tough Sheriff "Little Bill" Daggett's insufficient sense of justice, the infamous former outlaw and now destitute Kansas hog farmer, William Munny, embarks on a murderous last mission to find the men behind the hideous crime. Along with his old partner-in-crime, Ned Logan, and the brash but inexperienced young gunman, the "Schofield Kid", Munny enters a perilous world he has renounced many years ago, knowing that he walks right into a deadly trap; however, he still needs to find a way to raise his motherless children. Now, blood demands blood. Who is the hero, and who is the villain?\nWritten by\nNick Riganas	https://m.media-amazon.com/images/M/MV5BODM3YWY4NmQtN2Y3Ni00OTg0LWFhZGQtZWE3ZWY4MTJlOWU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3445406489/1434659607842-pgv4ql-1536964844984.mp4?Expires=1619379826&Signature=TKF-gZA~V1h3LFLCyIUF3e34LzZa7Ck6tPjmXpFRKU2r5C-j6vU0PicJlJ4FueOR3U6-ASCPRqbV1qO72uWs2e4oTRE7tvlucdmBUbmqAV~5X0fuew6PearM~GpJSiCwlSbATkjF2IbP1ZvUxzq~z1tlJw-N1NsaRLbAralN-VJcmNCNLKQf4y~Q8TPB6C3mjyXXZ8sgisPw-OM0ALZp2GWMnVxRH2OMflBHaZ2qx9UH9jZsET7XxBMD56Co4q0pnEoDmUnd3EuJZ-KhPYCHzMbZyUCUCsjKoX0OgIS4u4yQdwySh5nGx0s5c1EFZaF2sGRWYYYFb2v2oMfZlirrSw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	7 August 1992 (USA)			8.2 based on 380,872 user ratings	2h 10min	English	Warner Bros., Malpaso Productions 
136	tt0053291	/title/tt0053291	Some Like It Hot (1959)	After two Chicago musicians, Joe and Jerry, witness the the St. Valentine's Day massacre, they want to get out of town and get away from the gangster responsible, Spats Colombo. They're desperate to get a gig out of town but the only job they know of is in an all-girl band heading to Florida. They show up at the train station as Josephine and Daphne, the replacement saxophone and bass players. They certainly enjoy being around the girls, especially Sugar Kane Kowalczyk who sings and plays the ukulele. Joe in particular sets out to woo her while Jerry/Daphne is wooed by a millionaire, Osgood Fielding III. Mayhem ensues as the two men try to keep their true identities hidden and Spats Colombo and his crew show up for a meeting with several other crime lords.\nWritten by\ngarykmcd	https://m.media-amazon.com/images/M/MV5BNzAyOGIxYjAtMGY2NC00ZTgyLWIwMWEtYzY0OWQ4NDFjOTc5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2371683353/1434659607842-pgv4ql-1616202772979.mp4?Expires=1619379832&Signature=tmKcyixrA3wbPjl8hy13x8QDXUHMBd3f9WH967jaLT1mj~0u21lWM5OTmmB7fF83naOcLEoAzjoqnkF3sugEfI2sfU--gujloORBrHYdpyhbHQPsZsPd3K6xS1WaMY0U7OLPsDBvuzsbua2xsE8RhUJUqRH5faueAh59-J8j8ENojBmeknCLCzNd87b0orUm-FqImI2ujX13Hq9E9JzLGfZuaJcEIAQNOE2fYw-nyPX1NRyx6VXZkT3HLb0b4UF7lF7zRXPXUQRE6K5jVnohPYgSrlv-QnTtjkS6Jd~aAPG1WNvG2-bbDaTZvD3Fofc-JyAFkc34Pvr22a3rsCfqhA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	19 March 1959 (USA)			8.2 based on 247,119 user ratings	2h 1min	English	Ashton Productions, The Mirisch Corporation 
137	tt0347149	/title/tt0347149	Hauru no ugoku shiro (2004)	A love story between an 18-year-old girl named Sophie, cursed by a witch into an old woman's body, and a magician named Howl. Under the curse, Sophie sets out to seek her fortune, which takes her to Howl's strange moving castle. In the castle, Sophie meets Howl's fire demon, named Karishifâ. Seeing that she is under a curse, the demon makes a deal with Sophie--if she breaks the contract he is under with Howl, then Karushifâ will lift the curse that Sophie is under, and she will return to her 18-year-old shape.\nWritten by\nSophie Ball	https://m.media-amazon.com/images/M/MV5BNmM4YTFmMmItMGE3Yy00MmRkLTlmZGEtMzZlOTQzYjk3MzA2XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3502817561/1434659607842-pgv4ql-1605706014921.mp4?Expires=1619379840&Signature=E6hBfZgfrgH7y8mH~CjyAz4~E-K4akYVViKyNBxQzEuSaWxRTm1Avg~wj87K9wD3ULl0mHlczOBFsXLR~xwegHAQPOnNbi0DeVrAex7M6lqiYdb0vSAOVE5fYxzcpejf~bUwxaaa4U1yx7Fl9YQbUOdB3GwrMQKyDYXs~f3oGOz7wtjyJQLZCe2qXyMbsF4SUES3L9xHQdWRZ5y-b9sBl-HOMOmiCREZmTPxhcYC-gfonKmaTkRxKQHfIdUw9Z8aKDRJ5nzCFeRCBT1lfIxFKY8T7TqXUwwRODAfryhuyeadUINghtE9pk7pGklrNuUZHJX5cIAfBruWdKFPSCVu6w__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	20 November 2004 (Japan)			8.2 based on 342,398 user ratings	1h 59min	Japanese	Buena Vista Home Entertainment, DENTSU Music And Entertainment, Mitsubishi 
138	tt0042192	/title/tt0042192	All About Eve (1950)	Eve Harrington (Anne Baxter) is waiting backstage to meet her idol, talented but aging Broadway star Margo Channing (Bette Davis). It seems innocent enough as Eve explains that she has seen Margo in EVERY performance of her current play. Margo and her friends take Eve under their wing but only theatre critic Addison DeWitt (George Sanders) sees through Eve's evil plan, which is to take Margo's parts and her fiancé, Bill Simpson (Gary Merrill) too.	https://m.media-amazon.com/images/M/MV5BMTY2MTAzODI5NV5BMl5BanBnXkFtZTgwMjM4NzQ0MjE@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2863989017/1434659607842-pgv4ql-1563673288466.mp4?Expires=1619379850&Signature=BE-htsC~Fd-Bu7nA8PbwQUfUNTd5aKR~jigJD~qYi6DiLXdUORQ~VVKfSG563jhh6DaZKABa-8s9hsxjqv3BTMC4TRMWKX9a3fKIE7r1R5Rbgv6j~unBmX1rFMhPiELSLzSSX0aCuntt1nUXhOcGolJHMikkXxMbAdbKOCjfpjUmdxe29~A41mUcXQbfnQOwfZbRhlrwP1hKvw0nH6AkGpvJngFTi4HY8wV9uqSt7mmRj9OTIdVKFaw0VJIrFLWkXxUtHOWPyUs-2pb0rjdwwwEGZHFXgHNLaSVnOs0PzN99w51s0F1le5AQw8BJS5uPWuupo~OJ4e-IejOFnjbJNQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	27 October 1950 (USA)			8.2 based on 122,172 user ratings	2h 18min	English\n|\nFrench	Twentieth Century Fox 
139	tt0112641	/title/tt0112641	Casino (1995)	This Martin Scorsese film depicts the Janus-like quality of Las Vegas--it has a glittering, glamorous face, as well as a brutal, cruel one. Ace Rothstein and Nicky Santoro, mobsters who move to Las Vegas to make their mark, live and work in this paradoxical world. Seen through their eyes, each as a foil to the other, the details of mob involvement in the casinos of the 1970s and '80s are revealed. Ace is the smooth operator of the Tangiers casino, while Nicky is his boyhood friend and tough strongman, robbing and shaking down the locals. However, they each have a tragic flaw--Ace falls in love with a hustler, Ginger, and Nicky falls into an ever-deepening spiral of drugs and violence.\nWritten by\nTad Dibbern <DIBBERN_D@a1.mscf.upenn.edu>	https://m.media-amazon.com/images/M/MV5BMTcxOWYzNDYtYmM4YS00N2NkLTk0NTAtNjg1ODgwZjAxYzI3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1035796761/1434659607842-pgv4ql-1564464625619.mp4?Expires=1619379862&Signature=f6~NXNYKjYOTjBprV0t1PcuybW1Ic7JWQpMc2oAE2qhp76fGMQCl3oA56Q6lQ9kaCLWXJ7X4fP8AH2woLO1EA5taSrk8Sq11bZ4qz68OHm5CUbZwBFW9FMZG-Bj2vINZ8gwQm9eQF5bTKYzQJfu8EpTPuyeiY2oJuosj9k~1uJUWV0mqYxtbFd-LKvMtcYR0WBIot0IWBRbqpN0VoYB5k5G47LnwWNoqzJl7uIY3QI-eudf3Wu15fTwjDi1a8bXPHibs0~zYwEXLMGJy~pLq3enDCSkPMj3pbSJkgTLwfuDaF9t4CiLEqWqkhWsXWdHBRKrFnZnoa3cnmB5X-gdDMg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	22 November 1995 (USA)			8.2 based on 473,814 user ratings	2h 58min	English	Universal Pictures, Syalis DA, Légende Entreprises 
140	tt0993846	/title/tt0993846	The Wolf of Wall Street (2013)	In the early 1990s, Jordan Belfort teamed with his partner Donny Azoff and started brokerage firm Stratton Oakmont. Their company quickly grows from a staff of 20 to a staff of more than 250 and their status in the trading community and Wall Street grows exponentially. So much that companies file their initial public offerings through them. As their status grows, so do the amount of substances they abuse, and so do their lies. They draw attention like no other, throwing lavish parties for their staff when they hit the jackpot on high trades. That ultimately leads to Belfort featured on the cover of Forbes Magazine, being called "The Wolf Of Wall St.". With the FBI onto Belfort's trading schemes, he devises new ways to cover his tracks and watch his fortune grow. Belfort ultimately comes up with a scheme to stash their cash in a European bank. But with the FBI watching him like a hawk, how long will Belfort and Azoff be able to maintain their elaborate wealth and luxurious lifestyles?\nWritten by\nhalo1k	https://m.media-amazon.com/images/M/MV5BMjIxMjgxNTk0MF5BMl5BanBnXkFtZTgwNjIyOTg2MDE@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2312218649/1434659607842-pgv4ql-1616202335617.mp4?Expires=1619379868&Signature=UkZMEItZ8T-j1KZEBf2vKSCJDBo4vYbvifhvhLFpE0dG4HvxVFyvCBl0vhSbnXRXbwKt5OPEG85SvZ364ZbLiXeQKAVF5DTC8Y2F3JMCLSjEB7kktQRZV4SdPR4ytk~whDO5d4OxwHYBN-MY3Zu9CxbDpXaesSU0qVTtaM35Ns91PpT9ZToUDyLiHsadVapirlZJsOqW3-E07n-YF3opfj~ih4HM9QDqU1wf3CUp5gVGN8q~sPFa7ntr7SXTNeYsUorvvd3TSiAS~hF1udU~G9zxbpxZtuqFuHpf5gpMIln~u5~oOcAOX0sn7e~9diHvmwENB-eqgRiSEZfZrtpJbQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 December 2013 (USA)			8.2 based on 1,215,199 user ratings	3h	English\n|\nFrench	Red Granite Pictures, Appian Way, Sikelia Productions 
141	tt0268978	/title/tt0268978	A Beautiful Mind (2001)	From the heights of notoriety to the depths of depravity, John Forbes Nash, Jr. experienced it all. A mathematical genius, he made an astonishing discovery early in his career and stood on the brink of international acclaim. But the handsome and arrogant Nash soon found himself on a painful and harrowing journey of self-discovery. After many years of struggle, he eventually triumphed over his tragedy, and finally - late in life - received the Nobel Prize.\nWritten by\nUniversal Pictures and DreamWorks Pictures	https://m.media-amazon.com/images/M/MV5BMzcwYWFkYzktZjAzNC00OGY1LWI4YTgtNzc5MzVjMDVmNjY0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1801239321/1434659607842-pgv4ql-1536959542449.mp4?Expires=1619379881&Signature=ZoMs8~8QLXMzpmgEBJ7xTaPOBFYTu14h9hsTjQsdE596ku7DqBNbXXdt2oSP28DEhrVgYLhZN2Le5Ue47j4BirZPs9bkkBfF7vnVMYeApkp~tjtitEB-O1d0-STHnvUv3VjKPzqRcqzhHazT8Ub3LPYwxGXoJFhSs3A19sSCNN2Gk2B3YMbCH8h97XAgiOo4xPCGUcFdL9-Su~4f6GzcXk7~K1Vw554VxF87HkMbNZRJrwcucSH1hWt7CprBllinsmnLes~1T2BnuPd04lF6i~DZdaBKXdDUvG3--DfgeO-1SN7KH4U5UoI-3GfaFN9k8OJ4Y4vWxQkGMvQT9LhNcQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	4 January 2002 (USA)			8.2 based on 860,883 user ratings	2h 15min	English	Universal Pictures, Dreamworks Pictures, Imagine Entertainment 
142	tt0057115	/title/tt0057115	The Great Escape (1963)	Based on a true story, a group of allied escape artist-type prisoners-of-war are all put in an "escape proof" camp. Their leader decides to try to take out several hundred all at once. The first half of the movie is played for comedy, as the prisoners mostly outwit their jailers to dig the escape tunnel. The second half is high adventure as they use planes, trains, and boats to get out of occupied Europe.\nWritten by\nJohn Vogel <jlvogel@comcast.net>	https://m.media-amazon.com/images/M/MV5BNzA2NmYxMWUtNzBlMC00MWM2LTkwNmQtYTFlZjQwODNhOWE0XkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1130535193/1434659607842-pgv4ql-1563510478851.mp4?Expires=1619379893&Signature=qN800Cs9ccgW4ka6Bzq4UOr4-8Cq7awQRET9o-FNudApZtoIBZIYxjevngX2A-C-soiANhjebYRWNPKrVZ2p~a0vOEyq73ScccN4ahGX21FHgz3Z2FGEBgHpIVDSiB5MWlBRhJab-xsuIT1JKhArpLQQeHOlpPIRmzvFb96CuBl8tRs7tU0dbx5mAxJqQvHkir48u70iArDyGgFpBDhB4g6Nsz-z4MEkcwZHZiMG4t5qX7JfTZlJzkEqLhNtobtYQUJw50mNi~Vm8wHrsXiLUxjhgthCbghzb4dl~Or-GN6dfa~h6c3wOLGNwUHqVjw4ecY3bmjm36uTBmke7zE-fg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	4 July 1963 (USA)			8.2 based on 227,538 user ratings	2h 52min	English\n|\nGerman\n|\nFrench\n|\nRussian\n|\nSpanish	The Mirisch Company, Alpha 
143	tt0457430	/title/tt0457430	Pan's Labyrinth (2006)	In 1944 Falangist Spain, a girl, fascinated with fairy-tales, is sent along with her pregnant mother to live with her new stepfather, a ruthless captain of the Spanish army. During the night, she meets a fairy who takes her to an old faun in the center of the labyrinth. He tells her she's a princess, but must prove her royalty by surviving three gruesome tasks. If she fails, she will never prove herself to be the true princess and will never see her real father, the king, again.\nWritten by\nahmetkozan	https://m.media-amazon.com/images/M/MV5BMTU3ODg2NjQ5NF5BMl5BanBnXkFtZTcwMDEwODgzMQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1876343321/1434659607842-pgv4ql-1543572005604.mp4?Expires=1619379906&Signature=ARUsiqvJfXMBmnmOJoJphDz-cRZfK4uFtZti6T02wiEyB0SrEQrrfQdloP2~sz5fMxT9CKTGXOkjrxhUFEKphHqswaUhRSWKdzvHC5HTcuXJblAVbRydYKmQZiz87mQKyH8yQSfm7uIVx1rEmGZZYooYRTN~lU5nModgoFpKJchLnKWxB5EO1pr4NK3Ug3X1x6BTMAhQcqZ5fvhhf~jwyq~RTZFN9hmskA4B0AhqBcPuydXgDgBQ-VMq~wCoF8PE2xK4E4X32kJMOCu8uH7qCNyfvUJIw0BxPhuzlSBoQqLvxxFsu7c3hlgUhTUM~kdgMmNNryYHLy65MMj~mox-Yg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	11 October 2006 (Spain)			8.2 based on 625,484 user ratings	1h 58min	Spanish	Estudios Picasso, Tequila Gang, Esperanto Filmoj 
144	tt0469494	/title/tt0469494	There Will Be Blood (2007)	The intersecting life stories of Daniel Plainview and Eli Sunday in early twentieth century California is presented. Miner turn oilman Daniel Plainview is a driven man who will do whatever it takes to achieve his goals. He works hard but he also takes advantage of those around him at their expense if need be. His business partner is his son H.W., who in reality he "acquired" when H.W.'s biological single father, who worked on one of Daniel's rigs, got killed in a workplace accident. Daniel is deeply protective of H.W. if only for what H.W. brings to the partnership. Eli Sunday is one in a pair of twins, whose family farm Daniel purchases for the major oil deposit located on it. Eli, the local preacher and a self-proclaimed faith healer, wants the money from the sale of the property to finance his own church. The lives of the two competitive men often clash as Daniel pumps oil off the property and tries to acquire all the surrounding land at bargain prices to be able to build a ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BMjAxODQ4MDU5NV5BMl5BanBnXkFtZTcwMDU4MjU1MQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1341980953/1434659607842-pgv4ql-1563567763704.mp4?Expires=1619379919&Signature=h2VaCEGHDm82mHwmwvaZb0nZafkxyMUb~b9x2Xg5PwZhQqsd78ZBrBeA8YvKO6mWuOoRfBaqyzUSEPCb~cS8uOSz~kvd~03iuZCRw4wwHc7viZAy8l8gWGSwambUq~3LRePnkvZndMn9JffAW2TBXA2xothXVwf4-njNmrrx8ehg0UWCUOIc7B7eG9HwCE7deWOnhF7OFTV36To~j4RwAcIpAGPoRqj9TWypFxR0urQV-2PYLFMFcbc9xxmlr4iIWezgJto3sFgWODv9MDbZQFR8c85hhX69zraypRoukCZaeG81ZTiiH~1IUdi42RAHKVgbuvLqP3fF2qcY4R1wDw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 January 2008 (USA)			8.2 based on 526,464 user ratings	2h 38min	English\n|\nAmerican Sign Language	Paramount Vantage, Miramax, Ghoulardi Film Company 
145	tt1305806	/title/tt1305806	El secreto de sus ojos (2009)	In 1999, retired Argentinian federal justice agent Benjamín Espósito is writing a novel, using an old closed case as the source material. That case is the brutal rape and murder of Liliana Coloto. In addition to seeing the extreme grief of the victim's husband Ricardo Morales, Benjamín, his assistant Pablo Sandoval, and newly hired department chief Irene Menéndez-Hastings were personally affected by the case as Benjamín and Pablo tracked the killer, hence the reason why the unsatisfactory ending to the case has always bothered him. Despite the department already having two other suspects, Benjamín and Pablo ultimately were certain that a man named Isidoro Gómez is the real killer. Although he is aware that historical accuracy is not paramount for the novel, the process of revisiting the case is more an issue of closure for him. He tries to speak to the key players in the case, most specifically Irene, who still works in the justice department and who he has always been attracted to ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BY2FhZGI5M2QtZWFiZS00NjkwLWE4NWQtMzg3ZDZjNjdkYTJiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi100645401/1434659607842-pgv4ql-1542218588675.mp4?Expires=1619379932&Signature=oiZZ7FM4jN~LSPyn7gtP19EiBRDLupLshVlpWU01tAAfzKrNbQIzMN4oHFsZ30DYHjkrY5Z-PW6QPuwcvPKZ8Ftl-vL71KzBpSZd09MvMYvaYIXxdZuuiyphmtTNzrslxtb5wplKgGP2xU7k-rZVrbXHHhXO~KEEpuFYc2fNLWuzlHjp62io-rRqJtlRFo2hLWMxtvnPxGLbgJOal96izQBm8LG4as-1C6PY6wPPbl9Lji0pumbPOfM8doiehwXyTV5qJ9rdmJ9nGT6Ne~N15xSEcA9NJ6CGEkY~M6DyIzTR2qKEaK2O9rxqPGowKQ~m2rJCZNLAhBU-XGfhAiFLWw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	13 August 2009 (Argentina)			8.2 based on 196,110 user ratings	2h 9min	Spanish	Tornasol Films, Haddock Films, 100 Bares 
146	tt0055031	/title/tt0055031	Judgment at Nuremberg (1961)	It has been three years since the most important Nazi leaders had already been tried. This trial is about 4 judges who used their offices to conduct Nazi sterilization and cleansing policies. Retired American judge, Dan Haywood has a daunting task ahead of him. The Cold War is heating up and no one wants any more trials as Germany, and Allied governments, want to forget the past. But is that the right thing to do is the question that the tribunal must decide.\nWritten by\nTony Fontana <tony.fontana@spacebbs.com>	https://m.media-amazon.com/images/M/MV5BNDc2ODQ5NTE2MV5BMl5BanBnXkFtZTcwODExMjUyNA@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi296224025/1434659607842-pgv4ql-1564093814819.mp4?Expires=1619379963&Signature=THpStATScbsTBFyBdeKdmzyf~nwVOw0YWpORlMUieiqCqQxjDHDV6fua63gmVV48pXOPASQkkEffCgcdWG9QJG3OsP00qihXdyl-~aNAVwa-nO1UlhN4Zl-J5BOsmiZTSCXVblv5hfJSaSiwEIYTlKslg4o1NWc6KmADr-QxqPQqIBIDcl8gqMx7DdBTG8I8SgXm7W-APZ4Y3~8l8ABCNEaAf27PlzGJqNVlAJcRwGUlDBSKyCwlgjV4RQizemKuccruV1iPlgw-Q2Dhw0x7JeZOEpzYHGL8atJicHyZ1dNur3Bez50iKrWiUMXe0wA0BGzEGuhw5IExcV81v9r8MQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	18 December 1961 (Sweden)			8.2 based on 70,754 user ratings	2h 59min	English\n|\nGerman	Roxlom Films Inc. 
147	tt0120735	/title/tt0120735	Lock, Stock and Two Smoking Barrels (1998)	Four Jack-the-lads find themselves heavily - seriously heavily - in debt to an East End hard man and his enforcers after a crooked card game. Overhearing their neighbours in the next flat plotting to hold up a group of out-of-their-depth drug growers, our heros decide to stitch up the robbers in turn. In a way the confusion really starts when a pair of antique double-barrelled shotguns go missing in a completely different scam.\nWritten by\nAnonymous	https://m.media-amazon.com/images/M/MV5BMTAyN2JmZmEtNjAyMy00NzYwLThmY2MtYWQ3OGNhNjExMmM4XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2274558233/1434659607842-pgv4ql-1563999494897.mp4?Expires=1619379976&Signature=BGSz3J-SHIZtI0vF82Hw6jAP7Iph2QEO7a4CDj8JiDW69-JXQhKoRyrWHDK7CPE6rQst1EMQxhaxjqAUxcHEKZ2UFbB~N5lX-3XyP5U~v1sXcJc6ct1uzqRKJIVa4uHaqIY4N7GiwAaHTndX2~H76yehGRKDt7YGYev3ZJIGyIc8cMgSz0Eep7g6E2KXum5374Y0qZmA~TibOOVrI7S2QIYc1cpHtL250ZG2gx7-s5kGi9B9OMCBSIb2INX~h9ZJyHCtpp1VBg1hC9HINYY2NkxRREw22ZmtMFu8CLWhRLjHytOVbFVbvH~szdhlUb7as6WmkcRMsQ8TQsJHn3IKYg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	28 August 1998 (UK)			8.2 based on 541,969 user ratings	1h 47min	English	Summit Entertainment, The Steve Tisch Company, SKA Films 
148	tt0081398	/title/tt0081398	Raging Bull (1980)	When Jake LaMotta steps into a boxing ring and obliterates his opponent, he's a prizefighter. But when he treats his family and friends the same way, he's a ticking time bomb, ready to go off at any moment. Though LaMotta wants his family's love, something always seems to come between them. Perhaps it's his violent bouts of paranoia and jealousy. This kind of rage helped make him a champ, but in real life, he winds up in the ring alone.\nWritten by\nalfiehitchie	https://m.media-amazon.com/images/M/MV5BYjRmODkzNDItMTNhNi00YjJlLTg0ZjAtODlhZTM0YzgzYThlXkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3633616921/1434659607842-pgv4ql-1564767130226.mp4?Expires=1619379984&Signature=J5VD7zu7luP6hIm4qVQRparulnvinwWqcCc-eel1fMcF7QbKbZvGF-HOtCI8BVW7rxbPFDlLhZy2vAMXpyNOGP21L5yKjo~2QERCJKl46lA3ZehhxkwQvihgnjg8OHptvePjwSGJbDl3CXRWvmdGV57WJvC99LmYyYfarWSbyuk8c5frdTKQ8w0CDKZuxOR8iivoz8D7zTq3m2j060Iz~ax0Cr2EyDZx3qTf899yggs~IABudVKVw8uvDqg-pQdaIYTKJV9-ECJOAHrLkrwhIe~OhkUTMaQs3psZdG~MUbkTQLr0kULzaVyqcWBeqi5AsPbLJr4lT3bayPz2r~wrEg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	19 December 1980 (USA)			8.2 based on 326,071 user ratings	2h 9min	English	Chartoff-Winkler Productions 
150	tt0040897	/title/tt0040897	The Treasure of the Sierra Madre (1948)	Fred C. Dobbs and Bob Curtin, both down on their luck in Tampico, Mexico in 1925, meet up with a grizzled prospector named Howard and decide to join with him in search of gold in the wilds of central Mexico. Through enormous difficulties, they eventually succeed in finding gold, but bandits, the elements, and most especially greed threaten to turn their success into disaster.\nWritten by\nJim Beaver <jumblejim@prodigy.net>	https://m.media-amazon.com/images/M/MV5BOTJlZWMxYzEtMjlkMS00ODE0LThlM2ItMDI3NGQ2YjhmMzkxXkEyXkFqcGdeQXVyMDI2NDg0NQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi567346201/1434659607842-pgv4ql-1563748192580.mp4?Expires=1619380001&Signature=ZC7WCUnUdW3KhCk~y6ZYFekgMdwbdCd2k5RrchXUU-x8YAhnfBu~KwS0OgBkRb8QM2bc51r3C9C4mLE6W1yLXsqNAJEikBqY9lwyARNT~XWqAkDcDpbDIpcM-6ttP-reDIzEWvTnPgh7~qWB2uzCde4vqTuV0~88Czw9vih~y-ORFN4YbIPnTdPn364VNLHutJpxbsvS9G6PsmylQSs00syNELii7bzQ24K7xxSQKJnI4tkXFdWc~1SxS3vuTCVPTbcwg72nLmVQUbP-OQocMIfZwinwpkucPzwXU~yXiY1v0OIs-EZmDwwtgtHAp47SYYJuTfBN3CQeCDOSiZdVRw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	24 January 1948 (USA)			8.2 based on 115,757 user ratings	2h 6min	English\n|\nSpanish	Warner Bros. 
151	tt0046912	/title/tt0046912	Dial M for Murder (1954)	In London, wealthy Margot Mary Wendice had a brief love affair with the American writer Mark Halliday while her husband and professional tennis player Tony Wendice was on a tennis tour. Tony quits playing to dedicate to his wife and finds a regular job. She decides to give him a second chance for their marriage. When Mark arrives from America to visit the couple, Margot tells him that she had destroyed all his letters but one that was stolen. Subsequently she was blackmailed, but she had never retrieved the stolen letter. Tony arrives home, claims that he needs to work and asks Margot to go with Mark to the theater. Meanwhile Tony calls Captain Lesgate (aka Charles Alexander Swann who studied with him at college) and blackmails him to murder his wife, so that he can inherit her fortune. But there is no perfect crime, and things do not work as planned.\nWritten by\nClaudio Carvalho, Rio de Janeiro, Brazil	https://m.media-amazon.com/images/M/MV5BOWIwODIxYWItZDI4MS00YzhhLWE3MmYtMzlhZDIwOTMzZmE5L2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3634430233/1434659607842-pgv4ql-1563666268543.mp4?Expires=1619380013&Signature=IpJQo4ZZXrInahGm1B2mgwLIZIRsg~qGChboSTZJWh~BXkKrOtDPudmDB4-5YMrCVsj-1UX1fifJ7rMkayGQFfECNfNVSDM45Cu~n1e2ACHKjYWmJdQn381Ioj23pD4D8cn6H4wc-OUuKMqnZJL1fqbQ2OW-aqRYZImhcXFkmb3wvXvj0E2kPqzYWFXxrFSNs2dB9csm9Xx0U~u9j8Qs22h-j64LUBr2KxpycEd~YZWeiWiG~fPF1TKGDil61dw8LyEziWXVf9jaF-FWBTSzVVjZey82jxVOLrN8ooaPqBcWAZ1rkaoJJpC-i-LrLdxOVZDn6ZhZwV1o-eK6D-EHFw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	29 May 1954 (USA)			8.2 based on 160,844 user ratings	1h 45min	English	Warner Bros. 
152	tt1130884	/title/tt1130884	Shutter Island (2010)	In 1954, up-and-coming U.S. marshal Teddy Daniels is assigned to investigate the disappearance of a patient from Boston's Shutter Island Ashecliffe Hospital. He's been pushing for an assignment on the island for personal reasons, but before long he thinks he's been brought there as part of a twisted plot by hospital doctors whose radical treatments range from unethical to illegal to downright sinister. Teddy's shrewd investigating skills soon provide a promising lead, but the hospital refuses him access to records he suspects would break the case wide open. As a hurricane cuts off communication with the mainland, more dangerous criminals "escape" in the confusion, and the puzzling, improbable clues multiply, Teddy begins to doubt everything - his memory, his partner, even his own sanity.\nWritten by\nalfiehitchie	https://m.media-amazon.com/images/M/MV5BYzhiNDkyNzktNTZmYS00ZTBkLTk2MDAtM2U0YjU1MzgxZjgzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi4064281/1434659607842-pgv4ql-1616202579819.mp4?Expires=1619380023&Signature=n8FI--kpWBMeQeBT7xyhkLPjBrYYqNTk5vwEaub05HFPKPS4rLmaVksPxxwSCr8MpZftCPpqpekeudj1m89dtym79B4GBCK6md-9jkAF1V80e6jScwjhiKWW2OM8stSBmujaLSVieDXDZn5ylHuMPdfIHYfz6nTTsyzL0aMoV4frYQHRXj4sPn1071xrOBTICBwH5K9NyWycdKkDlHHG-J5lKZQyv8qs8sdEHpXQF0xkCIrcn9HnQ12nYMCtJ1MEa4mqMrPJyvvuYTct0CYjltmfyE77buGw70TwzV6lFJBzNcceVRwWe3xFA8DPeXXdfvQmtj8UXS0Zx0Gq-F4z2A__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	19 February 2010 (USA)			8.2 based on 1,152,535 user ratings	2h 18min	English\n|\nGerman	Paramount Pictures, Phoenix Pictures, Sikelia Productions 
153	tt5027774	/title/tt5027774	Three Billboards Outside Ebbing, Missouri (2017)	THREE BILLBOARDS OUTSIDE EBBING, MISSOURI is a darkly comic drama from Academy Award nominee Martin McDonagh (In Bruges). After months have passed without a culprit in her daughter's murder case, Mildred Hayes (Academy Award winner Frances McDormand) makes a bold move, painting three signs leading into her town with a controversial message directed at William Willoughby (Academy Award nominee Woody Harrelson), the town's revered chief of police. When his second-in-command Officer Dixon (Academy Award winner Sam Rockwell), an immature mother's boy with a penchant for violence, gets involved, the battle between Mildred and Ebbing's law enforcement is only exacerbated.\nWritten by\nFox Searchlight Pictures	https://m.media-amazon.com/images/M/MV5BMjI0ODcxNzM1N15BMl5BanBnXkFtZTgwMzIwMTEwNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3585980441/1434659607842-pgv4ql-1511221571104.mp4?Expires=1619380034&Signature=IOqX4OjDHo1Iqug3Bl7dAZo0BZ73PnG2HLBZIG0sl7ZEmZrzwUWrzaq1n1bzIoqc2ihy~BxUwNNrsPdAQAu-tnjXLOjfF0rGCkCSCnIoK3qmayj1~mCFG3kHM6RKcjd4Zm1yadvxDK2gGJ~6fgPYc4Z04v-88kQnK4PtzfvsxRg3P2hoFxZCA3TObYNSCMZGFLMnrBt9a9l-CYzeb0Xqo-b4U2rwNRbYI3b8D~m-hqem8v0f~3OkBjQFp0f1b4YTNWXijehEgjZrLMRKojor0TkSOJR1gNBg2Ct6SmJeZEXqZ~2paXa2ulPvBEwqPvFxjPWJ9k3oIXHQS8kX3oQ31g__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	1 December 2017 (USA)			8.1 based on 445,278 user ratings	1h 55min	English	Blueprint Pictures, Film 4, Fox Searchlight Pictures 
154	tt0015864	/title/tt0015864	The Gold Rush (1925)	A lone prospector ventures into Alaska looking for gold. He gets mixed up with some burly characters and falls in love with the beautiful Georgia. He tries to win her heart with his singular charm.\nWritten by\nJohn J. Magee <magee@helix.mgh.harvard.edu>	https://m.media-amazon.com/images/M/MV5BZjEyOTE4MzMtNmMzMy00Mzc3LWJlOTQtOGJiNDE0ZmJiOTU4L2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi70820889/1434659607842-pgv4ql-1563526422310.mp4?Expires=1619380047&Signature=IpSDrg48Erw-Ba2XSGLLxdnAk1uq2u1RcnAn3to8kG4ZYZPURCaNvGV13XjDqxS-HjAd7jHISvKUFOd8wVkTAMx7xSXL7UyVZdzJMcLqtu6jKgJTZhcocvF2yPJSGvKmALLNtIGWy1~Rs-U1kNco4V1FmC3eoQgg-Pftkfd6dWdrd9HZsXb0JWj0YI73JdBcMaxxhJoCwX8YuqBBpin5YErc36~TgHDBMhIrtX~Ulu43Ntu-UX-Z4fzsg3t9YGcpYzou7DdfRv4pjlLiwXzRpEwA7C8b17rOOidtNG-kh6yKaR7YElT5riteFGz5rQ6jUHrJfEa6ZjEAqsC7P~mkrw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	13 July 1925 (Brazil)			8.2 based on 102,766 user ratings	1h 35min	None\n|\nEnglish	Charles Chaplin Productions 
156	tt0071315	/title/tt0071315	Chinatown (1974)	In 1937 Los Angeles, private investigator Jake 'J.J.' Gittes specializes in cheating-spouse cases. His current target is Hollis Mulwray, high-profile chief engineer for the Los Angeles Department of Water and Power, whose wife suspects him of infidelity. In following Mulwray, Gittes witnesses some usual business dealings, such as a public meeting for construction of a new dam to create additional water supply for Los Angeles, as fresh water is vital to the growing community during the chronic drought; Mulwray opposes the dam. Eventually Gittes sees Mulwray meeting with an unknown young woman who isn't his wife. Once news of the supposed tryst between Mulwray and this woman hits the media, additional information comes to light that makes Gittes believe that Mulwray is being framed for something and that he himself is being set up. In his investigation of the issue behind Mulwray's framing and his own setup, Gittes is assisted by Mulwray's wife Evelyn, but he thinks she isn't being ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BOGMwYmY5ZmEtMzY1Yi00OWJiLTk1Y2MtMzI2MjBhYmZkNTQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1220411673/1434659607842-pgv4ql-1563432895396.mp4?Expires=1619380064&Signature=KpPUUKfecktxXdyPtIF1HudH-gNY4cSkcg7YdXDCi3KtV8z6FH7H8QKWXt6NjB6TrTm97zLF~fw--mCJw2WvA~bWH-9yLyKRpu5zirzThbZJ6FNAX8gULBMSTrLajEYH1sykKVjcS7UCTVyFRrVaFyO51hg~BL-R5YI1aafqzrCqT61H4-boCti4HqLwlUkAXzKxQIaRzeVc~6J1gmjIHbiSgHgt~0pGBRCAqQwzAvyDUoz7p5uPkop7RNr85j26XgrnpBhiaPizvSjbM5BtyiP8q9i9u1CH7DjakBPjMa1tKhuEhkZfmypAe7HtPU3iOk-C8Nh2EuNWetkSW-SwWw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	20 June 1974 (USA)			8.1 based on 298,859 user ratings	2h 10min	English\n|\nCantonese\n|\nSpanish	Paramount Pictures, Penthouse Video, Long Road Productions 
157	tt0477348	/title/tt0477348	No Country for Old Men (2007)	In rural Texas, welder and hunter Llewelyn Moss (Josh Brolin) discovers the remains of several drug runners who have all killed each other in an exchange gone violently wrong. Rather than report the discovery to the police, Moss decides to simply take the two million dollars present for himself. This puts the psychopathic killer, Anton Chigurh (Javier Bardem), on his trail as he dispassionately murders nearly every rival, bystander and even employer in his pursuit of his quarry and the money. As Moss desperately attempts to keep one step ahead, the blood from this hunt begins to flow behind him with relentlessly growing intensity as Chigurh closes in. Meanwhile, the laconic Sheriff Ed Tom Bell (Tommy Lee Jones) blithely oversees the investigation even as he struggles to face the sheer enormity of the crimes he is attempting to thwart.\nWritten by\nKenneth Chisholm (kchishol@rogers.com)	https://m.media-amazon.com/images/M/MV5BMjA5Njk3MjM4OV5BMl5BanBnXkFtZTcwMTc5MTE1MQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi145883417/1434659607842-pgv4ql-1616202385799.mp4?Expires=1619380071&Signature=H8xPrdCBFtcRfWWxwZnOYto90TD8RuQG7gyvXlRvXU5FmGt-qwT3VHraTvVRCzxpM715qlmV81ArtoN2OqDoAjkTDqlMeCsrTyc0bAQqfoe92bpbhIbcJdR~EuYcTSAgU7Ak5I~OVY2RjJjQ3jf5ol7KFKqrgGC6UWZeWvZLr5gEJoNqD34sFgEt3p57fC~4KtAA2~cuF9Fyv3x6DP3RTFZHi9gS9SQhIMeofMFKYeJzMK~tQ6kG6yBmrCNtRCJm-WnwkqBrEAOvbOkgVxWaAhmw0QkhmHc~X8RygKihmmLe3JoRxKf80jsN-kP2cWYlrvh~RQ1GchwnOCrdB6AItQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	21 November 2007 (USA)			8.1 based on 871,855 user ratings	2h 2min	English\n|\nSpanish	Paramount Vantage, Miramax, Scott Rudin Productions 
158	tt0434409	/title/tt0434409	V for Vendetta (2005)	In the distant future, Evey Hammond is an average citizen of the United Kingdom, which is under the rule of the fascist and tyrannical Norsefire Party. She is an employee of the state-run British Television Network, but soon, she becomes the number one enemy of the state together with an enigmatic and larger-than-life freedom fighter known only by the letter "V". V informs Evey that she must hide in his underground lair for at least one year, and while she is reluctant to the idea at first, a bond soon forms between the two individuals. In the meanwhile, the mysterious past of V is gradually revealed to the police inspector tasked with capturing him, Eric Finch, and it is not long until he starts questioning everything his government stands for.\nWritten by\ngoddangwatir	https://m.media-amazon.com/images/M/MV5BOTI5ODc3NzExNV5BMl5BanBnXkFtZTcwNzYxNzQzMw@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi4276093209/1434659607842-pgv4ql-1564222183608.mp4?Expires=1619380088&Signature=TBKl8Ods7JGWSwbuFhNf8iB5yw~uggcSRx8MurDh73j2tD6A2J3KZ8k9yafevBp66-InXi4uynoGKNyzRVS2WkNrXz~fnjDcdccgZF1EjlR9yh5b~3hzuUh7kvtTh~M6GzH7imT4UccTVbg~V~Sd5iCdzlM3v3HLZjjslm~VCKgT8vc9gqQPvUxU1DWQDWS4dJwCT03e-P4B8aBqA-AgqGjsqppsbDdssuJX1cbo1UbntcBkkeyQ-Atx8V~1Adl0H34KwEH6pqD53ZR-SfILUOHHlXjrpHarc1VSELbAAAAobwVvkbpsniWy40ACZFiAdxxFR6MX2dUPaMGqWTip8A__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	16 March 2006 (Germany)			8.2 based on 1,044,580 user ratings	2h 12min	English	Warner Bros., Virtual Studios, Silver Pictures 
159	tt2096673	/title/tt2096673	Inside Out (2015)	Growing up can be a bumpy road, and it's no exception for Riley, who is uprooted from her Midwest life when her father starts a new job in San Francisco. Like all of us, Riley is guided by her emotions - Joy, Fear, Anger, Disgust and Sadness. The emotions live in Headquarters, the control center inside Riley's mind, where they help advise her through everyday life. As Riley and her emotions struggle to adjust to a new life in San Francisco, turmoil ensues in Headquarters. Although Joy, Riley's main and most important emotion, tries to keep things positive, the emotions conflict on how best to navigate a new city, house and school.\nWritten by\nPixar	https://m.media-amazon.com/images/M/MV5BOTgxMDQwMDk0OF5BMl5BanBnXkFtZTgwNjU5OTg2NDE@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi203730969/1401497881123-xszl4z-1433806759893.mp4?Expires=1619380098&Signature=BrnAdWmnXuqoQIzOObHqg7rm05szmsNDSezdoimB~aR~UcRVeAM10~Et5Vz~uWS8Ejb9np2U7l4efu1ZVB8c8HzjwxOvkaS9bTUTjkE3E722lw~Gdw7lJYBCfPdcl445I18jBrSibSlT4iAMEwjv9C9LSFWkMAydjRENw~Qtz0IxKDVTDR5TrAtRGw~FnWJ1i3UimLLrCZWrXNFKY939tGZwDKKl9nClOdg913pwDd3bTSyMJtuXhkHbv16VC19ud67p7pjll8STt8m2dKRVCf0Qzqj1lDY94Dvk4eoalnrJhTOt40vZxCy6rTi6wwR-ElS5QB2v4OU8E4trQS9tcw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	19 June 2015 (USA)			8.1 based on 629,092 user ratings	1h 35min	English\n|\nPortuguese	Pixar Animation Studios, Walt Disney Pictures 
165	tt0107290	/title/tt0107290	Jurassic Park (1993)	Huge advancements in scientific technology have enabled a mogul to create an island full of living dinosaurs. John Hammond has invited four individuals, along with his two grandchildren, to join him at Jurassic Park. But will everything go according to plan? A park employee attempts to steal dinosaur embryos, critical security systems are shut down and it now becomes a race for survival with dinosaurs roaming freely over the island.\nWritten by\nFilm_Fan	https://m.media-amazon.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi177055257/1434659607842-pgv4ql-1616202408134.mp4?Expires=1619380170&Signature=Lo2WfscOwVBvqcnphvh4nqQWSoF3By-IVLNxt3kHGaIMPugApSNz7gNP4qjbRMxDWL4MBvATVmBBj6hq6-jWWHOKE~ld4by79ER6kJcZWkjh2kyLykUMMuVS3nd9LyYWjQgwZ8UyoJ-Jg6b08WUVTrYoteQKZ9~oSD0GFlRdQhky~oFLPNwAESEqTBes-a~j3FV21V2rwtICeVpBeZH4TiU7OvSVXcgjubBm-A0UMlY-KW01a8xhS7sfTureTwGOoJPDrGUtlU4U4atsXwJTaQC385J4znE5fLUe4GUzIinUsSO5jcPJiuqwcQhOuiiueNPbFEfL~OS8utUM0ikvFA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	11 June 1993 (USA)			8.1 based on 880,305 user ratings	2h 7min	English\n|\nSpanish	Universal Pictures, Amblin Entertainment 
160	tt0084787	/title/tt0084787	The Thing (1982)	A US research station, Antarctica, early-winter 1982. The base is suddenly buzzed by a helicopter from the nearby Norwegian research station. They are trying to kill a dog that has escaped from their base. After the destruction of the Norwegian chopper the members of the US team fly to the Norwegian base, only to discover them all dead or missing. They do find the remains of a strange creature the Norwegians burned. The Americans take it to their base and deduce that it is an alien life form. After a while it is apparent that the alien can take over and assimilate into other life forms, including humans, and can spread like a virus. This means that anyone at the base could be inhabited by The Thing, and tensions escalate.\nWritten by\ngrantss	https://m.media-amazon.com/images/M/MV5BNGViZWZmM2EtNGYzZi00ZDAyLTk3ODMtNzIyZTBjN2Y1NmM1XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2298151193/1434659607842-pgv4ql-1564011064429.mp4?Expires=1619380112&Signature=R3l1Frjw9qRQoMXBK7c2bRLrQUUErQdj43rTa~cLZfgJ382uthi~o-Wn16K3BnNuDb3FYS38bMDpak3AmoEdhNgDtr~A2glHFW9cp9aOCPAi0jxz89BgSmhVtn6Ja49R8rXx-xxpvsn1hiG7s1byYd66qdfFXbZTQ6WbooEuTk5totWuwnOp3YInzNSYqtBOCqyt-jQNYpWCDALrZM601fXqbNCJcEQjFsDiblRAM4yCN1O5jKHgQ0TtRiSyRB9lG7agdWjG1Z4o6mx08vufbHwetsv~fJkJqkMAdDkyVcjLLeDz8bHRRyIgN2I5R9GwKoCpNZQ~imeTpd75WEPVaA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	25 June 1982 (USA)			8.1 based on 376,665 user ratings	1h 49min	English\n|\nNorwegian	Universal Pictures, Turman-Foster Company 
161	tt0080678	/title/tt0080678	The Elephant Man (1980)	In Victorian London, Dr. Frederick Treves with the London Hospital comes across a circus sideshow attraction run by a man named Bytes called "The Elephant Man". In actuality, the creature on display is indeed a man, twenty-one-year-old Joseph "John" Merrick, who has several physical deformities, including an oversized and disfigured skull, and an oversized and disfigured right shoulder. Brutish Bytes, his "owner", only wants whatever he can get economically by presenting Merrick as a freak. Treves manages to bring Merrick under his care at the hospital, not without several of its own obstacles, including being questioned by those in authority since Merrick cannot be cured. Treves initially believes Bytes' assertion that mute Merrick is an imbecile, but ultimately learns that Merrick can speak and is a well-read and articulate man. As news of Merrick hits the London newspapers, he becomes a celebrated curiosity amongst London's upper class, including with Mrs. Kendal, a famed actress. ...\nWritten by\nHuggo	https://m.media-amazon.com/images/M/MV5BMDVjNjIwOGItNDE3Ny00OThjLWE0NzQtZTU3YjMzZTZjMzhkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1763229209/1434659607842-pgv4ql-1593421147127.mp4?Expires=1619380126&Signature=oElskwg1DVFryHGNpSGDZ6XLjZsJGn7R03-L0rjtOwHOOjCmecul-DqN7PBQerAFAz0ouSHV7ippy54wx2laHDjAuGbZ0~cTU9DiRf4Zy~wrem~xJ1pE881pBZscb8AEPh6H16Bkpc6XZbA9Em~qenWNQcBP0KsqW8qjO5RycOHK0x0ARYRfUEZjDVT5HMFkZcWmWo1Cl-KzFJP35VirkhcWoXuRZRJla1nCGkL5~Za9prBmsRnTt0j08LrRjsxRAoqtmH-5KWxAVry-c3g3FPadRs1~EBpEnOJZRvj5HA49POa69GLWcaRspRZA2xEkJ31GCWwQOZeydg8AFGkhxg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	10 October 1980 (USA)			8.1 based on 223,252 user ratings	2h 4min	English\n|\nFrench	Brooksfilms 
162	tt0050976	/title/tt0050976	Det sjunde inseglet (1957)	A Knight and his squire are home from the crusades. Black Death is sweeping their country. As they approach home, Death appears to the knight and tells him it is his time. The knight challenges Death to a chess game for his life. The Knight and Death play as the cultural turmoil envelopes the people around them as they try, in different ways, to deal with the upheaval the plague has caused.\nWritten by\nJohn Vogel <jlvogel@comcast.net>	https://m.media-amazon.com/images/M/MV5BM2I1ZWU4YjMtYzU0My00YmMzLWFmNTAtZDJhZGYwMmI3YWQ5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg			16 February 1957 (Sweden)			8.2 based on 168,189 user ratings	1h 36min	Swedish\n|\nLatin	Svensk Filmindustri (SF) 
163	tt0167404	/title/tt0167404	The Sixth Sense (1999)	Malcom Crowe (Bruce Willis) is a child psychologist who receives an award on the same night that he is visited by a very unhappy ex-patient. After this encounter, Crowe takes on the task of curing a young boy with the same ills as the ex-patient (Donnie Wahlberg) . This boy "sees dead people". Crowe spends a lot of time with the boy much to the dismay of his wife (Olivia Williams). Cole's mom (Toni Collette) is at her wit's end with what to do about her son's increasing problems. Crowe is the boy's only hope.\nWritten by\nJeff Mellinger <jmell@uclink4.berkeley.edu>	https://m.media-amazon.com/images/M/MV5BMWM4NTFhYjctNzUyNi00NGMwLTk3NTYtMDIyNTZmMzRlYmQyXkEyXkFqcGdeQXVyMTAwMzUyOTc@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1906613529/1434659607842-pgv4ql-1563536168631.mp4?Expires=1619380145&Signature=i2ZTV972AlJwYUob49INYEd6iVUKFiydMUqrWcm0lFFEWPpNNVDVyZuybm29RDtVqsQ311zYEhkGeIU2FUdhpPQ8I2rhLbbhvlijzDFxqHil7qCejwVr5gfDUF7lQ5OevSTpKSzAtHmuM4ft59EDgHW~PZ0Fxer6qw6Bl36k0mCTNrs~ZaEc6WgsnwF9KKU~JoHN6N-lFM4H8oAYRp05-D6XS4YQxgQkoEO0hNlQIMxSxmRAQv9tfpoa1Mjv3n5OGLylySC7Fj9oq0yDoq5HvJqKyaKjcFJ8ecNLpCk~EuwzEa-1L6XY68s5Hiwig4QyNgLszrpki5sA9Matpx01fQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	6 August 1999 (USA)			8.1 based on 920,745 user ratings	1h 47min	English\n|\nLatin\n|\nSpanish	Hollywood Pictures, Spyglass Entertainment, The Kennedy/Marshall Company 
164	tt1291584	/title/tt1291584	Warrior (2011)	Two brothers face the fight of a lifetime - and the wreckage of their broken family - within the brutal, high-stakes world of Mixed Martial Arts (MMA) fighting in Lionsgate's action/drama, WARRIOR. A former Marine, haunted by a tragic past, Tommy Riordan returns to his hometown of Pittsburgh and enlists his father, a recovered alcoholic and his former coach, to train him for an MMA tournament awarding the biggest purse in the history of the sport. As Tommy blazes a violent path towards the title prize, his brother, Brendan, a former MMA fighter unable to make ends meet as a public school teacher, returns to the amateur ring to provide for his family. Even though years have passed, recriminations and past betrayals keep Brendan bitterly estranged from both Tommy and his father. But when Brendan's unlikely rise as an underdog sets him on a collision course with Tommy, the two brothers must finally confront the forces that tore them apart, all the while waging the most intense, ...\nWritten by\nMConnell	https://m.media-amazon.com/images/M/MV5BMTk4ODk5MTMyNV5BMl5BanBnXkFtZTcwMDMyNTg0Ng@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi339320089/1434659607842-pgv4ql-1616202495162.mp4?Expires=1619380157&Signature=lQnbWRQYKmf4V~J~nKWQVEiQSqa1MEHP27-DKKDDxwd77BNOFEK7HrZOUJRhA2jcUBaVnQqDnsIIxgH~qXGopcXvgHu1O7rVeSvCE1RM0aYtSU0qK2vaVQQoTv3tZwEn6spwXdbwzzlMaKVttnEneGSayFaFrD6ovNAREhckTyz5yXBCAMtXQPstWRVyd93HjdYsaI7xT~BGOuOT1JqC2eNfDd-a8Vrmo5TjB9Pp29UHQQm6ZNpehiiUttJiKjByqCoAjRfgPT0I47vl0inLi9lp9WDo2iQIwiLuFh7scSnJrxAuDT8CMSFKG0gx-gCthoQAe2kRJG8h0Jl2NEdtYw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	9 September 2011 (USA)			8.2 based on 440,911 user ratings	2h 20min	English\n|\nSpanish	Lionsgate, Mimran Schur Pictures, Solaris 
166	tt4729430	/title/tt4729430	Klaus (2019)	When Jesper (Jason Schwartzman) distinguishes himself as the postal academy's worst student, he is stationed on a frozen island above the Arctic Circle, where the feuding locals hardly exchange words let alone letters. Jesper is about to give up when he finds an ally in local teacher Alva (Rashida Jones), and discovers Klaus (Oscar® winner J.K. Simmons), a mysterious carpenter who lives alone in a cabin full of handmade toys. These unlikely friendships return laughter to Smeerensburg, forging a new legacy of generous neighbors, magical lore and stockings hung by the chimney with care. An animated Christmas comedy directed by Despicable Me co-creator Sergio Pablos, KLAUS co-stars Rashida Jones, Jason Schwartzman and JK Simmons.\nWritten by\nNetflix	https://m.media-amazon.com/images/M/MV5BMWYwOThjM2ItZGYxNy00NTQwLWFlZWEtM2MzM2Q5MmY3NDU5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3213606681/1434659607842-pgv4ql-1570459307509.mp4?Expires=1619380183&Signature=svtI4ANKmJf-kIU3JYa~eU4HbuJEb9~sdxxIrGMp~dPEoCQ7Y9qXYNMZm-cun-ByvwtVmtEcGo0hDcC4BfbwEzR4na0mgX7BOZWZhO2vd8koBnK5eYquAEQIn5dkNayxtvaDtSjG9jcvExQLOSQ4S7pgn3x50Zg65Bxhujn2AnuyMwoF~5kl-zUiTp5VnGJ-7Qe6J9Z7sj721Y7sD~xZTCFifiDBXEJ2piQXY~S6tVm-mzYE-fo7rPxcQQYPwZsdBmdaZz1Wmjd27JeK17766DfJpIqrRYYZroWgcqqWT8DKfHC2uQXnwbhfgb6IVAOE~7p1otZRXFkqTn39rR3MKQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	15 November 2019 (Spain)			8.2 based on 110,813 user ratings	1h 36min	English\n|\nSaami	The SPA Studios, Atresmedia Cine 
167	tt0117951	/title/tt0117951	Trainspotting (1996)	A wild, freeform, Rabelaisian trip through the darkest recesses of Edinburgh low-life, focusing on Mark Renton and his attempt to give up his heroin habit, and how the latter affects his relationship with family and friends: Sean Connery wannabe Sick Boy, dimbulb Spud, psycho Begbie, 14-year-old girlfriend Diane, and clean-cut athlete Tommy, who's never touched drugs but can't help being curious about them...\nWritten by\nMichael Brooke <michael@everyman.demon.co.uk>	https://m.media-amazon.com/images/M/MV5BMzA5Zjc3ZTMtMmU5YS00YTMwLWI4MWUtYTU0YTVmNjVmODZhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2148899865/1434659607842-pgv4ql-1563537012853.mp4?Expires=1619380196&Signature=oBcPJ8ewly1WMUFFZUqFZaUUe0O4I4baKTCraBiU8jy-GCdQd0IIRFvRtQJvHk8M3CAIU~md3YbYEpquBtpE7EVxha2oqkNl2uSvsNn0JIyWawKK86IAkMXETcpGSWDonDgIRIVlqCo~4GxYjWcA3IXg5pDchmhsZmz9CYfq2E8K-z~gkbEcbigB0RTEViApRw7nSIsJ1XU5U7w6qHwFW~L1Y8Kz3spUT~dbf0oTEuCG6IIK408Ad7DfpcUjctKiIBDmmxYCchI2J6DLMvWBxaN-d7ijGtTSRQBnAE7rP4ZxAVBIDBbAM8xGuFFP6sO2hctYZ93wHtlAD4NrME9KRA__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	23 February 1996 (UK)			8.1 based on 641,430 user ratings	1h 33min	English	Channel Four Films, Figment Films, The Noel Gay Motion Picture Company 
168	tt0120382	/title/tt0120382	The Truman Show (1998)	Since birth, a big fat lie defines the well-organised but humdrum life of the kind-hearted insurance salesman and ambitious explorer, Truman Burbank. Utterly unaware of the thousands of cleverly hidden cameras watching his every move, for nearly three decades, Truman's entire existence pivots around the will and the wild imagination of the ruthlessly manipulative television producer, Christof--the all-powerful TV-God of an extreme 24/7 reality show: The Truman Show. As a result, Truman's picturesque neighbourhood with the manicured lawns and the uncannily perfect residents is nothing but an elaborate state-of-the-art set, and the only truth he knows is what the worldwide television network and its deep financial interests dictate. Do lab rats know they are forever imprisoned?\nWritten by\nNick Riganas	https://m.media-amazon.com/images/M/MV5BMDIzODcyY2EtMmY2MC00ZWVlLTgwMzAtMjQwOWUyNmJjNTYyXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi1878327577/1434659607842-pgv4ql-1563818833269.mp4?Expires=1619380210&Signature=AUF931CA-hzr3eu7iQE0z8hPFdcERU9EWe7Xn94M5V4QVEKtRkSOlLTV95lYGV~E-Xnf6NRootoupa2t36y97Itq9vt0oLHNtyYjQ9f7DaMF7ItBeOTNSxr3Zv0zIo5wHQ6AsgWzq7sSxkxZRmu-dDfh2WsA-0VExS8d2jput3dKFHA-eYeSQ03DpB2DXDsSdUG2ckeRMgbkJ6drjMWiVYue5zSgnD6hPkY4lzFyvC0WE5UGOo-ok~EQWOtWwUECBaCvwG1vP77MtMuLkTWoD0s9dyrEEj16klPNSs0uiObFS~~GDZ1H8NLP2qR698kIyFpSDmUlOePzvGiYHSrFzg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	5 June 1998 (USA)			8.1 based on 956,732 user ratings	1h 43min	English	Paramount Pictures, Scott Rudin Productions 
169	tt0031381	/title/tt0031381	Gone with the Wind (1939)	Scarlett is a woman who can deal with a nation at war, Atlanta burning, the Union Army carrying off everything from her beloved Tara, the carpetbaggers who arrive after the war. Scarlett is beautiful. She has vitality. But Ashley, the man she has wanted for so long, is going to marry his placid cousin, Melanie. Mammy warns Scarlett to behave herself at the party at Twelve Oaks. There is a new man there that day, the day the Civil War begins. Rhett Butler. Scarlett does not know he is in the room when she pleads with Ashley to choose her instead of Melanie.\nWritten by\nDale O'Connor <daleoc@interaccess.com>	https://m.media-amazon.com/images/M/MV5BYjUyZWZkM2UtMzYxYy00ZmQ3LWFmZTQtOGE2YjBkNjA3YWZlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi581873433/1434659607842-pgv4ql-1563889724970.mp4?Expires=1619380222&Signature=oMst1OrMes9FlZGrNSnS4LQQqoS4XBAbLUqL3FSPfiZDcBAKP1Qo4szrL3IvYpSHfAGhW6~HLW~Bnj6e1bgfZ2hynt~AV1DzqY814SdQdKthWHu94lx4uWAuFOB-w4Fbo2T5NX6JXm~puArgatjcDVar9DSvmv-FYPAOsVSZqQtIWQh9EX2V-3iQNSelFzdao1oUHRHQA0iND7U4oE-kmBJ22wUM8naM3DD1VHvScGBaFVYSm~UdwKk9UHO6thjG3prkfxVLsB65px9~hcmowLRXzuf6hBHis~dRmSJWtKQNx-FK-QEi5W1pMHyBWl6rryQUv9YV3ZYPTJzjEVChNg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	17 January 1940 (USA)			8.1 based on 293,550 user ratings	3h 58min	English	Selznick International Pictures, Metro-Goldwyn-Mayer (MGM) 
170	tt0266543	/title/tt0266543	Finding Nemo (2003)	A clown fish named Marlin lives in the Great Barrier Reef and loses his son, Nemo, after he ventures into the open sea, despite his father's constant warnings about many of the ocean's dangers. Nemo is abducted by a boat and netted up and sent to a dentist's office in Sydney. While Marlin ventures off to try to retrieve Nemo, Marlin meets a fish named Dory, a blue tang suffering from short-term memory loss. The companions travel a great distance, encountering various dangerous sea creatures such as sharks, anglerfish and jellyfish, in order to rescue Nemo from the dentist's office, which is situated by Sydney Harbour. While the two are searching the ocean far and wide, Nemo and the other sea animals in the dentist's fish tank plot a way to return to the sea to live their lives free again.\nWritten by\nDavid Morris	https://m.media-amazon.com/images/M/MV5BZTAzNWZlNmUtZDEzYi00ZjA5LWIwYjEtZGM1NWE1MjE4YWRhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi2687214105/MV5BMjE3ODI4NDgzMF5BMTFeQW1wNF5BbWU3MDY5OTE0ODc@.mp4?Expires=1619380240&Signature=sONBThZRLqNvIvSFeCvbksFotAK4OOwZMDhePzmqpRTiLUXDBEN0653SVSIsYIGr3JKT7yzCPaTHmMcOZ0ASE19Z5wDrRbGxVxXvMRxLeafpU5YZ7imINR2EzGwcfNTxEetECgpn6LxYbu43D7a755NXlsO3uX7GL2Q5JtZMqqwFwMEpZ5-1oruDaoJrfvh6RWxh8dSjKqNh5BEiXIZFl9VKAkuHhKb175EAx3lxub6rVDZS7cX8-1eJWKM4AEOoqWe3NiU5qSh5-KbMcjPs5-7HIZGzcbNCvVVcFxy2Nu3s8iMTqS36gx9V08X9103Md~HID6puCpEowQuJ8oo1Mg__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	30 May 2003 (USA)			8.1 based on 960,998 user ratings	1h 40min	English	Pixar Animation Studios, Walt Disney Pictures 
171	tt0079944	/title/tt0079944	Stalker (1979)	In a small, unnamed country there is an area called the Zone. It is apparently inhabited by aliens and contains the Room, where in it is believed wishes are granted. The government has declared The Zone a no-go area and have sealed off the area with barbed wire and border guards. However, this has not stopped people from attempting to enter the Zone. We follow one such party, made up of a writer, who wants to use the experience as inspiration for his writing, and a professor, who wants to research the Zone for scientific purposes. Their guide is a man to whom the Zone is everything, the Stalker.\nWritten by\ngrantss	https://m.media-amazon.com/images/M/MV5BMDgwODNmMGItMDcwYi00OWZjLTgyZjAtMGYwMmI4N2Q0NmJmXkEyXkFqcGdeQXVyNzY1MTU0Njk@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi370851353/1434659607842-pgv4ql-1593516512064.mp4?Expires=1619380294&Signature=Rn5DUd~rDTzf-tFOTw3KXsWLNVQnINbdHNv2fyzX-~FrV3totYdFGYFN0qGTfXvWU2nydA6SAQLmflogzYxnhPEFIPDd1Q1gkiEa5BKfaQBUs5rcujRAEnML655G-dvOZ8f2StXjA~nxSH7PTRSniqmOyze2WOReGShte3LlAfB34gqh6fhgCprmuojg8hut7NsVe6SsNbMUl1ZAK-U2nhonudlVXqr07n50jZNflrFT-zAgkDrfqp2mH8R-yjiBKlMspT4RSS8-dkhriLiR4yimwMJRVwFlcOB1GzkpklYHkyBTPNluQtMEe5B0oErMubMurBOt2nArFBTE0fVHnQ__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	17 April 1980 (Netherlands)			8.2 based on 119,609 user ratings	2h 42min	Russian	Mosfilm, Vtoroe Tvorcheskoe Obedinenie 
172	tt0353969	/title/tt0353969	Salinui chueok (2003)	In 1986, in the province of Gyunggi, in South Korea, a second young and beautiful woman is found dead, raped and tied and gagged with her underwear. Detective Park Doo-Man and Detective Cho Yong-koo, two brutal and stupid local detectives without any technique, investigate the murder using brutality and torturing the suspects, without any practical result. The Detective Seo Tae-Yoon from Seoul comes to the country to help the investigations and is convinced that a serial-killer is killing the women. When a third woman is found dead in the same "modus-operandi", the detectives find leads of the assassin.\nWritten by\nClaudio Carvalho, Rio de Janeiro, Brazil	https://m.media-amazon.com/images/M/MV5BOGViNTg4YTktYTQ2Ni00MTU0LTk2NWUtMTI4OTc1YTM0NzQ2XkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_FMjpg_UX1000_.jpg		https://imdb-video.media-imdb.com/vi3468476697/1434659607842-pgv4ql-1599680489085.mp4?Expires=1619380311&Signature=YYUI6vppXz8tZMaXLNNeviKaPAkzLQqfNXzPh626Y8pgHERm9PreeBecOn7Do8Qy2uWdZcRKKIEWdviBcJi~YW-q6k~jF3Ss0NNN6sCvZn8xfFbzY2UE3fIv30Gtln-aKVJcP-tNEQHx4VninR4giYfoJNvLJbKZfiWWAmi2d~G6gkd6BMlWCYrAu487HUVDN-aOQxdRCy0FvX~-Kmq9eCU6PAvf5p2jdEs0lFjqVgUykCTBusSl0dTHSwZLnxvdstDn~9dJKyLYpkv~QgVdyggv~vN6EVblZjuLkJa4FRHbUmmJidgfelVGvxfQ9sf4LYIAXiyZnUW7VJycxsPjYw__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA	2 May 2003 (South Korea)			8.1 based on 145,437 user ratings	2h 11min	Korean\n|\nEnglish	CJ Entertainment, Muhan Investment, Sidus 
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.people (id, imdb_id, imdb_url, full_name, bio, avatar, born_info, death_info) FROM stdin;
1	nm0001104	/name/nm0001104	Frank Darabont	Three-time Oscar nominee Frank Darabont was born in a refugee camp in 1959 in Montbeliard, France, the son of Hungarian parents who had fled Budapest during the failed 1956 Hungarian revolution. Brought to America as an infant, he settled with his family in Los Angeles and attended Hollywood High School. His first job in movies was as a production...	https://m.media-amazon.com/images/M/MV5BNjk0MTkxNzQwOF5BMl5BanBnXkFtZTcwODM5OTMwNA@@._V1_FMjpg_UX1000_.jpg	Born:  January 28,  1959  in Montbéliard, Doubs, France	
3	nm0000209	/name/nm0000209	 Tim Robbins\n(I)\n	Born in West Covina, California, but raised in New York City, Tim Robbins is the son of former The Highwaymen singer Gil Robbins and actress Mary Robbins (née Bledsoe). Robbins studied drama at UCLA, where he graduated with honors in 1981. That same year, he formed the Actors' Gang theater group, an experimental ensemble that expressed radical ...	https://m.media-amazon.com/images/M/MV5BMTI1OTYxNzAxOF5BMl5BanBnXkFtZTYwNTE5ODI4._V1_FMjpg_UX1000_.jpg	Born:  October 16,  1958  in West Covina, California, USA	
5	nm0348409	/name/nm0348409	 Bob Gunton\n	Bob Gunton is an American actor, primarily known for portraying strict and authoritarian characters in popular films. His better known roles include chief George Earle in "Demolition Man" (1993), prison warden Samuel Norton in "The Shawshank Redemption" (1994), medical school dean Dr. Walcott in "Patch Adams" (1998), and politician Cyrus Vance in ...	https://m.media-amazon.com/images/M/MV5BMjUyZDQ0NjktZmM5ZS00NzcxLTliMWYtNWUxNDcyMmExZjU0XkEyXkFqcGdeQXVyMTE1MjA4NzM@._V1_FMjpg_UX1000_.jpg	Born:  November 15,  1945  in Santa Monica, California, USA	
6	nm0000338	/name/nm0000338	Francis Ford Coppola	Francis Ford Coppola was born in 1939 in Detroit, Michigan, but grew up in a New York suburb in a creative, supportive Italian-American family. His father, Carmine Coppola, was a composer and musician. His mother, Italia Coppola (née Pennino), had been an actress. Francis Ford Coppola graduated with a degree in drama from Hofstra University, and ...	https://m.media-amazon.com/images/M/MV5BMTM5NDU3OTgyNV5BMl5BanBnXkFtZTcwMzQxODA0NA@@._V1_FMjpg_UX1000_.jpg	Born:  April 7,  1939  in Detroit, Michigan, USA	
10	nm0001001	/name/nm0001001	 James Caan\n(I)\n	A masculine and enigmatic actor whose life and movie career have had more ups and downs than the average rollercoaster and whose selection of roles has arguably derailed him from achieving true superstar status, James Caan is New York-born and bred. He was born in the Bronx, to Sophie (Falkenstein) and Arthur Caan, Jewish immigrants from Germany. ...	https://m.media-amazon.com/images/M/MV5BMTI5NjkyNDQ3NV5BMl5BanBnXkFtZTcwNjY5NTQ0Mw@@._V1_FMjpg_UX1000_.jpg	Born:  March 26,  1940  in The Bronx, New York, USA	
7	nm0701374	/name/nm0701374	Mario Puzo	Mario Puzo was born October 15, 1920, in "Hell's Kitchen" on Manhattan's (NY) West Side and, following military service in World War II, attended New York's New School for Social Research and Columbia University. His best-known novel, "The Godfather," was preceded by two critically acclaimed novels, "The Dark Arena" and "The Fortunate Pilgrim." In...	https://m.media-amazon.com/images/M/MV5BMjE1NjkxMDE3NV5BMl5BanBnXkFtZTcwNjI0MDMyOA@@._V1_FMjpg_UX1000_.jpg	Born:  October 15,  1920  in Manhattan, New York City, New York, USA	Died:  July 2,  1999  (age 78) in Bay Shore, Long Island, New York, USA
9	nm0000199	/name/nm0000199	Al Pacino	Alfredo James "Al" 'Pacino established himself as a film actor during one of cinema's most vibrant decades, the 1970s, and has become an enduring and iconic figure in the world of American movies. He was born April 25, 1940 in Manhattan, New York City, to Italian-American parents, Rose (nee Gerardi) and Sal Pacino. They divorced when he was young. ...	https://m.media-amazon.com/images/M/MV5BMTQzMzg1ODAyNl5BMl5BanBnXkFtZTYwMjAxODQ1._V1_FMjpg_UX1000_.jpg	Born:  April 25,  1940  in Manhattan, New York City, New York, USA	
11	nm0000134	/name/nm0000134	Robert De Niro	One of the greatest actors of all time, Robert De Niro was born on August 17, 1943 in Manhattan, New York City, to artists Virginia (Admiral) and Robert De Niro Sr. His paternal grandfather was of Italian descent, and his other ancestry is Irish, English, Dutch, German, and French. He was trained at the Stella Adler Conservatory and the American ...	https://m.media-amazon.com/images/M/MV5BMjAwNDU3MzcyOV5BMl5BanBnXkFtZTcwMjc0MTIxMw@@._V1_FMjpg_UX1000_.jpg	Born:  August 17,  1943  in New York City, New York, USA	
4	nm0000151	/name/nm0000151	Morgan Freeman	With an authoritative voice and calm demeanor, this ever popular American actor has grown into one of the most respected figures in modern US cinema. Morgan was born on June 1, 1937 in Memphis, Tennessee, to Mayme Edna (Revere), a teacher, and Morgan Porterfield Freeman, a barber. The young Freeman attended Los Angeles City College before serving ...	https://m.media-amazon.com/images/M/MV5BMTc0MDMyMzI2OF5BMl5BanBnXkFtZTcwMzM2OTk1MQ@@._V1_FMjpg_UX1000_.jpg	Born:  June 1,  1937  in Memphis, Tennessee, USA	
2	nm0000175	/name/nm0000175	Stephen King	Stephen Edwin King was born on September 21, 1947, at the Maine General Hospital in Portland. His parents were Nellie Ruth (Pillsbury), who worked as a caregiver at a mental institute, and Donald Edwin King, a merchant seaman. His father was born under the surname "Pollock," but used the last name "King," under which Stephen was born. He has an ...	https://m.media-amazon.com/images/M/MV5BMjA2ODIxNDM4Nl5BMl5BanBnXkFtZTYwMjkzMzU1._V1_FMjpg_UX1000_.jpg	Born:  September 21,  1947  in Portland, Maine, USA	
8	nm0000008	/name/nm0000008	Marlon Brando	Marlon Brando is widely considered the greatest movie actor of all time, rivaled only by the more theatrically oriented Laurence Olivier in terms of esteem. Unlike Olivier, who preferred the stage to the screen, Brando concentrated his talents on movies after bidding the Broadway stage adieu in 1949, a decision for which he was severely criticized...	https://m.media-amazon.com/images/M/MV5BMTg3MDYyMDE5OF5BMl5BanBnXkFtZTcwNjgyNTEzNA@@._V1_FMjpg_UX1000_.jpg	Born:  April 3,  1924  in Omaha, Nebraska, USA	Died:  July 1,  2004  (age 80) in Westwood, Los Angeles, California, USA
13	nm0634240	/name/nm0634240	Christopher Nolan	Best known for his cerebral, often nonlinear, storytelling, acclaimed writer-director Christopher Nolan was born on July 30, 1970, in London, England. Over the course of 15 years of filmmaking, Nolan has gone from low-budget independent films to working on some of the biggest blockbusters ever made. At 7 years old, Nolan began making short movies ...	https://m.media-amazon.com/images/M/MV5BNjE3NDQyOTYyMV5BMl5BanBnXkFtZTcwODcyODU2Mw@@._V1_FMjpg_UX1000_.jpg	Born:  July 30,  1970  in London, England, UK	
16	nm0005132	/name/nm0005132	 Heath Ledger\n(1979–2008)\n	When hunky, twenty-year-old heart-throb Heath Ledger first came to the attention of the public in 1999, it was all too easy to tag him as a "pretty boy" and an actor of little depth. He spent several years trying desperately to sway this image, but this was a double-edged sword. His work comprised nineteen films, including 10 Things I Hate About ...	https://m.media-amazon.com/images/M/MV5BMTI2NTY0NzA4MF5BMl5BanBnXkFtZTYwMjE1MDE0._V1_FMjpg_UX1000_.jpg	Born:  April 4,  1979  in Perth, Western Australia, Australia	Died:  January 22,  2008  (age 28) in Manhattan, New York City, New York, USA
17	nm0001173	/name/nm0001173	 Aaron Eckhart\n	Aaron Eckhart was born on March 12, 1968 in Cupertino, California, USA as Aaron Edward Eckhart. He is an actor and producer, known for The Dark Knight (2008), Thank You for Smoking (2005) and Rabbit Hole (2010).	https://m.media-amazon.com/images/M/MV5BMTc4MTAyNzMzNF5BMl5BanBnXkFtZTcwMzQ5MzQzMg@@._V1_FMjpg_UX1000_.jpg	Born:  March 12,  1968  in Cupertino, California, USA	
18	nm0001486	/name/nm0001486	 Sidney Lumet\n(1924–2011)\n	Sidney Lumet was a master of cinema, best known for his technical knowledge and his skill at getting first-rate performances from his actors -- and for shooting most of his films in his beloved New York. He made over 40 movies, often complex and emotional, but seldom overly sentimental. Although his politics were somewhat left-leaning and he often...	https://m.media-amazon.com/images/M/MV5BMTY4Mzk5Mzk4Ml5BMl5BanBnXkFtZTYwMTE2NDg0._V1_FMjpg_UX1000_.jpg	Born:  June 25,  1924  in Philadelphia, Pennsylvania, USA	Died:  April 9,  2011  (age 86) in Manhattan, New York City, New York, USA
19	nm0741627	/name/nm0741627	Reginald Rose	Reginald Rose was born on December 10, 1920 in Manhattan, New York City, New York, USA. He was a writer and producer, known for 12 Angry Men (1957), Studio One (1948) and The Defenders (1961). He was married to Ellen McLaughlin and Barbara E. Langbart. He died on April 19, 2002 in Norwalk, Connecticut, USA.	https://m.media-amazon.com/images/M/MV5BNGY1NWMxNzAtMDFlMi00OWI5LTg0ZDctZDE2OTQ0YjZjNTFjXkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  December 10,  1920  in Manhattan, New York City, New York, USA	Died:  April 19,  2002  (age 81) in Norwalk, Connecticut, USA
21	nm0002011	/name/nm0002011	 Lee J. Cobb\n(1911–1976)\n	Lee J. Cobb, one of the premier character actors in American film for three decades in the post-World War II period, was born Leo Jacoby in New York City's Lower East Side on December 8, 1911. The son of a Jewish newspaper editor, young Leo was a child prodigy in music, mastering the violin and the harmonica. Any hopes of a career as a violin ...	https://m.media-amazon.com/images/M/MV5BNDc3MTM0MDQyMF5BMl5BanBnXkFtZTYwMTczMTg2._V1_FMjpg_UX1000_.jpg	Born:  December 8,  1911  in New York City, New York, USA	Died:  February 11,  1976  (age 64) in Woodland Hills, Los Angeles, California, USA
22	nm0000842	/name/nm0000842	 Martin Balsam\n(1919–1996)\n	Martin Henry Balsam was born on November 4, 1919 in the Bronx, New York City, to Lillian (Weinstein) and Albert Balsam, a manufacturer of women's sportswear. He was the first-born child. His father was a Russian Jewish immigrant, and his mother was born in New York, to Russian Jewish parents. Martin caught the acting bug in high school where he ...	https://m.media-amazon.com/images/M/MV5BMTQwOTE4MjMxM15BMl5BanBnXkFtZTcwMDc5MDg5Nw@@._V1_FMjpg_UX1000_.jpg	Born:  November 4,  1919  in The Bronx, New York City, New York, USA	Died:  February 13,  1996  (age 76) in Rome, Lazio, Italy
108	nm0352443	/name/nm0352443	 Albert Hackett\n(1900–1995)\n	Albert Hackett was born on February 16, 1900 in New York City, New York, USA as Albert Maurice Hackett. He was a writer and actor, known for The Thin Man (1934), Seven Brides for Seven Brothers (1954) and Easter Parade (1948). He was married to Gisella Svetlik and Frances Goodrich. He died on March 16, 1995 in New York City.		Born:  February 16,  1900  in New York City, New York, USA	Died:  March 16,  1995  (age 95) in New York City, New York, USA
20	nm0000020	/name/nm0000020	Henry Fonda	Born in Grand Island, Nebraska, Henry Fonda started his acting debut with the Omaha Community Playhouse, a local amateur theater troupe directed by Dorothy Brando. He moved to the Cape Cod University Players and later Broadway, New York to expand his theatrical career from 1926 to 1934. His first major roles in Broadway include "New Faces of ...	https://m.media-amazon.com/images/M/MV5BOTEwNjQ2ODQ4Nl5BMl5BanBnXkFtZTYwMzEwMTM2._V1_FMjpg_UX1000_.jpg	Born:  May 16,  1905  in Grand Island, Nebraska, USA	Died:  August 12,  1982  (age 77) in Los Angeles, California, USA
109	nm0000071	/name/nm0000071	James Stewart	James Maitland Stewart was born on May 20, 1908 in Indiana, Pennsylvania, to Elizabeth Ruth (Johnson) and Alexander Maitland Stewart, who owned a hardware store. He was of Scottish, Ulster-Scots, and some English, descent. Stewart was educated at a local prep school, Mercersburg Academy, where he was a keen athlete (football and track), musician (...	https://m.media-amazon.com/images/M/MV5BMjIwNzMzODY0NV5BMl5BanBnXkFtZTcwMDk3NDQyOA@@._V1_FMjpg_UX1000_.jpg	Born:  May 20,  1908  in Indiana, Pennsylvania, USA	Died:  July 2,  1997  (age 89) in Los Angeles, California, USA
12	nm0000380	/name/nm0000380	Robert Duvall	Veteran actor and director Robert Selden Duvall was born on January 5, 1931, in San Diego, CA, to Mildred Virginia (Hart), an amateur actress, and William Howard Duvall, a career military officer who later became an admiral. Duvall majored in drama at Principia College (Elsah, IL), then served a two-year hitch in the army after graduating in 1953....	https://m.media-amazon.com/images/M/MV5BMjk1MjA2Mjc2MF5BMl5BanBnXkFtZTcwOTE4MTUwMg@@._V1_FMjpg_UX1000_.jpg	Born:  January 5,  1931  in San Diego, California, USA	
24	nm0447745	/name/nm0447745	 Thomas Keneally\n	Thomas Keneally, (born October 7, 1935, Sydney, Australia), Australian writer best known for his historical novels. Keneally's characters are gripped by their historical and personal past, and decent individuals are portrayed at odds with systems of authority. At age 17 Keneally entered a Roman Catholic seminary, but he left before ordination; the ...		Born:  October 7,  1935  in Sydney, New South Wales, Australia	
25	nm0001873	/name/nm0001873	 Steven Zaillian\n	Steven Zaillian was born on January 30, 1953 in Fresno, California, USA as Steven Ernest Bernard Zaillian. He is a writer and producer, known for Searching for Bobby Fischer (1993), Schindler's List (1993) and A Civil Action (1998). He is married to Elizabeth Zaillian. They have two children.	https://m.media-amazon.com/images/M/MV5BMjA2MDc1NzI3MV5BMl5BanBnXkFtZTcwODkyMDA1OA@@._V1_FMjpg_UX1000_.jpg	Born:  January 30,  1953  in Fresno, California, USA	
26	nm0000553	/name/nm0000553	 Liam Neeson\n	Liam Neeson was born on June 7, 1952 in Ballymena, Northern Ireland, to Katherine (Brown), a cook, and Bernard Neeson, a school caretaker. He was raised in a Catholic household. During his early years, Liam worked as a forklift operator for Guinness, a truck driver, an assistant architect and an amateur boxer. He had originally sought a career as ...	https://m.media-amazon.com/images/M/MV5BMjA1MTQ3NzU1MV5BMl5BanBnXkFtZTgwMDE3Mjg0MzE@._V1_FMjpg_UX1000_.jpg	Born:  June 7,  1952  in Ballymena, Co. Antrim, Northern Ireland, UK	
27	nm0000146	/name/nm0000146	 Ralph Fiennes\n	Actor Ralph Nathaniel Twisleton-Wykeham-Fiennes was born on December 22, 1962 in Suffolk, England, to Jennifer Anne Mary Alleyne (Lash), a novelist, and Mark Fiennes, a photographer. He is the eldest of six children. Four of his siblings are also in the arts: Martha Fiennes, a director; Magnus Fiennes, a musician; Sophie Fiennes, a producer; and ...	https://m.media-amazon.com/images/M/MV5BMzc5MjE1NDgyN15BMl5BanBnXkFtZTcwNzg2ODgwNA@@._V1_FMjpg_UX1000_.jpg	Born:  December 22,  1962  in Ipswich, Suffolk, England, UK	
28	nm0001426	/name/nm0001426	 Ben Kingsley\n	Ben Kingsley was born Krishna Bhanji on December 31, 1943 in Scarborough, Yorkshire, England. His father, Rahimtulla Harji Bhanji, was a Kenyan-born medical doctor, of Gujarati Indian descent, and his mother, Anna Lyna Mary (Goodman), was an English actress. Ben began to act in stage plays during the 1960s. He soon became a successful stage actor,...	https://m.media-amazon.com/images/M/MV5BOTU2Njg2NzM4M15BMl5BanBnXkFtZTgwNjYwNjQwMTI@._V1_FMjpg_UX1000_.jpg	Born:  December 31,  1943  in Scarborough, Yorkshire, England, UK	
29	nm0001392	/name/nm0001392	Peter Jackson	Peter Jackson was born as an only child in a small coast-side town in New Zealand in 1961. When a friend of his parents bought him a super 8 movie camera (because she saw how much he enjoyed taking photos), the then eight-year-old Peter instantly grabbed the thing to start recording his own movies, which he made with his friends. They were usually...	https://m.media-amazon.com/images/M/MV5BMTY1MzQ3NjA2OV5BMl5BanBnXkFtZTcwNTExOTA5OA@@._V1_FMjpg_UX1000_.jpg	Born:  October 31,  1961  in Pukerua Bay, North Island, New Zealand	
33	nm0001557	/name/nm0001557	Viggo Mortensen	Since his screen debut as a young Amish farmer in Peter Weir's Witness (1985), Viggo Mortensen's career has been marked by a steady string of well-rounded performances. Mortensen was born in New York City, to Grace Gamble (Atkinson) and Viggo Peter Mortensen, Sr. His father was Danish, his mother was American, and his maternal grandfather was ...	https://m.media-amazon.com/images/M/MV5BNDQzOTg4NzA2Nl5BMl5BanBnXkFtZTcwMzkwNjkxMg@@._V1_FMjpg_UX1000_.jpg	Born:  October 20,  1958  in Manhattan, New York City, New York, USA	
23	nm0000229	/name/nm0000229	Steven Spielberg	One of the most influential personalities in the history of cinema, Steven Spielberg is Hollywood's best known director and one of the wealthiest filmmakers in the world. He has an extraordinary number of commercially successful and critically acclaimed credits to his name, either as a director, producer or writer since launching the summer ...	https://m.media-amazon.com/images/M/MV5BMTY1NjAzNzE1MV5BMl5BanBnXkFtZTYwNTk0ODc0._V1_FMjpg_UX1000_.jpg	Born:  December 18,  1946  in Cincinnati, Ohio, USA	
35	nm0000233	/name/nm0000233	Quentin Tarantino	Quentin Jerome Tarantino was born in Knoxville, Tennessee. His father, Tony Tarantino, is an Italian-American actor and musician from New York, and his mother, Connie (McHugh), is a nurse from Tennessee. Quentin moved with his mother to Torrance, California, when he was four years old. In January of 1992, first-time writer-director Tarantino's ...	https://m.media-amazon.com/images/M/MV5BMTgyMjI3ODA3Nl5BMl5BanBnXkFtZTcwNzY2MDYxOQ@@._V1_FMjpg_UX1000_.jpg	Born:  March 27,  1963  in Knoxville, Tennessee, USA	
36	nm0000812	/name/nm0000812	 Roger Avary\n	Award-winning filmmaker Roger Avary first began experimenting in Beta I video and 8mm film formats during the late 1970s. In 1983, his Super-8mm supernatural thriller The Worm Turns won Best Film from the Los Angeles Film Teachers Association Film Expo. He went on to attend the Pasadena Art Center College of Design's film program. Avary then ...	https://m.media-amazon.com/images/M/MV5BZGM3ZTk0OWEtYTNhMC00ODZlLWI0ZmItNjY5YTM4NmQxZGYxXkEyXkFqcGdeQXVyMTk0OTQyOQ@@._V1_FMjpg_UX1000_.jpg	Born:  August 23,  1965  in Flin Flon, Manitoba, Canada	
37	nm0000237	/name/nm0000237	 John Travolta\n(I)\n	John Joseph Travolta was born in Englewood, New Jersey, one of six children of Helen Travolta (née Helen Cecilia Burke) and Salvatore/Samuel J. Travolta. His father was of Italian descent and his mother was of Irish ancestry. His father owned a tire repair shop called Travolta Tires in Hillsdale, NJ. Travolta started acting appearing in a local ...	https://m.media-amazon.com/images/M/MV5BMTUwNjQ0ODkxN15BMl5BanBnXkFtZTcwMDc5NjQwNw@@._V1_FMjpg_UX1000_.jpg	Born:  February 18,  1954  in Englewood, New Jersey, USA	
38	nm0000235	/name/nm0000235	 Uma Thurman\n	Uma Karuna Thurman was born in Boston, Massachusetts, into a highly unorthodox and internationally-minded family. She is the daughter of Nena Thurman (née Birgitte Caroline von Schlebrügge), a fashion model and socialite who now runs a mountain retreat, and of Robert Thurman (Robert Alexander Farrar Thurman), a professor and academic who is one of...	https://m.media-amazon.com/images/M/MV5BMjMxNzk1MTQyMl5BMl5BanBnXkFtZTgwMDIzMDEyMTE@._V1_FMjpg_UX1000_.jpg	Born:  April 29,  1970  in Boston, Massachusetts, USA	
39	nm0000168	/name/nm0000168	 Samuel L. Jackson\n	Samuel L. Jackson is an American producer and highly prolific actor, having appeared in over 100 films, including Die Hard: With a Vengeance (1995), Unbreakable (2000), Shaft (2000), The 51st State (2001), Black Snake Moan (2006), Snakes on a Plane (2006), and the Star Wars prequel trilogy (1999-2005), as well as the Marvel Cinematic Universe. ...	https://m.media-amazon.com/images/M/MV5BMTQ1NTQwMTYxNl5BMl5BanBnXkFtZTYwMjA1MzY1._V1_FMjpg_UX1000_.jpg	Born:  December 21,  1948  in Washington, District of Columbia, USA	
41	nm0898812	/name/nm0898812	 Luciano Vincenzoni\n(1926–2013)\n	Luciano Vincenzoni, born in Treviso, March 7, 1926, studied law in Rome and Padua. In 1952, with his friend Tony Roma, he produced "Oliva Incantesimo Tragico", starring María Félix. In 1954, he wrote his first script "Hanno Rubato un Tram", directed by Aldo Fabrizi. In this year, he met 'Pietro Germi' and wrote "The Railroad Man". 1956 began a ...		Born:  March 7,  1926  in Treviso, Veneto, Italy	Died:  September 22,  2013  (age 87) in Rome, Lazio, Italy
40	nm0001466	/name/nm0001466	Sergio Leone	Sergio Leone was virtually born into the cinema - he was the son of Roberto Roberti (A.K.A. Vincenzo Leone), one of Italy's cinema pioneers, and actress Bice Valerian. Leone entered films in his late teens, working as an assistant director to both Italian directors and U.S. directors working in Italy (usually making Biblical and Roman epics, much ...	https://m.media-amazon.com/images/M/MV5BMTk4Njk5MzY3MV5BMl5BanBnXkFtZTcwMTEyMzE0NA@@._V1_FMjpg_UX1000_.jpg	Born:  January 3,  1929  in Rome, Lazio, Italy	Died:  April 30,  1989  (age 60) in Rome, Lazio, Italy
43	nm0908919	/name/nm0908919	 Eli Wallach\n(1915–2014)\n	One of Hollywood's finest character / "Method" actors, Eli Wallach was in demand for over 60 years (first film/TV role was 1949) on stage and screen, and has worked alongside the world's biggest stars, including Clark Gable, Clint Eastwood, Steve McQueen, Marilyn Monroe, Yul Brynner, Peter O'Toole, and Al Pacino, to name but a few. Wallach was born...	https://m.media-amazon.com/images/M/MV5BMjA4OTM3ODQ5MF5BMl5BanBnXkFtZTgwMzE3OTcwMjE@._V1_FMjpg_UX1000_.jpg	Born:  December 7,  1915  in Red Hook, Brooklyn, New York City, New York, USA	Died:  June 24,  2014  (age 98) in Manhattan, New York City, New York, USA
30	nm0866058	/name/nm0866058	J.R.R. Tolkien	English writer, scholar and philologist, Tolkien's father was a bank manager in South Africa. Shortly before his father died (1896) his mother took him and his younger brother to his father's native village of Sarehole, near Birmingham, England. The landscapes and Nordic mythology of the Midlands may have been the source for Tolkien's fertile ...	https://m.media-amazon.com/images/M/MV5BMGMxMmRkNzctMWQzYy00MTY3LWEzMDAtMzEzMDhkZWI4MjZlXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_FMjpg_UX1000_.jpg	Born:  January 3,  1892  in Bloemfontein, Orange Free State [now in South Africa]	Died:  September 2,  1973  (age 81) in Bournemouth, Dorset, England, UK
31	nm0909638	/name/nm0909638	Fran Walsh	Fran Walsh was born on January 10, 1959 in Wellington, New Zealand. She is known for her work on The Lord of the Rings: The Fellowship of the Ring (2001), The Lord of the Rings: The Return of the King (2003) and The Lord of the Rings: The Two Towers (2002). She has been married to Peter Jackson since 1987. They have two children.	https://m.media-amazon.com/images/M/MV5BNTg2MzE0ODAyNV5BMl5BanBnXkFtZTcwNjk4NDgxOA@@._V1_FMjpg_UX1000_.jpg	Born:  January 10,  1959  in Wellington, New Zealand	
32	nm0000704	/name/nm0000704	Elijah Wood	Elijah Wood is an American actor best known for portraying Frodo Baggins in Peter Jackson's blockbuster Lord of the Rings film trilogy. In addition to reprising the role in The Hobbit series, Wood also played Ryan in the FX television comedy Wilfred (2011) and voiced Beck in the Disney XD animated television series TRON: Uprising (2012). Born ...	https://m.media-amazon.com/images/M/MV5BMTM0NDIxMzQ5OF5BMl5BanBnXkFtZTcwNzAyNTA4Nw@@._V1_FMjpg_UX1000_.jpg	Born:  January 28,  1981  in Cedar Rapids, Iowa, USA	
34	nm0005212	/name/nm0005212	Ian McKellen	Widely regarded as one of greatest stage and screen actors both in his native Great Britain and internationally, twice nominated for the Oscar and recipient of every major theatrical award in the UK and US, Ian Murray McKellen was born on May 25, 1939 in Burnley, Lancashire, England, to Margery Lois (Sutcliffe) and Denis Murray McKellen, a civil ...	https://m.media-amazon.com/images/M/MV5BMTQ2MjgyNjk3MV5BMl5BanBnXkFtZTcwNTA3NTY5Mg@@._V1_FMjpg_UX1000_.jpg	Born:  May 25,  1939  in Burnley, Lancashire, England, UK	
45	nm0089217	/name/nm0089217	 Orlando Bloom\n	Orlando Jonathan Blanchard Copeland Bloom was born on January 13, 1977 in Canterbury, Kent, England. His mother, Sonia Constance Josephine Bloom (née Copeland), was born in Kolkata, India, to an English family then-resident there. The man he first knew as his father, Harry Bloom, was a legendary political activist who fought for civil rights in ...	https://m.media-amazon.com/images/M/MV5BMjE1MDkxMjQ3NV5BMl5BanBnXkFtZTcwMzQ3Mjc4MQ@@._V1_FMjpg_UX1000_.jpg	Born:  January 13,  1977  in Canterbury, Kent, England, UK	
47	nm0657333	/name/nm0657333	 Chuck Palahniuk\n	Chuck is a low key writer who never stops writing and taking down notes to file away for future writing. Very funny, very creative and very thought provoking. His books often make you look at yourself in ways that you would never have before. Same goes for the world, he will make you notice things that you never did. He is of French and Russian ...	https://m.media-amazon.com/images/M/MV5BMTQ4MjMyMjE3NV5BMl5BanBnXkFtZTcwODUxMzc1MQ@@._V1_FMjpg_UX1000_.jpg	Born:  February 21,  1962  in Pasco, Washington, USA	
48	nm0880243	/name/nm0880243	 Jim Uhls\n	Jim Uhls was born on March 25, 1957 in Missouri, USA as James Walter Uhls. He is a writer and producer, known for Fight Club (1999), Jumper (2008) and The Destroyer. He is married to Yalda Tehranian. They have two children.	https://m.media-amazon.com/images/M/MV5BYzZiNDk4MTUtYWY3Mi00NWQ3LTk0OGMtMDc1MWUyNGVkZDc1XkEyXkFqcGdeQXVyMjM1NzQxNzg@._V1_FMjpg_UX1000_.jpg	Born:  March 25,  1957  in Missouri, USA	
51	nm0001533	/name/nm0001533	 Meat Loaf\n	Meat Loaf was born Marvin Lee Aday in Dallas, Texas, and moved to Los Angeles in 1967 to play in local bands. In 1970, he moved to New York and appeared in the Broadway musicals "Hair", "Rockabye Hamlet" and "The Rocky Horror Show" and Off Broadway in "Rainbow","More Than You Deserve", "National Lampoon Show" and the New York Shakespeare ...	https://m.media-amazon.com/images/M/MV5BMTIzNTQ4MjYyOV5BMl5BanBnXkFtZTcwNzgwNTEzMg@@._V1_FMjpg_UX1000_.jpg	Born:  September 27,  1947  in Dallas, Texas, USA	
53	nm0343165	/name/nm0343165	 Winston Groom\n(1943–2020)\n	This is condensed from Wikipedia. Winston Groom was raised in Mobile, Alabama where he attended University Military School (now UMS-Wright Preparatory School). His earliest ambition was to become a lawyer but instead, chose to become a author. Groom attended the University of Alabama, was a member of Delta Tau Delta Fraternity and the Army ROTC, ...	https://m.media-amazon.com/images/M/MV5BY2FjNGM3NzQtZWEwOC00ODBiLTkwMzQtYjkwOTUyYzE0MzkzL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  March 23,  1943  in Washington, District of Columbia, USA	Died:  September 17,  2020  (age 77) in Fairhope, Alabama, USA
54	nm0744839	/name/nm0744839	 Eric Roth\n(I)\n	Eric Roth was born on March 22, 1945 in New York City, New York, USA. He is a producer and writer, known for Forrest Gump (1994), The Curious Case of Benjamin Button (2008) and The Insider (1999). He has been married to Debra Greenfield since 1987. They have five children.	https://m.media-amazon.com/images/M/MV5BMjIzNDc0MzA1MF5BMl5BanBnXkFtZTgwODM4NDc3MTE@._V1_FMjpg_UX1000_.jpg	Born:  March 22,  1945  in New York City, New York, USA	
56	nm0000705	/name/nm0000705	 Robin Wright\n(V)\n	Robin Gayle Wright was born in Dallas, Texas, to Gayle (Gaston), a national director at Mary Kay, and Freddie Wright, a pharmaceutical executive. She grew up in San Diego, California. She started her professional career as a model in 1980 at age 14, and worked both in Paris and Japan. After finishing high school she decided to become an actress. ...	https://m.media-amazon.com/images/M/MV5BMTU0NTc4MzEyOV5BMl5BanBnXkFtZTcwODY0ODkzMQ@@._V1_FMjpg_UX1000_.jpg	Born:  April 8,  1966  in Dallas, Texas, USA	
55	nm0000158	/name/nm0000158	Tom Hanks	Thomas Jeffrey Hanks was born in Concord, California, to Janet Marylyn (Frager), a hospital worker, and Amos Mefford Hanks, an itinerant cook. His mother's family, originally surnamed "Fraga", was entirely Portuguese, while his father was of mostly English ancestry. Tom grew up in what he has called a "fractured" family. He moved around a great ...	https://m.media-amazon.com/images/M/MV5BMTQ2MjMwNDA3Nl5BMl5BanBnXkFtZTcwMTA2NDY3NQ@@._V1_FMjpg_UX1000_.jpg	Born:  July 9,  1956  in Concord, California, USA	
121	nm0997115	/name/nm0997115	 Miyu Irino\n	Miyu Irino was born on February 19, 1988 in Tokyo, Japan. He is an actor, known for Sen to Chihiro no kamikakushi (2001), Koto no ha no niwa (2013) and Koe no katachi (2016).	https://m.media-amazon.com/images/M/MV5BZjA4M2Q5NDItN2FjNi00NTg3LWE3MTEtOWM0NDJmODk1YjQwXkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_FMjpg_UX1000_.jpg	Born:  February 19,  1988  in Tokyo, Japan	
14	nm0634300	/name/nm0634300	Jonathan Nolan	Attended Loyola Academy in Wilmette, Illinois, graduating in 1994. Graduated from Georgetown University in Washington, D.C. in 1999. Majored in English. Shortly after graduating from Georgetown University, Jonathan Nolan served as a production assistant on Memento (2000). Wrote the short story, "Memento Mori", on which the film Memento (2000) is ...	https://m.media-amazon.com/images/M/MV5BMTEwNjY2MjgxMTZeQTJeQWpwZ15BbWU3MDY4NjY1Mjc@._V1_FMjpg_UX1000_.jpg	Born:  June 6,  1976  in London, England, UK	
122	nm0000190	/name/nm0000190	 Matthew McConaughey\n	American actor and producer Matthew David McConaughey was born in Uvalde, Texas. His mother, Mary Kathleen (McCabe), is a substitute school teacher originally from New Jersey. His father, James Donald McConaughey, was a Mississippi-born gas station owner who ran an oil pipe supply business. He is of Irish, Scottish, English, German, and Swedish ...	https://m.media-amazon.com/images/M/MV5BMTg0MDc3ODUwOV5BMl5BanBnXkFtZTcwMTk2NjY4Nw@@._V1_FMjpg_UX1000_.jpg	Born:  November 4,  1969  in Uvalde, Texas, USA	
50	nm0001570	/name/nm0001570	Edward Norton	American actor, filmmaker and activist Edward Harrison Norton was born on August 18, 1969, in Boston, Massachusetts, and was raised in Columbia, Maryland. His mother, Lydia Robinson "Robin" (Rouse), was a foundation executive and teacher of English, and a daughter of famed real estate developer James Rouse, who developed Columbia, MD; she passed ...	https://m.media-amazon.com/images/M/MV5BMTYwNjQ5MTI1NF5BMl5BanBnXkFtZTcwMzU5MTI2Mw@@._V1_FMjpg_UX1000_.jpg	Born:  August 18,  1969  in Boston, Massachusetts, USA	
57	nm0000641	/name/nm0000641	 Gary Sinise\n	Gary Alan Sinise was born in Blue Island, Illinois, to Mylles S. (Alsip) and Robert L. Sinise, A.C.E., a film editor. He is of Italian (from his paternal grandfather), English, Scottish, Irish, French, German, and Swedish ancestry. His family moved to Highland Park, where he attended high school. He was something of a rebel, playing in bands but ...	https://m.media-amazon.com/images/M/MV5BMzE4NzcyMzU3OV5BMl5BanBnXkFtZTYwOTM2NDE2._V1_FMjpg_UX1000_.jpg	Born:  March 17,  1955  in Blue Island, Illinois, USA	
59	nm0330687	/name/nm0330687	 Joseph Gordon-Levitt\n	Joseph Leonard Gordon-Levitt was born February 17, 1981 in Los Angeles, California, to Jane Gordon and Dennis Levitt. Joseph was raised in a Jewish family with his late older brother, Dan Gordon-Levitt, who passed away in October 2010. His parents worked for the Pacifica Radio station KPFK-FM and his maternal grandfather, Michael Gordon, had been ...	https://m.media-amazon.com/images/M/MV5BMTY3NTk0NDI3Ml5BMl5BanBnXkFtZTgwNDA3NjY0MjE@._V1_FMjpg_UX1000_.jpg	Born:  February 17,  1981  in Los Angeles, California, USA	
60	nm0680983	/name/nm0680983	 Elliot Page\n	Elliot Page was born in Halifax, Nova Scotia to Martha Philpotts, a teacher, and Dennis Page, a graphic designer. Page wanted to start acting at an early age and attended the Neptune Theater School. They began their career at the age of 10 on the award-winning television series Pit Pony (1999), for which they received a Gemini nomination and a ...	https://m.media-amazon.com/images/M/MV5BYWY0NzFmYjAtYzMwNC00ODc3LWI2ZWEtOTU3YTM0Y2ZiNTM5XkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_FMjpg_UX1000_.jpg	Born:  February 21,  1987  in Halifax, Nova Scotia, Canada	
61	nm0449984	/name/nm0449984	 Irvin Kershner\n(1923–2010)\n	Irvin Kershner was born on April 29, 1923 in Philadelphia, Pennsylvania. A graduate of the University of Southern California film school, Kershner began his career in 1950, producing documentaries for the United States Information Service in the Middle East. He later turned to television, directing and photographing a series of documentaries ...	https://m.media-amazon.com/images/M/MV5BMTQyNjk0NTcwMl5BMl5BanBnXkFtZTcwNzAyNDQxNA@@._V1_FMjpg_UX1000_.jpg	Born:  April 29,  1923  in Philadelphia, Pennsylvania, USA	Died:  November 27,  2010  (age 87) in Los Angeles, California, USA
62	nm0102824	/name/nm0102824	 Leigh Brackett\n(1915–1978)\n	Leigh Douglass Brackett was born in 1915 in Los Angeles. She was the author of numerous short stories and books regarding science fiction and has been referred to as the Queen of Space Opera. Hollywood director Howard Hawks was so impressed by one of her novels that he had his secretary call in "this guy Brackett" to help William Faulkner write ...	https://m.media-amazon.com/images/M/MV5BMTU3NGE5MmQtMjdkMC00ODlkLTk5MjUtYTNkMzk3MDIwYmI4XkEyXkFqcGdeQXVyMTcyODY2NDQ@._V1_FMjpg_UX1000_.jpg	Born:  December 7,  1915  in Los Angeles, California, USA	Died:  March 17,  1978  (age 62) in Lancaster, California, USA
68	nm0905152	/name/nm0905152	Lilly Wachowski	Director, writer, and producer Lilly Wachowski was born in 1967 in Chicago, the daughter of Lynne, a nurse and painter, and Ron, a businessman. Lilly was educated at Kellogg Elementary School in Chicago, before moving on to Whitney M. Young High School. After graduating from high school, she attended Emerson College in Boston but dropped out. Lilly...	https://m.media-amazon.com/images/M/MV5BMTU1Mjc1MjkzNV5BMl5BanBnXkFtZTgwOTc1NDQ1ODE@._V1_FMjpg_UX1000_.jpg	Born:  December 29,  1967  in Chicago, Illinois, USA	
64	nm0000434	/name/nm0000434	Mark Hamill	Mark Hamill is best known for his portrayal of Luke Skywalker in the original Star Wars trilogy - Star Wars (1977), Star Wars: Episode V - The Empire Strikes Back (1980), and Star Wars: Episode VI - Return of the Jedi (1983) - a role he reprised in Star Wars: Episode VII - The Force Awakens (2015), Star Wars: Episode VIII - The Last Jedi (2017) ...	https://m.media-amazon.com/images/M/MV5BOGY2MjI5MDQtOThmMC00ZGIwLWFmYjgtYWU4MzcxOGEwMGVkXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_FMjpg_UX1000_.jpg	Born:  September 25,  1951  in Oakland, California, USA	
65	nm0000148	/name/nm0000148	Harrison Ford	Harrison Ford was born on July 13, 1942 in Chicago, Illinois, to Dorothy (Nidelman), a radio actress, and Christopher Ford (born John William Ford), an actor turned advertising executive. His father was of Irish and German ancestry, while his maternal grandparents were Jewish emigrants from Minsk, Belarus. Harrison was a lackluster student at ...	https://m.media-amazon.com/images/M/MV5BMTY4Mjg0NjIxOV5BMl5BanBnXkFtZTcwMTM2NTI3MQ@@._V1_FMjpg_UX1000_.jpg	Born:  July 13,  1942  in Chicago, Illinois, USA	
58	nm0000138	/name/nm0000138	Leonardo DiCaprio	Few actors in the world have had a career quite as diverse as Leonardo DiCaprio's. DiCaprio has gone from relatively humble beginnings, as a supporting cast member of the sitcom Growing Pains (1985) and low budget horror movies, such as Critters 3 (1991), to a major teenage heartthrob in the 1990s, as the hunky lead actor in movies such as Romeo +...	https://m.media-amazon.com/images/M/MV5BMjI0MTg3MzI0M15BMl5BanBnXkFtZTcwMzQyODU2Mw@@._V1_FMjpg_UX1000_.jpg	Born:  November 11,  1974  in Hollywood, Los Angeles, California, USA	
63	nm0001410	/name/nm0001410	Lawrence Kasdan	Lawrence Kasdan was born on January 14, 1949 in Miami, Florida, USA as Lawrence Edward Kasdan. He is a writer and producer, known for The Big Chill (1983), Silverado (1985) and Wyatt Earp (1994). He has been married to Meg Kasdan since November 28, 1971. They have two children.	https://m.media-amazon.com/images/M/MV5BMjM3MTQ1NDg2OF5BMl5BanBnXkFtZTYwNjc0NDEz._V1_FMjpg_UX1000_.jpg	Born:  January 14,  1949  in Miami, Florida, USA	
67	nm0905154	/name/nm0905154	Lana Wachowski	Lana Wachowski and her sister Lilly Wachowski, also known as the Wachowskis, are the duo behind such ground-breaking movies as The Matrix (1999) and Cloud Atlas (2012). Born to mother Lynne, a nurse, and father Ron, a businessman of Polish descent, Wachowski grew up in Chicago and formed a tight creative relationship with her sister Lilly. After ...	https://m.media-amazon.com/images/M/MV5BMjEzMTc2MDQ5OV5BMl5BanBnXkFtZTcwNjkzNDY0OA@@._V1_FMjpg_UX1000_.jpg	Born:  June 21,  1965  in Chicago, Illinois, USA	
69	nm0000206	/name/nm0000206	 Keanu Reeves\n	Keanu Charles Reeves, whose first name means "cool breeze over the mountains" in Hawaiian, was born September 2, 1964 in Beirut, Lebanon. He is the son of Patricia Taylor, a showgirl and costume designer, and Samuel Nowlin Reeves, a geologist. Keanu's father was born in Hawaii, of British, Portuguese, Native Hawaiian, and Chinese ancestry, and ...	https://m.media-amazon.com/images/M/MV5BYTkzODI4MDMtNDNmZC00NDZlLWFmNTktNDRhOWE2YzhlZTQ2XkEyXkFqcGdeQXVyMTE1MTYxNDAw._V1_FMjpg_UX1000_.jpg	Born:  September 2,  1964  in Beirut, Lebanon	
70	nm0000401	/name/nm0000401	 Laurence Fishburne\n	Critically hailed for his forceful, militant, authoritative figures and one of Hollywood's most talented and versatile performers, Laurence (John) Fishburne III has been the recipient of numerous awards, including a number of NAACP Image honors. Born in Augusta, Georgia on July 30, 1961, to Hattie Bell (Crawford), a teacher, and Laurence John ...	https://m.media-amazon.com/images/M/MV5BMTc0NjczNDc1MV5BMl5BanBnXkFtZTYwMDU0Mjg1._V1_FMjpg_UX1000_.jpg	Born:  July 30,  1961  in Augusta, Georgia, USA	
73	nm0683380	/name/nm0683380	Nicholas Pileggi	Nicholas Pileggi was born and raised in New York, the son of a shoe store owner. He worked as a journalist for Associated Press in the 1950s where he specialized in crime reporting. Over the next 30 years he built up his contacts and reputation, covering stories for New York magazine and contributing to many others, as he became an expert on crime...	https://m.media-amazon.com/images/M/MV5BOTM5OWZkNGQtNzY1Ni00YWUzLWFhZTEtM2JlZDI5NTNiOTVjXkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  February 22,  1933  in New York City, New York, USA	
74	nm0000501	/name/nm0000501	 Ray Liotta\n	Intense is the word for Ray Liotta. He specializes in psychopathic characters who hide behind a cultivated charm. Even in his nice-guy roles in Field of Dreams (1989) and Operation Dumbo Drop (1995), you get the impression that something is smoldering inside of him. Liotta maintains a steady stream of work, completing multiple projects per year. ...	https://m.media-amazon.com/images/M/MV5BMTU3NzM5MjUwMF5BMl5BanBnXkFtZTYwNDM2NDky._V1_FMjpg_UX1000_.jpg	Born:  December 18,  1954  in Newark, New Jersey, USA	
77	nm0369142	/name/nm0369142	 Lawrence Hauben\n(1931–1985)\n	Lawrence Hauben was born on March 3, 1931 in New York, USA as Lawrence Alan Hauben. He was an actor and writer, known for One Flew Over the Cuckoo's Nest (1975), Point Blank (1967) and Then Came Bronson (1969). He died on December 22, 1985 in Santa Barbara, California, USA.		Born:  March 3,  1931  in New York, USA	Died:  December 22,  1985  (age 54) in Santa Barbara, California, USA
78	nm0325743	/name/nm0325743	 Bo Goldman\n	There are but a few select screenwriters who are spoken of with the kind of reverence usually reserved for film Directors - Robert Towne, Alvin Sargent and Bo Goldman. Goldman is a screenwriter's screenwriter, and one of the most honored in motion picture history. The recipient of two Academy Awards, a New York Film Critics Award, two Writers ...	https://m.media-amazon.com/images/M/MV5BNjQxMjUzMTAxMF5BMl5BanBnXkFtZTcwMjYyMDgyMQ@@._V1_FMjpg_UX1000_.jpg	Born:  September 10,  1932  in New York City, New York, USA	
80	nm0001221	/name/nm0001221	 Louise Fletcher\n(I)\n	Born in Birmingham, Alabama, to Episcopal minister Robert Fletcher and his wife Estelle, both of whom were deaf, Louise Fletcher was introduced to performing at a young age by the aunt who taught her to speak. After graduating from the University of North Carolina, she took a trip out west with her roommates, finding herself in Los Angeles without...	https://m.media-amazon.com/images/M/MV5BMTIzOTcwNzYzMl5BMl5BanBnXkFtZTYwMjQ3MTI0._V1_FMjpg_UX1000_.jpg	Born:  July 22,  1934  in Birmingham, Alabama, USA	
71	nm0005251	/name/nm0005251	Carrie-Anne Moss	Carrie-Anne Moss was born and raised in Vancouver, Canada. At age 20, after studying at the American Academy of Dramatic Arts, she moved to Europe to pursue a career in modeling. While in Spain she was cast in a regular role in the TV show Dark Justice which was produced in Barcelona for its first season. She followed the series to its new ...	https://m.media-amazon.com/images/M/MV5BMTYxMjgwNzEwOF5BMl5BanBnXkFtZTcwNTQ0NzI5Ng@@._V1_FMjpg_UX1000_.jpg	Born:  August 21,  1967  in Vancouver, British Columbia, Canada	
76	nm0001232	/name/nm0001232	Milos Forman	Milos Forman was born Jan Tomas Forman in Caslav, Czechoslovakia, to Anna (Svabova), who ran a summer hotel, and Rudolf Forman, a professor. During World War II, his parents were taken away by the Nazis, after being accused of participating in the underground resistance. His father died in Buchenwald and his mother died in Auschwitz, and Milos ...	https://m.media-amazon.com/images/M/MV5BNDY5NDAyODM2Nl5BMl5BanBnXkFtZTcwMzgzNzg3OA@@._V1_FMjpg_UX1000_.jpg	Born:  February 18,  1932  in Cáslav, Czechoslovakia [now Czech Republic]	Died:  April 13,  2018  (age 86) in Danbury, Connecticut, USA
75	nm0000582	/name/nm0000582	Joe Pesci	Compact Italian-American actor Joe Pesci was born February 9, 1943 in Newark, New Jersey, to Mary (Mesce), a part-time barber, and Angelo Pesci, a bartender and forklift driver. Pesci first broke into entertainment as a child actor, and by the mid-1950s, was starring on the series "Star Time Kids". In the mid-1960s, he released a record under the ...	https://m.media-amazon.com/images/M/MV5BMzc3MTcxNDYxNV5BMl5BanBnXkFtZTcwOTI3NjE1Mw@@._V1_FMjpg_UX1000_.jpg	Born:  February 9,  1943  in Newark, New Jersey, USA	
81	nm0077720	/name/nm0077720	 Michael Berryman\n(I)\n	Late 1970s horror genre icon who's best known for his creepy performance as "Pluto" in the uncompromising Wes Craven horror film The Hills Have Eyes (1977). Berryman (who suffers from Hypohidrotic Ectodermal Dysplasia, a rare condition leaving him with no sweat glands, hair, fingernails or teeth) reminds one of a latter-day Rondo Hatton who also ...	https://m.media-amazon.com/images/M/MV5BMTc0OTA0MTAwM15BMl5BanBnXkFtZTcwOTQ3MDQ4NA@@._V1_FMjpg_UX1000_.jpg	Born:  September 4,  1948  in Los Angeles, California, USA	
82	nm0000041	/name/nm0000041	Akira Kurosawa	After training as a painter (he storyboards his films as full-scale paintings), Kurosawa entered the film industry in 1936 as an assistant director, eventually making his directorial debut with Sugata Sanshiro (1943). Within a few years, Kurosawa had achieved sufficient stature to allow him greater creative freedom. Yoidore tenshi (1948) was the ...	https://m.media-amazon.com/images/M/MV5BMjE3ODQwNTY2Nl5BMl5BanBnXkFtZTcwMTI5ODM1Mw@@._V1_FMjpg_UX1000_.jpg	Born:  March 23,  1910  in Tokyo, Japan	Died:  September 6,  1998  (age 88) in Setagaya, Tokyo, Japan
86	nm0875477	/name/nm0875477	 Keiko Tsushima\n(1926–2012)\n	Keiko Tsushima was born on February 7, 1926 in Nagasaki, Japan as Mori Naoko. She is known for her work on Shichinin no samurai (1954), Shiosai (1975) and Umi no hanabi (1951). She died on August 1, 2012 in Tokyo, Japan.	https://m.media-amazon.com/images/M/MV5BMmE4ZmVhZmYtOGY5ZS00N2JiLThlZjgtNmU3NDBkMWRjOGYzXkEyXkFqcGdeQXVyMTI3MDk3MzQ@._V1_FMjpg_UX1000_.jpg	Born:  February 7,  1926  in Nagasaki, Japan	Died:  August 1,  2012  (age 86) in Tokyo, Japan
46	nm0000399	/name/nm0000399	David Fincher	David Fincher was born in 1962 in Denver, Colorado, and was raised in Marin County, California. When he was 18 years old he went to work for John Korty at Korty Films in Mill Valley. He subsequently worked at ILM (Industrial Light and Magic) from 1981-1983. Fincher left ILM to direct TV commercials and music videos after signing with N. Lee Lacy ...	https://m.media-amazon.com/images/M/MV5BMTc1NDkwMTQ2MF5BMl5BanBnXkFtZTcwMzY0ODkyMg@@._V1_FMjpg_UX1000_.jpg	Born:  August 28,  1962  in Denver, Colorado, USA	
87	nm0001825	/name/nm0001825	 Andrew Kevin Walker\n	Andrew Kevin Walker was born on August 14, 1964 in Altoona, Pennsylvania, USA. He is a writer, known for Se7en (1995), Sleepy Hollow (1999) and 8MM (1999).	https://m.media-amazon.com/images/M/MV5BZTU1OGUyYTktZjgxNi00MDMyLTkyZGYtMWQ2OTg2N2U1OWRkXkEyXkFqcGdeQXVyODYzNDkyMDA@._V1_FMjpg_UX1000_.jpg	Born:  August 14,  1964  in Altoona, Pennsylvania, USA	
49	nm0000093	/name/nm0000093	Brad Pitt	An actor and producer known as much for his versatility as he is for his handsome face, Golden Globe-winner Brad Pitt's most widely recognized role may be Tyler Durden in Fight Club (1999). However, his portrayals of Billy Beane in Moneyball (2011), and Rusty Ryan in the remake of Ocean's Eleven (2001) and its sequels, also loom large in his ...	https://m.media-amazon.com/images/M/MV5BMjA1MjE2MTQ2MV5BMl5BanBnXkFtZTcwMjE5MDY0Nw@@._V1_FMjpg_UX1000_.jpg	Born:  December 18,  1963  in Shawnee, Oklahoma, USA	
90	nm0148437	/name/nm0148437	 Vincenzo Cerami\n(1940–2013)\n	Vincenzo Cerami was born on November 2, 1940 in Rome, Lazio, Italy. He was a writer, known for La vita è bella (1997), La tigre e la neve (2005) and Porte aperte (1990). He was married to Graziella Chiarcossi and Mimsy Farmer. He died on July 17, 2013 in Rome.	https://m.media-amazon.com/images/M/MV5BMjIyMDA3NDE1Ml5BMl5BanBnXkFtZTcwNDU0NDg4OQ@@._V1_FMjpg_UX1000_.jpg	Born:  November 2,  1940  in Rome, Lazio, Italy	Died:  July 17,  2013  (age 72) in Rome, Lazio, Italy
89	nm0000905	/name/nm0000905	Roberto Benigni	Roberto Benigni was born on October 27, 1952 in Manciano La Misericordia, Castiglion Fiorentino, Tuscany, Italy as Roberto Remigio Benigni. He is an actor and writer, known for La vita è bella (1997), La tigre e la neve (2005) and Down by Law (1986). He has been married to Nicoletta Braschi since December 26, 1991.	https://m.media-amazon.com/images/M/MV5BMTUwMzI1Nzg5NF5BMl5BanBnXkFtZTYwODU5NjYz._V1_FMjpg_UX1000_.jpg	Born:  October 27,  1952  in Manciano La Misericordia, Castiglion Fiorentino, Tuscany, Italy	
91	nm0000971	/name/nm0000971	 Nicoletta Braschi\n	Nicoletta Braschi was born on April 19, 1960 in Cesena, Emilia-Romagna, Italy. She is an actress, known for La vita è bella (1997), Johnny Stecchino (1991) and Down by Law (1986). She has been married to Roberto Benigni since December 1991.	https://m.media-amazon.com/images/M/MV5BMTcyMjUxNzMzOF5BMl5BanBnXkFtZTYwMzM1NDM3._V1_FMjpg_UX1000_.jpg	Born:  April 19,  1960  in Cesena, Emilia-Romagna, Italy	
83	nm0368074	/name/nm0368074	Shinobu Hashimoto	Shinobu Hashimoto was born on April 18, 1918 in Hyogo Prefecture, Japan. He was a writer and director, known for Seppuku (1962), Kakushi-toride no san-akunin (1958) and Rashomon (1950). He died on July 19, 2018 in Tokyo, Japan.		Born:  April 18,  1918  in Hyogo Prefecture, Japan	Died:  July 19,  2018  (age 100) in Tokyo, Japan
88	nm0000228	/name/nm0000228	Kevin Spacey	Kevin Spacey Fowler, better known by his stage name Kevin Spacey, is an American actor of screen and stage, film director, producer, screenwriter and singer. He began his career as a stage actor during the 1980s before obtaining supporting roles in film and television. He gained critical acclaim in the early 1990s that culminated in his first ...	https://m.media-amazon.com/images/M/MV5BMTY1NzMyODc3Nl5BMl5BanBnXkFtZTgwNzE2MzA1NDM@._V1_FMjpg_UX1000_.jpg	Born:  July 26,  1959  in South Orange, New Jersey, USA	
84	nm0001536	/name/nm0001536	Toshirô Mifune	Toshiro Mifune achieved more worldwide fame than any other Japanese actor of his century. He was born in Tsingtao, China, to Japanese parents and grew up in Dalian. He did not set foot in Japan until he was 21. His father was an importer and a commercial photographer, and young Toshiro worked in his father's studio for a time after graduating from...	https://m.media-amazon.com/images/M/MV5BMTM3NzE2MzEyNF5BMl5BanBnXkFtZTcwNzA5MTU4Mw@@._V1_FMjpg_UX1000_.jpg	Born:  April 1,  1920  in Tsingtao, China [now Qingdao, Shandong, China]	Died:  December 24,  1997  (age 77) in Mitaka city, Tokyo, Japan
85	nm0793766	/name/nm0793766	Takashi Shimura	Japanese character actor Takashi Shimura was one of the finest film actors of the 20th century and a leading member of the "stock company" of master director Akira Kurosawa. A native of southern Japan, Shimura was a descendant of the samurai warrior class. Following university training, he founded a theatre company, Shichigatsu-za ("July Theatre")...	https://m.media-amazon.com/images/M/MV5BMTUyNjY0ODYyMV5BMl5BanBnXkFtZTcwMDg0MTc4Ng@@._V1_FMjpg_UX1000_.jpg	Born:  March 12,  1905  in Ikuno, Hyogo, Japan	Died:  February 11,  1982  (age 76) in Tokyo, Japan
92	nm0134493	/name/nm0134493	 Giorgio Cantarini\n	Giorgio Cantarini was born in Orvieto, Italy on April 12, 1992. He has lived in Rome and Paris. He made his cinema debut at just five years old in the role of Joshua in the film "La Vita è Bella" (Life is Beautiful) by Roberto Benigni, a role for which he won the Jackie Coogan Award (Young artist award of Hollywood), becoming the youngest winner ...	https://m.media-amazon.com/images/M/MV5BYjdhNTFiYTYtOGE4Ni00NTVjLTlhMGYtYThhNzAxZjUxMmM5XkEyXkFqcGdeQXVyNDM4Nzc5NzY@._V1_FMjpg_UX1000_.jpg	Born:  April 12,  1992  in Orvieto, Umbria, Italy	
93	nm0576987	/name/nm0576987	 Fernando Meirelles\n(I)\n	Fernando Meirelles was born in a middle class family in São Paulo City, Brazil. He studied architecture at the university of São Paulo. At the same time he developed an interest in filmmaking. With a group of friends he started producing experimental videos and video art. They won a huge number of awards in Brazilian video festivals. After that, ...	https://m.media-amazon.com/images/M/MV5BMTMzMDA3Mjg0N15BMl5BanBnXkFtZTYwMTc4NDIz._V1_FMjpg_UX1000_.jpg	Born:  November 9,  1955  in São Paulo, São Paulo, Brazil	
94	nm0526199	/name/nm0526199	 Kátia Lund\n	Kátia Lund was born in 1966 in São Paulo, São Paulo, Brazil. She is a director and writer, known for Cidade de Deus (2002), Notícias de uma Guerra Particular (1999) and Anaconda (1997).	https://m.media-amazon.com/images/M/MV5BMTUyNTEzODc1NF5BMl5BanBnXkFtZTYwOTUyMjIz._V1_FMjpg_UX1000_.jpg	Born:  1966  in São Paulo, São Paulo, Brazil	
95	nm0513130	/name/nm0513130	 Paulo Lins\n	Paulo Lins was born in 1958 in Rio de Janeiro, Rio de Janeiro, Brazil. He is a writer and director, known for Quase Dois Irmãos (2004), Minha Alma (2000) and Cidade de Deus (2002).		Born:  1958  in Rio de Janeiro, Rio de Janeiro, Brazil	
96	nm1130251	/name/nm1130251	 Bráulio Mantovani\n	Bráulio Mantovani is a writer and producer, known for Tropa de Elite 2: O Inimigo Agora é Outro (2010), Cidade de Deus (2002) and Tropa de Elite (2007).			
97	nm1179105	/name/nm1179105	 Alexandre Rodrigues\n(I)\n	Alexandre Rodrigues was born on May 21, 1983 in Rio de Janeiro, Rio de Janeiro, Brazil. He is an actor, known for Cidade de Deus (2002), Paraíso (2009) and E.A.S.: Esquadrão Antissequestro (2018).	https://m.media-amazon.com/images/M/MV5BMTc5MzkzNzk5MV5BMl5BanBnXkFtZTcwMjc4MTE5Ng@@._V1_FMjpg_UX1000_.jpg	Born:  May 21,  1983  in Rio de Janeiro, Rio de Janeiro, Brazil	
98	nm1129884	/name/nm1129884	 Leandro Firmino\n	Leandro Firmino was born on June 23, 1978 in Rio de Janeiro, Rio de Janeiro, Brazil. He is an actor, known for Cidade de Deus (2002), Trash (2014) and Impuros (2018).	https://m.media-amazon.com/images/M/MV5BMTQ5MjM3ODIyM15BMl5BanBnXkFtZTcwNTMzNDY3Mw@@._V1_FMjpg_UX1000_.jpg	Born:  June 23,  1978  in Rio de Janeiro, Rio de Janeiro, Brazil	
99	nm0618690	/name/nm0618690	 Matheus Nachtergaele\n	Matheus Nachtergaele was born in Sao Paulo, Brazil, in 1969. He is one of the best young Brazilian actor at the moment. He showed his talent in many beautiful roles, both in cinema and television. For the TV he workes in the TV series "Hilda Furacao" in the role of the transexual Cintura Fina, in the TV series "A muralha" in the role of a ...		Born:  January 3,  1969  in São Paulo, São Paulo, Brazil	
100	nm0001129	/name/nm0001129	 Jonathan Demme\n(1944–2017)\n	Jonathan Demme was born on February 22, 1944 in Baldwin, Long Island, New York, USA as Robert Jonathan Demme. He was a director and producer, known for The Silence of the Lambs (1991), Rachel Getting Married (2008) and Philadelphia (1993). He was married to Joanne Howard and Evelyn Purcell. He died on April 26, 2017 in Manhattan, New York.	https://m.media-amazon.com/images/M/MV5BMTY1NzY0OTQ0OF5BMl5BanBnXkFtZTcwNDY1Njk5Mg@@._V1_FMjpg_UX1000_.jpg	Born:  February 22,  1944  in Baldwin, Long Island, New York, USA	Died:  April 26,  2017  (age 73) in Manhattan, New York, USA
101	nm0365383	/name/nm0365383	 Thomas Harris\n(I)\n	Thomas Harris was born in 1940 in Jackson, Mississippi, USA. He was raised in the town of Rich where his father worked as a farmer. He earned his bachelor's degree in English from Baylor University in Texas in 1964. While attending school, he also worked for the local newspaper. After graduating, Harris traveled Europe for a time. Back in the USA, ...	https://m.media-amazon.com/images/M/MV5BNDYwZTY3YWYtOTdmNi00Njc1LWEyOTUtNzFjZTBhMjU2YmUwXkEyXkFqcGdeQXVyNDkzNTM2ODg@._V1_FMjpg_UX1000_.jpg	Born:  1940  in Jackson, Mississippi, USA	
102	nm0848217	/name/nm0848217	 Ted Tally\n	Ted Tally was born on April 9, 1952 as Theodore Tally. He is known for his work on The Silence of the Lambs (1991), All the Pretty Horses (2000) and Mission to Mars (2000).		Born:  April 9,  1952	
105	nm0095029	/name/nm0095029	 Lawrence A. Bonney\n	Lawrence A. Bonney is an actor, known for The Silence of the Lambs (1991).			
106	nm0001008	/name/nm0001008	 Frank Capra\n(1897–1991)\n	One of seven children, Frank Capra was born on May 18, 1897, in Bisacquino, Sicily. On May 10, 1903, his family left for America aboard the ship Germania, arriving in New York on May 23rd. "There's no ventilation, and it stinks like hell. They're all miserable. It's the most degrading place you could ever be," Capra said about his Atlantic passage...	https://m.media-amazon.com/images/M/MV5BMTQ1NjE0NzgzNV5BMl5BanBnXkFtZTYwODg0MjI2._V1_FMjpg_UX1000_.jpg	Born:  May 18,  1897  in Bisacquino, Sicily, Italy	Died:  September 3,  1991  (age 94) in La Quinta, California, USA
107	nm0329304	/name/nm0329304	 Frances Goodrich\n(1890–1984)\n	Frances Goodrich was born on December 21, 1890 in Belleville, New Jersey, USA. She was a writer, known for The Thin Man (1934), Seven Brides for Seven Brothers (1954) and Easter Parade (1948). She was married to Albert Hackett, Henrik Van Loon and Robert Ames. She died on January 29, 1984 in New York City, New York, USA.		Born:  December 21,  1890  in Belleville, New Jersey, USA	Died:  January 29,  1984  (age 93) in New York City, New York, USA
104	nm0000164	/name/nm0000164	Anthony Hopkins	Anthony Hopkins was born on December 31, 1937, in Margam, Wales, to Muriel Anne (Yeats) and Richard Arthur Hopkins, a baker. His parents were both of half Welsh and half English descent. Influenced by Richard Burton, he decided to study at College of Music and Drama and graduated in 1957. In 1965, he moved to London and joined the National Theatre...	https://m.media-amazon.com/images/M/MV5BMTg5ODk1NTc5Ml5BMl5BanBnXkFtZTYwMjAwOTI4._V1_FMjpg_UX1000_.jpg	Born:  December 31,  1937  in Margam, Port Talbot, West Glamorgan, Wales, UK	
110	nm0001656	/name/nm0001656	 Donna Reed\n(I)\n(1921–1986)\n	Donna Reed was born in the midwestern town of Denison, Iowa, on January 27, 1921, as Donna Belle Mullenger. A small town - a population of less than 3,000 people - Denison was located by the Boyer River, and was the county seat of Crawford County. Donna grew up as a farm girl, much like many young girls in western Iowa, except for one thing - ...	https://m.media-amazon.com/images/M/MV5BMjAzNzA4MDc4NV5BMl5BanBnXkFtZTYwNTU2ODU2._V1_FMjpg_UX1000_.jpg	Born:  January 27,  1921  in Denison, Iowa, USA	Died:  January 14,  1986  (age 64) in Beverly Hills, Los Angeles, California, USA
111	nm0000859	/name/nm0000859	 Lionel Barrymore\n(1878–1954)\n	Famed actor, composer, artist, author and director. His talents extended to the authoring of the novel "Mr. Cartonwine: A Moral Tale" as well as his autobiography. In 1944, he joined ASCAP, and composed "Russian Dances", "Partita", "Ballet Viennois", "The Woodman and the Elves", "Behind the Horizon", "Fugue Fantasia", "In Memorium", "Hallowe'en", ...	https://m.media-amazon.com/images/M/MV5BMTc5NzY5MTgwNV5BMl5BanBnXkFtZTYwMjc4NjQ2._V1_FMjpg_UX1000_.jpg	Born:  April 28,  1878  in Philadelphia, Pennsylvania, USA	Died:  November 15,  1954  (age 76) in Van Nuys, California, USA
112	nm0734441	/name/nm0734441	 Robert Rodat\n	Robert Rodat was born in 1953 in New Hampshire, USA. He is a writer and producer, known for Saving Private Ryan (1998), Falling Skies (2011) and The Patriot (2000). He is married to Mollie Miller. They have three children.	https://m.media-amazon.com/images/M/MV5BNjM4NTI1NTcxM15BMl5BanBnXkFtZTcwODEwNDQ1Mw@@._V1_FMjpg_UX1000_.jpg	Born:  1953  in New Hampshire, USA	
114	nm0001744	/name/nm0001744	 Tom Sizemore\n(I)\n	Tom Sizemore rose in prominence throughout the 1990s, establishing himself as a memorable tough-guy actor, sought by the most respected directors in the business. Thomas Edward Sizemore, Jr. was born in Detroit, Michigan, to Judith (Schannault), an ombudsman staff member, and Thomas Edward Sizemore, Sr., a lawyer and professor. Sizemore grew up ...	https://m.media-amazon.com/images/M/MV5BMTUyMzQ3NDg5N15BMl5BanBnXkFtZTYwMzc0Mjk2._V1_FMjpg_UX1000_.jpg	Born:  November 29,  1961  in Detroit, Michigan, USA	
115	nm0000184	/name/nm0000184	George Lucas	George Walton Lucas, Jr. was raised on a walnut ranch in Modesto, California. His father was a stationery store owner and he had three siblings. During his late teen years, he went to Thomas Downey High School and was very much interested in drag racing. He planned to become a professional racecar driver. However, a terrible car accident just ...	https://m.media-amazon.com/images/M/MV5BMTA0Mjc0NzExNzBeQTJeQWpwZ15BbWU3MDEzMzQ3MDI@._V1_FMjpg_UX1000_.jpg	Born:  May 14,  1944  in Modesto, California, USA	
66	nm0000402	/name/nm0000402	Carrie Fisher	Carrie Frances Fisher was born on October 21, 1956 in Burbank, California, to singers/actors Eddie Fisher and Debbie Reynolds. She was an actress and writer known for Star Wars (1977), Star Wars: Episode V - The Empire Strikes Back (1980) and Star Wars: Episode VI - Return of the Jedi (1983). Fisher is also known for her book, "Postcards from the ...	https://m.media-amazon.com/images/M/MV5BMjM4ODU5MDY4MV5BMl5BanBnXkFtZTgwODY1MjQ5MDI@._V1_FMjpg_UX1000_.jpg	Born:  October 21,  1956  in Burbank, California, USA	Died:  December 27,  2016  (age 60) in Los Angeles, California, USA
116	nm0003817	/name/nm0003817	 Michael Clarke Duncan\n(1957–2012)\n	Michael Clarke Duncan was born on December 10, 1957 in Chicago, Illinois. Raised by his single mother, Jean, a house cleaner, on Chicago's South Side, Duncan grew up resisting drugs and alcohol, instead concentrating on school. He wanted to play football in high school, but his mother wouldn't let him, afraid that he would get hurt. He then turned...	https://m.media-amazon.com/images/M/MV5BMTI3NDY2ODk5OV5BMl5BanBnXkFtZTYwMjQ0NzE0._V1_FMjpg_UX1000_.jpg	Born:  December 10,  1957  in Chicago, Illinois, USA	Died:  September 3,  2012  (age 54) in Los Angeles, California, USA
117	nm0001556	/name/nm0001556	 David Morse\n(I)\n	David Morse, a 6' 4" tall blue-eyed blond who performed on stage for 10 years before breaking into film, has become established as a respected supporting, character actor and second lead. He was born the first of four children of Charles, a sales manager, and Jacquelyn Morse, a schoolteacher, on October 11, 1953, in Beverly, Massachusetts. He grew ...	https://m.media-amazon.com/images/M/MV5BMTgwNjUzOTE1N15BMl5BanBnXkFtZTYwNTU4NDQ0._V1_FMjpg_UX1000_.jpg	Born:  October 11,  1953  in Hamilton, Massachusetts, USA	
118	nm0594503	/name/nm0594503	Hayao Miyazaki	Hayao Miyazaki is one of Japan's greatest animation directors. The entertaining plots, compelling characters, and breathtaking animation in his films have earned him international renown from critics as well as public recognition within Japan. The Walt Disney Company's commitment to introduce the films to the rest of the world will let more people...	https://m.media-amazon.com/images/M/MV5BMjcyNjk2OTkwNF5BMl5BanBnXkFtZTcwOTk0MTQ3Mg@@._V1_FMjpg_UX1000_.jpg	Born:  January 5,  1941  in Tokyo, Japan	
119	nm0153738	/name/nm0153738	 Daveigh Chase\n	Daveigh Chase was born on July 24, 1990 in Las Vegas, Nevada. She was raised in the small town of Albany, Oregon; where she continues to spend much of her time. She began singing and dancing in her hometown and other local areas at community events and shows starting at age 3. After visiting Los Angeles, she did her first commercial for Campbell's ...	https://m.media-amazon.com/images/M/MV5BMTcyMDAyMjA4NF5BMl5BanBnXkFtZTcwNjg1ODkzMg@@._V1_FMjpg_UX1000_.jpg	Born:  July 24,  1990  in Las Vegas, Nevada, USA	
120	nm0687189	/name/nm0687189	 Suzanne Pleshette\n(1937–2008)\n	Suzanne Pleshette achieved television immortality in her role as Bob Newhart's wife in the 1970s classic situation comedy, The Bob Newhart Show (1972). For her role as "Emily Hartley", wife of psychologist "Bob Hartley" (played by Bob Newhart), Pleshette was nominated for the Emmy Award twice, in 1977 and 1978. She was also nominated for an Emmy ...	https://m.media-amazon.com/images/M/MV5BMTU0NzkwMjA3N15BMl5BanBnXkFtZTYwNDkwNTgy._V1_FMjpg_UX1000_.jpg	Born:  January 31,  1937  in New York City, New York, USA	Died:  January 19,  2008  (age 70) in Los Angeles, California, USA
113	nm0000354	/name/nm0000354	Matt Damon	Matthew Paige Damon was born on October 8, 1970, in Boston, Massachusetts, to Kent Damon, a stockbroker, realtor and tax preparer, and Nancy Carlsson-Paige, an early childhood education professor at Lesley University. Matt has an older brother, Kyle, a sculptor. His father was of English and Scottish descent, and his mother is of Finnish and ...	https://m.media-amazon.com/images/M/MV5BMTM0NzYzNDgxMl5BMl5BanBnXkFtZTcwMDg2MTMyMw@@._V1_FMjpg_UX1000_.jpg	Born:  October 8,  1970  in Boston, Massachusetts, USA	
124	nm1567113	/name/nm1567113	 Jessica Chastain\n	Jessica Michelle Chastain was born in Sacramento, California, and was raised in a middle-class household in a Northern California suburb. Her mother, Jerri Chastain, is a vegan chef whose family is originally from Kansas, and her stepfather is a fireman. She discovered dance at the age of nine and was in a dance troupe by age thirteen. She began ...	https://m.media-amazon.com/images/M/MV5BMTU1MDM5NjczOF5BMl5BanBnXkFtZTcwOTY2MDE4OA@@._V1_FMjpg_UX1000_.jpg	Born:  March 24,  1977  in Sacramento, California, USA	
125	nm0094435	/name/nm0094435	Bong Joon Ho	Bong Joon Ho was born on September 14, 1969 in Daegu, South Korea. He is a writer and producer, known for Snowpiercer (2013), Gisaengchung (2019) and Okja (2017).	https://m.media-amazon.com/images/M/MV5BOGVmYzZkODgtNTQ3OS00MzgxLTllOGUtZTFjNDc4MmE1ZDcwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg	Born:  September 14,  1969  in Daegu, South Korea	
127	nm1310525	/name/nm1310525	 Sun-kyun Lee\n	Sun-kyun Lee was born on March 2, 1975 in Seoul, South Korea. He is an actor and manager, known for Gisaengchung (2019), Kkeut-kka-ji-gan-da (2014) and Paju (2009). He has been married to Hye-jin Jeon since May 23, 2009. They have two children.	https://m.media-amazon.com/images/M/MV5BZWNhYTI0OTctODExYi00MDAyLWI3ZmEtNGYwMmJiMjhhOGU4XkEyXkFqcGdeQXVyNTI5NjIyMw@@._V1_FMjpg_UX1000_.jpg	Born:  March 2,  1975  in Seoul, South Korea	
128	nm1856097	/name/nm1856097	 Yeo-jeong Cho\n	Yeo-jeong Cho was born on February 10, 1981 in South Korea. She is an actress, known for Gisaengchung (2019), Bang-ja jeon (2010) and In-gan-jung-dok (2014).	https://m.media-amazon.com/images/M/MV5BYzI3YWY1MjQtZDhmMC00MWFlLTk3NWYtMzU3MDYxNTcxZmUwXkEyXkFqcGdeQXVyNTI5NjIyMw@@._V1_FMjpg_UX1000_.jpg	Born:  February 10,  1981  in South Korea	
129	nm0000108	/name/nm0000108	Luc Besson	Luc Besson spent the first years of his life following his parents, scuba diving instructors, around the world. His early life was entirely aquatic. He already showed amazing creativity as a youth, writing early drafts of Le grand bleu (1988) and The Fifth Element (1997), as an adolescent bored in school. He planned on becoming a marine biologist ...	https://m.media-amazon.com/images/M/MV5BMTAwNzE4Njg0NTFeQTJeQWpwZ15BbWU3MDk0MDEyMDc@._V1_FMjpg_UX1000_.jpg	Born:  March 18,  1959  in Paris, France	
130	nm0000606	/name/nm0000606	 Jean Reno\n(I)\n	Jean Reno was born Juan Moreno y Herrera-Jiménez in Casablanca, Morocco, to Spanish parents (from Andalucía) who moved to North Africa to seek work. His father was a linotypist. Reno settled in France at 17. He began studying drama and has credits in French television and theater as well as films. His first two marriages both ended in divorce, and...	https://m.media-amazon.com/images/M/MV5BMTgzNjA1MjY2M15BMl5BanBnXkFtZTYwMjgzOTk0._V1_FMjpg_UX1000_.jpg	Born:  July 30,  1948  in Casablanca, French Protectorate of Morocco [now Morocco]	
131	nm0000198	/name/nm0000198	 Gary Oldman\n	Gary Oldman is a talented English movie star and character actor, renowned for his expressive acting style. One of the most celebrated thespians of his generation, with a diverse career encompassing theatre, film and television, he is known for his roles as Sid Vicious in Sid and Nancy (1986), Drexl in True Romance (1993), George Smiley in Tinker ...	https://m.media-amazon.com/images/M/MV5BMTc3NTM4MzQ5MV5BMl5BanBnXkFtZTcwOTE4MDczNw@@._V1_FMjpg_UX1000_.jpg	Born:  March 21,  1958  in New Cross, London, England, UK	
133	nm0462030	/name/nm0462030	 Masaki Kobayashi\n(I)\n(1916–1996)\n	Masaki Kobayashi was born on February 14, 1916 in Hokkaido, Japan. He was a director and writer, known for Seppuku (1962), Jôi-uchi: Hairyô tsuma shimatsu (1967) and Ningen no jôken (1959). He died on October 4, 1996 in Tokyo, Japan.	https://m.media-amazon.com/images/M/MV5BNWQwZTVjYTEtYTdmYi00MTkxLWJjMjYtZTNkOWY0MTRlM2Y3XkEyXkFqcGdeQXVyMjUxODE0MDY@._V1_FMjpg_UX1000_.jpg	Born:  February 14,  1916  in Hokkaido, Japan	Died:  October 4,  1996  (age 80) in Tokyo, Japan
134	nm0847668	/name/nm0847668	 Yasuhiko Takiguchi\n(1924–2004)\n	Contribute to IMDb. Add a bio, trivia, and more.\nUpdate information for Yasuhiko Takiguchi »		Born:  1924	Died:  June 9,  2004  (age 80) in Taku, Saga, Japan
136	nm0410968	/name/nm0410968	 Akira Ishihama\n	Akira Ishihama was born on January 29, 1935 in Tokyo, Japan. He is an actor, known for Seppuku (1962), Umi no hanabi (1951) and Kamen Raidaa Burakku: Kyoufu! Akumatouge no kaijinkan! (1988).		Born:  January 29,  1935  in Tokyo, Japan	
137	nm0412615	/name/nm0412615	 Shima Iwashita\n	Shima Iwashita was born on January 3, 1941 in Tokyo, Japan. She is an actress, known for Seppuku (1962), Hanare goze Orin (1977) and Akane-gumo (1967). She has been married to Masahiro Shinoda since 1967.	https://m.media-amazon.com/images/M/MV5BNTY4ODkzNjI1M15BMl5BanBnXkFtZTcwMjk5MDUwNw@@._V1_FMjpg_UX1000_.jpg	Born:  January 3,  1941  in Tokyo, Japan	
135	nm0619938	/name/nm0619938	Tatsuya Nakadai	Japanese leading man, an important star and one of the handful of Japanese actors well known outside Japan. Nakadai was a tall handsome clerk in a Tokyo shop when director Masaki Kobayashi encountered him and cast him in Kabe atsuki heya (1956). Nakadai was subsequently cast in the lead role in Kobayashi's monumental trilogy 'Ningen no joken' and ...	https://m.media-amazon.com/images/M/MV5BMTM5MzYwNDA3NV5BMl5BanBnXkFtZTcwNDExMTMwNw@@._V1_FMjpg_UX1000_.jpg	Born:  December 13,  1932  in Tokyo, Japan	
132	nm0000204	/name/nm0000204	Natalie Portman	Natalie Portman is the first person born in the 1980s to have won the Academy Award for Best Actress (for Black Swan (2010)). Natalie was born Natalie Hershlag on June 9, 1981, in Jerusalem, Israel. She is the only child of Avner Hershlag, a Israeli-born doctor, and Shelley Stevens, an American-born artist (from Cincinnati, Ohio), who also acts as ...	https://m.media-amazon.com/images/M/MV5BMTQ3ODE3Mjg1NV5BMl5BanBnXkFtZTcwNzA4ODcxNA@@._V1_FMjpg_UX1000_.jpg	Born:  June 9,  1981  in Jerusalem, Israel	
126	nm0814280	/name/nm0814280	Kang-ho Song	Song Kang-ho never professionally trained as an actor, beginning his career in social theater groups after graduating from Kimhae High School. Later, he joined Kee Kuk-seo's influential theater company with its emphasis on instinctive acting and improvisation, which proved to be Song's training ground. Although regularly approached to act in films...	https://m.media-amazon.com/images/M/MV5BYjYyYzcyZTAtY2I4Yy00NGE2LThiNzYtYmVjNGIyNWU2YjVkXkEyXkFqcGdeQXVyNTI5NjIyMw@@._V1_FMjpg_UX1000_.jpg	Born:  January 17,  1967  in Gim-hae, South Gyeongsang Povince, South Korea	
138	nm0021249	/name/nm0021249	 Roger Allers\n	Roger Allers was born on June 29, 1949 in Rye, New York, USA as Roger Charles Allers. He is known for his work on The Lion King (1994), Aladdin (1992) and Beauty and the Beast (1991). He has been married to Leslee Allers since 1965. They have two children.	https://m.media-amazon.com/images/M/MV5BNzc2MDk4ODg0MV5BMl5BanBnXkFtZTgwNjkxMzI4MTE@._V1_FMjpg_UX1000_.jpg	Born:  June 29,  1949  in Rye, New York, USA	
139	nm0591450	/name/nm0591450	 Rob Minkoff\n	Rob Minkoff was born on August 11, 1962 in Palo Alto, California, USA as Robert Ralph Minkoff. He is a producer and director, known for The Lion King (1994), Stuart Little 2 (2002) and The Forbidden Kingdom (2008). He has been married to Crystal Kung since September 29, 2007.	https://m.media-amazon.com/images/M/MV5BNzVhZDg5YzItNWI1MC00Y2I1LWJmNmYtNmFmYzVjMzg4YzY0XkEyXkFqcGdeQXVyMTc1MDQwODM@._V1_FMjpg_UX1000_.jpg	Born:  August 11,  1962  in Palo Alto, California, USA	
140	nm0575293	/name/nm0575293	 Irene Mecchi\n	Irene Mecchi was born on September 21, 1949 in San Francisco, California, USA. She is known for her work on The Lion King (1994), The Hunchback of Notre Dame (1996) and Brave (2012).		Born:  September 21,  1949  in San Francisco, California, USA	
141	nm0731271	/name/nm0731271	 Jonathan Roberts\n(I)\n	Jonathan Roberts was born in Boston, Massachusetts, USA. He is a writer and producer, known for The Lion King (1994), The Hunchback of Notre Dame (1996) and James and the Giant Peach (1996).		Born: Boston, Massachusetts, USA	
142	nm0000111	/name/nm0000111	 Matthew Broderick\n(I)\n	A slight comic actor chiefly known for his boyish charm, Matthew Broderick was born on March 21, 1962 in New York City, to Patricia Broderick (née Biow), a playwright and painter, and James Broderick, an actor. His father had Irish and English ancestry, and his mother was from a Jewish family (from Germany and Poland). Matthew initially took up ...	https://m.media-amazon.com/images/M/MV5BMTg2NjA0MzM0OF5BMl5BanBnXkFtZTcwMDU5ODAxMw@@._V1_FMjpg_UX1000_.jpg	Born:  March 21,  1962  in New York City, New York, USA	
143	nm0000460	/name/nm0000460	 Jeremy Irons\n	British actor Jeremy Irons was born in Cowes, Isle of Wight, a small island off the south coast of England. He is the son of Barbara Anne Brereton (Sharpe) and Paul Dugan Irons, an accountant. Young Jeremy didn't prove very fond of figures. He visited mainland England only once a year. He wound up being grounded when his family settled down in ...	https://m.media-amazon.com/images/M/MV5BMTY5Mzg2NDY5OV5BMl5BanBnXkFtZTcwMDQwNzA0Mg@@._V1_FMjpg_UX1000_.jpg	Born:  September 19,  1948  in Cowes, Isle of Wight, England, UK	
144	nm0000469	/name/nm0000469	 James Earl Jones\n	Widely regarded as the one of greatest stage and screen actors both in his native USA and internationally, James Earl Jones was born on January 17, 1931 in Arkabutla, Mississippi. At an early age, he started to take dramatic lessons to calm himself down. It appeared to work as he has since starred in many films over a 40-year period, beginning ...	https://m.media-amazon.com/images/M/MV5BMTcwNTg1MzMwM15BMl5BanBnXkFtZTcwNTQyMDgyMg@@._V1_FMjpg_UX1000_.jpg	Born:  January 17,  1931  in Arkabutla, Mississippi, USA	
145	nm0001741	/name/nm0001741	 Bryan Singer\n	Bryan Singer was born on September 17, 1965 in New York City, New York, USA as Bryan Jay Singer. He is a producer and director, known for X-Men (2000), The Usual Suspects (1995) and X-Men: Days of Future Past (2014).	https://m.media-amazon.com/images/M/MV5BMTMwMzQ0OTgzNF5BMl5BanBnXkFtZTcwMjExNzAyMg@@._V1_FMjpg_UX1000_.jpg	Born:  September 17,  1965  in New York City, New York, USA	
146	nm0003160	/name/nm0003160	 Christopher McQuarrie\n	Christopher McQuarrie is an acclaimed producer, director and an Academy Award® winning writer. McQuarrie grew up in Princeton Junction, New Jersey and in lieu of college, he spent the first five years out of school traveling and working at a detective agency. He later moved to Los Angeles to pursue a career in film. In 1995, his screenplay for The ...	https://m.media-amazon.com/images/M/MV5BMzQyMzg1NjUxN15BMl5BanBnXkFtZTgwNDAyMjAwMDE@._V1_FMjpg_UX1000_.jpg	Born:  October 25,  1968  in Princeton, New Jersey, USA	
147	nm0000321	/name/nm0000321	 Gabriel Byrne\n	Byrne was the first of six children, born in Dublin, Ireland. His father was a cooper and his mother a hospital worker. He was raised Catholic and educated by the Irish Christian Brothers. He spent five years of his childhood in a seminary training to be a Catholic priest. He later said, "I spent five years in the seminary and I suppose it was ...	https://m.media-amazon.com/images/M/MV5BMjAxMzE1ODA1Ml5BMl5BanBnXkFtZTcwODY3MjU5MQ@@._V1_FMjpg_UX1000_.jpg	Born:  May 12,  1950  in Dublin, Ireland	
148	nm0001590	/name/nm0001590	 Chazz Palminteri\n	Bronx-born and raised Chazz Palminteri was a natural choice to continue the Italianate torch in film. In the tradition set forth in the 1970s by such icons as director Martin Scorsese and actors Robert De Niro, Al Pacino, John Cazale and Joe Pesci, Palminteri has brought grit, muscle and an evocative realism to the sidewalks of his New York ...	https://m.media-amazon.com/images/M/MV5BMjExNjU4NTUzOV5BMl5BanBnXkFtZTgwMTY3MDMzMTE@._V1_FMjpg_UX1000_.jpg	Born:  May 15,  1952  in New York City, New York, USA	
150	nm0367838	/name/nm0367838	 Ronald Harwood\n(1934–2020)\n	Born in Cape Town, Union of South Africa in 1934, Ronald Harwood moved to London in 1951 to pursue a career in the theatre. After attending the Royal Academy of Dramatic Arts, he joined the Shakespeare Company of Sir Donald Wolfit, one of the last 'actor-manager' of Great-Britain. From 1953 to 1958, Harwood became the personal dresser of Sir ...	https://m.media-amazon.com/images/M/MV5BMjAyMTI4NTM0M15BMl5BanBnXkFtZTYwMzMxOTI4._V1_FMjpg_UX1000_.jpg	Born:  November 9,  1934  in Cape Town, South Africa	Died:  September 8,  2020  (age 85) in Sussex, England, UK
151	nm0844262	/name/nm0844262	 Wladyslaw Szpilman\n(1911–2000)\n	Wladyslaw Szpilman was born in 1911 in Sosnowiec. On leaving school, he went to Warsaw to study music (piano) in the Chopin School of Music, under Professor Jozef Smidowicz, and later, under Professor Aleksander Michalowski (both scholars of Franz List). In 1931 he went to Berlin to the Academy of Music studying under Professor Leonid Kreutzer and ...	https://m.media-amazon.com/images/M/MV5BMTc5NzU4NzE3NF5BMl5BanBnXkFtZTcwNzQ3MTUyMQ@@._V1_FMjpg_UX1000_.jpg	Born:  December 5,  1911  in Sosnowiec, Poland, Russian Empire [now Sosnowiec, Slaskie, Poland]	Died:  July 6,  2000  (age 88) in Warsaw, Mazowieckie, Poland
152	nm0004778	/name/nm0004778	 Adrien Brody\n	Adrien Nicholas Brody was born in Woodhaven, Queens, New York, the only child of retired history professor Elliot Brody and Hungarian-born photographer Sylvia Plachy. He accompanied his mother on assignments for the Village Voice, and credits her with making him feel comfortable in front of the camera. Adrien attended the American Academy of ...	https://m.media-amazon.com/images/M/MV5BMjI3ODkxMjU3OF5BMl5BanBnXkFtZTgwMTk2Njk3MTE@._V1_FMjpg_UX1000_.jpg	Born:  April 14,  1973  in Woodhaven, Queens, New York City, New York, USA	
153	nm0470981	/name/nm0470981	 Thomas Kretschmann\n	Thomas Kretschmann was born in East Germany. Before becoming an actor, he was a swimmer. He has acted in several popular American movies, such as Resident Evil: Apocalypse (2004), The Pianist (2002), U-571 (2000), In Enemy Hands (2004), etc. He has three children, Nicolas, Stella and Sascha with his ex-girlfriend Lena.	https://m.media-amazon.com/images/M/MV5BMTY1Njc5MzE1OF5BMl5BanBnXkFtZTcwMTc1NDM4Nw@@._V1_FMjpg_UX1000_.jpg	Born:  September 8,  1962  in Dessau, German Democratic Republic [now Saxony-Anhalt, Federal Republic of Germany]	
154	nm0277975	/name/nm0277975	 Frank Finlay\n(1926–2016)\n	One of Britain's finest products of the stage, film and TV, actor Frank Finlay, he with the dark and handsomely serious-to-mordant looks, was born on August 6, 1926, in Farnworth, England, the son of Josiah, a butcher, and Margaret Finlay. Of English, Irish and Scottish descent, Frank attended St. Gregory the Great School and then was actually ...	https://m.media-amazon.com/images/M/MV5BMTM1MTc1MzExOV5BMl5BanBnXkFtZTcwNDI5MDkwOA@@._V1_FMjpg_UX1000_.jpg	Born:  August 6,  1926  in Farnworth, Lancashire, England, UK	Died:  January 30,  2016  (age 89) in Weybridge, Surrey, England, UK
155	nm0000116	/name/nm0000116	James Cameron	James Francis Cameron was born on August 16, 1954 in Kapuskasing, Ontario, Canada. He moved to the United States in 1971. The son of an engineer, he majored in physics at California State University before switching to English, and eventually dropping out. He then drove a truck to support his screenwriting ambition. He landed his first ...	https://m.media-amazon.com/images/M/MV5BMjI0MjMzOTg2MF5BMl5BanBnXkFtZTcwMTM3NjQxMw@@._V1_FMjpg_UX1000_.jpg	Born:  August 16,  1954  in Kapuskasing, Ontario, Canada	
156	nm0936537	/name/nm0936537	 William Wisher\n	William Wisher is a writer and actor, known for Terminator 2: Judgment Day (1991), The Terminator (1984) and Judge Dredd (1995).	https://m.media-amazon.com/images/M/MV5BNzFkMzcyN2UtZjFlNy00ODQyLThkOGUtYzQwOTEwNzUxYmIwXkEyXkFqcGdeQXVyNzY2MzE3NDk@._V1_FMjpg_UX1000_.jpg		
157	nm0000216	/name/nm0000216	 Arnold Schwarzenegger\n	With an almost unpronounceable surname and a thick Austrian accent, who would have ever believed that a brash, quick talking bodybuilder from a small European village would become one of Hollywood's biggest stars, marry into the prestigious Kennedy family, amass a fortune via shrewd investments and one day be the Governor of California!? The ...	https://m.media-amazon.com/images/M/MV5BMTI3MDc4NzUyMV5BMl5BanBnXkFtZTcwMTQyMTc5MQ@@._V1_FMjpg_UX1000_.jpg	Born:  July 30,  1947  in Thal, Styria, Austria	
158	nm0000157	/name/nm0000157	 Linda Hamilton\n(I)\n	Born in Salisbury, Maryland, USA, following high school Linda studied for two years at Washington College in Chestertown, Maryland, before moving on to acting studies in New York. In New York she attended acting workshops given by Lee Strasberg. Her first parts were small parts in TV series, with her biggest break coming with her role in The ...	https://m.media-amazon.com/images/M/MV5BYzNiODYyZTgtOGNjYS00YWRhLWI2YWUtMjg1ODc1MmRkMTg5XkEyXkFqcGdeQXVyMTEwMTQ3ODI0._V1_FMjpg_UX1000_.jpg	Born:  September 26,  1956  in Salisbury, Maryland, USA	
52	nm0000709	/name/nm0000709	Robert Zemeckis	A whiz-kid with special effects, Robert is from the Spielberg camp of film-making (Steven Spielberg produced many of his films). Usually working with writing partner Bob Gale, Robert's earlier films show he has a talent for zany comedy (Romancing the Stone (1984), 1941 (1979)) and special effect vehicles (Who Framed Roger Rabbit (1988) and Back to...	https://m.media-amazon.com/images/M/MV5BMTgyMTMzMDUyNl5BMl5BanBnXkFtZTcwODA0ODMyMw@@._V1_FMjpg_UX1000_.jpg	Born:  May 14,  1951  in Chicago, Illinois, USA	
160	nm0301826	/name/nm0301826	 Bob Gale\n(I)\n	Bob Gale is an Oscar-nominated screenwriter-producer-director, best known as co-creator, co-writer and co-producer of Back to the Future (1985) and its sequels. Gale was born and raised in St. Louis, Missouri, and graduated Phi Beta Kappa with a B.A. in Cinema from the University of Southern California in 1973. He has written over 30 screenplays; ...	https://m.media-amazon.com/images/M/MV5BMTU1OTAxNzAwNl5BMl5BanBnXkFtZTcwMjk5NTQzMQ@@._V1_FMjpg_UX1000_.jpg	Born:  May 25,  1951  in University City, Missouri, USA	
161	nm0000150	/name/nm0000150	 Michael J. Fox\n(I)\n	Michael J. Fox was born Michael Andrew Fox on June 9, 1961 in Edmonton, Alberta, Canada, to Phyllis Fox (née Piper), a payroll clerk, and William Fox. His parents moved their 10-year-old son, his three sisters, Kelli Fox, Karen, and Jacki, and his brother Steven, to Vancouver, British Columbia, after his father, a sergeant in the Canadian Army ...	https://m.media-amazon.com/images/M/MV5BMTcwNzM0MjE4NF5BMl5BanBnXkFtZTcwMDkxMzEwMw@@._V1_FMjpg_UX1000_.jpg	Born:  June 9,  1961  in Edmonton, Alberta, Canada	
162	nm0000502	/name/nm0000502	 Christopher Lloyd\n(I)\n	Christopher Lloyd is an American actor with a relatively long career. His better known roles include drug-using taxicab driver Jim Ignatowski in the sitcom "Taxi" (1978-1983), Klingon officer Commander Kruge in the film "Star Trek III: The Search for Spock" (1984), inventor Dr. Emmett "Doc" Brown in the 'Back to the Future" film trilogy (1985-1990...	https://m.media-amazon.com/images/M/MV5BMTkxNzQ0ODgxOV5BMl5BanBnXkFtZTcwMTAxMDY0Mg@@._V1_FMjpg_UX1000_.jpg	Born:  October 22,  1938  in Stamford, Connecticut, USA	
163	nm0000670	/name/nm0000670	 Lea Thompson\n(I)\n	Lea Katherine Thompson was born on May 31, 1961, in Rochester, Minnesota. She is the youngest of five children. Her parents are Barbara Anne (Barry) and Clifford Elwin "Cliff" Thompson. Since all her siblings were much older than she, Lea says it seemed like she had more than two parents. The family lived in the Starlight Motel, all the kids ...	https://m.media-amazon.com/images/M/MV5BZjgzNmViYTktMjhjNy00NDc1LWI2MjMtNGUxYmFlZTNhODViXkEyXkFqcGdeQXVyMjA3MjIzMDA@._V1_FMjpg_UX1000_.jpg	Born:  May 31,  1961  in Rochester, Minnesota, USA	
214	nm0041066	/name/nm0041066	 Antonella Attili\n	Antonella Attili was born on April 3, 1963 in Rome, Lazio, Italy. She is an actress and production manager, known for Nuovo Cinema Paradiso (1988), Prima del tramonto (1999) and Tolo Tolo (2020).	https://m.media-amazon.com/images/M/MV5BMTY2MzEyMjA3Ml5BMl5BanBnXkFtZTcwNTYzNDAzMQ@@._V1_FMjpg_UX1000_.jpg	Born:  April 3,  1963  in Rome, Lazio, Italy	
309	nm0305558	/name/nm0305558	 Gael García Bernal\n	Gael García Bernal was born in Guadalajara to Patricia Bernal, an actress/model & José Ángel García, an actor/director. His stepfather's cinematographer Sergio Yazbek. He began his acting career as a child, working w/ his parents in a variety of plays. At 14, he starred in a soap opera called El abuelo y yo (1992). He appeared in film school ...	https://m.media-amazon.com/images/M/MV5BMTkzNjg4NzMwNF5BMl5BanBnXkFtZTYwMjExNjQ0._V1_FMjpg_UX1000_.jpg	Born:  November 30,  1978  in Guadalajara, Mexico	
164	nm0443411	/name/nm0443411	 Tony Kaye\n(I)\n	Tony Kaye was born in London, United Kingdom. He has made several well-known music videos, including the video for "Runaway Train" by Soul Asylum, which won a Grammy Award, "Dani California" by Red Hot Chili Peppers, "What God Wants" by Roger Waters, and "Help Me" and "God's Gonna Cut You Down" by Johnny Cash. Kaye is a six time Grammy nominated ...	https://m.media-amazon.com/images/M/MV5BMTY4Nzg0MTQ4Ml5BMl5BanBnXkFtZTcwMTcwMzcwNQ@@._V1_FMjpg_UX1000_.jpg	Born:  1952  in London, England, UK	
165	nm0571346	/name/nm0571346	 David McKenna\n(I)\n	David McKenna was born on August 14, 1968 in San Diego, California, USA as David Joel McKenna. He is a writer and producer, known for American History X (1998), Get Carter (2000) and S.W.A.T. (2003).	https://m.media-amazon.com/images/M/MV5BZTVlNWFmYWItZjAzYS00OTQ4LWE3M2QtMTQ0NjNmN2M0OGFhXkEyXkFqcGdeQXVyOTQwMTExMTE@._V1_FMjpg_UX1000_.jpg	Born:  August 14,  1968  in San Diego, California, USA	
159	nm0000411	/name/nm0000411	Edward Furlong	Edward Walter Furlong was born in Glendale, California. His mother, Eleanor (Tafoya), is from a Mexican family, and worked at a youth center. Furlong had no acting ambitions until he was approached by casting agent Mali Finn, who was looking for a young actor to play the role of John Connor in what turned out to be one of the the biggest ...	https://m.media-amazon.com/images/M/MV5BMTI1MzgxODkyMl5BMl5BanBnXkFtZTcwNTc1NDIzMQ@@._V1_FMjpg_UX1000_.jpg	Born:  August 2,  1977  in Glendale, California, USA	
166	nm0000350	/name/nm0000350	 Beverly D'Angelo\n(I)\n	Intriguing, inspiring, and never less than interesting -- key adjectives in describing the career of Beverly D'Angelo, which has well passed the four-decade mark. Perhaps deserving better movies than she generally found herself in, she nevertheless was always an object of fascination and the one to watch...whatever the role. Hardly the shrinking ...	https://m.media-amazon.com/images/M/MV5BMTMyNTk4ODU5NV5BMl5BanBnXkFtZTcwODU0OTgwMw@@._V1_FMjpg_UX1000_.jpg	Born:  November 15,  1951  in Columbus, Ohio, USA	
167	nm0000122	/name/nm0000122	Charles Chaplin	Considered to be one of the most pivotal stars of the early days of Hollywood, Charlie Chaplin lived an interesting life both in his films and behind the camera. He is most recognized as an icon of the silent film era, often associated with his popular character, the Little Tramp; the man with the toothbrush mustache, bowler hat, bamboo cane, and ...	https://m.media-amazon.com/images/M/MV5BNDcwMDc0ODAzOF5BMl5BanBnXkFtZTgwNTY2OTI1MDE@._V1_FMjpg_UX1000_.jpg	Born:  April 16,  1889  in Walworth, London, England, UK	Died:  December 25,  1977  (age 88) in Vevey, Vaud, Switzerland
169	nm0074788	/name/nm0074788	 Henry Bergman\n(I)\n(1868–1946)\n	Henry Bergman was born on February 23, 1868 in San Francisco, California, USA. He was an actor and assistant director, known for Modern Times (1936), City Lights (1931) and The Gold Rush (1925). He died on October 22, 1946 in Hollywood, California.		Born:  February 23,  1868  in San Francisco, California, USA	Died:  October 22,  1946  (age 78) in Hollywood, California, USA
171	nm0291905	/name/nm0291905	David Franzoni	David Franzoni grew up in Vermont, attended the University of Vermont where he studied geology and paleontology and was a partner in a commercial film company. After attending a semester of graduate school, David dropped out, went to Berlin where he bought a motorcycle. He traveled eastern and western Europe, Turkey and Cyprus before driving his ...	https://m.media-amazon.com/images/M/MV5BNDFiNGEwMWQtMmYxZC00YTZlLWI0MWMtZDc1MDQyMjYwY2RkXkEyXkFqcGdeQXVyMTc5Mjc0OTg@._V1_FMjpg_UX1000_.jpg	Born:  March 4,  1947	
174	nm0001567	/name/nm0001567	 Connie Nielsen\n(I)\n	Danish beauty Connie Nielsen consistently lights up the screen with an eclectic bevy of film roles. She was born in Frederikshavn, Denmark, to a mother who worked as an insurance clerk, and a father, Bent Nielsen, who was a bus driver. Nielsen began her acting career working alongside her mother on the local revue and variety scene. At 18, she ...	https://m.media-amazon.com/images/M/MV5BYzZiYTQ4YTAtMzRkMi00ZDZlLWFkZWItNGI2ZTIyODRiYTc4XkEyXkFqcGdeQXVyMjUzMjc2MjE@._V1_FMjpg_UX1000_.jpg	Born:  July 3,  1965  in Elling, Frederikshavn, Denmark	
170	nm0000631	/name/nm0000631	Ridley Scott	Described by film producer Michael Deeley as "the very best eye in the business", director Ridley Scott was born on November 30, 1937 in South Shields, Tyne and Wear (then County Durham). His father was an officer in the Royal Engineers and the family followed him as his career posted him throughout the United Kingdom and Europe before they ...	https://m.media-amazon.com/images/M/MV5BMGJkOGM5OWEtNDYxMy00Njg4LWExNjAtY2ZlNWNlNzVhNDk4XkEyXkFqcGdeQXVyNDkzNTM2ODg@._V1_FMjpg_UX1000_.jpg	Born:  November 30,  1937  in South Shields, County Durham, England, UK	
168	nm0002104	/name/nm0002104	Paulette Goddard	Paulette Goddard was a child model who debuted in "The Ziegfeld Follies" at the age of 13. She gained fame with the show as the girl on the crescent moon, and was married to a wealthy man by the time she was 16. After her divorce she went to Hollywood in 1931, where she appeared in small roles in pictures for a number of studios. A stunning natural...	https://m.media-amazon.com/images/M/MV5BMjE1NTk1Mjg4MF5BMl5BanBnXkFtZTcwMjAxMDIzNw@@._V1_FMjpg_UX1000_.jpg	Born:  June 3,  1910  in Whitestone Landing, Long Island, New York, USA	Died:  April 23,  1990  (age 79) in Ronco, Switzerland
173	nm0001618	/name/nm0001618	Joaquin Phoenix	Joaquin Phoenix was born Joaquin Rafael Bottom in San Juan, Puerto Rico, to Arlyn (Dunetz) and John Bottom, and is the middle child in a brood of five. His parents, from the continental United States, were then serving as Children of God missionaries. His mother is from a Jewish family from New York, while his father, from California, is of mostly...	https://m.media-amazon.com/images/M/MV5BZGMyY2Q4NTEtMWVkZS00NzcwLTkzNmQtYzBlMWZhZGNhMDhkXkEyXkFqcGdeQXVyNjk1MjYyNTA@._V1_FMjpg_UX1000_.jpg	Born:  October 28,  1974  in San Juan, Puerto Rico	
306	nm2937122	/name/nm2937122	 Adrian Molina\n(I)\n	Adrian Molina is known for his work on Coco (2017), The Good Dinosaur (2015) and Monsters University (2013).	https://m.media-amazon.com/images/M/MV5BMjIzMTk5MTA5MF5BMl5BanBnXkFtZTgwMzEzODU1NDM@._V1_FMjpg_UX1000_.jpg		
305	nm0881279	/name/nm0881279	Lee Unkrich	Lee Unkrich is an Academy Award-winning director at Pixar Animation Studios. He most recently directed Disney.Pixar's critically-acclaimed "Coco", which received the Academy Award for Best Animated Feature and Best Song. As the director of Disney.Pixar's "Toy Story 3," Lee was also awarded an Academy Award for Best Animated Feature. Lee joined Pixar...	https://m.media-amazon.com/images/M/MV5BMjA1ODE2NTEzN15BMl5BanBnXkFtZTYwNzUzODY2._V1_FMjpg_UX1000_.jpg	Born:  August 8,  1967  in Cleveland, Ohio, USA	
176	nm0825010	/name/nm0825010	 Joseph Stefano\n(I)\n(1922–2006)\n	Creative horror screenwriter Joseph Stefano has been writing scripts since the early sixties. His first was The Black Orchid (1958). Less than a year later, he met his new friend, Alfred Hitchcock, to do the famous script for Psycho (1960). Stefano decided to drop the assignment for Hitchcock's The Birds (1963). Stefano later wrote a screenplay ...		Born:  May 5,  1922  in Philadelphia, Pennsylvania, USA	Died:  August 25,  2006  (age 84) in Thousand Oaks, California, USA
177	nm0088645	/name/nm0088645	 Robert Bloch\n(I)\n(1917–1994)\n	Robert Bloch was born on April 5, 1917 in Chicago, Illinois, USA as Robert Albert Bloch. He is known for his work on Psycho (1960), Psycho (1998) and Star Trek (1966). He was married to Eleanor Zalisko Alexander and Marion Holcombe. He died on September 23, 1994 in Los Angeles, California, USA.	https://m.media-amazon.com/images/M/MV5BNDYyNzdhMTItZDYyMC00OTJjLThjODgtNjI2ZGY1MjE3NjI1XkEyXkFqcGdeQXVyMTEwODg2MDY@._V1_FMjpg_UX1000_.jpg	Born:  April 5,  1917  in Chicago, Illinois, USA	Died:  September 23,  1994  (age 77) in Los Angeles, California, USA
178	nm0000578	/name/nm0000578	 Anthony Perkins\n(I)\n(1932–1992)\n	Anthony Perkins was born April 4, 1932 in New York City to Janet Esselstyn (Rane) and Osgood Perkins, an actor of both stage and film. His paternal great-grandfather was noted engraver Andrew Varick Stout Anthony. Perkins attended the Brooks School, the Browne & Nichols School, Columbia University and Rollins College. He made his screen debut in ...	https://m.media-amazon.com/images/M/MV5BMTIzMTUyMTYxM15BMl5BanBnXkFtZTYwNzE5OTI2._V1_FMjpg_UX1000_.jpg	Born:  April 4,  1932  in New York City, New York, USA	Died:  September 12,  1992  (age 60) in Hollywood, Los Angeles, California, USA
179	nm0001463	/name/nm0001463	 Janet Leigh\n(I)\n(1927–2004)\n	Janet Leigh was the only child of a couple who often moved from town to town. Living in apartments, Janet was a bright child who skipped several grades and finished high school when she was 15. A lonely child, she would spend much of her time at movie theaters. She was a student, studying music and psychology, at the University of the Pacific ...	https://m.media-amazon.com/images/M/MV5BMjU3MjY5OTE0MF5BMl5BanBnXkFtZTYwMzUyMDY2._V1_FMjpg_UX1000_.jpg	Born:  July 6,  1927  in Merced, California, USA	Died:  October 3,  2004  (age 77) in Beverly Hills, Los Angeles, California, USA
180	nm0587256	/name/nm0587256	 Vera Miles\n	Born in Boise City, Oklahoma, Vera Miles attended school in Pratt, Kansas and Wichita, Kansas. The patrician beauty of Miss Miles won her the title of "Miss Kansas" in 1948, leading soon to small roles in Hollywood films and television series. Fame came to the forthright, spirited Miles when she attracted the attention of two master directors, ...	https://m.media-amazon.com/images/M/MV5BMTgwOTY2MTk4MF5BMl5BanBnXkFtZTcwMTAwNjYwNA@@._V1_FMjpg_UX1000_.jpg	Born:  August 23,  1929  in Boise City, Oklahoma, USA	
72	nm0000217	/name/nm0000217	Martin Scorsese	Martin Charles Scorsese was born on November 17, 1942 in Queens, New York City, to Catherine Scorsese (née Cappa) and Charles Scorsese, who both worked in Manhattan's garment district, and whose families both came from Palermo, Sicily. He was raised in the neighborhood of Little Italy, which later provided the inspiration for several of his films....	https://m.media-amazon.com/images/M/MV5BMTcyNDA4Nzk3N15BMl5BanBnXkFtZTcwNDYzMjMxMw@@._V1_FMjpg_UX1000_.jpg	Born:  November 17,  1942  in Queens, New York City, New York, USA	
181	nm1184258	/name/nm1184258	 William Monahan\n(II)\n	William Monahan was born on November 3, 1960 in Boston, Massachusetts, USA. He is a writer and producer, known for The Departed (2006), London Boulevard (2010) and Kingdom of Heaven (2005).	https://m.media-amazon.com/images/M/MV5BMTU5ODg5NzIxMl5BMl5BanBnXkFtZTcwMTExNjQ3Nw@@._V1_FMjpg_UX1000_.jpg	Born:  November 3,  1960  in Boston, Massachusetts, USA	
182	nm0538320	/name/nm0538320	 Alan Mak\n(I)\n	Alan Mak Siu Fai was born in Hong Kong in 1965. In 1986, he studied in the School of Drama at the Hong Kong Academy for Performance Arts. Upon graduation in 1990, he started his movie career. Mak made his directorial debut in 1997, with his first film being Nude Fear, which was written and produced by Joe Ma. After that, Mak had directed more films...		Born:  January 1,  1965  in Hong Kong	
79	nm0000197	/name/nm0000197	Jack Nicholson	Jack Nicholson, an American actor, producer, director and screenwriter, is a three-time Academy Award winner and twelve-time nominee. Nicholson is also notable for being one of two actors - the other being Michael Caine - who have received an Oscar nomination in every decade from the 1960s through the early 2000s. Nicholson was born on April 22, ...	https://m.media-amazon.com/images/M/MV5BMTQ3OTY0ODk0M15BMl5BanBnXkFtZTYwNzE4Njc4._V1_FMjpg_UX1000_.jpg	Born:  April 22,  1937  in Neptune, New Jersey, USA	
183	nm0156039	/name/nm0156039	 Virginia Cherrill\n(1908–1996)\n	Actress in US and UK films of the early 1930s. Born on a farm, Cherrill was discovered by Charles Chaplin while sitting beside him at a boxing match in Los Angeles; he introduced himself at intermission and hired her for her debut in City Lights (1931). She met husband Cary Grant at the premiere of Blonde Venus (1932) and stopped working after ...	https://m.media-amazon.com/images/M/MV5BOGYwMDFhMzgtNzk0YS00YWY2LTgyZjAtMDk0MTQ3ZjE4YTE5L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMzI5NDcxNzI@._V1_FMjpg_UX1000_.jpg	Born:  April 12,  1908  in Carthage, Illinois, USA	Died:  November 14,  1996  (age 88) in Santa Barbara, California, USA
184	nm5681967	/name/nm5681967	 Florence Lee\n(II)\n(1864–1933)\n	Florence Dawson Lee was an actress who appeared in films during the silent era, playing older women characters. She was born Florence Dawson in 1864 in Florence, South Carolina, the daughter of Job and Julia Dawson. Her father, a native of Ireland, operated a grocery and liquor business in Charleston. Her mother was a native of South Carolina. Her...		Born:  February,  1864  in South Carolina, USA	Died:  February 17,  1933  (age 69) in Los Angeles, California, USA
175	nm0000033	/name/nm0000033	Alfred Hitchcock	Alfred Joseph Hitchcock was born in Leytonstone, Essex, England. He was the son of Emma Jane (Whelan; 1863 - 1942) and East End greengrocer William Hitchcock (1862 - 1914). His parents were both of half English and half Irish ancestry. He had two older siblings, William Hitchcock (born 1890) and Eileen Hitchcock (born 1892). Raised as a strict ...	https://m.media-amazon.com/images/M/MV5BMTQxOTg3ODc2NV5BMl5BanBnXkFtZTYwNTg0NTU2._V1_FMjpg_UX1000_.jpg	Born:  August 13,  1899  in Leytonstone, London, England, UK	Died:  April 29,  1980  (age 80) in Bel Air, Los Angeles, California, USA
307	nm0441735	/name/nm0441735	 Jason Katz\n(I)\n	Jason Katz is known for his work on Coco (2017), A Bug's Life (1998) and Toy Story (1995).			
308	nm5645519	/name/nm5645519	 Anthony Gonzalez\n(VIII)\n	Anthony Gonzalez is an actor, known for Coco (2017), Icebox (2018) and The Last Ship (2014).	https://m.media-amazon.com/images/M/MV5BNDY0ZDZiZWQtZTE0OC00NjgxLWEwZDgtOWEwOTEwMjhlOGVhXkEyXkFqcGdeQXVyNjY5NDgzNjQ@._V1_FMjpg_UX1000_.jpg		
185	nm3227090	/name/nm3227090	Damien Chazelle	Damien Sayre Chazelle is an American director and screenwriter. He was born in Providence, Rhode Island. His mother, Celia Sayre (Martin) Chazelle, is an American-Canadian writer and professor of history at The College of New Jersey. His father, Bernard Chazelle, is a French-American Eugene Higgins Professor of computer science at Princeton ...	https://m.media-amazon.com/images/M/MV5BMjE2MzcyODA3MV5BMl5BanBnXkFtZTgwNTA3NTU2MjE@._V1_FMjpg_UX1000_.jpg	Born:  January 19,  1985  in Providence, Rhode Island, USA	
186	nm1886602	/name/nm1886602	 Miles Teller\n	Miles Alexander Teller is an American actor and musician. For his performance in the film The Spectacular Now (2013), he won the Dramatic Special Jury Award for Acting at the 2013 Sundance Film Festival. He has appeared in the films Rabbit Hole (2010), Footloose (2011), Project X (2012), That Awkward Moment (2014), Divergent (2014), Two Night Stand...	https://m.media-amazon.com/images/M/MV5BMTY2MzM2NzAxNF5BMl5BanBnXkFtZTgwMDIyMzg1NDE@._V1_FMjpg_UX1000_.jpg	Born:  February 20,  1987  in Downingtown, Pennsylvania, USA	
188	nm2552034	/name/nm2552034	 Melissa Benoist\n	Melissa Marie Benoist is an American actress, singer and dancer. She was born in Littleton, Colorado , the daughter of Julie and Jim Benoist, a physician. Her paternal great-grandfather was of French descent. The rest of her ancestry is German, English, and Scottish. She started dance classes at the age of three and when she was four years old her...	https://m.media-amazon.com/images/M/MV5BNWU3MzE1YzgtNzY4ZC00YWJmLTk1Y2MtYTMzYzIxODM3YzQyXkEyXkFqcGdeQXVyNjk1MjYyNTA@._V1_FMjpg_UX1000_.jpg	Born:  October 4,  1988  in Littleton, Colorado, USA	
190	nm0865918	/name/nm0865918	 Éric Toledano\n	Éric Toledano was born on July 3, 1971 in Paris, France. He is a producer and director, known for The Intouchables (2011), Le sens de la fête (2017) and Hors normes (2019).	https://m.media-amazon.com/images/M/MV5BMTY4OTQzNjAwMl5BMl5BanBnXkFtZTcwMDU3NTg2OA@@._V1_FMjpg_UX1000_.jpg	Born:  July 3,  1971  in Paris, France	
189	nm0619923	/name/nm0619923	Olivier Nakache	Olivier Nakache was born on April 15, 1973 in Suresnes, Hauts-de-Seine, France. He is a producer and director, known for The Intouchables (2011), Le sens de la fête (2017) and Hors normes (2019).	https://m.media-amazon.com/images/M/MV5BMjI4MzIxMTQ1MV5BMl5BanBnXkFtZTcwNDk4NzgxOA@@._V1_FMjpg_UX1000_.jpg	Born:  April 15,  1973  in Suresnes, Hauts-de-Seine, France	
191	nm4778840	/name/nm4778840	 Philippe Pozzo di Borgo\n	Philippe Pozzo di Borgo was born on February 14, 1951 in Paris, France. He is a writer, known for The Intouchables (2011), Menschen (1982) and 37 Grad (1994).		Born:  February 14,  1951  in Paris, France	
192	nm0167388	/name/nm0167388	 François Cluzet\n	François Cluzet was born on September 21, 1955 in Paris, France. He is an actor and director, known for The Intouchables (2011), Ne le dis à personne (2006) and French Kiss (1995). He has been married to Narjiss Slaoui-Falcoz since 2011. He was previously married to Chantal Perrin.	https://m.media-amazon.com/images/M/MV5BMTkyNjcyNjE0Nl5BMl5BanBnXkFtZTcwMTY5NTc1NA@@._V1_FMjpg_UX1000_.jpg	Born:  September 21,  1955  in Paris, France	
193	nm1082477	/name/nm1082477	 Omar Sy\n	Omar Sy was born on January 20, 1978 in Trappes, Yvelines, France. He is an actor and writer, known for The Intouchables (2011), Jurassic World (2015) and X-Men: Days of Future Past (2014). He has been married to Hélène since July 6, 2007. They have four children.	https://m.media-amazon.com/images/M/MV5BMjI2MjE3MDQ3NV5BMl5BanBnXkFtZTcwOTY0NzU0Nw@@._V1_FMjpg_UX1000_.jpg	Born:  January 20,  1978  in Trappes, Yvelines, France	
194	nm0494504	/name/nm0494504	 Anne Le Ny\n	Anne Le Ny was born on December 16, 1962 in Antony, Hauts-de-Seine, France. She is an actress and writer, known for The Intouchables (2011), Ceux qui restent (2007) and Attila Marcel (2013).		Born:  December 16,  1962  in Antony, Hauts-de-Seine, France	
196	nm0636435	/name/nm0636435	 Akiyuki Nosaka\n(1930–2015)\n	Akiyuki Nosaka was born on October 10, 1930 in Kamakura, Japan. He was a writer and actor, known for Hotaru no haka (1988), Asobi (1971) and Grave of the Fireflies. He was married to Nosaka Yoko. He died on December 9, 2015 in Tokyo, Japan.		Born:  October 10,  1930  in Kamakura, Japan	Died:  December 9,  2015  (age 85) in Tokyo, Japan
195	nm0847223	/name/nm0847223	Isao Takahata	Isao Takahata was born on October 29, 1935 in Ise, Japan. He was a director and writer, known for Hotaru no haka (1988), Kaguyahime no monogatari (2013) and Omohide poro poro (1991). He died on April 5, 2018 in Tokyo, Japan.	https://m.media-amazon.com/images/M/MV5BNDM5OTc2NjI1MV5BMl5BanBnXkFtZTgwOTI3MjA4MTE@._V1_FMjpg_UX1000_.jpg	Born:  October 29,  1935  in Ise, Japan	Died:  April 5,  2018  (age 82) in Tokyo, Japan
197	nm0851302	/name/nm0851302	 Tsutomu Tatsumi\n	Tsutomu Tatsumi is an actor, known for Hotaru no haka (1988).			
198	nm0794186	/name/nm0794186	 Ayano Shiraishi\n	Ayano Shiraishi is an actress, known for Hotaru no haka (1988).			
199	nm0945312	/name/nm0945312	 Akemi Yamaguchi\n(I)\n	Akemi Yamaguchi is an actress, known for Hotaru no haka (1988), Rashamen Oman: Higanbana wa chitta (1972) and Hirusagari no joji: Uramado (1972).			
15	nm0000288	/name/nm0000288	Christian Bale	Christian Charles Philip Bale was born in Pembrokeshire, Wales, UK on January 30, 1974, to English parents Jennifer "Jenny" (James) and David Bale. His mother was a circus performer and his father, who was born in South Africa, was a commercial pilot. The family lived in different countries throughout Bale's childhood, including England, Portugal,...	https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_FMjpg_UX1000_.jpg	Born:  January 30,  1974  in Haverfordwest, Pembrokeshire, Wales, UK	
200	nm0413168	/name/nm0413168	 Hugh Jackman\n	Hugh Michael Jackman is an Australian actor, singer, multi-instrumentalist, dancer and producer. Jackman has won international recognition for his roles in major films, notably as superhero, period, and romance characters. He is best known for his long-running role as Wolverine in the X-Men film series, as well as for his lead roles in the ...	https://m.media-amazon.com/images/M/MV5BNDExMzIzNjk3Nl5BMl5BanBnXkFtZTcwOTE4NDU5OA@@._V1_FMjpg_UX1000_.jpg	Born:  October 12,  1968  in Sydney, New South Wales, Australia	
430	nm0121256	/name/nm0121256	 Anthony Burgess\n(I)\n(1917–1993)\n	Anthony Burgess was born on February 25, 1917 in Manchester, England as John Anthony Burgess Wilson. He is known for his work on A Clockwork Orange (1971), Vinyl (1965) and La guerre du feu (1981). He was married to Liana Burgess and Llewela Isherwood Jones. He died on November 22, 1993 in London, England.		Born:  February 25,  1917  in Manchester, England, UK	Died:  November 22,  1993  (age 76) in London, England, UK
201	nm0424060	/name/nm0424060	 Scarlett Johansson\n	Scarlett Ingrid Johansson was born on November 22, 1984 in Manhattan, New York City, New York. Her mother, Melanie Sloan is from a Jewish family from the Bronx and her father, Karsten Johansson is a Danish-born architect from Copenhagen. She has a sister, Vanessa Johansson, who is also an actress, a brother, Adrian, a twin brother, Hunter Johansson...	https://m.media-amazon.com/images/M/MV5BMTM3OTUwMDYwNl5BMl5BanBnXkFtZTcwNTUyNzc3Nw@@._V1_FMjpg_UX1000_.jpg	Born:  November 22,  1984  in Manhattan, New York City, New York, USA	
202	nm0006872	/name/nm0006872	 Sergio Donati\n(I)\n	Sergio Donati was born on April 13, 1933 in Rome, Lazio, Italy. He is a writer and actor, known for Raw Deal (1986), Once Upon a Time in the West (1968) and Giù la testa (1971).	https://m.media-amazon.com/images/M/MV5BM2RlYmU3MjAtMmU3MC00ODdjLWIwMjYtNzM1NDM1YzI5NzE2XkEyXkFqcGdeQXVyMjUyNDk2ODc@._V1_FMjpg_UX1000_.jpg	Born:  April 13,  1933  in Rome, Lazio, Italy	
203	nm0000314	/name/nm0000314	 Charles Bronson\n(I)\n(1921–2003)\n	The archetypal screen tough guy with weatherbeaten features--one film critic described his rugged looks as "a Clark Gable who had been left out in the sun too long"--Charles Bronson was born Charles Buchinsky, one of 15 children of struggling parents in Pennsylvania. His mother, Mary (Valinsky), was born in Pennsylvania, to Lithuanian parents, and...	https://m.media-amazon.com/images/M/MV5BMTMxMzY5OTQwNV5BMl5BanBnXkFtZTYwMTcyOTE2._V1_FMjpg_UX1000_.jpg	Born:  November 3,  1921  in Ehrenfeld, Pennsylvania, USA	Died:  August 30,  2003  (age 81) in Los Angeles, California, USA
204	nm0001012	/name/nm0001012	 Claudia Cardinale\n(I)\n	Like many other female Italian film stars, Claudia Cardinale's entry into the business was by way of a beauty pageant. She was 17 years old and studying at the Centro Sperimentale in Rome when she entered a beauty contest, which resulted in her getting a succession of small film roles. Her earthy interpretations of Sicilian women got her noticed ...	https://m.media-amazon.com/images/M/MV5BMTg2MTM4MTEzNV5BMl5BanBnXkFtZTYwNDExMzQ2._V1_FMjpg_UX1000_.jpg	Born:  April 15,  1938  in Tunis, French Protectorate Tunisia [now Tunisia]	
205	nm0002031	/name/nm0002031	 Michael Curtiz\n(1886–1962)\n	Curtiz began acting in and then directing films in his native Hungary in 1912. After WWI, he continued his filmmaking career in Austria and Germany and into the early 1920s when he directed films in other countries in Europe. Moving to the US in 1926, he started making films in Hollywood for Warner Bros. and became thoroughly entrenched in the ...	https://m.media-amazon.com/images/M/MV5BMTcyMjA2MTgwNF5BMl5BanBnXkFtZTYwMTcwMDY2._V1_FMjpg_UX1000_.jpg	Born:  December 24,  1886  in Budapest, Austria-Hungary [now Hungary]	Died:  April 10,  1962  (age 75) in Hollywood, Los Angeles, California, USA
206	nm0258493	/name/nm0258493	 Julius J. Epstein\n(1909–2000)\n	Julius J. Epstein was born on August 22, 1909 in New York City, New York, USA. He was a writer and producer, known for Casablanca (1942), Reuben, Reuben (1983) and Pete 'n' Tillie (1972). He was married to Ann Margot Laszlo and Frances Sage. He died on December 30, 2000 in Los Angeles, California, USA.		Born:  August 22,  1909  in New York City, New York, USA	Died:  December 30,  2000  (age 91) in Los Angeles, California, USA
207	nm0258525	/name/nm0258525	 Philip G. Epstein\n(1909–1952)\n			Born:  August 22,  1909  in New York City, New York, USA	Died:  February 7,  1952  (age 42) in Hollywood, California, USA
209	nm0000006	/name/nm0000006	 Ingrid Bergman\n(I)\n(1915–1982)\n	Ingrid Bergman was one of the greatest actresses from Hollywood's lamented Golden Era. Her natural and unpretentious beauty and her immense acting talent made her one of the most celebrated figures in the history of American cinema. Bergman is also one of the most Oscar-awarded actresses, tied with Meryl Streep, both second only to Katharine ...	https://m.media-amazon.com/images/M/MV5BMTYzMTgzMTIwOV5BMl5BanBnXkFtZTYwNzI5MzI2._V1_FMjpg_UX1000_.jpg	Born:  August 29,  1915  in Stockholm, Sweden	Died:  August 29,  1982  (age 67) in Chelsea, London, England, UK
210	nm0002134	/name/nm0002134	 Paul Henreid\n(1908–1992)\n	Paul Henreid was born Paul Georg Julius Freiherr von Hernreid Ritter von Wasel-Waldingau in Trieste, in the Austro-Hungarian Empire. He was the son of Marie Luise Heilig (Lendecke) and Baron Karl Alphons Hernreid. His father was an aristocratic banker, who was born to a Jewish family whose surname was changed from Hirsch to Hernreid. Paul grew up ...	https://m.media-amazon.com/images/M/MV5BMjMyOTQ0ODg1NF5BMl5BanBnXkFtZTcwMjM2MjYwOA@@._V1_FMjpg_UX1000_.jpg	Born:  January 10,  1908  in Trieste, Austria-Hungary [now Trieste, Friuli-Venezia Giulia, Italy]	Died:  March 29,  1992  (age 84) in Santa Monica, California, USA
211	nm0868153	/name/nm0868153	Giuseppe Tornatore	Giuseppe Tornatore was born on May 27, 1956 in Bagheria, Sicily, Italy. He is a writer and director, known for La migliore offerta (2013), La leggenda del pianista sull'oceano (1998) and Nuovo Cinema Paradiso (1988).	https://m.media-amazon.com/images/M/MV5BMjIwNTY2MTA5MF5BMl5BanBnXkFtZTcwNjY3ODg5Mg@@._V1_FMjpg_UX1000_.jpg	Born:  May 27,  1956  in Bagheria, Sicily, Italy	
212	nm0634159	/name/nm0634159	 Philippe Noiret\n(1930–2006)\n	Philippe Noiret was one of French cinema's most familiar faces who appeared in more than 140 films in a career that spanned more than half a century. He was born on October 1, 1930, in Lille, Nord, France, into a middle class family of shopkeepers. His father was fond of literature. Young Noiret attended the College Janson-of-Sally in the 16th ...	https://m.media-amazon.com/images/M/MV5BMTU2MzE2OTE0N15BMl5BanBnXkFtZTcwNTg2NzIwNw@@._V1_FMjpg_UX1000_.jpg	Born:  October 1,  1930  in Lille, Nord, France	Died:  November 23,  2006  (age 76) in Paris, France
213	nm0134073	/name/nm0134073	 Enzo Cannavale\n(1928–2011)\n	Enzo Cannavale was born on April 5, 1928 in Castellammare di Stabia, Campania, Italy. He was an actor, known for Nuovo Cinema Paradiso (1988), 32 dicembre (1988) and Piedone l'africano (1978). He died on March 18, 2011 in Naples, Campania.	https://m.media-amazon.com/images/M/MV5BMjE1MmI5YmEtNDI0Ny00ZjIzLTkwMzMtZTU5Yjc1MDVjMjkyXkEyXkFqcGdeQXVyMTI3MDk3MzQ@._V1_FMjpg_UX1000_.jpg	Born:  April 5,  1928  in Castellammare di Stabia, Campania, Italy	Died:  March 18,  2011  (age 82) in Naples, Campania, Italy
215	nm0371088	/name/nm0371088	 John Michael Hayes\n(1919–2008)\n	Born in Worcester, Massachusetts, John Michael Hayes began his writing career as a newspaper reporter. Following service with the US Army during WWII, he moved to California where he wrote for such radio dramas as Sam Spade and Inner Sanctum. Moving to film in 1952, he has amassed credits which span over 40 years and include such enduring titles ...	https://m.media-amazon.com/images/M/MV5BMzAwMzk2NWEtZDM5Mi00NjgwLWI5MWItODNkZjUxZmMzMTkxXkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_FMjpg_UX1000_.jpg	Born:  May 11,  1919  in Worcester, Massachusetts, USA	Died:  November 19,  2008  (age 89) in Hanover, New Hampshire, USA
216	nm0941280	/name/nm0941280	 Cornell Woolrich\n(1903–1968)\n	Prolific mystery writer Cornell Woolrich was born in New York City, but his parents separated when he was young and he spent much of his childhood in Latin America with his father. Then he was sent back to New York to live with his rich, domineering mother, Claire. He attended Columbia University where he wrote his first novel, a Jazz Age piece ...	https://m.media-amazon.com/images/M/MV5BODlmOWMyNTItZDA5Ni00ZDhlLWI3ZWUtNGJjNzU1NmM5YjNkL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjUxODE0MDY@._V1_FMjpg_UX1000_.jpg	Born:  December 4,  1903  in New York City, New York, USA	Died:  September 25,  1968  (age 64) in New York City, New York, USA
218	nm0179819	/name/nm0179819	 Wendell Corey\n(1914–1968)\n	Wendell Corey was a hard-working American character actor who appeared in numerous movies and television productions in the 1940s, '50s and '60s. Born on March 20, 1914 in Dracut, Massachusetts, in the northeastern part of the Commonwealth near the New Hampshire border, Corey was the son of a Congregationalist clergyman. After receiving his ...	https://m.media-amazon.com/images/M/MV5BMTgwODk5NjE1MF5BMl5BanBnXkFtZTcwMjY3MDgwOA@@._V1_FMjpg_UX1000_.jpg	Born:  March 20,  1914  in Dracut, Massachusetts, USA	Died:  November 8,  1968  (age 54) in Woodland Hills, Los Angeles, California, USA
219	nm0639321	/name/nm0639321	Dan O'Bannon	Dan O'Bannon was inspired at an early age by EC Comics like Tales from the Crypt and old horror films that he saw in St. Louis. He even wrote a few stories for Heavy Metal magazine (which also showed up in the film). O'Bannon got his start when he and John Carpenter collaborated on the cult sci-fi film Dark Star (1974). After a failed attempt to ...	https://m.media-amazon.com/images/M/MV5BMTM1NjkzNjc0MV5BMl5BanBnXkFtZTcwMjU2NTg2OA@@._V1_FMjpg_UX1000_.jpg	Born:  September 30,  1946  in St. Louis, Missouri, USA	Died:  December 17,  2009  (age 63) in Los Angeles, California, USA
221	nm0000643	/name/nm0000643	 Tom Skerritt\n(I)\n	Lean, ruggedly handsome leading man and supporting actor whose "outdoor" looks have improved with age, Tom Skerritt attended Wayne State University and UCLA. He was first noticed in a UCLA production of "The Rainmaker" before making his movie debut in War Hunt (1962). However, he spent most of the next decade in television, regularly appearing in ...	https://m.media-amazon.com/images/M/MV5BNzY3Mjk5MTMyMl5BMl5BanBnXkFtZTYwMjUxMTc1._V1_FMjpg_UX1000_.jpg	Born:  August 25,  1933  in Detroit, Michigan, USA	
223	nm0587518	/name/nm0587518	 John Milius\n(I)\n	John Milius is a screenwriter and director who came to prominence in the 1970s, when he was associated with Francis Ford Coppola and the pre-Star Wars (1977) George Lucas. Born on April 11, 1944 in St. Louis, Missouri, Milius was one of the first movie industry professionals to be a film school graduate, having matriculated at the University of ...	https://m.media-amazon.com/images/M/MV5BMTg2OTk1MTI2NF5BMl5BanBnXkFtZTcwMTg2MjIyOA@@._V1_FMjpg_UX1000_.jpg	Born:  April 11,  1944  in St. Louis, Missouri, USA	
224	nm0000640	/name/nm0000640	 Martin Sheen\n	Multiple Emmy- and Golden Globe-winner Martin Sheen is one of America's most celebrated, colorful, and accomplished actors. Moving flawlessly between artistic mediums, Sheen's acting range is striking. Sheen was born Ramón Antonio Gerard Estevez in Dayton, Ohio, to Mary-Ann (Phelan), an Irish immigrant (from Borrisokane, County Tipperary), and ...	https://m.media-amazon.com/images/M/MV5BOTM1MTA5MTY0MV5BMl5BanBnXkFtZTcwMTQ4OTUzMg@@._V1_FMjpg_UX1000_.jpg	Born:  August 3,  1940  in Dayton, Ohio, USA	
226	nm0001592	/name/nm0001592	 Joe Pantoliano\n(I)\n	With more than 100 film, television and stage credits to his name, Joseph Peter Pantoliano is a prolific American character actor who has played many diverse and memorable roles, from Guido in Risky Business (1983) to Eddie Moscone in Midnight Run (1988), Cosmo Renfro in The Fugitive (1993), Cypher in The Matrix (1999) and Teddy in Memento (2000). ...	https://m.media-amazon.com/images/M/MV5BMTA5NjgwODU4NDZeQTJeQWpwZ15BbWU3MDE0NzUwNDQ@._V1_FMjpg_UX1000_.jpg	Born:  September 12,  1951  in Hoboken, New Jersey, USA	
225	nm0001602	/name/nm0001602	Guy Pearce	Guy Edward Pearce was born 5 October, 1967 in Cambridgeshire, England, UK to Margaret Anne and Stuart Graham Pearce. His father was born in Auckland, New Zealand, to English and Scottish parents, while Guy's mother is English. Pearce and his family initially traveled to Australia for two years, after his father was offered the position of Chief ...	https://m.media-amazon.com/images/M/MV5BMTgyNzc2NzY3Nl5BMl5BanBnXkFtZTgwNTMzMzAwMjE@._V1_FMjpg_UX1000_.jpg	Born:  October 5,  1967  in Ely, Cambridgeshire, England, UK	
217	nm0000038	/name/nm0000038	Grace Kelly	On November 12, 1929, Grace Patricia Kelly was born in Philadelphia, Pennsylvania to wealthy parents. Her girlhood was uneventful for the most part, but one of the things she desired was to become an actress which she had decided on at an early age. After her high school graduation in 1947, Grace struck out on her own, heading to New York's bright...	https://m.media-amazon.com/images/M/MV5BMTgzNjI4MzY1NF5BMl5BanBnXkFtZTYwMTM4MzQ2._V1_FMjpg_UX1000_.jpg	Born:  November 12,  1929  in Philadelphia, Pennsylvania, USA	Died:  September 14,  1982  (age 52) in Monaco
222	nm0000457	/name/nm0000457	John Hurt	One of stage, screen and TV's finest transatlantic talents, slight, gravel-voiced, pasty-looking John Vincent Hurt was born on January 22, 1940, in Shirebrook, a coal mining village, in Derbyshire, England. The youngest child of Phyllis (Massey), an engineer and one-time actress, and Reverend Arnould Herbert Hurt, an Anglican clergyman and ...	https://m.media-amazon.com/images/M/MV5BMTM1NTgyMTAyOV5BMl5BanBnXkFtZTcwMTE4MjQwNA@@._V1_FMjpg_UX1000_.jpg	Born:  January 22,  1940  in Chesterfield, Derbyshire, England, UK	Died:  January 25,  2017  (age 77) in East Runton, Cromer, Norfolk, England, UK
227	nm0642988	/name/nm0642988	 Jack Oakie\n(I)\n(1903–1978)\n	"America's Joyboy," beefy, plump-faced comedian Jack Oakie, was one of the funniest top and second banana jokesters of stage, radio and especially film's "Golden Age." He would accomplish so much despite the fact that he was "functionally deaf" throughout his career and performed primarily with the aid of lip reading or vibrations. The stories vary...	https://m.media-amazon.com/images/M/MV5BNGMyMThjZGItYmYwZC00YTkxLWI1MGMtMDExZDdkYjFjZTRhXkEyXkFqcGdeQXVyMzI5NDcxNzI@._V1_FMjpg_UX1000_.jpg	Born:  November 12,  1903  in Sedalia, Missouri, USA	Died:  January 23,  1978  (age 74) in Los Angeles, California, USA
228	nm0000261	/name/nm0000261	 Karen Allen\n(I)\n	Karen Jane Allen was born in Carrollton, rural southern Illinois, to Patricia (Howell), a teacher, and Carroll Thompson Allen, an FBI agent. She spent her first 10 years traveling around the country with her parents and two sisters. She was always "the new girl in school." Acting did not really cross Allen's mind until she was in her early 20s, ...	https://m.media-amazon.com/images/M/MV5BMTg2NjgyMjQwMF5BMl5BanBnXkFtZTcwNzkwMjE3MQ@@._V1_FMjpg_UX1000_.jpg	Born:  October 5,  1951  in Carrollton, Illinois, USA	
229	nm0293550	/name/nm0293550	 Paul Freeman\n(I)\n	Probably one of Britain's most underrated actors, Paul Freeman has accumulated literally hundreds of screen credits over several decades, most notably as the main villain in the Steven Spielberg classic Raiders of the Lost Ark (1981), and he has worked extensively in the theatre, but he has managed to avoid becoming a star or even a household name...	https://m.media-amazon.com/images/M/MV5BMjA4Mzc2NjU2N15BMl5BanBnXkFtZTcwNzYzMDAxMw@@._V1_FMjpg_UX1000_.jpg	Born:  January 18,  1943  in Barnet, Hertfordshire, England, UK	
230	nm0004937	/name/nm0004937	 Jamie Foxx\n	Jamie Foxx is an American actor, singer and comedian. He won an Academy Award for Best Actor, BAFTA Award for Best Actor in a Leading Role, and Golden Globe Award for Best Actor in a Musical or Comedy, for his work in the biographical film Ray (2004). The same year, he was nominated for the Academy Award for Best Supporting Actor for his role in ...	https://m.media-amazon.com/images/M/MV5BMTkyNjY1NDg3NF5BMl5BanBnXkFtZTgwNjA2MTg0MzE@._V1_FMjpg_UX1000_.jpg	Born:  December 13,  1967  in Terrell, Texas, USA	
231	nm0910607	/name/nm0910607	 Christoph Waltz\n	Christoph Waltz is an Austrian-German actor. He is known for his work with American filmmaker Quentin Tarantino, receiving acclaim for portraying SS-Standartenführer Hans Landa in Inglourious Basterds (2009) and bounty hunter Dr. King Schultz in Django Unchained (2012). For each performance, he won an Academy Award, a BAFTA Award, and a Golden ...	https://m.media-amazon.com/images/M/MV5BMTM4MDk3OTYxOF5BMl5BanBnXkFtZTcwMDk5OTUwOQ@@._V1_FMjpg_UX1000_.jpg	Born:  October 4,  1956  in Vienna, Austria	
232	nm0003697	/name/nm0003697	Florian Henckel von Donnersmarck	Florian Henckel von Donnersmarck was born on May 2, 1973 in Cologne, North Rhine-Westphalia, Germany as Florian Maria Georg Christian Graf Henckel von Donnersmarck. He is a director and writer, known for The Lives of Others (2006), Werk ohne Autor (2018) and The Tourist (2010). He is married to Christiane Asschenfeldt. They have three children.	https://m.media-amazon.com/images/M/MV5BMTI0MTk2NDY5OV5BMl5BanBnXkFtZTcwODY2ODQ1MQ@@._V1_FMjpg_UX1000_.jpg	Born:  May 2,  1973  in Cologne, North Rhine-Westphalia, Germany	
233	nm0618057	/name/nm0618057	 Ulrich Mühe\n(1953–2007)\n	Ulrich Mühe was born on June 20, 1953 in Grimma, East Germany as Friedrich Hans Ulrich Mühe. He was an actor and director, known for The Lives of Others (2006), Funny Games (1997) and Der letzte Zeuge (1998). He was married to Susanne Lothar, Jenny Gröllmann and Annegret Hahn. He died on July 22, 2007 in Walbeck, Saxony-Anhalt, Germany.	https://m.media-amazon.com/images/M/MV5BMTcwNzQ0OTAxOV5BMl5BanBnXkFtZTcwNDcyODczMQ@@._V1_FMjpg_UX1000_.jpg	Born:  June 20,  1953  in Grimma, East Germany	Died:  July 22,  2007  (age 54) in Walbeck, Saxony-Anhalt, Germany
234	nm0311476	/name/nm0311476	 Martina Gedeck\n	Martina Gedeck was born in Munich. After spending a year in the US, she studied drama at the Berlin University of the Arts. Martina's film career began while she was still at drama school. Her filmography covers practically all genres of film. Gedeck has won a total of 23 major cinema and TV awards. She was nominated as Europe's best actress on her...	https://m.media-amazon.com/images/M/MV5BMTQ2MjY3MDYwNV5BMl5BanBnXkFtZTcwMTQ0MjAxNA@@._V1_FMjpg_UX1000_.jpg	Born:  September 14,  1961  in Munich, Bavaria, Germany	
235	nm0462407	/name/nm0462407	 Sebastian Koch\n(I)\n	On stage, television or the movie theatre screen Sebastian Koch is undeniably one of Germany s most multi-faceted and successful actors. Born in Karlsruhe, Germany, May 31, 1962, he spent his childhood and youth in Stuttgart, southwestern Germany. He planned to become a musician, but in the late seventies a Stuttgart theater production by director...	https://m.media-amazon.com/images/M/MV5BODEzMjY3MjQtNjc5Mi00MDAzLWFhNTUtZGU0ZDQ5MjE5NTIzXkEyXkFqcGdeQXVyMjExMjAwOTk@._V1_FMjpg_UX1000_.jpg	Born:  May 31,  1962  in Karlsruhe, Baden-Württemberg, Germany	
236	nm0000040	/name/nm0000040	Stanley Kubrick	Stanley Kubrick was born in Manhattan, New York City, to Sadie Gertrude (Perveler) and Jacob Leonard Kubrick, a physician. His family were Jewish immigrants (from Austria, Romania, and Russia). Stanley was considered intelligent, despite poor grades at school. Hoping that a change of scenery would produce better academic performance, Kubrick's ...	https://m.media-amazon.com/images/M/MV5BMTIwMzAwMzg1MV5BMl5BanBnXkFtZTYwMjc4ODQ2._V1_FMjpg_UX1000_.jpg	Born:  July 26,  1928  in New York City, New York, USA	Died:  March 7,  1999  (age 70) in Harpenden, Hertfordshire, England, UK
237	nm0932229	/name/nm0932229	 Calder Willingham\n(1922–1995)\n			Born:  December 23,  1922  in Atlanta, Georgia, USA	Died:  February 21,  1995  (age 72) in Laconia, New Hampshire, USA
238	nm0000018	/name/nm0000018	 Kirk Douglas\n(I)\n(1916–2020)\n	Cleft-chinned, steely-eyed and virile star of international cinema who rose from being "the ragman's son" (the name of his best-selling 1988 autobiography) to become a bona fide superstar, Kirk Douglas, also known as Issur Danielovitch Demsky, was born on December 9, 1916 in Amsterdam, New York. His parents, Bryna (Sanglel) and Herschel ...	https://m.media-amazon.com/images/M/MV5BMTc1NDc0MjI5NV5BMl5BanBnXkFtZTYwMDE1MjM2._V1_FMjpg_UX1000_.jpg	Born:  December 9,  1916  in Amsterdam, New York, USA	Died:  February 5,  2020  (age 103) in Beverly Hills, California, USA
239	nm0576127	/name/nm0576127	 Ralph Meeker\n(1920–1988)\n	Burly American character actor Ralph Meeker first acted on stage at his alma mater, Northwestern University, alongside other budding performers Charlton Heston and Patricia Neal. He graduated as a music major because his dean had discouraged him from pursuing a theatrical career. Ignoring that advice, Meeker nevertheless moved to New York to study...	https://m.media-amazon.com/images/M/MV5BNDUyMTg5MjA2MF5BMl5BanBnXkFtZTcwNzUxMjMxOA@@._V1_FMjpg_UX1000_.jpg	Born:  November 21,  1920  in Minneapolis, Minnesota, USA	Died:  August 5,  1988  (age 67) in Woodland Hills, Los Angeles, California, USA
240	nm0579663	/name/nm0579663	 Adolphe Menjou\n(1890–1963)\n	The words "suave" and "debonair" became synonymous with the name Adolphe Menjou in Hollywood, both on- and off-camera. The epitome of knavish, continental charm and sartorial opulence, Menjou, complete with trademark waxy black mustache, evolved into one of Hollywood's most distinguished of artists and fashion plates, a tailor-made scene-stealer, ...	https://m.media-amazon.com/images/M/MV5BMTg2NzgyMTE3M15BMl5BanBnXkFtZTYwNTIwMTM2._V1_FMjpg_UX1000_.jpg	Born:  February 18,  1890  in Pittsburgh, Pennsylvania, USA	Died:  October 29,  1963  (age 73) in Beverly Hills, Los Angeles, California, USA
241	nm2371802	/name/nm2371802	 Thomas Kail\n	Thomas Kail is a director and producer, known for Hamilton (2020), Fosse/Verdon (2019) and Grease Live! (2016).	https://m.media-amazon.com/images/M/MV5BMzg2OTQ1NjAxN15BMl5BanBnXkFtZTgwNjU2MzYwMjI@._V1_FMjpg_UX1000_.jpg		
243	nm2375857	/name/nm2375857	 Ron Chernow\n	Ron Chernow is a writer and producer, known for Hamilton (2020), Titan: The Life of John D. Rockefeller and Untitled Ulysses S. Grant Project.	https://m.media-amazon.com/images/M/MV5BNWMwODUyNDktODViZS00M2JmLTgyZDItZTQ0Yjc5ZGJlNmZkXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_FMjpg_UX1000_.jpg		
242	nm0592135	/name/nm0592135	Lin-Manuel Miranda	Lin-Manuel Miranda wrote the first incarnation of "In the Heights" his sophomore year at Wesleyan University in Connecticut. Off-Broadway, "In The Heights" received nine Drama Desk nominations, including best music, best lyrics, and it won the award for outstanding ensemble performance; received the Lucille Lortel Award and Outer Critics Circle ...	https://m.media-amazon.com/images/M/MV5BMTU0MDM2Mzg0OV5BMl5BanBnXkFtZTgwMjA1MDE2MDI@._V1_FMjpg_UX1000_.jpg	Born:  January 16,  1980  in New York City, New York, USA	
244	nm5623883	/name/nm5623883	 Phillipa Soo\n	Phillipa Soo was born on May 31, 1990 in Libertyville, Illinois, USA as Phillipa Anne Soo. She is an actress, known for Hamilton (2020), Over the Moon (2020) and Moana (2016). She has been married to Steven Pasquale since September 24, 2017.	https://m.media-amazon.com/images/M/MV5BYjM0MmQ1NzMtMzNkMi00YjFkLWJmZWQtNmJhY2VkODIwYzFlXkEyXkFqcGdeQXVyNTA5OTkyNDI@._V1_FMjpg_UX1000_.jpg	Born:  May 31,  1990  in Libertyville, Illinois, USA	
245	nm1502434	/name/nm1502434	 Leslie Odom Jr.\n	Born in New York. Grew up in Philadelphia with his parents and little sister. Attended Carnegie Mellon University in Pittsburgh, Pennsylvania. Graduated and moved to Los Angeles in the summer of 2003.	https://m.media-amazon.com/images/M/MV5BODU4ZjgzNTUtY2Y2Yy00ZTA2LWI4ZGUtNjQxMzRhNmIzYjlhXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_FMjpg_UX1000_.jpg	Born:  August 6,  1981  in Queens, New York, USA	
246	nm0004056	/name/nm0004056	Andrew Stanton	Andrew Stanton has been a major creative force at Pixar Animation Studios since 1990, when he became the second animator and ninth employee to join the company's elite group of computer animation pioneers. As Vice President, Creative he currently oversees all shorts and feature projects at the studio. Stanton wrote and directed the Academy Award®-...	https://m.media-amazon.com/images/M/MV5BMTY0MTIyMzAzNF5BMl5BanBnXkFtZTcwNDUzNjQ0Nw@@._V1_FMjpg_UX1000_.jpg	Born:  December 3,  1965  in Boston, Massachusetts, USA	
248	nm0123785	/name/nm0123785	 Ben Burtt\n	Ben Burtt was born in New York, USA. Though he is a writer, an editor and a director, he is best known for his work as a sound designer. Ben has worked on many Pixar and Star Trek movies and all of the Star Wars movies. He is credited for creating Chewbacca's voice and sounds as well as the voice of Yoda and several others.	https://m.media-amazon.com/images/M/MV5BMTg5NTY4NjY1OV5BMl5BanBnXkFtZTcwNjQwNzkyMg@@._V1_FMjpg_UX1000_.jpg	Born:  July 12,  1948  in Jamesville, New York, USA	
249	nm2264184	/name/nm2264184	 Elissa Knight\n(I)\n	Elissa Knight was born on April 15, 1975 in Santa Cruz, California, USA. She is known for her work on WALL·E (2008), Cars (2006) and Inside Out (2015).	https://m.media-amazon.com/images/M/MV5BMjA2NTY0MTAxN15BMl5BanBnXkFtZTcwNjY2MjY3MQ@@._V1_FMjpg_UX1000_.jpg	Born:  April 15,  1975  in Santa Cruz, California, USA	
250	nm0307531	/name/nm0307531	 Jeff Garlin\n	As a multi-talented comedian who encompasses writing, producing, directing, acting and performing stand-up comedy, Jeff Garlin has honed a successful career that started at Second City in his hometown of Chicago. Influenced by the comedians of his childhood (such as Richard Pryor, Woody Allen, and Shelley Berman), Garlin enjoys telling stories, ...	https://m.media-amazon.com/images/M/MV5BMzY4MDE4OTk2MF5BMl5BanBnXkFtZTcwNjYxMzA2MQ@@._V1_FMjpg_UX1000_.jpg	Born:  June 5,  1962  in Chicago, Illinois, USA	
251	nm0680846	/name/nm0680846	Todd Phillips	Todd Phillips was born on December 20, 1970 in Brooklyn, New York City, New York, USA as Todd Bunzl. He is a producer and director, known for Joker (2019), Due Date (2010) and Old School (2003).	https://m.media-amazon.com/images/M/MV5BNGY5MWRjM2MtNDkzNC00MDcwLWE2ZjYtOWNlZmM3MWIyNGZmXkEyXkFqcGdeQXVyMTAxMjM5NTA4._V1_FMjpg_UX1000_.jpg	Born:  December 20,  1970  in Brooklyn, New York City, New York, USA	
252	nm0798788	/name/nm0798788	 Scott Silver\n(I)\n	Scott Silver is a writer, known for Joker (2019), The Fighter (2010) and Johns (1996).			
247	nm0230032	/name/nm0230032	Pete Docter	Pete Docter is the Oscar®-winning director of "Monsters, Inc.," "Up," and "Inside Out," and Chief Creative Officer at Pixar Animation Studios. He is currently directing Pixar's feature film "Soul" with producer Dana Murray, which is set to release June 19, 2020. Starting at Pixar in 1990 as the studio's third animator, Docter collaborated and help ...	https://m.media-amazon.com/images/M/MV5BYTg1M2JlZDUtYWFiNS00MGU1LTkwMTgtNjQ4ODcyOWUyMGRlXkEyXkFqcGdeQXVyMTk3NjYyMQ@@._V1_FMjpg_UX1000_.jpg	Born:  October 9,  1968  in Bloomington, Minnesota, USA	
601	nm1732981	/name/nm1732981	Martin McDonagh	Martin McDonagh was born on March 26, 1970 in Camberwell, London, England. He is a writer and director, known for In Bruges (2008), Seven Psychopaths (2012) and Three Billboards Outside Ebbing, Missouri (2017).	https://m.media-amazon.com/images/M/MV5BMTgxMTQ2Njc5NF5BMl5BanBnXkFtZTcwMDU2Mzc1MQ@@._V1_FMjpg_UX1000_.jpg	Born:  March 26,  1970  in Camberwell, London, England, UK	
253	nm5939164	/name/nm5939164	 Zazie Beetz\n	Zazie Beetz (born c. 1991) is a German-American actress known for the role of Vanessa on Atlanta (2016), as well as for starring in Deadpool 2 (2018), Applesauce (2015), and Still Here (2020). Born in Berlin, Germany, to a German father and an African-American mother, she was raised in Manhattan (New York City) speaking both German and English at ...	https://m.media-amazon.com/images/M/MV5BOWNiMjFkZTYtN2I1YS00YTcwLWFiM2MtYWZmY2YzNTEwMDYwXkEyXkFqcGdeQXVyNjEyNzc2MTI@._V1_FMjpg_UX1000_.jpg	Born:  May 25,  1991  in Mitte, Berlin, Germany	
254	nm0001167	/name/nm0001167	 Shelley Duvall\n	Shelley Alexis Duvall was born in Fort Worth, Texas, the first child to Bobbie Ruth (Massengale, 1929-2020), a real estate broker, and Robert Richardson Duvall (1919-1994), a lawyer. At the time of her birth, her mother was visiting her grandmother in Fort Worth, though Duvall was raised in Houston. During her childhood, Shelley's mother ...	https://m.media-amazon.com/images/M/MV5BNjE4MTY1Mzk0N15BMl5BanBnXkFtZTgwOTQzNDE2MDE@._V1_FMjpg_UX1000_.jpg	Born:  July 7,  1949  in Houston, Texas, USA	
255	nm0515950	/name/nm0515950	 Danny Lloyd\n(I)\n	Danny Lloyd was selected for the role of Danny Torrance in Stanley Kubrick's The Shining (1980) because of his ability to concentrate for extended periods of time. Because of his age (6) and the genre of The Shining (1980) Danny was closely guarded by Kubrick during filming and didn't know it was a horror film until several years later. Despite ...	https://m.media-amazon.com/images/M/MV5BZDBkN2I0YTktY2I4Ni00MTQ1LWIwY2YtZDUzMzAwZDRmZDQ0XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_FMjpg_UX1000_.jpg	Born:  October 13,  1972  in Chicago, Illinois, USA	
261	nm1165110	/name/nm1165110	 Chris Hemsworth\n	Christopher Hemsworth was born on August 11, 1983 in Melbourne, Victoria, Australia & raised in Phillip Island, Victoria, Australia. Chris was born to Leonie Hemsworth (née van Os), an English teacher & Craig Hemsworth, a social-services counselor and his brothers are actors, Liam Hemsworth & Luke Hemsworth. He is of Dutch (from his immigrant ...	https://m.media-amazon.com/images/M/MV5BOTU2MTI0NTIyNV5BMl5BanBnXkFtZTcwMTA4Nzc3OA@@._V1_FMjpg_UX1000_.jpg	Born:  August 11,  1983  in Melbourne, Victoria, Australia	
264	nm0102818	/name/nm0102818	 Charles Brackett\n(1892–1969)\n	Charles Brackett, born in Saratoga Springs, New York, of Scottish ancestry, followed in his attorney-father's footsteps and graduated with a law degree from Harvard University in 1920. He practised law for several years, before commencing work as drama critic for The New Yorker (1925-29), in addition to submitting short stories to The Saturday ...	https://m.media-amazon.com/images/M/MV5BOGFiMTYxYTctNTU4Mi00NGRiLTg3MDAtOGI1YWYzNDE3OWU5XkEyXkFqcGdeQXVyMzI5NDcxNzI@._V1_FMjpg_UX1000_.jpg	Born:  November 26,  1892  in Saratoga Springs, New York, USA	Died:  March 9,  1969  (age 76) in Los Angeles, California, USA
263	nm0000697	/name/nm0000697	Billy Wilder	Originally planning to become a lawyer, Billy Wilder abandoned that career in favor of working as a reporter for a Viennese newspaper, using this experience to move to Berlin, where he worked for the city's largest tabloid. He broke into films as a screenwriter in 1929 and wrote scripts for many German films until Adolf Hitler came to power in ...	https://m.media-amazon.com/images/M/MV5BMTA2MDc2MDIwMzFeQTJeQWpwZ15BbWU2MDA3MTg0Ng@@._V1_FMjpg_UX1000_.jpg	Born:  June 22,  1906  in Sucha, Galicia, Austria-Hungary [now Sucha Beskidzka, Malopolskie, Poland]	Died:  March 27,  2002  (age 95) in West Los Angeles, California, USA
256	nm0751577	/name/nm0751577	Anthony Russo	Anthony Russo was born on February 3, 1970 in Cleveland, Ohio, USA as Anthony J. Russo. He is a producer and director, known for Captain America: The Winter Soldier (2014), Avengers: Endgame (2019) and Avengers: Infinity War (2018).	https://m.media-amazon.com/images/M/MV5BMTc2NjM5MTM0Ml5BMl5BanBnXkFtZTgwMTY3ODczNjM@._V1_FMjpg_UX1000_.jpg	Born:  February 3,  1970  in Cleveland, Ohio, USA	
257	nm0751648	/name/nm0751648	Joe Russo	Joe Russo was born on July 8, 1971 in Cleveland, Ohio, USA as Joseph Vincent Russo. He is a producer and director, known for Avengers: Endgame (2019), Avengers: Infinity War (2018) and Captain America: The Winter Soldier (2014).	https://m.media-amazon.com/images/M/MV5BMTc2NzY1NTY5OF5BMl5BanBnXkFtZTgwNjY3ODczNjM@._V1_FMjpg_UX1000_.jpg	Born:  July 8,  1971  in Cleveland, Ohio, USA	
265	nm0000034	/name/nm0000034	 William Holden\n(I)\n(1918–1981)\n	William Holden was born William Franklin Beedle, Jr. in O'Fallon, Illinois, to Mary Blanche (Ball), a schoolteacher, and William Franklin Beedle, Sr., an industrial chemist. He came from a wealthy family (the Beedles) that moved to Pasadena, California, when he was three. In 1937, while studying chemistry at Pasadena Junior College, he was signed ...	https://m.media-amazon.com/images/M/MV5BNzVhMjZiMzItMTIxYi00M2EzLWE0YWMtYTZhODk4NDQ2ZDJmXkEyXkFqcGdeQXVyMDUyOTUyNQ@@._V1_FMjpg_UX1000_.jpg	Born:  April 17,  1918  in O'Fallon, Illinois, USA	Died:  November 12,  1981  (age 63) in Santa Monica, California, USA
266	nm0841797	/name/nm0841797	 Gloria Swanson\n(I)\n(1899–1983)\n	Gloria Swanson went to public schools in Chicago; Key West, Florida; and San Juan, Puerto Rico. Her film debut was as an extra in The Fable of Elvira and Farina and the Meal Ticket (1915). From the following year on, she had leading roles in pictures for Keystone, then a year with Triangle, and, in 1919, a contract with Cecil B. DeMille. DeMille ...	https://m.media-amazon.com/images/M/MV5BMTU3NzIxOTUwOV5BMl5BanBnXkFtZTYwNDM5MTI2._V1_FMjpg_UX1000_.jpg	Born:  March 27,  1899  in Chicago, Illinois, USA	Died:  April 4,  1983  (age 84) in New York City, New York, USA
267	nm0002233	/name/nm0002233	 Erich von Stroheim\n(1885–1957)\n	Erich von Stroheim was born Erich Oswald Stroheim in 1885, in Vienna, Austria, to Johanna (Bondy), from Prague, and Benno Stroheim, a hatter from Gleiwitz, Germany (now Gliwice, Poland). His family was Jewish. After spending some time working in his father's hat factory, he emigrated to America around 1909. Working in various jobs he arrived in ...	https://m.media-amazon.com/images/M/MV5BMjEyMTYwNTcyOF5BMl5BanBnXkFtZTYwMzQ2MjI2._V1_FMjpg_UX1000_.jpg	Born:  September 22,  1885  in Vienna, Austria-Hungary [now Austria]	Died:  May 12,  1957  (age 71) in Maurepas, Seine-et-Oise [now Yvelines], France
268	nm0002005	/name/nm0002005	 Agatha Christie\n(1890–1976)\n	Agatha was born as "Agatha Mary Clarissa Miller" in 1890 to Frederick Alvah Miller and Clara Boehmer. Agatha was of American and British descent, her father being American and her mother British. Her father was a relatively affluent stockbroker. Agatha received home education from early childhood to when she turned 12-years-old in 1902. Her ...	https://m.media-amazon.com/images/M/MV5BMTU3OTYzMzY4NV5BMl5BanBnXkFtZTcwMDIxOTIyOA@@._V1_FMjpg_UX1000_.jpg	Born:  September 15,  1890  in Torquay, Devon, England, UK	Died:  January 12,  1976  (age 85) in Wallingford, Oxfordshire, England, UK
269	nm0000061	/name/nm0000061	 Tyrone Power\n(1914–1958)\n	Tyrone Power was one of the great romantic swashbuckling stars of the mid-twentieth century, and the third Tyrone Power of four in a famed acting dynasty reaching back to the eighteenth century. His great-grandfather was the first Tyrone Power (1795-1841), a famed Irish comedian. His father, known to historians as Tyrone Power Sr., but to his ...	https://m.media-amazon.com/images/M/MV5BMTMyNTEzOTA2OF5BMl5BanBnXkFtZTYwNDk5MDM2._V1_FMjpg_UX1000_.jpg	Born:  May 5,  1914  in Cincinnati, Ohio, USA	Died:  November 15,  1958  (age 44) in Madrid, Spain
270	nm0000017	/name/nm0000017	 Marlene Dietrich\n(I)\n(1901–1992)\n	Her father was a police lieutenant and imbued in her a military attitude to life. Marlene was known in school for her "bedroom eyes" and her first affairs were at this stage in her life - a professor at the school was terminated. She entered the cabaret scene in 1920s Germany, first as a spectator then as a cabaret singer. In 1924, she married and...	https://m.media-amazon.com/images/M/MV5BMTI0NTcyMTM5OF5BMl5BanBnXkFtZTYwOTkzMDU2._V1_FMjpg_UX1000_.jpg	Born:  December 27,  1901  in Schöneberg, Brandenburg, Prussia, German Empire [now part of Berlin, Germany]	Died:  May 6,  1992  (age 90) in Paris, France
271	nm0001452	/name/nm0001452	 Charles Laughton\n(1899–1962)\n	Charles Laughton was born in Scarborough, Yorkshire, England, to Eliza (Conlon) and Robert Laughton, hotel keepers of Irish and English descent, respectively. He was educated at Stonyhurst (a highly esteemed Jesuit college in England) and at the Royal Academy of Dramatic Art (received gold medal). His first appearance on stage was in 1926. ...	https://m.media-amazon.com/images/M/MV5BMTMzOTQ0MTMzNF5BMl5BanBnXkFtZTYwNzkyNjI2._V1_FMjpg_UX1000_.jpg	Born:  July 1,  1899  in Victoria Hotel, Scarborough, North Yorkshire, England, UK	Died:  December 15,  1962  (age 63) in Hollywood, Los Angeles, California, USA
272	nm2130108	/name/nm2130108	 Bob Persichetti\n	Bob Persichetti is known for his work on Spider-Man: Into the Spider-Verse (2018), Puss in Boots (2011) and The Curse of the Were-Rabbit (2005).	https://m.media-amazon.com/images/M/MV5BMjM1ZmFlZDUtNTQ4YS00OTU5LTkzYTktNjcwODkwZGQ3NjUxXkEyXkFqcGdeQXVyNTI5NjIyMw@@._V1_FMjpg_UX1000_.jpg		
273	nm0709056	/name/nm0709056	 Peter Ramsey\n(III)\n	Peter Ramsey is the director of Dreamworks Animation's 2012 feature film "Rise Of The Guardians". He also directed the Halloween TV special, "Monsters vs. Aliens: Mutant Pumpkins from Outer Space" as well as serving as a story artist on several of Dreamworks Animation's feature films. Prior to joining Dreamworks, he worked as a storyboard artist ...	https://m.media-amazon.com/images/M/MV5BMjRhNzUxZmMtNTIxZS00ZDhiLWFjMmItOTI4YmU2ZGNiYjk4XkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_FMjpg_UX1000_.jpg		
274	nm0520488	/name/nm0520488	 Phil Lord\n	Phil Lord was born on July 12, 1975 in Miami, Florida, USA as Philip A. Lord. He is a producer and writer, known for Spider-Man: Into the Spider-Verse (2018), The Lego Movie (2014) and Clone High (2002).	https://m.media-amazon.com/images/M/MV5BOTI5NTUwMTAwOV5BMl5BanBnXkFtZTcwMDIxMDgzOQ@@._V1_FMjpg_UX1000_.jpg	Born:  July 12,  1975  in Miami, Florida, USA	
275	nm0745247	/name/nm0745247	 Rodney Rothman\n	Rodney Rothman is a writer and producer, known for Spider-Man: Into the Spider-Verse (2018), 22 Jump Street (2014) and Forgetting Sarah Marshall (2008).	https://m.media-amazon.com/images/M/MV5BNDA3ZmQ0ZjYtOTlkOS00YTQxLThlZDItMTA1MjZhYzIxZjNjXkEyXkFqcGdeQXVyMTA5MTAzMDY@._V1_FMjpg_UX1000_.jpg		
276	nm4271336	/name/nm4271336	 Shameik Moore\n	Born in Atlanta of Jamaican descent, Shameik Moore booked his first lead role of Malcolm in Rick Famuyiwa's Dope (2015), produced by Forest Whitaker and Nina Yang Bongiovi. The film, which is narrated by Forest Whitaker, also stars Tony Revolori, Kiersey Clemons, Zoë Kravitz, Kimberly Elise and ASAP Rocky. His strong musical ability was recognized ...	https://m.media-amazon.com/images/M/MV5BMjAwNDU2OTc5M15BMl5BanBnXkFtZTgwOTk0ODMyNDE@._V1_FMjpg_UX1000_.jpg	Born:  May 4,  1995  in Atlanta, Georgia, USA	
277	nm2159926	/name/nm2159926	 Jake Johnson\n(XVI)\n	Jake Johnson (born Mark Jake Johnson Weinberger; May 28, 1978) is an American actor, comedian and director, most commonly known for playing Nick Miller in the Fox comedy series New Girl opposite Zooey Deschanel, for which he has received a Teen Choice Award nomination among others. Johnson also co-starred in the 2009 film Paper Heart and the 2012 ...	https://m.media-amazon.com/images/M/MV5BMjExMzc5NDM0Nl5BMl5BanBnXkFtZTcwOTU3MDU3OA@@._V1_FMjpg_UX1000_.jpg	Born:  May 28,  1978  in Evanston, Illinois, USA	
278	nm2794962	/name/nm2794962	 Hailee Steinfeld\n	Hailee Steinfeld was born on December 11, 1996 in Tarzana, California, to Cheri (Domasin), an interior designer, and Peter Steinfeld, a personal fitness trainer. She has a brother, Griffin. Her uncle is Jake Steinfeld, a fitness trainer, and her great-uncle is actor Larry Domasin. Her father is of Ashkenazi Jewish descent and her mother's ancestry...	https://m.media-amazon.com/images/M/MV5BMGFmZDVhZDUtZWIyNC00NzBjLTg0ZGEtY2FhMjJlZWJhZjBlXkEyXkFqcGdeQXVyMTcwNzE4OTI@._V1_FMjpg_UX1000_.jpg	Born:  December 11,  1996  in Tarzana, Los Angeles, California, USA	
279	nm0661791	/name/nm0661791	 Chan-wook Park\n(I)\n	Chan-wook Park was born on August 23, 1963 in Seoul, South Korea. He is a producer and director, known for Ah-ga-ssi (2016), Bakjwi (2009) and Oldeuboi (2003). He is married to Eun-hee Kim. They have one child.	https://m.media-amazon.com/images/M/MV5BMTgyODk3MTU5OV5BMl5BanBnXkFtZTcwMTc3NjcyMQ@@._V1_FMjpg_UX1000_.jpg	Born:  August 23,  1963  in Seoul, South Korea	
280	nm1628380	/name/nm1628380	 Garon Tsuchiya\n	Contribute to IMDb. Add a bio, trivia, and more.\nUpdate information for Garon Tsuchiya »			
281	nm2057405	/name/nm2057405	 Nobuaki Minegishi\n	Contribute to IMDb. Add a bio, trivia, and more.\nUpdate information for Nobuaki Minegishi »			
282	nm0158856	/name/nm0158856	 Choi Min-sik\n	Choi Min-shik first made a name for himself in theater before breaking into the film world with a role in Park Chong-won's acclaimed film 'Our Twisted Hero' (1992). In the mid-nineties he continued to act in theater productions as well as in several TV dramas, including Moon Over Seoul with Han Seok-gyu. 1997 marked his return to motion pictures, ...	https://m.media-amazon.com/images/M/MV5BNDg4MDM3NDA0Ml5BMl5BanBnXkFtZTgwODExMzMyMjE@._V1_FMjpg_UX1000_.jpg	Born:  January 22,  1962  in Seoul, South Korea	
283	nm0949167	/name/nm0949167	 Yoo Ji-Tae\n	Yoo Ji-Tae was born on April 13, 1976 in Seoul, South Korea. He is an actor and director, known for Oldeuboi (2003), Donggam (2000) and Mai Ratima (2012).	https://m.media-amazon.com/images/M/MV5BOTQ3MzE5ZWUtMjkzMS00MDQ5LTlkNWMtYjQxMmM0NmRiZDUwXkEyXkFqcGdeQXVyNDcyMjQ4MzU@._V1_FMjpg_UX1000_.jpg	Born:  April 13,  1976  in Seoul, South Korea	
284	nm1367246	/name/nm1367246	 Kang Hye-jeong\n	Kang Hye-jeong was born on January 4, 1982 in South Korea. She is an actress, known for Oldeuboi (2003), Welkkeom tu Dongmakgol (2005) and Nabi (2001). She has been married to Tablo (Lee Seon-Woong) since October 26, 2009. They have one child.	https://m.media-amazon.com/images/M/MV5BOTgyMDY1MDE5M15BMl5BanBnXkFtZTcwNDI3MDExOA@@._V1_FMjpg_UX1000_.jpg	Born:  January 4,  1982  in South Korea	
285	nm0301274	/name/nm0301274	 Neil Gaiman\n	Neil Gaiman is an English author of short fiction, novels, comic books, graphic novels, audio theatre, and films. He is best known for the comic book series The Sandman and novels Stardust, American Gods, Coraline, and The Graveyard Book. As a child and a teenager, Gaiman read the works of C. S. Lewis, J. R. R. Tolkien, Lewis Carroll, Mary Shelley,...	https://m.media-amazon.com/images/M/MV5BMTczNjc1NjIzMV5BMl5BanBnXkFtZTYwNDU2MjYz._V1_FMjpg_UX1000_.jpg	Born:  November 10,  1960  in Portchester, England, UK	
286	nm0559444	/name/nm0559444	 Yôji Matsuda\n(I)\n	Yôji Matsuda was born on October 19, 1967 in Fukuoka, Japan. He is an actor, known for Kaze no tani no Naushika (1984), Mononoke-hime (1997) and Toki o kakeru shôjo (2006).		Born:  October 19,  1967  in Fukuoka, Japan	
287	nm0410942	/name/nm0410942	 Yuriko Ishida\n(I)\n	Ishida Yuriko was born in Nagoya, Aichi Prefecture. Her family moved to Tokyo soon after. She travelled to and lived in Hyogo Prefecture, Kanagawa Prefecture and Taiwan as a child due to her father's work. During elementary school she participated in the Junior Olympics as a swimmer. She returned to Tokyo at age fifteen. She was scouted to model ...	https://m.media-amazon.com/images/M/MV5BNmVjZTM1NjktZGNhMC00MDIxLWE4MWItYWFhYTBmYTY3NmY4XkEyXkFqcGdeQXVyMjg0MTI5NzQ@._V1_FMjpg_UX1000_.jpg	Born:  October 3,  1969  in Tokyo, Japan	
288	nm0849100	/name/nm0849100	 Yûko Tanaka\n(I)\n	Yûko Tanaka was born on April 29, 1955 in Osaka, Japan. She is known for her work on Amagi goe (1983), Itsuka dokusho suruhi (2005) and Hibi (2005). She has been married to Kenji Sawada since 1989.		Born:  April 29,  1955  in Osaka, Japan	
289	nm0816143	/name/nm0816143	 Terry Southern\n(I)\n(1924–1995)\n	Terry Southern began writing satirical, outrageous fiction at the age of 12, when he took it upon himself to rewrite various Edgar Allan Poe stories "because they didn't go far enough". After serving as a lieutenant in the army in World War II, he began writing short stories in earnest while studying at the Sorbonne. "The Accident", published in ...		Born:  May 1,  1924  in Alvarado, Texas, USA	Died:  October 29,  1995  (age 71) in New York City, New York, USA
290	nm0000634	/name/nm0000634	 Peter Sellers\n(I)\n(1925–1980)\n	Often credited as the greatest comedian of all time, Peter Sellers was born Richard Henry Sellers to a well-off acting family in 1925 in Southsea, a suburb of Portsmouth. He was the son of Agnes Doreen "Peg" (Marks) and William "Bill" Sellers. His parents worked in an acting company run by his grandmother. His father was Protestant and his mother ...	https://m.media-amazon.com/images/M/MV5BMTI0MjE1MjczMF5BMl5BanBnXkFtZTYwMDIxNTQ2._V1_FMjpg_UX1000_.jpg	Born:  September 8,  1925  in Southsea, Hampshire, England, UK	Died:  July 24,  1980  (age 54) in Lambeth, London, England, UK
291	nm0001715	/name/nm0001715	 George C. Scott\n(1927–1999)\n	George C. Scott was an immensely talented actor, a star of the big screen, stage and television. He was born on October 18, 1927 in Wise, Virginia, to Helena Agnes (Slemp) and George Dewey Scott. At the age of eight, his mother died, and his father, an executive at Buick, raised him. In 1945, he joined the United States Marines and spent four ...	https://m.media-amazon.com/images/M/MV5BMTIwNTk5NjkzOF5BMl5BanBnXkFtZTYwNTAwOTQ2._V1_FMjpg_UX1000_.jpg	Born:  October 18,  1927  in Wise, Virginia, USA	Died:  September 22,  1999  (age 71) in Westlake Village, California, USA
292	nm0001330	/name/nm0001330	 Sterling Hayden\n(I)\n(1916–1986)\n	Born to George & Frances Simonson Walter, and named Sterling Relyea Walter. Father died in 1925. Adopted by stepfather 'James Hayden' renamed Sterling Walter Hayden. Grew up in New Hampshire, Massachusetts, Pennsylvania, Washington D.C., and Maine. Though very poor, attended prep school at Wassookeag School in Dexter, Maine. Ran away to sea at 17,...	https://m.media-amazon.com/images/M/MV5BMjE0MTk1NjkzN15BMl5BanBnXkFtZTcwMzA1MjE1Mg@@._V1_FMjpg_UX1000_.jpg	Born:  March 26,  1916  in Upper Montclair, New Jersey, USA	Died:  May 23,  1986  (age 70) in Sausalito, California, USA
123	nm0004266	/name/nm0004266	Anne Hathaway	Anne Jacqueline Hathaway was born in Brooklyn, New York, to Kate McCauley Hathaway, an actress, and Gerald T. Hathaway, a lawyer, both originally from Philadelphia. She is of mostly Irish descent, along with English, German, and French. Her first major role came in the short-lived television series Get Real (1999). She gained widespread ...	https://m.media-amazon.com/images/M/MV5BMTRhNzQ3NGMtZmQ1Mi00ZTViLTk3OTgtOTk0YzE2YTgwMmFjXkEyXkFqcGdeQXVyNzg5MzIyOA@@._V1_FMjpg_UX1000_.jpg	Born:  November 12,  1982  in Brooklyn, New York City, New York, USA	
294	nm0340580	/name/nm0340580	 Harry Grey\n(II)\n(1901–1980)\n	Real name Harry/Herschel Goldberg. Born in Russia in 1901, son of Israel and Celia Goldberg, emigrated to USA in 1905. Dropped out from schooling at grade 7. Brother of Hyman Goldberg, a syndicated columnist and food critic for the New York Post and author of several books including "Our Man in the Kitchen", a compilation of recipes from his ...		Born:  November 2,  1901  in Kiev, Russian Empire [now Ukraine]	Died:  October,  1980  (age 78) in New York City, New York, USA
295	nm0073053	/name/nm0073053	 Leonardo Benvenuti\n(1923–2000)\n	Leonardo Benvenuti was born on September 8, 1923 in Florence, Tuscany, Italy. He was a writer and assistant director, known for Speriamo che sia femmina (1986), Amici miei (1975) and Guendalina (1957). He was married to Christiana Di Vita. He died on November 3, 2000 in Rome, Lazio, Italy.		Born:  September 8,  1923  in Florence, Tuscany, Italy	Died:  November 3,  2000  (age 77) in Rome, Lazio, Italy
296	nm0000249	/name/nm0000249	 James Woods\n(I)\n	James Howard Woods was born on April 18, 1947 in Vernal, Utah, the son of Martha A. (Smith) and Gail Peyton Woods, a U.S. Army intelligence officer who died during Woods' childhood. James is of Irish, English, and German descent. He grew up in Warwick, Rhode Island, with his mother and stepfather Thomas E. Dixon. He graduated from Pilgrim High ...	https://m.media-amazon.com/images/M/MV5BMTM3NTEzNjI5NV5BMl5BanBnXkFtZTcwNjQzOTkwNA@@._V1_FMjpg_UX1000_.jpg	Born:  April 18,  1947  in Vernal, Utah, USA	
297	nm0001527	/name/nm0001527	 Elizabeth McGovern\n(I)\n	Daughter of a law professor at Northwestern University, she moved with her family to Los Angeles when he transferred to the University of California at Los Angeles (U.C.L.A.). She began acting in school plays at North Hollywood High, graduated from The Oakwood School and then continued her stage training at the American Conservatory Theatre in San...	https://m.media-amazon.com/images/M/MV5BMjI3MzM5ODYyNF5BMl5BanBnXkFtZTcwODIwNzk4Ng@@._V1_FMjpg_UX1000_.jpg	Born:  July 18,  1961  in Evanston, Illinois, USA	
298	nm1396121	/name/nm1396121	Makoto Shinkai	Makoto Shinkai is a Japanese director, writer, producer, animator, editor, cinematographer, voice actor, manga artist and former graphic designer. Shinkai studied Japanese literature at Chuo University where he was a member of juvenile literature club where he drew picture books. In 1999, Shinkai released She and Her Cat, a five-minute short piece ...	https://m.media-amazon.com/images/M/MV5BN2IxMTg5YmEtMWQ5NC00NDQyLTliOWQtMjkxYTU5NDFmMmQyXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_FMjpg_UX1000_.jpg	Born:  February 9,  1973  in Koumi, Japan	
299	nm1126340	/name/nm1126340	 Ryûnosuke Kamiki\n	Ryunosuke Kamiki was born in Fujimi. He was diagnosed with a rare disease soon after he was born and was lucky enough to become one of the 1% who survived the disease. To celebrate this miracle, his mother decided to register him as a child actor in an agency to record his growth. He acted in his first TV ad when he was 2 & quickly became one of ...	https://m.media-amazon.com/images/M/MV5BNzlkYzdjYWEtOTkyNC00NDNhLWIyNTItZmFjNWQxZDZmNzFlXkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_FMjpg_UX1000_.jpg	Born:  May 19,  1993  in Fujimi, Japan	
300	nm4759838	/name/nm4759838	 Mone Kamishiraishi\n	Mone Kamishiraishi was born on January 27, 1998 in Kagoshima, Japan. She is an actress, known for Kimi no na wa. (2016), Maiko wa redî (2014) and Ôkami kodomo no Ame to Yuki (2012).	https://m.media-amazon.com/images/M/MV5BODM5YWY3ODMtNTEyOC00MWNmLWJjYTgtMjQ1Y2QyZjY4MjAzXkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_FMjpg_UX1000_.jpg	Born:  January 27,  1998  in Kagoshima, Japan	
301	nm6954008	/name/nm6954008	 Ryô Narita\n	Ryô Narita was born on November 22, 1993 in Saitama, Japan. He is an actor, known for Kimi no na wa. (2016), Katsuben! (2019) and Sayonara kuchibiru (2019).	https://m.media-amazon.com/images/M/MV5BNzBmNDcxYzktYzIyOC00NDFkLWFjMjMtNDA2NjlkNmMwMTkzXkEyXkFqcGdeQXVyMjg0MTI5NzQ@._V1_FMjpg_UX1000_.jpg	Born:  November 22,  1993  in Saitama, Japan	
302	nm0318429	/name/nm0318429	 David Giler\n(1943–2020)\n	David Giler was born on July 23, 1943 in New York City, New York, USA as David Kevin Giler. He was a producer and writer, known for Aliens (1986), Alien³ (1992) and Alien: Resurrection (1997). He was married to Nancy Kwan. He died on December 19, 2020 in Bangkok, Thailand.	https://m.media-amazon.com/images/M/MV5BZTc4NTgxZTItNzEzYy00YjcwLTk3MWUtMmUwMzdhM2U5OTI1XkEyXkFqcGdeQXVyMDc2NTEzMw@@._V1_FMjpg_UX1000_.jpg	Born:  July 23,  1943  in New York City, New York, USA	Died:  December 19,  2020  (age 77) in Bangkok, Thailand
220	nm0000244	/name/nm0000244	Sigourney Weaver	Sigourney Weaver was born Susan Alexandra Weaver, on October 8, 1949, in Leroy Hospital in New York City. Her father, TV producer Sylvester L. Weaver Jr., originally wanted to name her Flavia, because of his passion for Roman history (he had already named her elder brother Trajan). Her mother, Elizabeth Inglis, was a British actress who had ...	https://m.media-amazon.com/images/M/MV5BMTk1MTcyNTE3OV5BMl5BanBnXkFtZTcwMTA0MTMyMw@@._V1_FMjpg_UX1000_.jpg	Born:  October 8,  1949  in Manhattan, New York City, New York, USA	
303	nm0000299	/name/nm0000299	 Michael Biehn\n	Michael Connell Biehn was born on July 31, 1956 in Anniston, Alabama, to Marcia (Connell) and Don Biehn, a lawyer. He grew up in Lincoln, Nebraska, and at age 14 moved with his family to Lake Havasu, Arizona, where he won a drama scholarship to the University of Arizona. He left prematurely two years later to pursue an acting career in Hollywood. ...	https://m.media-amazon.com/images/M/MV5BMTM2OTI1MTEyOV5BMl5BanBnXkFtZTcwMzM5NTQ4NA@@._V1_FMjpg_UX1000_.jpg	Born:  July 31,  1956  in Anniston, Alabama, USA	
304	nm0001343	/name/nm0001343	 Carrie Henn\n	Carrie Henn was born on May 7, 1976 in Panama City, Florida, USA as Caroline Marie Henn. She is an actress, known for Aliens (1986), Triborn and Thunder Island (2020). She has been married to Nathan Kutcher since July 2, 2005. They have one child.	https://m.media-amazon.com/images/M/MV5BMTI4OTY5Nzg5NV5BMl5BanBnXkFtZTcwMzM0ODEyMw@@._V1_FMjpg_UX1000_.jpg	Born:  May 7,  1976  in Panama City, Florida, USA	
310	nm0000973	/name/nm0000973	 Benjamin Bratt\n(I)\n	The middle of five children, Bratt hails from a close-knit family. His mother, an indigenous Quechua Peruvian from Lima, moved to the U.S. at age 14. He grew up in San Francisco. He is known for his roles in the films Traffic (2000), Miss Congeniality (2000), and Despicable Me 2 (2013). He is married to actress Talisa Soto.	https://m.media-amazon.com/images/M/MV5BMTUwNDIwOTI5N15BMl5BanBnXkFtZTcwMDcwMjQyNg@@._V1_FMjpg_UX1000_.jpg	Born:  December 16,  1963  in San Francisco, California, USA	
258	nm1321655	/name/nm1321655	Christopher Markus	Christopher Markus was born on January 2, 1970 in Buffalo, New York, USA. He is a writer and producer, known for Avengers: Endgame (2019), Avengers: Infinity War (2018) and Captain America: The First Avenger (2011). He has been married to Claire Saunders since October 22, 2011.	https://m.media-amazon.com/images/M/MV5BMjAxMDAwODYwOV5BMl5BanBnXkFtZTcwMjc5OTEwNg@@._V1_FMjpg_UX1000_.jpg	Born:  January 2,  1970  in Buffalo, New York, USA	
259	nm1321656	/name/nm1321656	Stephen McFeely	Stephen McFeely is a writer and producer, known for Avengers: Endgame (2019), Captain America: The First Avenger (2011) and Avengers: Infinity War (2018).	https://m.media-amazon.com/images/M/MV5BZmJlZTFkOTAtYTY0Yi00NjIxLTllYWQtNDgwN2RhY2VlNGVmXkEyXkFqcGdeQXVyNzY1ODU1OTk@._V1_FMjpg_UX1000_.jpg		
260	nm0000375	/name/nm0000375	Robert Downey Jr.	Robert Downey Jr. has evolved into one of the most respected actors in Hollywood. With an amazing list of credits to his name, he has managed to stay new and fresh even after over four decades in the business. Downey was born April 4, 1965 in Manhattan, New York, the son of writer, director and filmographer Robert Downey Sr. and actress Elsie Downey...	https://m.media-amazon.com/images/M/MV5BNzg1MTUyNDYxOF5BMl5BanBnXkFtZTgwNTQ4MTE2MjE@._V1_FMjpg_UX1000_.jpg	Born:  April 4,  1965  in Manhattan, New York City, New York, USA	
311	nm0262635	/name/nm0262635	 Chris Evans\n(V)\n	Christopher Robert Evans began his acting career in typical fashion: performing in school productions and community theatre. He was born in Boston, Massachusetts, the son of Lisa (Capuano), who worked at the Concord Youth Theatre, and G. Robert Evans III, a dentist. His uncle is former U.S. Representative Mike Capuano. Chris's father is of half ...	https://m.media-amazon.com/images/M/MV5BMTU2NTg1OTQzMF5BMl5BanBnXkFtZTcwNjIyMjkyMg@@._V1_FMjpg_UX1000_.jpg	Born:  June 13,  1981  in Boston, Massachusetts, USA	
262	nm0749263	/name/nm0749263	Mark Ruffalo	Award-winning actor Mark Ruffalo was born on November 22, 1967, in Kenosha, Wisconsin, of humble means to father Frank Lawrence Ruffalo, a construction painter and Marie Rose (Hebert), a stylist and hairdresser; his father's ancestry is Italian and his mother is of half French-Canadian and half Italian descent. Mark moved with his family to ...	https://m.media-amazon.com/images/M/MV5BNWIzZTI1ODUtZTUzMC00NTdiLWFlOTYtZTg4MGZkYmU4YzNlXkEyXkFqcGdeQXVyNTExOTk5Nzg@._V1_FMjpg_UX1000_.jpg	Born:  November 22,  1967  in Kenosha, Wisconsin, USA	
312	nm1701024	/name/nm1701024	Nadine Labaki	Nadine Labaki was born on February 18, 1974 in Beirut, Lebanon. She is an actress and director, known for Et maintenant on va où? (2011), Capharnaüm (2018) and Sukkar banat (2007). She has been married to Khaled Mouzanar since October 2007.	https://m.media-amazon.com/images/M/MV5BMTk2NDgxMTQyMV5BMl5BanBnXkFtZTgwNTk3MTA3NTE@._V1_FMjpg_UX1000_.jpg	Born:  February 18,  1974  in Beirut, Lebanon	
313	nm2764802	/name/nm2764802	 Jihad Hojeily\n				
314	nm9862858	/name/nm9862858	 Zain Al Rafeea\n	Zain Al Rafeea is an actor, known for Capharnaüm (2018). Zain was a Syrian refugee when he was discovered in the streets of Beirut by director Nadine Labaki. At the time, his life shared similarities with that of his character of the same name. He and his family have since been resettled in Norway.	https://m.media-amazon.com/images/M/MV5BY2VhZDgzM2MtN2YyMi00ODFhLThmNjMtZDZjZmU4OTc1ZTg0XkEyXkFqcGdeQXVyNTI5NjIyMw@@._V1_FMjpg_UX1000_.jpg	Born:  October 10,  2004  in Daraa, Syria	
315	nm9862859	/name/nm9862859	 Yordanos Shiferaw\n	Yordanos Shiferaw is an actress, known for Capharnaüm (2018).			
316	nm9862860	/name/nm9862860	 Boluwatife Treasure Bankole\n	Boluwatife Treasure Bankole is an actress, known for Capharnaüm (2018).	https://m.media-amazon.com/images/M/MV5BY2FjMzE1NzAtYTBmMi00Nzg0LThhNjgtYjM3ODRlZjk4NjhiXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_FMjpg_UX1000_.jpg		
318	nm0050332	/name/nm0050332	 Alan Ball\n(I)\n	Alan Ball was born on May 13, 1957 in Atlanta, Georgia, USA as Alan E. Ball. He is a producer and writer, known for American Beauty (1999), Six Feet Under (2001) and True Blood (2008).	https://m.media-amazon.com/images/M/MV5BMjA5NDA4MzExMV5BMl5BanBnXkFtZTcwMzA4NDI5MQ@@._V1_FMjpg_UX1000_.jpg	Born:  May 13,  1957  in Atlanta, Georgia, USA	
319	nm0000906	/name/nm0000906	 Annette Bening\n	Annette Carol Bening was born on May 29, 1958 in Topeka, Kansas, the youngest of four children of Shirley (Ashley), a soloist and church singer, and Arnett Grant Bening, an insurance salesman. She is of German and British Isles ancestry. Her family moved to California when she was young, and she grew up there. She graduated from San Francisco ...	https://m.media-amazon.com/images/M/MV5BMTc4ODQ1ODM5Ml5BMl5BanBnXkFtZTcwOTU2NDk3OQ@@._V1_FMjpg_UX1000_.jpg	Born:  May 29,  1958  in Topeka, Kansas, USA	
320	nm0000301	/name/nm0000301	 Thora Birch\n	For some people, oatmeal starts the day off right - for Thora Birch, it launched a healthy career in front of the camera. It's hard to believe that the actress, who slunk into stardom with her turn as the disillusioned daughter in American Beauty (1999), is even related to the apple-cheeked blonde who once gazed up at Quaker Oats (R) spokesman ...	https://m.media-amazon.com/images/M/MV5BZDY3ZjBkNzAtOTdhYS00NjU1LTg0MTEtOGNjODk0NWU4YTNjXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_FMjpg_UX1000_.jpg	Born:  March 11,  1982  in Los Angeles, California, USA	
322	nm0908824	/name/nm0908824	 Randall Wallace\n(I)\n	Randall Wallace was born on July 28, 1949 in Jackson, Tennessee, USA. He is a writer and producer, known for We Were Soldiers (2002), Pearl Harbor (2001) and Braveheart (1995).	https://m.media-amazon.com/images/M/MV5BMTI5OTQzMzM3Nl5BMl5BanBnXkFtZTYwOTc4MTg0._V1_FMjpg_UX1000_.jpg	Born:  July 28,  1949  in Jackson, Tennessee, USA	
321	nm0000154	/name/nm0000154	Mel Gibson	Mel Columcille Gerard Gibson was born January 3, 1956 in Peekskill, New York, USA, as the sixth of eleven children of Hutton Gibson, a railroad brakeman, and Anne Patricia (Reilly) Gibson (who died in December of 1990). His mother was Irish, from County Longford, while his American-born father is of mostly Irish descent. Mel and his family moved to...	https://m.media-amazon.com/images/M/MV5BNTUzOTMwNTM0OV5BMl5BanBnXkFtZTcwNDQwMTUxMw@@._V1_FMjpg_UX1000_.jpg	Born:  January 3,  1956  in Peekskill, New York, USA	
323	nm0000521	/name/nm0000521	 Sophie Marceau\n	Sophie Marceau was born Sophie Danièle Sylvie Maupu in Paris, France, to Simone (Morisset), a shop assistant, and Benoît Maupu, a truck driver. She grew up far from the studio spotlights. When she was 14 she was living in the Paris suburb of Gentilly with her father. She learned from friends that director Claude Pinoteau was looking for new faces ...	https://m.media-amazon.com/images/M/MV5BMTc5NjA5OTk4Ml5BMl5BanBnXkFtZTYwNzkyNzYz._V1_FMjpg_UX1000_.jpg	Born:  November 17,  1966  in Paris, France	
324	nm0001526	/name/nm0001526	 Patrick McGoohan\n(1928–2009)\n	Though born in America, Irish actor Patrick McGoohan rose to become the number-one British TV star in the 1950s to 1960s era. His parents moved to Ireland when he was very young and McGoohan acquired a neutral accent that sounds at home in British or American dialogue. He was an avid stage actor and performed hundreds of times in small and large ...	https://m.media-amazon.com/images/M/MV5BMTY3MTAzMTExOF5BMl5BanBnXkFtZTcwNzEwNjUyMg@@._V1_FMjpg_UX1000_.jpg	Born:  March 19,  1928  in Astoria, Queens, New York City, New York, USA	Died:  January 13,  2009  (age 80) in Santa Monica, California, USA
326	nm0452878	/name/nm0452878	 Ryûzô Kikushima\n(1914–1989)\n	Ryûzô Kikushima was born on January 28, 1914 in Japan. He was a writer and producer, known for Tengoku to jigoku (1963), Yojinbo (1961) and Sanjuro (1962). He died on March 18, 1989 in Japan.		Born:  January 28,  1914  in Japan	Died:  March 18,  1989  (age 75) in Japan
327	nm0755403	/name/nm0755403	 Yutaka Sada\n(1911–2017)\n	Yutaka Sada was born on March 30, 1911 in Tokyo, Japan. He was an actor, known for Tengoku to jigoku (1963), Yojinbo (1961) and Sanjuro (1962). He died in 2017.	https://m.media-amazon.com/images/M/MV5BMjQ2MjkwZGMtZWVlNy00NWUxLTlkNGYtMjhiZGE1ZDA4NmI5XkEyXkFqcGdeQXVyMDUyOTUyNQ@@._V1_FMjpg_UX1000_.jpg	Born:  March 30,  1911  in Tokyo, Japan	Died:  2017  (age 105)
328	nm0005124	/name/nm0005124	John Lasseter	Although born in Hollywood John and his twin sister, Johanna were raised in Wittier near Los Angeles. His parents were Jewell Mae (Risley), an art teacher, and Paul Eual Lasseter, a parts manager at a Chevrolet dealership. His mother's profession contributed to his interest in animation and particularly the Bugs Bunny and Daffy Duck cartoons which...	https://m.media-amazon.com/images/M/MV5BMTQ5NTczNjE5MV5BMl5BanBnXkFtZTcwMTA1MTQ3Mg@@._V1_FMjpg_UX1000_.jpg	Born:  January 12,  1957  in Hollywood, Los Angeles, California, USA	
330	nm0725543	/name/nm0725543	 Don Rickles\n(1926–2017)\n	Donald Jay Rickles was born May 8, 1926 in New York. Following the Golden Era of Hollywood, he remained active until early 2017. He got his start in night clubs, toiling for over 20 years, until 1958, when he made his film debut in Run Silent Run Deep (1958). The movie was a big hit. Afterward, Rickles continued acting, starring in films like X (...	https://m.media-amazon.com/images/M/MV5BMTY0NTk1NzY1M15BMl5BanBnXkFtZTcwNjk4NDMwNA@@._V1_FMjpg_UX1000_.jpg	Born:  May 8,  1926  in Jackson Heights, Queens, New York City, New York, USA	Died:  April 6,  2017  (age 90) in Los Angeles, California, USA
331	nm0000583	/name/nm0000583	Wolfgang Petersen	This director seems to shine most when making movies that can best be described as part action movies/part disaster movies. Beginning with Outbreak (1995) about the outbreak of a killer virus. This film had shades of an Irwin Allen disaster movie, The Swarm (1978), about the outbreak of killer bees. Both films had the military and scientists clash,...	https://m.media-amazon.com/images/M/MV5BMTczNTQ5ODY4OV5BMl5BanBnXkFtZTYwMDcyMDI1._V1_FMjpg_UX1000_.jpg	Born:  March 14,  1941  in Emden, Germany	
332	nm0118164	/name/nm0118164	 Lothar G. Buchheim\n(1918–2007)\n	Lothar G. Buchheim was born on February 6, 1918 in Weimar, Germany as Lothar-Günther Buchheim. He was a writer and actor, known for Das Boot (1981), Das Boot (1985) and Das Boot (2018). He was married to Diethild Wickboldt. He died on February 22, 2007 in Starnberg, Bavaria, Germany.		Born:  February 6,  1918  in Weimar, Germany	Died:  February 22,  2007  (age 89) in Starnberg, Bavaria, Germany
333	nm0001638	/name/nm0001638	 Jürgen Prochnow\n	Born in Berlin, Germany, in 1941, Jürgen Prochnow is a leading actor of the German stage and screen. He was memorable as the submarine captain in the gritty WW II film Das Boot (1981), which brought him to international prominence. He has since starred in many well-received European and Hollywood productions.	https://m.media-amazon.com/images/M/MV5BMTgyNzQ3NDk4OF5BMl5BanBnXkFtZTYwMDgxMjA3._V1_FMjpg_UX1000_.jpg	Born:  June 10,  1941  in Berlin, Germany	
334	nm0344963	/name/nm0344963	 Herbert Grönemeyer\n	Herbert Grönemeyer was born on April 12, 1956 in Göttingen, Lower Saxony, Germany as Herbert Arthur Wiglev Clamor Grönemeyer. He is an actor and composer, known for Das Boot (1981), The American (2010) and A Most Wanted Man (2014). He was previously married to Anna Henkel-Grönemeyer.	https://m.media-amazon.com/images/M/MV5BMjcxNzgyOTk5Nl5BMl5BanBnXkFtZTcwNDE4MDkxNA@@._V1_FMjpg_UX1000_.jpg	Born:  April 12,  1956  in Göttingen, Lower Saxony, Germany	
335	nm0921044	/name/nm0921044	 Klaus Wennemann\n(1940–2000)\n	Klaus Wennemann was born on December 18, 1940 in Oer-Erkenschwick, North Rhine-Westphalia, Germany. He was an actor, known for Das Boot (1981), Der Fahnder (1984) and Das Boot (1985). He was married to Hedwig. He died on January 7, 2000 in Bad Aibling, Bavaria, Germany.		Born:  December 18,  1940  in Oer-Erkenschwick, North Rhine-Westphalia, Germany	Died:  January 7,  2000  (age 59) in Bad Aibling, Bavaria, Germany
329	nm0000741	/name/nm0000741	Tim Allen	Timothy Allen Dick was born on June 13, 1953, in Denver, Colorado, to Martha Katherine (Fox) and Gerald M. Dick. His father, a real estate salesman, was killed in a collision with a drunk driver while driving his family home from a University of Colorado football game, when Tim was eleven years old. His mother, a community service worker, ...	https://m.media-amazon.com/images/M/MV5BMTI5ODY0NTAwOF5BMl5BanBnXkFtZTcwOTI3NjQxMw@@._V1_FMjpg_UX1000_.jpg	Born:  June 13,  1953  in Denver, Colorado, USA	
325	nm0644823	/name/nm0644823	Hideo Oguni			Born:  July 9,  1904  in Aomori, Japan	Died:  February 5,  1996  (age 91)
336	nm0386246	/name/nm0386246	Rajkumar Hirani	Rajkumar Hirani is an Indian film director and editor. Hirani has directed five Hindi films, including Munna Bhai M.B.B.S., Lage Raho Munnabhai, 3 Idiots, PK and Sanju, and all of which have been commercial and critical successes. Most of which have won several awards, including the national awards. Among his awards, include 11 Filmfare Awards. He...	https://m.media-amazon.com/images/M/MV5BMTc3ODMzMjI2N15BMl5BanBnXkFtZTgwMjI5ODEzOTE@._V1_FMjpg_UX1000_.jpg	Born:  November 20,  1962  in Nagpur, Maharashtra, India	
337	nm0430785	/name/nm0430785	 Abhijat Joshi\n(I)\n	Abhijat Joshi is a writer and actor, known for 3 Idiots (2009), PK (2014) and Lage Raho Munna Bhai (2006).			
339	nm0534856	/name/nm0534856	 Madhavan\n(I)\n	Madhavan was born on June 1, 1970, in a Tamil-speaking family. At the age of 18 his college entrusted him with the responsibility of representing India as a Cultural Ambassador to Canada. A year later he and three others from his college were sent to Britain as army cadets and received training in the royal army, navy, and Air Force. While conducting...	https://m.media-amazon.com/images/M/MV5BOTllZTE4YTItNmFkNi00ZTQ0LWI3NzAtMzk2NGNhZmM2ZmU4XkEyXkFqcGdeQXVyOTc1MzM5MA@@._V1_FMjpg_UX1000_.jpg	Born:  June 1,  1970  in Jamshedpur, Bihar, India	
340	nm1587175	/name/nm1587175	 Mona Singh\n(I)\n	Mona Singh was born on October 8, 1981 in Chandigarh, India. She is an actress, known for 3 Idiots (2009), Jassi Jaissi Koi Nahin (2003) and Kya Huaa Tera Vaada (2012).	https://m.media-amazon.com/images/M/MV5BMzg5NzRiM2QtM2NiNS00MjFmLWI0Y2MtNmIyMDllMjhhMWM5XkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_FMjpg_UX1000_.jpg	Born:  October 8,  1981  in Chandigarh, India	
341	nm0787323	/name/nm0787323	Peter Shaffer	Peter Shaffer was born on May 15, 1926 in Liverpool, England as Peter Levin Shaffer. He is known for his work on Amadeus (1984), Equus (1977) and Follow Me (1972). He died on June 6, 2016 in County Cork, Ireland.	https://m.media-amazon.com/images/M/MV5BMTc5MTUxODU4OF5BMl5BanBnXkFtZTgwNzkxMTExOTE@._V1_FMjpg_UX1000_.jpg	Born:  May 15,  1926  in Liverpool, England, UK	Died:  June 6,  2016  (age 90) in County Cork, Ireland
342	nm0000719	/name/nm0000719	 F. Murray Abraham\n	Academy Award-winning actor F. Murray Abraham was born on October 24, 1939 in Pittsburgh, Pennsylvania and raised in El Paso, Texas. His father, Fred Abraham, was a Syrian (Antiochian Orthodox Christian) immigrant. His mother, Josephine (Stello) Abraham, was the daughter of Italian immigrants. Born with the first name "Murray", he added an "F." to...	https://m.media-amazon.com/images/M/MV5BNDQ2MzQ2ODYxM15BMl5BanBnXkFtZTcwODY3NTIxNw@@._V1_FMjpg_UX1000_.jpg	Born:  October 24,  1939  in Pittsburgh, Pennsylvania, USA	
343	nm0001371	/name/nm0001371	 Tom Hulce\n	Thomas Edward Hulce was born in Detroit, Michigan, and grew up in Plymouth, MI, where he was raised with his two sisters and older brother. He is the son of Joanna (Winkleman), who had sung professionally, and Raymond Albert Hulce, who worked for Ford. He has English, German, and Irish ancestry. Wanting to be a singer, Tom had to make a switch in ...	https://m.media-amazon.com/images/M/MV5BMTM0ODY0MTE0NF5BMl5BanBnXkFtZTcwOTQwNTIzOA@@._V1_FMjpg_UX1000_.jpg	Born:  December 6,  1953  in Detroit, Michigan, USA	
344	nm0000931	/name/nm0000931	 Elizabeth Berridge\n(I)\n	Elizabeth Berridge was born on May 2, 1962 in Westchester County, New York, USA. She is an actress, known for Amadeus (1984), Hidalgo (2004) and The Funhouse (1981). She has been married to Kevin Corrigan since March 2001. They have one child.	https://m.media-amazon.com/images/M/MV5BMTU2MDg1OTg3Nl5BMl5BanBnXkFtZTcwOTgxMTg5Nw@@._V1_FMjpg_UX1000_.jpg	Born:  May 2,  1962  in Westchester County, New York, USA	
345	nm1208167	/name/nm1208167	 Diane Kruger\n	Diane Kruger was born Diane Heidkrüger in Algermissen, near Hildesheim, Germany, to Maria-Theresa, a bank employee, and Hans-Heinrich Heidkrüger, a computer specialist. She studied ballet with the Royal Ballet in London before an injury ended her career. She returned to Germany and became a top fashion model. She later pursued acting and relocated...	https://m.media-amazon.com/images/M/MV5BMTM3MzY0Nzk2Ml5BMl5BanBnXkFtZTcwODQ0MTMyMw@@._V1_FMjpg_UX1000_.jpg	Born:  July 15,  1976  in Algermissen, Lower Saxony, West Germany	
346	nm0744834	/name/nm0744834	 Eli Roth\n	Eli Raphael Roth was born in Newton, Massachusetts, to Cora (Bialis), a painter, and Sheldon H. Roth, a psychoanalyst, psychiatrist, and clinical professor. His family is Jewish (from Austria, Hungary, Russia, and Poland). He began shooting Super 8 films at the age of eight, after watching Ridley Scott's Alien (1979) and vomiting, and deciding he ...	https://m.media-amazon.com/images/M/MV5BMTkyMjU0NDk2OF5BMl5BanBnXkFtZTgwMDY4MDE4NTM@._V1_FMjpg_UX1000_.jpg	Born:  April 18,  1972  in Boston, Massachusetts, USA	
347	nm0001814	/name/nm0001814	 Gus Van Sant\n	Gus Van Sant was born on July 24, 1952 in Louisville, Kentucky, USA as Gus Greene Van Sant Junior. He is a director and producer, known for Elephant (2003), My Own Private Idaho (1991) and Drugstore Cowboy (1989).	https://m.media-amazon.com/images/M/MV5BMTI2MDcxOTEzM15BMl5BanBnXkFtZTcwNjY0ODkyMg@@._V1_FMjpg_UX1000_.jpg	Born:  July 24,  1952  in Louisville, Kentucky, USA	
349	nm0000245	/name/nm0000245	 Robin Williams\n(I)\n(1951–2014)\n	Robin McLaurin Williams was born on Saturday, July 21st, 1951, in Chicago, Illinois, a great-great-grandson of Mississippi Governor and Senator, Anselm J. McLaurin. His mother, Laurie McLaurin (née Janin), was a former model from Mississippi, and his father, Robert Fitzgerald Williams, was a Ford Motor Company executive from Indiana. Williams had ...	https://m.media-amazon.com/images/M/MV5BNTYzMjc2Mjg4MF5BMl5BanBnXkFtZTcwODc1OTQwNw@@._V1_FMjpg_UX1000_.jpg	Born:  July 21,  1951  in Chicago, Illinois, USA	Died:  August 11,  2014  (age 63) in Tiburon, California, USA
338	nm0451148	/name/nm0451148	Aamir Khan	Aamir is doubtless one of the most dedicated actors in this world. With his recent successes in both the Indian and Chinese markets he has shouldered his way into becoming one of the world's biggest superstars. Undergoing rapid transformations in his body structure to better embody the variegated characters in his energetic films, Aamir has ...	https://m.media-amazon.com/images/M/MV5BMjAwMjk3NDUzN15BMl5BanBnXkFtZTcwNjI4MTY0NA@@._V1_FMjpg_UX1000_.jpg	Born:  March 14,  1965  in Bombay, Maharashtra, India	
348	nm0000255	/name/nm0000255	Ben Affleck	American actor and filmmaker Benjamin Géza Affleck-Boldt was born on August 15, 1972 in Berkeley, California, and was raised in Cambridge, Massachusetts. His mother, Chris Anne (née Boldt), is a school teacher, and his father, Timothy Byers Affleck, is a social worker; the two are divorced. Ben has a younger brother, actor Casey Affleck, who was ...	https://m.media-amazon.com/images/M/MV5BMzczNzNiMDAtMmUzZS00MTkwLWIwOTYtNmYyNjg3MTVkNThhXkEyXkFqcGdeQXVyMjA4MjI5MTA@._V1_FMjpg_UX1000_.jpg	Born:  August 15,  1972  in Berkeley, California, USA	
350	nm0549658	/name/nm0549658	 Richard Marquand\n(1937–1987)\n	Richard Marquand was born on September 22, 1937 in Llanishen, Cardiff, Glamorgan, Wales as Richard Alfred Marquand. He was a director and producer, known for Star Wars: Episode VI - Return of the Jedi (1983), Jagged Edge (1985) and Nowhere to Run (1993). He was married to Carol Bell and Josephine Marquand. He died on September 4, 1987 in Tunbridge...	https://m.media-amazon.com/images/M/MV5BMjgwY2ZkYjEtNzgxZi00ZDIyLWJhZWItZjg1NGQ4OWE5ZTZhXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_FMjpg_UX1000_.jpg	Born:  September 22,  1937  in Llanishen, Cardiff, Glamorgan, Wales, UK	Died:  September 4,  1987  (age 49) in Tunbridge Wells, Kent, England, UK
351	nm1244760	/name/nm1244760	Amole Gupte	Amole Gupte is an Indian screenwriter, actor, and director, known for his work on Bollywood films like Taare Zameen Par (Like Stars on Earth), Stanley ka dabba, Kaminey and others. He is also an actor in Bheja Fry 2 (2011), stanley Ka Dabba (2011),Urumi (2011) Phas gaye re obama (2010) and Kaminey.	https://m.media-amazon.com/images/M/MV5BZmNhMWQyOGYtYmZkMy00ZjdjLWE4N2QtYjc0NzEyZjViZWQzXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_FMjpg_UX1000_.jpg		
352	nm2594301	/name/nm2594301	 Darsheel Safary\n	Born in the same city and on the same month as his family friend Aamir Khan, Darsheel Safary (born March 9, 1997 in Mumbai, India) is an Indian child movie actor primarily working on starring in Hindi Bollywood films. He is best known for his acclaimed portrayal of a dyslexic child in the 2007 film Taare Zameen Par (Like Stars on Earth), a drama ...	https://m.media-amazon.com/images/M/MV5BMjYyYzViMmYtMjU4Yi00NGM3LWFjZTEtZmFkOGFmOTllY2I2XkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_FMjpg_UX1000_.jpg	Born:  March 9,  1996	
353	nm1538116	/name/nm1538116	 Tisca Chopra\n	Tisca is known for carefully choosing to be part of stories that needed to be brought to the people. With the burning desire to act, every endeavor of hers has been respected and applauded. Tisca has acted in over 50 feature films in different languages with many eminent directors like Aamir Khan, Prakash Jha, Sudhir Mishra, Abhinay Deo and others....	https://m.media-amazon.com/images/M/MV5BZTU4NzkyN2YtMDZkMy00NzJhLWFiYWQtOGU1NmUwMjk0NjgxXkEyXkFqcGdeQXVyMTE5NzgxOTM@._V1_FMjpg_UX1000_.jpg		
354	nm0000172	/name/nm0000172	 Harvey Keitel\n	American actor and producer Harvey Keitel was born on May 13, 1939 in Brooklyn, New York City, to Miriam (Klein) and Harry Keitel. An Oscar and Golden Globe Award nominee, he has appeared in films such as Martin Scorsese's Mean Streets (1973) and Taxi Driver (1976), Ridley Scott's The Duellists (1977) and Thelma & Louise (1991), Peter Yates' ...	https://m.media-amazon.com/images/M/MV5BMTcxMDcxMjgxOV5BMl5BanBnXkFtZTcwODc2NTk2MQ@@._V1_FMjpg_UX1000_.jpg	Born:  May 13,  1939  in Brooklyn, New York, USA	
355	nm0000619	/name/nm0000619	 Tim Roth\n(I)\n	Often mistaken for an American because of his skill at imitating accents, actor Tim Roth was born Timothy Simon Roth on May 14, 1961 in Lambeth, London, England. His mother, Ann, was a teacher and landscape painter. His father, Ernie, was a journalist who had changed the family name from "Smith" to "Roth"; Ernie was born in Brooklyn, New York, to ...	https://m.media-amazon.com/images/M/MV5BMjA5NTA3MDQyOV5BMl5BanBnXkFtZTcwODM4NDE3Mw@@._V1_FMjpg_UX1000_.jpg	Born:  May 14,  1961  in Dulwich, London, England, UK	
356	nm0000514	/name/nm0000514	 Michael Madsen\n(I)\n	Michael Madsen's long career spans nearly 40 years and more than 170 films in which he has played memorable characters in myriad box office hits, including: Kill Bill: Vol. 1 (2003), Kill Bill: Vol. 2 (2004) Sin City (2005), Hell Ride (2008), Die Another Day (2002), Donnie Brasco (1997), Species (1995), The Getaway (1994), Thelma & Louise (...	https://m.media-amazon.com/images/M/MV5BMTI4ODA5NzY2N15BMl5BanBnXkFtZTYwNjc3NTI1._V1_FMjpg_UX1000_.jpg	Born:  September 25,  1957  in Chicago, Illinois, USA	
357	nm0002009	/name/nm0002009	 Arthur C. Clarke\n(1917–2008)\n	Arthur C. Clarke was born in the seaside town of Minehead, Somerset, England in December 16, 1917. In 1936 he moved to London, where he joined the British Interplanetary Society. There he started to experiment with astronautic material in the BIS, write the BIS Bulletin and science fiction. During World War II, as a RAF officer, he was in charge ...	https://m.media-amazon.com/images/M/MV5BZDdlNDk3ZDMtNzdkOS00MjhjLWIxYzQtMjA2NzJhOGIxYWVmXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_FMjpg_UX1000_.jpg	Born:  December 16,  1917  in Minehead, Somerset, England, UK	Died:  March 19,  2008  (age 90) in Colombo, Sri Lanka
358	nm0001158	/name/nm0001158	 Keir Dullea\n	Tall, slim, remote and boyishly handsome, one of Keir Dullea's most arresting features is his pale blue eyes, which featured in a number of watershed films of the 1960s. His major breakthrough (providing him legendary status) was the starring role as astronaut Dave Bowman in Stanley Kubrick's 2001: A Space Odyssey. After that, he persevered quite ...	https://m.media-amazon.com/images/M/MV5BMTczODgxNDU1NV5BMl5BanBnXkFtZTYwMzQxOTI2._V1_FMjpg_UX1000_.jpg	Born:  May 30,  1936  in Cleveland, Ohio, USA	
359	nm0516972	/name/nm0516972	 Gary Lockwood\n(I)\n	Gary Lockwood was born in Van Nuys, California. He attended the University of California at Los Angeles on a football scholarship. He began his career as a movie stuntman, and a stand-in for Anthony Perkins, prior to his acting debut in 1959 in an uncredited bit role in Warlock (1959). He also appeared as a police officer in Perry Mason: The Case ...	https://m.media-amazon.com/images/M/MV5BMTQ0MDMzNjQ1Nl5BMl5BanBnXkFtZTYwNzMxOTI2._V1_FMjpg_UX1000_.jpg	Born:  February 21,  1937  in Van Nuys, California, USA	
360	nm0843213	/name/nm0843213	 William Sylvester\n(1922–1995)\n	William Sylvester was born on January 31, 1922 in Oakland, California, USA as William R. Silvester. He was an actor, known for 2001: A Space Odyssey (1968), Gorgo (1961) and Riding with Death (1976). He was married to Veronica Hurst and Sheila Sweet. He died on January 25, 1995 in Sacramento, California.	https://m.media-amazon.com/images/M/MV5BMzAzMDc5OTI1NV5BMl5BanBnXkFtZTcwNDQ1MzY2OQ@@._V1_FMjpg_UX1000_.jpg	Born:  January 31,  1922  in Oakland, California, USA	Died:  January 25,  1995  (age 72) in Sacramento, California, USA
361	nm0004716	/name/nm0004716	 Darren Aronofsky\n	Darren Aronofsky was born February 12, 1969, in Brooklyn, New York. Growing up, Darren was always artistic: he loved classic movies and, as a teenager, he even spent time doing graffiti art. After high school, Darren went to Harvard University to study film (both live-action and animation). He won several film awards after completing his senior ...	https://m.media-amazon.com/images/M/MV5BMTI1NTQ0NjU3MF5BMl5BanBnXkFtZTcwOTQ0MTUyMg@@._V1_FMjpg_UX1000_.jpg	Born:  February 12,  1969  in Brooklyn, New York City, New York, USA	
362	nm0782968	/name/nm0782968	Hubert Selby Jr.	American writer. He was born and brought up in New York City, the son of Hubert and Adalin Selby. His father was a merchant seaman and former coal-miner from Kentucky who had settled in the Red Hook district of Brooklyn. Hubert Sr. returned to the merchant marine after the outbreak of World War Two, where in 1944 Hubert Jr. followed him. He had ...	https://m.media-amazon.com/images/M/MV5BNDczNmMzZTEtOGZlYy00YzBjLWFhMDgtOTZhNmZkNGVkMGU2XkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_FMjpg_UX1000_.jpg	Born:  July 23,  1928  in Brooklyn, New York, USA	Died:  April 26,  2004  (age 75) in Los Angeles, California, USA
363	nm0000995	/name/nm0000995	 Ellen Burstyn\n	Ellen Burstyn was born in Detroit, Michigan, to Correine Marie (Hamel) and John Austin Gillooly. She is of Irish, French/French-Canadian, Pennsylvania Dutch (German), and Native American ancestry.. She worked a number of jobs before she became an actress. At 14, she was a short-order cook at a lunch counter. After graduating from Detroit's Cass ...	https://m.media-amazon.com/images/M/MV5BMTU4MjYxMDc3MF5BMl5BanBnXkFtZTYwNzU3MDIz._V1_FMjpg_UX1000_.jpg	Born:  December 7,  1932  in Detroit, Michigan, USA	
364	nm0001467	/name/nm0001467	 Jared Leto\n	Jared Leto is a very familiar face in recent film history. Although he has always been the lead vocals, rhythm guitar, and songwriter for American band Thirty Seconds to Mars, Leto is an accomplished actor merited by the numerous, challenging projects he has taken in his life. He is known to be selective about his film roles. Jared Leto was born in...	https://m.media-amazon.com/images/M/MV5BMTczMjUwNDUzMF5BMl5BanBnXkFtZTgwNDA4OTAzMTE@._V1_FMjpg_UX1000_.jpg	Born:  December 26,  1971  in Bossier City, Louisiana, USA	
367	nm2105585	/name/nm2105585	 Tobias Lindholm\n	Tobias Lindholm was born on July 5, 1977 in Næstved, Denmark. He is a writer and director, known for Druk (2020), Jagten (2012) and Kapringen (2012).	https://m.media-amazon.com/images/M/MV5BMjE0ODExNjY0NV5BMl5BanBnXkFtZTcwMzIxMDc2OQ@@._V1_FMjpg_UX1000_.jpg	Born:  July 5,  1977  in Næstved, Denmark	
366	nm0899121	/name/nm0899121	Thomas Vinterberg	With Sidste omgang (1993) (Last Round), his graduation short from The National Film School of Denmark, he got an early taste of critical success. He received the Jury's and Producers' Awards at the International Student Film Fest in Munich and won the 1st Prize at the Tel Aviv Film Fest. Popular success followed with his breakthrough short fiction...	https://m.media-amazon.com/images/M/MV5BMTAzNzE4OTAwMTdeQTJeQWpwZ15BbWU2MDEwNjMyNQ@@._V1_FMjpg_UX1000_.jpg	Born:  May 19,  1969  in Copenhagen, Denmark	
368	nm0586568	/name/nm0586568	 Mads Mikkelsen\n	Mads Mikkelsen's great successes parallel those achieved by the Danish film industry since the mid-1990s. He was born in Østerbro, Copenhagen, to Bente Christiansen, a nurse, and Henning Mikkelsen, a banker. Starting out as a low-life pusher/junkie in the 1996 success Pusher (1996), he slowly grew to become one of Denmark's biggest movie actors. ...	https://m.media-amazon.com/images/M/MV5BMTcyMTU5MzgxMF5BMl5BanBnXkFtZTYwMDI0NjI1._V1_FMjpg_UX1000_.jpg	Born:  November 22,  1965  in Østerbro, Copenhagen, Denmark	
369	nm0488917	/name/nm0488917	 Thomas Bo Larsen\n	Thomas Bo Larsen was born on November 27, 1963 in Gladsaxe, Denmark. He is an actor, known for Jagten (2012), Festen (1998) and Druk (2020).	https://m.media-amazon.com/images/M/MV5BMTYyODM1NjAxMV5BMl5BanBnXkFtZTcwMzkwNTM4Nw@@._V1_FMjpg_UX1000_.jpg	Born:  November 27,  1963  in Gladsaxe, Denmark	
370	nm5038871	/name/nm5038871	 Annika Wedderkopp\n	Annika Wedderkopp was born on December 14, 2004 in Gentofte, Sjælland, Denmark. She is an actress, known for Jagten (2012) and QEDA (2017).	https://m.media-amazon.com/images/M/MV5BOWY1NzZhYTEtMmRkYi00OTFlLTllMjYtM2Q5ZWE2ZDlmZmE3XkEyXkFqcGdeQXVyOTQyMTEyNjk@._V1_FMjpg_UX1000_.jpg	Born:  December 14,  2004  in Gentofte, Sjælland, Denmark	
371	nm0178785	/name/nm0178785	 Alec Coppel\n(1907–1972)\n			Born:  September 17,  1907  in Melbourne, Victoria, Australia	Died:  January 22,  1972  (age 64) in London, England, UK
372	nm0853138	/name/nm0853138	 Samuel A. Taylor\n(1912–2000)\n	Samuel A. Taylor was born on June 13, 1912 in Chicago, Illinois, USA as Samuel Albert Tanenbaum. He was a writer and director, known for Sabrina (1954), Vertigo (1958) and Sabrina (1995). He was married to Suzanne Combes Taylor. He died on May 26, 2000 in Blue Hill, Maine, USA.		Born:  June 13,  1912  in Chicago, Illinois, USA	Died:  May 26,  2000  (age 87) in Blue Hill, Maine, USA
373	nm0001571	/name/nm0001571	 Kim Novak\n(I)\n	Kim Novak was born in Chicago, Illinois on February 13, 1933 with the birth name of Marilyn Pauline Novak. She was the daughter of a former teacher turned transit clerk and his wife, also a former teacher. Throughout elementary and high school, Kim did not get along well with teachers. She even admitted that she didn't like being told what to do ...	https://m.media-amazon.com/images/M/MV5BMTQ4NjA0NjQ4OV5BMl5BanBnXkFtZTYwOTU5NzI2._V1_FMjpg_UX1000_.jpg	Born:  February 13,  1933  in Chicago, Illinois, USA	
374	nm0000895	/name/nm0000895	 Barbara Bel Geddes\n(1922–2005)\n	Arguably best remembered for her role as Miss Ellie, the Ewing family matriarch on the long-running TV series Dallas (1978), Barbara Bel Geddes had earlier scored success on stage and screen long before gaining more lasting fame on television. She was born in New York City on Halloween Day 1922, the daughter of noted theatrical and industrial ...	https://m.media-amazon.com/images/M/MV5BMTIzOTg1OTg5Nl5BMl5BanBnXkFtZTcwOTYyMDEzMQ@@._V1_FMjpg_UX1000_.jpg	Born:  October 31,  1922  in New York City, New York, USA	Died:  August 8,  2005  (age 82) in Northeast Harbor, Maine, USA
413	nm0380282	/name/nm0380282	 Michael Herr\n(1940–2016)\n	Michael Herr was born on April 13, 1940 in Lexington, Kentucky, USA as Michael David Herr. He was a writer and producer, known for Full Metal Jacket (1987), Apocalypse Now (1979) and The Rainmaker (1997). He was married to Valerie Elliott. He died on June 23, 2016 in New York, USA.	https://m.media-amazon.com/images/M/MV5BMjI4Mjc5MTQ5MV5BMl5BanBnXkFtZTgwMDM2OTYyOTE@._V1_FMjpg_UX1000_.jpg	Born:  April 13,  1940  in Lexington, Kentucky, USA	Died:  June 23,  2016  (age 76) in New York, USA
414	nm0000546	/name/nm0000546	 Matthew Modine\n	The youngest of seven, Matthew was born in Loma Linda, Ca, to Dolores (Warner), a bookkeeper, and Mark Alexander Modine, a drive-in theater manager. After graduating high school in Imperial Beach, Ca. Modine moved to NYC (1979). Matthew studied with Stella Adler at her Conservatory of Acting. While still a student of hers, he began landing ...	https://m.media-amazon.com/images/M/MV5BMjE3NTE4NjQxOF5BMl5BanBnXkFtZTgwMTI3MzQwNDI@._V1_FMjpg_UX1000_.jpg	Born:  March 22,  1959  in Loma Linda, California, USA	
375	nm0000485	/name/nm0000485	Fritz Lang	Fritz Lang was born in Vienna, Austria, in 1890. His father managed a construction company. His mother, Pauline Schlesinger, was Jewish but converted to Catholicism when Lang was ten. After high school, he enrolled briefly at the Technische Hochschule Wien and then started to train as a painter. From 1910 to 1914, he traveled in Europe, and he ...	https://m.media-amazon.com/images/M/MV5BNzU2ODY0NzkwNF5BMl5BanBnXkFtZTgwNDI0MTE5MTE@._V1_FMjpg_UX1000_.jpg	Born:  December 5,  1890  in Vienna, Austria-Hungary [now Austria]	Died:  August 2,  1976  (age 85) in Beverly Hills, Los Angeles, California, USA
377	nm0000048	/name/nm0000048	 Peter Lorre\n(I)\n(1904–1964)\n	Peter Lorre was born László Löwenstein in Rózsahegy in the Slovak area of the Austro-Hungarian Empire, the son of Hungarian Jewish parents. He learned both Hungarian and German languages from birth, and was educated in elementary and secondary schools in the Austria-Hungary capitol Vienna, but did not complete. As a youth he ran away from home, ...	https://m.media-amazon.com/images/M/MV5BMTI2MzM0ODQwOV5BMl5BanBnXkFtZTYwMjYwNjI2._V1_FMjpg_UX1000_.jpg	Born:  June 26,  1904  in Rózsahegy, Austria-Hungary [now Ruzomberok, Slovakia]	Died:  March 23,  1964  (age 59) in Los Angeles, California, USA
378	nm0927145	/name/nm0927145	 Ellen Widmann\n(1894–1985)\n	Ellen Widmann was born on December 15, 1894 in Biel, Switzerland. She was an actress, known for M - Eine Stadt sucht einen Mörder (1931), Das Weyerhuus (1940) and Der letzte raum (1966). She was married to Adolf Manz and Herbert Kuchenbuch. She died on October 22, 1985 in Zurich, Switzerland.		Born:  December 15,  1894  in Biel, Switzerland	Died:  October 22,  1985  (age 90) in Zurich, Switzerland
379	nm0484737	/name/nm0484737	 Inge Landgut\n(1922–1986)\n	Inge Landgut was born on November 23, 1922 in Berlin, Germany. She was an actress, known for M - Eine Stadt sucht einen Mörder (1931), Emil und die Detektive (1931) and Hanneles Himmelfahrt (1934). She was married to Werner Oelschlaeger. She died on May 29, 1986 in West Berlin, West Germany.	https://m.media-amazon.com/images/M/MV5BNDEyNTg4ODA0M15BMl5BanBnXkFtZTgwNzY1MTEwMzE@._V1_FMjpg_UX1000_.jpg	Born:  November 23,  1922  in Berlin, Germany	Died:  May 29,  1986  (age 63) in West Berlin, West Germany
381	nm0442109	/name/nm0442109	 Charlie Kaufman\n(I)\n	Avid reader Charlie Kaufman wrote plays and made short films as a young student. He moved from Massapequa, New York to West Hartford, Connecticut in 1972 where he attended high school. As a comedic actor, he performed in school plays and, after graduation, he enrolled at Boston University but soon transferred NYU to study film. Charlie worked in ...	https://m.media-amazon.com/images/M/MV5BMTY5NzUyNjYxM15BMl5BanBnXkFtZTYwMDM1NDg0._V1_FMjpg_UX1000_.jpg	Born:  November 19,  1958  in New York City, New York, USA	
380	nm0327273	/name/nm0327273	Michel Gondry	He grew up in Versailles with a family who was very influenced by pop music. When he was young, Gondry wanted to be a painter or an inventor. In the 80s he entered in an art school in Paris where he could develop his graphic skills and where he also met friends with whom he created a pop-rock band called Oui-Oui. The band released 2 albums ('...	https://m.media-amazon.com/images/M/MV5BMjEwNDg3MDA1MF5BMl5BanBnXkFtZTcwMDAxMzc1MQ@@._V1_FMjpg_UX1000_.jpg	Born:  May 8,  1963  in Versailles, Seine-et-Oise [now Yvelines], France	
383	nm0000701	/name/nm0000701	 Kate Winslet\n	Ask Kate Winslet what she likes about any of her characters, and the word "ballsy" is bound to pop up at least once. The British actress has made a point of eschewing straightforward pretty-girl parts in favor of more devilish damsels; as a result, she's built an eclectic resume that runs the gamut from Shakespearean tragedy to modern-day ...	https://m.media-amazon.com/images/M/MV5BODgzMzM2NTE0Ml5BMl5BanBnXkFtZTcwMTcyMTkyOQ@@._V1_FMjpg_UX1000_.jpg	Born:  October 5,  1975  in Reading, Berkshire, England, UK	
384	nm0929489	/name/nm0929489	 Tom Wilkinson\n(I)\n	Popular British character actor Tom Wilkinson was born in Leeds, West Yorkshire, England, and comes from a long line of urban farmers. He is the son of Marjorie (Percival) and Thomas Wilkinson. Economic hardships forced his family to move to Canada for a few years when Wilkinson was a child; after he had returned to England, he attended and ...	https://m.media-amazon.com/images/M/MV5BMTcxNzc0NzQyN15BMl5BanBnXkFtZTcwNjI1NDA2MQ@@._V1_FMjpg_UX1000_.jpg	Born:  February 5,  1948  in Leeds, West Yorkshire, England, UK	
386	nm0542534	/name/nm0542534	 Herman J. Mankiewicz\n(1897–1953)\n	Herman J. Mankiewicz, now known primarily as the man who co-wrote Citizen Kane (1941) with Hollywood's greatest wunderkind, Orson Welles, was one of the highest-paid screenwriters in Hollywood and the head of Paramount's screen-writing department in the late 1920s and early '30s. He reached the pinnacle of his craft soon after arriving in ...	https://m.media-amazon.com/images/M/MV5BMzYyYTk2ZmMtYzI1ZS00OGI4LWFlODktYThjOWQ2NTI4MGY1XkEyXkFqcGdeQXVyMjUxODE0MDY@._V1_FMjpg_UX1000_.jpg	Born:  November 7,  1897  in New York City, New York, USA	Died:  March 5,  1953  (age 55) in Hollywood, Los Angeles, California, USA
376	nm0902376	/name/nm0902376	Thea von Harbou	Thea von Harbou was born on December 27, 1888 in Tauperlitz, Döhlau, Bavaria, Germany as Thea Gabriele von Harbou. She was a writer and director, known for Metropolis (1927), Spione (1928) and M - Eine Stadt sucht einen Mörder (1931). She was married to Fritz Lang and Rudolf Klein-Rogge. She died on July 1, 1954 in Berlin, Germany.	https://m.media-amazon.com/images/M/MV5BZmQxOWYyY2EtMWViNi00YTIwLWEwNDctZDk1ODlkZmZkNDA1XkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  December 27,  1888  in Tauperlitz, Döhlau, Bavaria, Germany	Died:  July 1,  1954  (age 65) in Berlin, Germany
535	nm0628704	/name/nm0628704	 Jinpachi Nezu\n(1947–2016)\n	Jinpachi Nezu was born on December 1, 1947 in Yamanashi, Japan as Toru Nezu. He was an actor, known for Ran (1985), Kagemusha (1980) and Saraba itoshiki daichi (1982). He died on December 29, 2016 in Tokyo, Japan.	https://m.media-amazon.com/images/M/MV5BYTY4ZTJlM2YtMGQ5YS00ODJjLTlmODktZDZjMDlkOTQyYzk1L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_FMjpg_UX1000_.jpg	Born:  December 1,  1947  in Yamanashi, Japan	Died:  December 29,  2016  (age 69) in Tokyo, Japan
536	nm0672459	/name/nm0672459	 David Webb Peoples\n	David Webb Peoples was born on February 9, 1940 in Middletown, Connecticut, USA. He is a writer and editor, known for Unforgiven (1992), Blade Runner (1982) and Twelve Monkeys (1995). He is married to Janet Peoples.		Born:  February 9,  1940  in Middletown, Connecticut, USA	
385	nm0000080	/name/nm0000080	Orson Welles	His father, Richard Head Welles, was a well-to-do inventor, his mother, Beatrice (Ives) Welles, a beautiful concert pianist; Orson Welles was gifted in many arts (magic, piano, painting) as a child. When his mother died in 1924 (when he was nine) he traveled the world with his father. He was orphaned at 15 after his father's death in 1930 and ...	https://m.media-amazon.com/images/M/MV5BOTE1Nzg5NzMwM15BMl5BanBnXkFtZTYwMDQwMTM2._V1_FMjpg_UX1000_.jpg	Born:  May 6,  1915  in Kenosha, Wisconsin, USA	Died:  October 10,  1985  (age 70) in Hollywood, Los Angeles, California, USA
387	nm0001072	/name/nm0001072	 Joseph Cotten\n(I)\n(1905–1994)\n	Joseph Cheshire Cotten, Jr. was born in Petersburg, Virginia, into a well-to-do Southern family. He was the eldest of three sons born to Sally Whitworth (Willson) and Joseph Cheshire Cotten, Sr., an assistant postmaster. Jo (as he was known) and his brothers Whit and Sam spent their summers at their aunt and uncle's home at Virginia Beach. And ...	https://m.media-amazon.com/images/M/MV5BMjE3MjQ4NzIyOV5BMl5BanBnXkFtZTYwOTU1MjI2._V1_FMjpg_UX1000_.jpg	Born:  May 15,  1905  in Petersburg, Virginia, USA	Died:  February 6,  1994  (age 88) in Westwood, Los Angeles, California, USA
388	nm0173827	/name/nm0173827	 Dorothy Comingore\n(1913–1971)\n	Dorothy Comingore earned a place in motion picture history for her role as the second Mrs. Kane (the Marion Davies to Orson Welles's William Randolph Hearst) in Citizen Kane (1941). It was an extraordinary performance, justifiably praised by critics and public alike. She was apparently slated to be on the short list for an Academy Award. However, ...	https://m.media-amazon.com/images/M/MV5BMTU4NjcwNTU5Ml5BMl5BanBnXkFtZTcwMDI5NDYwOA@@._V1_FMjpg_UX1000_.jpg	Born:  August 24,  1913  in Los Angeles, California, USA	Died:  December 30,  1971  (age 58) in Stonington, Connecticut, USA
389	nm4318159	/name/nm4318159	 Nitesh Tiwari\n(I)\n	Nitesh Tiwari is a writer and director, known for Chhichhore (2019), Dangal (2016) and Bareilly Ki Barfi (2017).	https://m.media-amazon.com/images/M/MV5BODg5ODQ4Mjg5Nl5BMl5BanBnXkFtZTgwMjI3NTU5MDI@._V1_FMjpg_UX1000_.jpg		
390	nm6328029	/name/nm6328029	 Piyush Gupta\n(II)\n	Piyush Gupta is a writer and assistant director, known for Chhichhore (2019), Dangal (2016) and Bhoothnath Returns (2014).			
391	nm6328031	/name/nm6328031	 Shreyas Jain\n	Contribute to IMDb. Add a bio, trivia, and more.\nUpdate information for Shreyas Jain »			
392	nm2799219	/name/nm2799219	 Sakshi Tanwar\n	Sakshi Tanwar was born on January 12, 1973 in Alwar, Rajasthan, India. She is an actress, known for Dangal (2016), Bade Achhe Lagte Hain (2011) and Kahaani Ghar Ghar Kii (2000).	https://m.media-amazon.com/images/M/MV5BMTg1NDU0Njg4Ml5BMl5BanBnXkFtZTgwNDM1ODA0OTE@._V1_FMjpg_UX1000_.jpg	Born:  January 12,  1973  in Alwar, Rajasthan, India	
393	nm0760778	/name/nm0760778	 Fatima Sana Shaikh\n	Fatima Sana Shaikh was born in Mumbai, India, to Hindu Brahman Father, Vipen Sharma, and Muslim Mother, Raj Tabassum. She was enrolled to St. Xavier High School in Mumbai for her primary education and later to Mithibai College, Mumbai for higher education. Shaikh began her film career with the 1997 film Chachi 420 with Kamal Hasan. She played the ...	https://m.media-amazon.com/images/M/MV5BNzcwNjcxYTYtYWFjOS00YzNiLTk5MjgtMjQ0NGFlMDY3ODU3L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_FMjpg_UX1000_.jpg	Born:  January 11,  1992  in Hyderabad, Andhra Pradesh, India	
394	nm0459552	/name/nm0459552	 Elem Klimov\n(1933–2003)\n	Elem Klimov was born on July 9, 1933 in Stalingrad, Nizhne-Volzhskiy kray, RSFSR, USSR as Elem Germanovich Klimov. He was a director and actor, known for Idi i smotri (1985), Agoniya (1981) and Pokhozhdeniya zubnogo vracha (1965). He was married to Larisa Shepitko. He died on October 26, 2003 in Moscow, Russia.	https://m.media-amazon.com/images/M/MV5BYzMwZDFlNWEtODdlNi00MzZmLTlkM2UtZWYzNTcxOTkyNTI2XkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  July 9,  1933  in Stalingrad, Nizhne-Volzhskiy kray, RSFSR, USSR [now Volgograd, Volgogradskaya oblast, Russia]	Died:  October 26,  2003  (age 70) in Moscow, Russia
395	nm0010696	/name/nm0010696	Ales Adamovich	Ales Adamovich was born on September 3, 1927 in the USSR. He was a writer, known for Idi i smotri (1985), Franz + Polina (2006) and Voyna pod kryshami (1971). He died on January 1, 1994 in Moscow, Russia.		Born:  September 3,  1927  in USSR	Died:  January 1,  1994  (age 66) in Moscow, Russia
396	nm0470385	/name/nm0470385	 Aleksey Kravchenko\n(I)\n	Aleksey Kravchenko was born on October 10, 1969 in Moskovskaya oblast, RSFSR, USSR as Aleksey Evgenevich Kravchenko. He is an actor, known for Idi i smotri (1985), 9 rota (2005) and Muzhskoy sezon. Barkhatnaya revolyutsiya (2005). He is married to Nadezhda Borisova.	https://m.media-amazon.com/images/M/MV5BMjIyODk0OTIzMF5BMl5BanBnXkFtZTgwNTM4MTI2MTE@._V1_FMjpg_UX1000_.jpg	Born:  October 10,  1969  in Moskovskaya oblast, RSFSR, USSR [now Russia]	
397	nm0592500	/name/nm0592500	 Olga Mironova\n	Olga Mironova is an actress, known for Idi i smotri (1985).	https://m.media-amazon.com/images/M/MV5BMjAyMjg3MzY0MF5BMl5BanBnXkFtZTgwNDM4MTI2MTE@._V1_FMjpg_UX1000_.jpg		
398	nm0490708	/name/nm0490708	 Liubomiras Laucevicius\n	Liubomiras Laucevicius was born on June 15, 1950 in Vilnius, Litovskaya SSR, USSR. He is an actor, known for Idi i smotri (1985), Romanovy: Ventsenosnaya semya (2000) and Morskoy volk (1990).	https://m.media-amazon.com/images/M/MV5BOWViNWRjOGItNDM4MC00ZGVhLTg4N2UtNWE0NThhOGM4MzllXkEyXkFqcGdeQXVyNjg3MTIwODI@._V1_FMjpg_UX1000_.jpg	Born:  June 15,  1950  in Vilnius, Litovskaya SSR, USSR	
399	nm0002045	/name/nm0002045	 Stanley Donen\n(1924–2019)\n	Inspired by Fred Astaire's dancing in Flying Down to Rio (1933), Stanley Donen (pronounced 'Dawn-en') attended dance classes from the age of ten. He later recalled that the only thing he wanted to be was a tap dancer. He was born in Columbia, South Carolina, to Helen Pauline (Cohen) and Mordecai Moses Donen, a dress-shop manager, of Russian-Jewish ...	https://m.media-amazon.com/images/M/MV5BNTQ0MDgxNzEtYWUyZC00MjhkLThmOTItOTU5ZmZjYTg4Zjc3XkEyXkFqcGdeQXVyMjUxODE0MDY@._V1_FMjpg_UX1000_.jpg	Born:  April 13,  1924  in Columbia, South Carolina, USA	Died:  February 21,  2019  (age 94) in New York City, New York, USA
428	nm0000201	/name/nm0000201	 Michelle Pfeiffer\n	Michelle Pfeiffer was born in Santa Ana, California to Dick and Donna Pfeiffer. She has an older brother and two younger sisters - Dedee Pfeiffer, and Lori Pfeiffer, who both dabbled in acting and modeling but decided against making it their lives' work. She graduated from Fountain Valley High School in 1976, and attended one year at the Golden ...	https://m.media-amazon.com/images/M/MV5BMTUzNjI0Njc5NF5BMl5BanBnXkFtZTYwOTM2MjYz._V1_FMjpg_UX1000_.jpg	Born:  April 29,  1958  in Santa Ana, California, USA	
429	nm0000874	/name/nm0000874	 Steven Bauer\n	Steven Bauer was born on December 2, 1956 in Havana, Cuba as Esteban Ernesto Echevarria. He is an actor and producer, known for Scarface (1983), Traffic (2000) and Primal Fear (1996).	https://m.media-amazon.com/images/M/MV5BMTNjNTY4NDItODdlOC00N2QwLWI4Y2UtYTE2ZmM5MzI2NGFiXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_FMjpg_UX1000_.jpg	Born:  December 2,  1956  in Havana, Cuba	
401	nm0173679	/name/nm0173679	 Betty Comden\n(1917–2006)\n	Songwriter ("New York, New York", "Lonely Town", "The Party's Over", "Just in Time"), author and actress. educated at New York University with a Bachelor of Science degree. While a student, she acted with the Washington Square Players. She was a member of the Revuers, a night club act which also included Judy Holliday and Adolph Green. She wrote ...	https://m.media-amazon.com/images/M/MV5BM2E1MzY5MTAtMzhlNy00N2FkLWJkNjYtMTM2ZDE5Nzk1NzU1XkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_FMjpg_UX1000_.jpg	Born:  May 3,  1917  in Brooklyn, New York City, New York, USA	Died:  November 23,  2006  (age 89) in New York City, New York, USA
402	nm0337582	/name/nm0337582	 Adolph Green\n(I)\n(1914–2002)\n	Songwriter ("New York, New York", "The Party's Over", "Just in Time", "Make Someone Happy"), author and actor, educated at City College of New York. While he was a student, he acted with the Washington Square Players and had a part in the road company of "Having a Wonderful Time". A member of The Revuers with Betty Comden (with whom he also ...	https://m.media-amazon.com/images/M/MV5BZGI4ODk0NGMtODg3Yy00OTYwLThjMzgtMGQ2OGE3Y2ZhMDlhXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_FMjpg_UX1000_.jpg	Born:  December 2,  1914  in The Bronx, New York City, New York, USA	Died:  October 23,  2002  (age 87) in New York City, New York, USA
400	nm0000037	/name/nm0000037	Gene Kelly	Eugene Curran Kelly was born in Pittsburgh, Pennsylvania, the third son of Harriet Catherine (Curran) and James Patrick Joseph Kelly, a phonograph salesman. His father was of Irish descent and his mother was of Irish and German ancestry. Metro-Goldwyn-Mayer was the largest and most powerful studio in Hollywood when Gene Kelly arrived in town in ...	https://m.media-amazon.com/images/M/MV5BMTM3MzIyMDI5Ml5BMl5BanBnXkFtZTYwNzQ2MjU2._V1_FMjpg_UX1000_.jpg	Born:  August 23,  1912  in Pittsburgh, Pennsylvania, USA	Died:  February 2,  1996  (age 83) in Beverly Hills, Los Angeles, California, USA
403	nm0640307	/name/nm0640307	 Donald O'Connor\n(1925–2003)\n	Born into a vaudeville family, O'Connor was the youthful figure cutting a rug in several Universal musicals of the 1940s. His best-known musical work is probably Singin' in the Rain (1952), in which he did an impressive dance that culminated in a series of backflips off the wall. O'Connor was also effective in comedic lead roles, particularly as ...	https://m.media-amazon.com/images/M/MV5BMTI0NTA2ODE4NV5BMl5BanBnXkFtZTYwODMyNTM2._V1_FMjpg_UX1000_.jpg	Born:  August 28,  1925  in Chicago, Illinois, USA	Died:  September 27,  2003  (age 78) in Calabasas, California, USA
404	nm0001666	/name/nm0001666	 Debbie Reynolds\n(I)\n(1932–2016)\n	Debbie Reynolds was born Mary Frances Reynolds in El Paso, Texas, the second child of Maxine N. (Harmon) and Raymond Francis Reynolds, a carpenter for the Southern Pacific Railroad. Her film career began at MGM after she won a beauty contest at age 16 impersonating Betty Hutton. Reynolds wasn't a dancer until she was selected to be Gene Kelly's ...	https://m.media-amazon.com/images/M/MV5BMTM5NTAzNzM0NF5BMl5BanBnXkFtZTcwMTY4OTY2Nw@@._V1_FMjpg_UX1000_.jpg	Born:  April 1,  1932  in El Paso, Texas, USA	Died:  December 28,  2016  (age 84) in Cedars-Sinai Medical Center, Los Angeles, California, USA
405	nm0701012	/name/nm0701012	 Edna Purviance\n(1895–1958)\n	Edna Purviance began working as a stenographer in San Francisco. Charles Chaplin invited her to join him at Essanay Studio in 1915, the year of her film debut in Chaplin's His Night Out. Over the next seven years she appeared as his leading lady in over 20 Chaplin films made by Essanay, Mutual, and First National, including the classics The Tramp ...	https://m.media-amazon.com/images/M/MV5BMTgzMTI2MTcwNV5BMl5BanBnXkFtZTcwMjY4NjYxOA@@._V1_FMjpg_UX1000_.jpg	Born:  October 21,  1895  in Paradise, Nevada, USA	Died:  January 11,  1958  (age 62) in Hollywood, Los Angeles, California, USA
406	nm0001067	/name/nm0001067	 Jackie Coogan\n(1914–1984)\n	Jackie Coogan was born into a family of vaudevillians where his father was a dancer and his mother had been a child star. On the stage by four, Jackie was touring at the age of five with his family in Los Angeles, California. While performing on the stage, he was spotted by Charles Chaplin, who then and there planned a movie in which he and Jackie ...	https://m.media-amazon.com/images/M/MV5BMjE0NjgwNTYzMV5BMl5BanBnXkFtZTYwMzc1ODU2._V1_FMjpg_UX1000_.jpg	Born:  October 26,  1914  in Los Angeles, California, USA	Died:  March 1,  1984  (age 69) in Santa Monica, California, USA
407	nm0001120	/name/nm0001120	 Vittorio De Sica\n(1901–1974)\n	Vittorio De Sica grew up in Naples, and started out as an office clerk in order to raise money to support his poor family. He was increasingly drawn towards acting, and made his screen debut while still in his teens, joining a stage company in 1923. By the late 1920s he was a successful matinee idol of the Italian theatre, and repeated that ...	https://m.media-amazon.com/images/M/MV5BMzcxOTgxMTY3NV5BMl5BanBnXkFtZTgwODE5OTk3MTE@._V1_FMjpg_UX1000_.jpg	Born:  July 7,  1901  in Sora, Lazio, Italy	Died:  November 13,  1974  (age 73) in Neuilly-sur-Seine, Hauts-de-Seine, France
408	nm0953790	/name/nm0953790	 Cesare Zavattini\n(1902–1989)\n	Cesare Zavattini was born on September 20, 1902 in Luzzara, Emilia-Romagna, Italy. He was a writer and director, known for Ladri di biciclette (1948), È primavera... (1950) and Prima comunione (1950). He died on October 13, 1989 in Rome, Lazio, Italy.	https://m.media-amazon.com/images/M/MV5BMDE3Yzg1MmYtYTlmMy00YzNiLWJjMzMtMGYyNzY1N2JjZjBlXkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  September 20,  1902  in Luzzara, Emilia-Romagna, Italy	Died:  October 13,  1989  (age 87) in Rome, Lazio, Italy
409	nm0059030	/name/nm0059030	 Luigi Bartolini\n(I)\n(1892–1963)\n	Contribute to IMDb. Add a bio, trivia, and more.\nUpdate information for Luigi Bartolini »		Born:  February 8,  1892  in Cupramontana, Marche, Italy	Died:  May 16,  1963  (age 71) in Rome, Lazio, Italy
410	nm0536009	/name/nm0536009	 Lamberto Maggiorani\n(1909–1983)\n	Lamberto Maggiorani was born on August 28, 1909 in Rome, Lazio, Italy. He was an actor, known for Ladri di biciclette (1948), Il giudizio universale (1961) and A Tale of Five Cities (1951). He died on April 22, 1983 in Rome.	https://m.media-amazon.com/images/M/MV5BNzQ0NzkyMjk5OV5BMl5BanBnXkFtZTcwOTQ5MDI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  August 28,  1909  in Rome, Lazio, Italy	Died:  April 22,  1983  (age 73) in Rome, Lazio, Italy
411	nm0821543	/name/nm0821543	 Enzo Staiola\n	Enzo Staiola was born on November 15, 1939 in Rome, Lazio, Italy. He is an actor, known for Ladri di biciclette (1948), The Barefoot Contessa (1954) and A Tale of Five Cities (1951).	https://m.media-amazon.com/images/M/MV5BMjIzMzAyMzg1Nl5BMl5BanBnXkFtZTgwMzMyNzk0MTE@._V1_FMjpg_UX1000_.jpg	Born:  November 15,  1939  in Rome, Lazio, Italy	
412	nm0136794	/name/nm0136794	 Lianella Carell\n(1927–2000)\n	Lianella Carell was born on May 6, 1927 in Rome, Lazio, Italy. She was an actress and writer, known for Ladri di biciclette (1948), Amore e guai (1958) and Femmine insaziabili (1969). She died on December 19, 2000 in Rome.		Born:  May 6,  1927  in Rome, Lazio, Italy	Died:  December 19,  2000  (age 73) in Rome, Lazio, Italy
415	nm0000388	/name/nm0000388	 R. Lee Ermey\n(1944–2018)\n	A talented character actor known for his military roles, Ronald Lee Ermey was in the United States Marine Corps for 11 years. He rose to the rank of Staff Sergeant, and later was bestowed the honorary rank of Gunnery Sergeant by the Marine Corps, after he served 14 months in Vietnam and later did two tours in Okinawa, Japan. After injuries forced ...	https://m.media-amazon.com/images/M/MV5BMTA4Mzg5MjgzODleQTJeQWpwZ15BbWU3MDY4MDA5MDM@._V1_FMjpg_UX1000_.jpg	Born:  March 24,  1944  in Emporia, Kansas, USA	Died:  April 15,  2018  (age 74) in Santa Monica, California, USA
416	nm0000352	/name/nm0000352	 Vincent D'Onofrio\n	Vincent Phillip D'Onofrio was born on June 30, 1959 in Brooklyn, New York, to Phyllis, a restaurant manager and server, and Gene D'Onofrio, a theatre production assistant and interior designer. He is of Italian descent and has two older sisters. He studied at the Actors Studio and the American Stanislavski Theatre. Vincent D'Onofrio is known as an...	https://m.media-amazon.com/images/M/MV5BMTk0NTE2MDkzNF5BMl5BanBnXkFtZTYwODUzMjcz._V1_FMjpg_UX1000_.jpg	Born:  June 30,  1959  in Brooklyn, New York City, New York, USA	
417	nm0437520	/name/nm0437520	 Nobuo Kaneko\n(1923–1995)\n	Nobuo Kaneko was born on March 27, 1923. He was an actor, known for Ikiru (1952), Kyuketsuki Gokemidoro (1968) and Akô-jô danzetsu (1978). He was married to Yatsuko Tan'ami. He died on January 20, 1995.	https://m.media-amazon.com/images/M/MV5BNGM5MWU3NTAtMjcxZS00YTVhLWE2NjYtNTNjNDQ2ODkzZWNhL2ltYWdlXkEyXkFqcGdeQXVyNDAxOTExNTM@._V1_FMjpg_UX1000_.jpg	Born:  March 27,  1923	Died:  January 20,  1995  (age 71)
418	nm0385443	/name/nm0385443	 Shin'ichi Himori\n(1907–1959)\n	Shin'ichi Himori was born on January 10, 1907 in Tokyo, Japan as Kazuo Moriyama. He was an actor, known for Ikiru (1952), Anma to onna (1938) and Kanzashi (1941). He died on September 12, 1959.	https://m.media-amazon.com/images/M/MV5BMTQ4NjE5NTQ1M15BMl5BanBnXkFtZTcwMTY2ODMwNw@@._V1_FMjpg_UX1000_.jpg	Born:  January 10,  1907  in Tokyo, Japan	Died:  September 12,  1959  (age 52)
419	nm0005363	/name/nm0005363	Guy Ritchie	Guy Ritchie was born in Hatfield, Hertfordshire, UK on September 10, 1968. After watching Butch Cassidy and the Sundance Kid (1969) as a child, Guy realized that what he wanted to do was make films. He never attended film school, saying that the work of film school graduates was boring and unwatchable. At 15 years old, he dropped out of school and...	https://m.media-amazon.com/images/M/MV5BMTM2NDkxMTcxMl5BMl5BanBnXkFtZTcwNTMyNjI5MQ@@._V1_FMjpg_UX1000_.jpg	Born:  September 10,  1968  in Hatfield, Hertfordshire, England, UK	
420	nm0005458	/name/nm0005458	 Jason Statham\n	Jason Statham was born in Shirebrook, Derbyshire, to Eileen (Yates), a dancer, and Barry Statham, a street merchant and lounge singer. He was a Diver on the British National Diving Team and finished twelfth in the World Championships in 1992. He has also been a fashion model, black market salesman and finally of course, actor. He received the ...	https://m.media-amazon.com/images/M/MV5BMTkxMzk2MDkwOV5BMl5BanBnXkFtZTcwMDAxODQwMg@@._V1_FMjpg_UX1000_.jpg	Born:  July 26,  1967  in Shirebrook, Derbyshire, England, UK	
421	nm0001125	/name/nm0001125	 Benicio Del Toro\n	Benicio Del Toro emerged in the mid-1990s as one of the most watchable and charismatic character actors to come along in years. A favorite of film buffs, Del Toro gained mainstream public attention as the conflicted but basically honest Mexican policeman in Steven Soderbergh's Traffic (2000). Benicio was born on February 19, 1967 in San Germán, ...	https://m.media-amazon.com/images/M/MV5BMTkzODQ4NzU1N15BMl5BanBnXkFtZTcwOTUzMzc5Mg@@._V1_FMjpg_UX1000_.jpg	Born:  February 19,  1967  in San Germán, Puerto Rico	
422	nm0499626	/name/nm0499626	 Ernest Lehman\n(1915–2005)\n	One of the most critically and commercially successful screenwriters in Hollywood history, Lehman grew up on Long Island, graduated from NY's City College. One of his first jobs was as a copywriter for a Broadway publicist. This experience would later be reflected in his novel and screenplay, "Sweet Smell of Success." He also worked as a radio ...	https://m.media-amazon.com/images/M/MV5BNmQ3MWFlZGYtNTU5ZC00NjQ1LTg2ZjEtNTdhNTNmM2UyMDc0XkEyXkFqcGdeQXVyMTQxMjk0Mg@@._V1_FMjpg_UX1000_.jpg	Born:  December 8,  1915  in New York City, New York, USA	Died:  July 2,  2005  (age 89) in Los Angeles, California, USA
423	nm0000026	/name/nm0000026	 Cary Grant\n(I)\n(1904–1986)\n	Once told by an interviewer, "Everybody would like to be Cary Grant", Grant is said to have replied, "So would I." Cary Grant was born Archibald Alec Leach on January 18, 1904 in Horfield, Bristol, England, to Elsie Maria (Kingdon) and Elias James Leach, who worked in a factory. His early years in Bristol would have been an ordinary ...	https://m.media-amazon.com/images/M/MV5BNzYyODM4NDU1MV5BMl5BanBnXkFtZTYwMjI1ODM2._V1_FMjpg_UX1000_.jpg	Born:  January 18,  1904  in Horfield, Bristol, England, UK	Died:  November 29,  1986  (age 82) in Davenport, Iowa, USA
424	nm0001693	/name/nm0001693	 Eva Marie Saint\n	Actress and producer Eva Marie Saint was born on July 4, 1924 on Newark, New Jersey. She is known for starring in Elia Kazan's On the Waterfront (1954), for which she won an Academy Award for Best Supporting Actress, and Alfred Hitchcock's North by Northwest (1959). Her film career also includes roles in Raintree County (1957), Exodus (1960), The ...	https://m.media-amazon.com/images/M/MV5BMjg4NDU4OTI4NF5BMl5BanBnXkFtZTcwODYxNjk0MQ@@._V1_FMjpg_UX1000_.jpg	Born:  July 4,  1924  in Newark, New Jersey, USA	
425	nm0000051	/name/nm0000051	 James Mason\n(I)\n(1909–1984)\n	James Mason was a great English actor of British and American films. He was born in Yorkshire, and attended Marlborough College and Cambridge University, where he discovered acting on a lark, and abandoned a planned career as an architect. Following 4 years in repertory companies, he joined the Old Vic under the guidance of Sir Tyrone Guthrie and ...	https://m.media-amazon.com/images/M/MV5BMjE0NDQxOTQzNl5BMl5BanBnXkFtZTYwNDAxMDI2._V1_FMjpg_UX1000_.jpg	Born:  May 15,  1909  in Huddersfield, Yorkshire [now in Kirklees, West Yorkshire], England, UK	Died:  July 27,  1984  (age 75) in Lausanne, Vaud, Switzerland
426	nm0000361	/name/nm0000361	 Brian De Palma\n(I)\n	Brian De Palma is the son of a surgeon. He studied physics but at the same time felt his dedication for the movies and made some short films. After seven independent productions he had his first success with Sisters (1972) and his voyeuristic style. Restlessly he worked on big projects with the script writers Paul Schrader, John Farris and Oliver ...	https://m.media-amazon.com/images/M/MV5BMTI2ODQ0NDY3OV5BMl5BanBnXkFtZTYwNjAxNTM0._V1_FMjpg_UX1000_.jpg	Born:  September 11,  1940  in Newark, New Jersey, USA	
427	nm0000231	/name/nm0000231	 Oliver Stone\n(I)\n	Oliver Stone has become known as a master of controversial subjects and a legendary film maker. His films are filled with a variety of film angles and styles, he pushes his actors to give Oscar-worthy performances, and despite his failures, has always returned to success. William Oliver Stone was born in New York City, to Jacqueline (Goddet) and ...	https://m.media-amazon.com/images/M/MV5BMTMwMjExMTY3OV5BMl5BanBnXkFtZTcwNjY3MDA2MQ@@._V1_FMjpg_UX1000_.jpg	Born:  September 15,  1946  in New York City, New York, USA	
431	nm0000532	/name/nm0000532	 Malcolm McDowell\n(I)\n	Malcolm John Taylor was born on June 13, 1943 in Leeds, England, to working-class parents Edna (McDowell), a hotelier, and Charles Taylor, a publican. His father was an alcoholic. Malcolm hated his parents' ways. His father was keen to send his son to private school to give him a good start in life, so Malcolm was packed off to boarding school at ...	https://m.media-amazon.com/images/M/MV5BMTcxMjQxNzczM15BMl5BanBnXkFtZTcwMTg3MTMwNw@@._V1_FMjpg_UX1000_.jpg	Born:  June 13,  1943  in Horsforth, Yorkshire, England, UK	
432	nm0535861	/name/nm0535861	 Patrick Magee\n(I)\n(1922–1982)\n	Born in Armagh, Northern Ireland, Patrick Magee is a classic example of how certain actors rate the stage far more highly than the screen. Magee was well aware that the vast majority of the films that he appeared in were dreadful (he mostly played sinister villains in horror films), but the money came in very handy in financing his distinguished ...	https://m.media-amazon.com/images/M/MV5BMTRhMzg2N2UtN2E5ZC00MDI2LTljNDMtZTFlNWJiZGQyOWNiXkEyXkFqcGdeQXVyMzAwOTU1MTk@._V1_FMjpg_UX1000_.jpg	Born:  March 31,  1922  in Armagh, Northern Ireland, UK	Died:  August 14,  1982  (age 60) in Fulham, London, England, UK
433	nm0060988	/name/nm0060988	 Michael Bates\n(I)\n(1920–1978)\n	Michael Bates was born on December 4, 1920 in Jhansi, United Provinces of Agra and Oudh, British India as Michael Hammond Bates. He was an actor, known for A Clockwork Orange (1971), Frenzy (1972) and Patton (1970). He was married to Margaret M. J. Chisholm. He died on January 11, 1978 in Chelsea, London, England.	https://m.media-amazon.com/images/M/MV5BMTM5NDk3MDIxNF5BMl5BanBnXkFtZTcwNjc1Mzk5Nw@@._V1_FMjpg_UX1000_.jpg	Born:  December 4,  1920  in Jhansi, United Provinces of Agra and Oudh, British India	Died:  January 11,  1978  (age 57) in Chelsea, London, England, UK
317	nm0005222	/name/nm0005222	Sam Mendes	Samuel Alexander Mendes was born on August 1, 1965 in Reading, England, UK to parents James Peter Mendes, a retired university lecturer, and Valerie Helene Mendes, an author who writes children's books. Their marriage didn't last long, James divorced Sam's mother in 1970 when Sam was just 5-years-old. Sam was educated at Cambridge University and ...	https://m.media-amazon.com/images/M/MV5BNTgzODMyMDUwNF5BMl5BanBnXkFtZTcwNzEyMjAyMg@@._V1_FMjpg_UX1000_.jpg	Born:  August 1,  1965  in Reading, Berkshire, England, UK	
434	nm4880670	/name/nm4880670	 Krysty Wilson-Cairns\n	Krysty Wilson-Cairns trained at the National Film and Television School, London. She loves screenwriting, storytelling and writing about herself in the third person. Born and raised in Glasgow, Krysty has told stories for many years, but they were often to do with what happened to her Mother's gin and why the dog is wearing a polo neck. Finally she...	https://m.media-amazon.com/images/M/MV5BZGQ1ZDliZDAtMmNlMC00Y2E0LTg2NDItMDhkZTdiY2IxODc1XkEyXkFqcGdeQXVyNjMxNDk5MDM@._V1_FMjpg_UX1000_.jpg		
435	nm2835616	/name/nm2835616	 Dean-Charles Chapman\n	Dean-Charles Chapman was born on September 7, 1997 in Havering, Essex, England. He is an actor, known for 1917 (2019), Before I Go to Sleep (2014) and Game of Thrones (2011).	https://m.media-amazon.com/images/M/MV5BNzM2Mjc2NzAzMV5BMl5BanBnXkFtZTgwMjE0MzAwNTE@._V1_FMjpg_UX1000_.jpg	Born:  September 7,  1997  in Havering, Essex, England, UK	
436	nm1126657	/name/nm1126657	 George MacKay\n(I)\n	George MacKay was born 13 March, 1992 in Hammersmith, London, England, to Kim Baker, a British costume designer, and Paul Christopher MacKay, an Australian stage/lighting manager, from Adelaide. One of his grandmothers is from Cork, Ireland. At the age of ten, George was scouted to audition for a role in the family feature, Peter Pan (2003). He ...	https://m.media-amazon.com/images/M/MV5BMTQ4NjQ0NTEwOV5BMl5BanBnXkFtZTgwODQyMzIyMTI@._V1_FMjpg_UX1000_.jpg	Born:  March 13,  1992  in London, England, UK	
437	nm0990547	/name/nm0990547	 Daniel Mays\n(I)\n	Daniel Alan Mays (born 31 March 1978) is an English actor. Born the third of four boys, Mays was brought up in Buckhurst Hill, Essex, by his electrician father and bank cashier mother. He attended the Italia Conti Academy of Theatre Arts before going on to win a place at the Royal Academy of Dramatic Art. After graduating from RADA in 2000, Mays ...	https://m.media-amazon.com/images/M/MV5BMDBkMDgwYzgtMTNjNC00MzY3LWJjOGItZjVhNGE5OTAyNjNiXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_FMjpg_UX1000_.jpg	Born:  March 31,  1978  in Epping, Essex, England, UK	
438	nm0898288	/name/nm0898288	Denis Villeneuve	Denis Villeneuve is a French Canadian film director and writer. He was born in 1967, in Trois-Rivières, Québec, Canada. He started his career as a filmmaker at the National Film Board of Canada. He is best known for his feature films Arrival (2016), Sicario (2015), Prisoners (2013), Enemy (2013), and Incendies (2010). He is married to Tanya ...	https://m.media-amazon.com/images/M/MV5BMzU2MDk5MDI2MF5BMl5BanBnXkFtZTcwNDkwMjMzNA@@._V1_FMjpg_UX1000_.jpg	Born:  October 3,  1967  in Trois-Rivières, Québec, Canada	
439	nm1416431	/name/nm1416431	 Wajdi Mouawad\n	Wajdi Mouawad is a writer and actor, known for Littoral (2004), Incendies (2010) and Sous le ciel d'Alice (2020).			
440	nm0044073	/name/nm0044073	 Lubna Azabal\n	Lubna Azabal was born on August 15, 1973 in Brussels, Belgium. She is an actress, known for Incendies (2010), Coriolanus (2011) and Body of Lies (2008).	https://m.media-amazon.com/images/M/MV5BMzE2NzU0MzEzMF5BMl5BanBnXkFtZTgwODc5NDcxMjE@._V1_FMjpg_UX1000_.jpg	Born:  August 15,  1973  in Brussels, Belgium	
441	nm0246386	/name/nm0246386	 Mélissa Désormeaux-Poulin\n	Mélissa Désormeaux-Poulin is an actress, known for Incendies (2010), Gabrielle (2013) and Dérive (2018).	https://m.media-amazon.com/images/M/MV5BMTU1MzE3MjQwNV5BMl5BanBnXkFtZTcwNjkzMzY3Mw@@._V1_FMjpg_UX1000_.jpg		
442	nm0309945	/name/nm0309945	 Maxim Gaudette\n	Maxim Gaudette was born on June 8, 1974 in Sherbrooke, Quebec, Canada. He is an actor, known for Incendies (2010), Polytechnique (2009) and Lac Mystère (2013).	https://m.media-amazon.com/images/M/MV5BMTY2MTUwNzE2Nl5BMl5BanBnXkFtZTgwMjEyNjU3NjE@._V1_FMjpg_UX1000_.jpg	Born:  June 8,  1974  in Sherbrooke, Quebec, Canada	
443	nm0001707	/name/nm0001707	 Paul Schrader\n(I)\n	Although his name is often linked to that of the "movie brat" generation (Steven Spielberg, Martin Scorsese, Francis Ford Coppola, George Lucas, Brian De Palma, etc.) Paul Schrader's background couldn't have been more different than theirs. His strict Calvinist parents refused to allow him to see a film until he was 18. Although he more than made ...	https://m.media-amazon.com/images/M/MV5BMTc0MTUwNDM0OV5BMl5BanBnXkFtZTcwMTIzMzM5MQ@@._V1_FMjpg_UX1000_.jpg	Born:  July 22,  1946  in Grand Rapids, Michigan, USA	
103	nm0000149	/name/nm0000149	Jodie Foster	Jodie Foster started her career at the age of two. For four years she made commercials and finally gave her debut as an actress in the TV series Mayberry R.F.D. (1968). In 1975 Jodie was offered the role of prostitute Iris Steensma in the movie Taxi Driver (1976). This role, for which she received an Academy Award nomination in the "Best ...	https://m.media-amazon.com/images/M/MV5BMTM3MjgyOTQwNF5BMl5BanBnXkFtZTcwMDczMzEwNA@@._V1_FMjpg_UX1000_.jpg	Born:  November 19,  1962  in Los Angeles, California, USA	
444	nm0001732	/name/nm0001732	 Cybill Shepherd\n	Cybill Lynne Shepherd was born in Memphis, Tennessee, to Patty, a homemaker, and William Shepherd, a small business owner. Named after her grandfather, Cy, and her father, Bill, Shepherd's career began at a young age in modeling, when she won the "Miss Teenage Memphis" contest in 1966 and the "Model of the Year" contest in 1968. She became a ...	https://m.media-amazon.com/images/M/MV5BMTUzNTA1Mzg5M15BMl5BanBnXkFtZTYwNjkzNDk3._V1_FMjpg_UX1000_.jpg	Born:  February 18,  1950  in Memphis, Tennessee, USA	
445	nm1410815	/name/nm1410815	Asghar Farhadi	Asghar Farhadi was born in 1972 in Iran. He became interested in cinema in his teenage years and started his filmmaking education by joining the Youth Cinema Society of Esfahan in 1986 where he made 8mm and 16mm short films. He received his Bachelors in Theater from University of Tehran's School of Dramatic Arts in 1998 and his Masters in Stage ...	https://m.media-amazon.com/images/M/MV5BMTM0NDE2Mzg4N15BMl5BanBnXkFtZTcwMDcxMjYyNw@@._V1_FMjpg_UX1000_.jpg	Born:  May 7,  1972  in Khomeyni Shahr, Isfahan, Iran	
446	nm1818216	/name/nm1818216	 Payman Maadi\n	Peyman Maadi was born in 1972 in New York City to an Iranian couple. His father was a lawyer. His family moved back to Iran when he was 5 years old. He graduated in Metallurgical Engineering from Karaj Azad University. Maadi started his film career as a screenwriter in late 2000s. He is the writer of several famous Iranian films. He started his ...	https://m.media-amazon.com/images/M/MV5BMzQyNzk1MzMtNThlZC00YmMxLThkNDAtNmQzMTVjYWJlMmI5XkEyXkFqcGdeQXVyMTI5NDA3NTI1._V1_FMjpg_UX1000_.jpg	Born:  1970  in New York City, New York, USA	
447	nm0368689	/name/nm0368689	 Leila Hatami\n	Award-winning actress, Leila Hatami, was born on October 1, 1972 in Tehran, Iran, to legendary Iranian Director, Ali Hatami, and actress mother, Zari Khoshkam (Zahra Hatami). During her childhood, she appeared in several of her father's films including the historical TV series, Hezardastan (1988), and biopic Kamalolmolk (1984), as well as a role ...	https://m.media-amazon.com/images/M/MV5BNTQ1Mzc1MjI3OF5BMl5BanBnXkFtZTcwMDYxNzk4Ng@@._V1_FMjpg_UX1000_.jpg	Born:  October 1,  1972  in Tehran, Iran	
448	nm4299147	/name/nm4299147	 Sareh Bayat\n	Sareh Bayat was born and raised in Tehran, Iran. She majored in Theater at university and received a Diploma of Honor for Best Actress from Tehran's Police Theatre Festival in 2006. She furthered her acting training at Karnameh Institute of Arts and Culture's School of Cinematic Arts where she received lessons by renowned actor, Parviz Parastui, ...	https://m.media-amazon.com/images/M/MV5BNjliNTFmZTEtYWYwYS00MDgyLWE1NTktMTU3NTg3NmE2YTdkXkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  October 6,  1979  in Tehran, Iran	
449	nm0000349	/name/nm0000349	 Joan Cusack\n	Actress Joan Cusack was born in New York City, New York, and is the daughter of Nancy (née Carolan) and Dick Cusack. Her father was an advertising executive, writer and actor, and her mother was a math teacher. Her siblings - Susie Cusack, John Cusack, Ann Cusack and Bill Cusack also act. Her family is of Irish descent. Raised in Evanston, Illinois...	https://m.media-amazon.com/images/M/MV5BMTMzMTAxMjQzMV5BMl5BanBnXkFtZTYwMzU1OTE1._V1_FMjpg_UX1000_.jpg	Born:  October 11,  1962  in New York City, New York, USA	
450	nm0001351	/name/nm0001351	 George Roy Hill\n(1921–2002)\n	George Roy Hill was never able to 'hit it off' with the critics despite the fact that 2 of his films - Butch Cassidy and the Sundance Kid (1969), and The Sting (1973) - had remained among the top 10 box office hits by 1976. His work was frequently derided as 'impersonal' or lacking in stylistic trademarks. Andrew Sarris famously referred to it as ...	https://m.media-amazon.com/images/M/MV5BMjE1NzM2MTM1OF5BMl5BanBnXkFtZTgwNjA3Nzg4MDE@._V1_FMjpg_UX1000_.jpg	Born:  December 20,  1921  in Minneapolis, Minnesota, USA	Died:  December 27,  2002  (age 81) in New York City, New York, USA
451	nm0911486	/name/nm0911486	 David S. Ward\n	David S. Ward was born on October 25, 1945 in Providence, Rhode Island, USA as David Schad Ward. He is a writer, known for The Sting (1973), Major League II (1994) and Sleepless in Seattle (1993). He is married to Marie-Louis White. He was previously married to Christine Atwood and Rosanna DeSoto.	https://m.media-amazon.com/images/M/MV5BMjA4MjA1ODI2M15BMl5BanBnXkFtZTcwMzc2ODgwMw@@._V1_FMjpg_UX1000_.jpg	Born:  October 25,  1945  in Providence, Rhode Island, USA	
452	nm0000056	/name/nm0000056	 Paul Newman\n(I)\n(1925–2008)\n	Screen legend, superstar, and the man with the most famous blue eyes in movie history, Paul Leonard Newman was born on January 26, 1925, in Cleveland, Ohio, the second son of Arthur Sigmund Newman (died 1950) and Theresa Fetsko (died 1982). His elder brother was Arthur S. Newman Jr., named for their father, a Jewish businessman who owned a ...	https://m.media-amazon.com/images/M/MV5BODUwMDYwNDg3N15BMl5BanBnXkFtZTcwODEzNTgxMw@@._V1_FMjpg_UX1000_.jpg	Born:  January 26,  1925  in Shaker Heights, Ohio, USA	Died:  September 26,  2008  (age 83) in Westport, Connecticut, USA
453	nm0000602	/name/nm0000602	 Robert Redford\n(I)\n	Born on August 18, 1936, in Santa Monica, California, to Charles Robert Redford, an accountant for Standard Oil, and Martha Redford, who died in 1955, the year he graduated high school, Charles Robert Redford Jr. was a scrappy kid who stole hubcaps in high school and lost his college baseball scholarship at the University of Colorado because of ...	https://m.media-amazon.com/images/M/MV5BMTk1Nzc5MzQyMV5BMl5BanBnXkFtZTcwNjQ5OTA0Mg@@._V1_FMjpg_UX1000_.jpg	Born:  August 18,  1936  in Santa Monica, California, USA	
454	nm0001727	/name/nm0001727	 Robert Shaw\n(I)\n(1927–1978)\n	Robert Archibald Shaw was born on August 9, 1927, in Westhoughton, Lancashire, England, the eldest son of Doreen Nora (Avery), a nurse, and Thomas Archibald Shaw, a doctor. His paternal grandfather was Scottish, from Argyll. Shaw's mother, who was born in Piggs Peak, Swaziland, met his father while she was a nurse at a hospital in Truro, Cornwall....	https://m.media-amazon.com/images/M/MV5BMTc0NzI3NTU2MF5BMl5BanBnXkFtZTcwNTUzMjkyOA@@._V1_FMjpg_UX1000_.jpg	Born:  August 9,  1927  in Westhoughton, Lancashire, England, UK	Died:  August 28,  1978  (age 51) in Tourmakeady, County Mayo, Ireland
455	nm0000180	/name/nm0000180	 David Lean\n(I)\n(1908–1991)\n	An important British filmmaker, David Lean was born in Croydon on March 25, 1908 and brought up in a strict Quaker family (ironically, as a child he wasn't allowed to go to the movies). During the 1920s, he briefly considered the possibility of becoming an accountant like his father before finding a job at Gaumont British Studios in 1927. He ...	https://m.media-amazon.com/images/M/MV5BMjM3NzIzMzg4M15BMl5BanBnXkFtZTcwOTA1Mzg3Mw@@._V1_FMjpg_UX1000_.jpg	Born:  March 25,  1908  in Croydon, Surrey, England, UK	Died:  April 16,  1991  (age 83) in London, England, UK
456	nm0493042	/name/nm0493042	 T.E. Lawrence\n(1888–1935)\n	T.E. Lawrence was born on August 16, 1888 in Tremadoc, Caernarvonshire, Wales as Thomas Edward Lawrence. He was a writer, known for Lawrence of Arabia (1962), With Lawrence in Arabia (1927) and T. E. Lawrence 1888-1935 (1962). He died on May 19, 1935 in Clouds Hill, Dorset, England.		Born:  August 16,  1888  in Tremadoc, Caernarvonshire, Wales, UK	Died:  May 19,  1935  (age 46) in Clouds Hill, Dorset, England, UK
457	nm0004122	/name/nm0004122	 Robert Bolt\n(1924–1995)\n	Son of a small shopkeeper, he attended Manchester Grammar School. He later said that he made poor uses of his opportunities there. He went to work in an insurance office, but later entered Manchester University, taking a degree in History. A post-graduate year at Exeter University led to a schoolmaster's position, first at a village school in ...	https://m.media-amazon.com/images/M/MV5BZDliMjU1ZDUtNTgzOS00NDU5LWFhM2ItNDk0ZWU4ZDc5M2JlXkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  August 15,  1924  in Sale, Cheshire, England, UK	Died:  February 20,  1995  (age 70) in Petersfield, Hampshire, England, UK
458	nm0000564	/name/nm0000564	 Peter O'Toole\n(I)\n(1932–2013)\n	A leading man of prodigious talents, Peter O'Toole was raised in Leeds, Yorkshire, England, the son of Constance Jane Eliot (Ferguson), a Scottish nurse, and Patrick Joseph O'Toole, an Irish metal plater, football player and racecourse bookmaker. Upon leaving school, he decided to become a journalist, beginning as a newspaper copy boy. Although he...	https://m.media-amazon.com/images/M/MV5BMjA0MDYyNzczN15BMl5BanBnXkFtZTYwNjMzNjMz._V1_FMjpg_UX1000_.jpg	Born:  August 2,  1932  in Hunslet, Leeds, West Yorkshire, England, UK	Died:  December 14,  2013  (age 81) in London, England, UK
459	nm0000027	/name/nm0000027	 Alec Guinness\n(1914–2000)\n	Alec Guinness was an English actor. He is known for his six collaborations with David Lean: Herbert Pocket in Great Expectations (1946), Fagin in Oliver Twist (1948), Col. Nicholson in The Bridge on the River Kwai (1957), for which he won the Academy Award for Best Actor), Prince Faisal in Lawrence of Arabia (1962), General Yevgraf Zhivago in ...	https://m.media-amazon.com/images/M/MV5BMTIxMTA5OTI2M15BMl5BanBnXkFtZTYwNjEwNjU2._V1_FMjpg_UX1000_.jpg	Born:  April 2,  1914  in Marylebone, London, England, UK	Died:  August 5,  2000  (age 86) in Midhurst, Sussex, England, UK
460	nm0000063	/name/nm0000063	 Anthony Quinn\n(I)\n(1915–2001)\n	Anthony Quinn was born Antonio Rodolfo Quinn Oaxaca (some sources indicate Manuel Antonio Rodolfo Quinn Oaxaca) on April 21, 1915, in Chihuahua, Mexico, to Manuela (Oaxaca) and Francisco Quinn, who became an assistant cameraman at a Los Angeles (CA) film studio. His paternal grandfather was Irish, and the rest of his family was Mexican. After ...	https://m.media-amazon.com/images/M/MV5BMTY2MTAxMzIxMV5BMl5BanBnXkFtZTYwODc3OTE2._V1_FMjpg_UX1000_.jpg	Born:  April 21,  1915  in Chihuahua, Mexico	Died:  June 3,  2001  (age 86) in Boston, Massachusetts, USA
462	nm0491011	/name/nm0491011	 Guillaume Laurant\n	Guillaume Laurant was born on November 22, 1961 in Saint-Quentin, Aisne, France. He is a writer and actor, known for Amélie (2001), J'ai perdu mon corps (2019) and Un long dimanche de fiançailles (2004). He was previously married to Sandrine Bonnaire.		Born:  November 22,  1961  in Saint-Quentin, Aisne, France	
461	nm0000466	/name/nm0000466	Jean-Pierre Jeunet	Jean-Pierre Jeunet is a self-taught director who was very quickly interested by cinema, with a predilection for a fantastic cinema where form is as important as the subject. Thus he started directing TV commercials and video clips (such as Julien Clerc in 1984). At the same time he met designer/drawer Marc Caro with whom he made two short ...	https://m.media-amazon.com/images/M/MV5BMjE2Mjg3MTE2NF5BMl5BanBnXkFtZTYwOTUzMzk1._V1_FMjpg_UX1000_.jpg	Born:  September 3,  1953  in Roanne, Loire, Rhône-Alpes, France	
463	nm0851582	/name/nm0851582	 Audrey Tautou\n	Audrey Justine Tautou was born on August 9, 1976 in Beaumont, France, to Evelyne Marie Laure (Nuret), a teacher, and Bernard Tautou, a dental surgeon. Audrey showed an interest for comedy at an early age and started her acting lessons at 'Cours Florent'. In 1998 she won the best young actress award in the ninth 'Jeune Comedien de Cinema Festival' ...	https://m.media-amazon.com/images/M/MV5BMTYzOTgyNjk1Nl5BMl5BanBnXkFtZTcwNjMwMjI1OQ@@._V1_FMjpg_UX1000_.jpg	Born:  August 9,  1976  in Beaumont, Puy-de-Dôme, France	
464	nm0440913	/name/nm0440913	 Mathieu Kassovitz\n	Mathieu Kassovitz was born on August 3, 1967 in Paris, France. He is an actor and director, known for Amélie (2001), La haine (1995) and The Fifth Element (1997). He is married to Julie Mauduech. They have one child.	https://m.media-amazon.com/images/M/MV5BMzIwMzIzMzE3NF5BMl5BanBnXkFtZTYwNzcwODU1._V1_FMjpg_UX1000_.jpg	Born:  August 3,  1967  in Paris, France	
465	nm0749363	/name/nm0749363	 Rufus\n(I)\n	Rufus was born on December 19, 1942 in Riom, Puy-de-Dôme, France as Jacques Narcy. He is an actor, known for Amélie (2001), Delicatessen (1991) and La cité des enfants perdus (1995).	https://m.media-amazon.com/images/M/MV5BMjIzMDA5MzIwMF5BMl5BanBnXkFtZTcwNjkwOTAyNw@@._V1_FMjpg_UX1000_.jpg	Born:  December 19,  1942  in Riom, Puy-de-Dôme, France	
466	nm0375609	/name/nm0375609	 Brigitte Helm\n(1906–1996)\n	After her role in Metropolis (1927) she made a string of movies in which she almost always had the starring role, easily making the transition to sound films. Her last film was Ein idealer Gatte (1935) (An Ideal Spouse) in 1935.	https://m.media-amazon.com/images/M/MV5BOTE2MTkwNTYyMV5BMl5BanBnXkFtZTgwMDI1ODY3MTE@._V1_FMjpg_UX1000_.jpg	Born:  March 17,  1906  in Berlin, Germany	Died:  June 11,  1996  (age 90) in Ascona, Switzerland
467	nm0002154	/name/nm0002154	 Alfred Abel\n(1879–1937)\n	This elegant actor of the golden age of German cinema appeared in several masterpieces, before the cameras of such inspired geniuses as Lang, Lubitsch and Murnau. Vocation had come rather late in his life, though. Abel was indeed already 33 when he made his first film. Beforehand, he had been a forester, a gardener and a shopkeeper. But one day, ...	https://m.media-amazon.com/images/M/MV5BMDdjYjI1NGMtOGExOC00NjA0LTg2YmYtNGRjNzU4MGE4MDBhXkEyXkFqcGdeQXVyMzI5NDcxNzI@._V1_FMjpg_UX1000_.jpg	Born:  March 12,  1879  in Leipzig, Germany	Died:  December 12,  1937  (age 58) in Berlin, Germany
468	nm0297054	/name/nm0297054	 Gustav Fröhlich\n(1902–1987)\n	Gustav Fröhlich was born on March 21, 1902 in Hannover, Lower Saxony, Germany. He was an actor and director, known for Metropolis (1927), Leb' wohl, Christina (1945) and Seine Tochter ist der Peter (1955). He was married to Maria Hajek and Gitta Alpar. He died on December 22, 1987 in Lugano, Ticino, Switzerland.	https://m.media-amazon.com/images/M/MV5BMjAzMzcyODI2NF5BMl5BanBnXkFtZTcwNDY4NjgyMw@@._V1_FMjpg_UX1000_.jpg	Born:  March 21,  1902  in Hannover, Lower Saxony, Germany	Died:  December 22,  1987  (age 85) in Lugano, Ticino, Switzerland
471	nm0000511	/name/nm0000511	 Shirley MacLaine\n	Shirley MacLaine was born Shirley MacLean Beaty in Richmond, Virginia. Her mother, Kathlyn Corinne (MacLean), was a drama teacher from Nova Scotia, Canada, and her father, Ira Owens Beaty, a professor of psychology and real estate agent, was from Virginia. Her brother, Warren Beatty, was born on March 30, 1937. Her ancestry includes English and ...	https://m.media-amazon.com/images/M/MV5BMTI0MTE5MjQ1MF5BMl5BanBnXkFtZTYwMzU2MDg1._V1_FMjpg_UX1000_.jpg	Born:  April 24,  1934  in Richmond, Virginia, USA	
473	nm0607694	/name/nm0607694	 Fulvio Morsella\n(–2002)\n				Died:  December,  2002  in Rome, Lazio, Italy
42	nm0000142	/name/nm0000142	Clint Eastwood	Clint Eastwood was born May 31, 1930 in San Francisco, the son of Clinton Eastwood Sr., a bond salesman and later manufacturing executive for Georgia-Pacific Corporation, and Ruth Wood, a housewife turned IBM operator. He had a comfortable, middle-class upbringing in nearby Piedmont. At school Clint took interest in music and mechanics, but was an...	https://m.media-amazon.com/images/M/MV5BMTg3MDc0MjY0OV5BMl5BanBnXkFtZTcwNzU1MDAxOA@@._V1_FMjpg_UX1000_.jpg	Born:  May 31,  1930  in San Francisco, California, USA	
44	nm0001812	/name/nm0001812	Lee Van Cleef	One of the great movie villains, Clarence Leroy Van Cleef, Jr. was born in Somerville, New Jersey, to Marion Lavinia (Van Fleet) and Clarence LeRoy Van Cleef, Sr. His parents were both of Dutch ancestry. Van Cleef started out as an accountant. He served in the U.S. Navy aboard minesweepers and sub chasers during World War II. After the war he ...	https://m.media-amazon.com/images/M/MV5BMTY0ODU1NjY5N15BMl5BanBnXkFtZTcwNTI0NzEyMw@@._V1_FMjpg_UX1000_.jpg	Born:  January 9,  1925  in Somerville, New Jersey, USA	Died:  December 16,  1989  (age 64) in Oxnard, California, USA
474	nm0002231	/name/nm0002231	 Gian Maria Volontè\n(1933–1994)\n	Born in Milan in 1933, Gian Maria Volontè studied in Rome at the National Dramatic Arts Academy, where he obtained his degree in 1957. He began working in theatre and television, where he was soon noticed as one of the most promising actors of his generation. After several supporting appearances in film, he reached notoriety with the character of ...	https://m.media-amazon.com/images/M/MV5BMTY5NTU2NDU4M15BMl5BanBnXkFtZTcwNTUyNjMyNA@@._V1_FMjpg_UX1000_.jpg	Born:  April 9,  1933  in Milan, Lombardy, Italy	Died:  December 6,  1994  (age 61) in Florina, Greece
475	nm0151452	/name/nm0151452	 Raymond Chandler\n(1888–1959)\n	An American novelist, writer of crime fiction featuring the private detective Philip Marlowe, Raymond (Thornton) Chandler was born in Chicago of an American father and an Anglo-Irish mother. He moved to England when his parents divorced. He attended Dulwich College and studied languages in France and Germany before returning to England in 1907 and...	https://m.media-amazon.com/images/M/MV5BYjQwNDI5ODctZGU3MC00NzIwLWE3ZmQtYjQxYWE5NTlmMjE0XkEyXkFqcGdeQXVyMjUxODE0MDY@._V1_FMjpg_UX1000_.jpg	Born:  July 23,  1888  in Chicago, Illinois, USA	Died:  March 26,  1959  (age 70) in La Jolla, California, USA
472	nm0534045	/name/nm0534045	Fred MacMurray	Fred MacMurray was likely the most underrated actor of his generation. True, his earliest work is mostly dismissed as pedestrian, but no other actor working in the 1940s and 50s was able to score so supremely whenever cast against type. Frederick Martin MacMurray was born in Kankakee, Illinois, to Maleta Martin and Frederick MacMurray. His father ...	https://m.media-amazon.com/images/M/MV5BMTkwMTIyODQ4Nl5BMl5BanBnXkFtZTYwOTk1MTI2._V1_FMjpg_UX1000_.jpg	Born:  August 30,  1908  in Kankakee, Illinois, USA	Died:  November 5,  1991  (age 83) in Santa Monica, California, USA
476	nm0001766	/name/nm0001766	 Barbara Stanwyck\n(1907–1990)\n	Today Barbara Stanwyck is remembered primarily as the matriarch of the family known as the Barkleys on the TV western The Big Valley (1965), wherein she played Victoria, and from the hit drama The Colbys (1985). But she was known to millions of other fans for her movie career, which spanned the period from 1927 until 1964, after which she appeared...	https://m.media-amazon.com/images/M/MV5BNjMxODIzODEzNF5BMl5BanBnXkFtZTYwNDgwNjI2._V1_FMjpg_UX1000_.jpg	Born:  July 16,  1907  in Brooklyn, New York City, New York, USA	Died:  January 20,  1990  (age 82) in Santa Monica, California, USA
477	nm0000064	/name/nm0000064	 Edward G. Robinson\n(I)\n(1893–1973)\n	Emanuel Goldenberg arrived in the United States from Romania at age ten, and his family moved into New York's Lower East Side. He took up acting while attending City College, abandoning plans to become a rabbi or lawyer. The American Academy of Dramatic Arts awarded him a scholarship, and he began work in stock, with his new name, Edward G. ...	https://m.media-amazon.com/images/M/MV5BMjE0NzcwMzU5Nl5BMl5BanBnXkFtZTYwNTkwMjI2._V1_FMjpg_UX1000_.jpg	Born:  December 12,  1893  in Bucharest, Romania	Died:  January 26,  1973  (age 79) in Hollywood, Los Angeles, California, USA
478	nm0612322	/name/nm0612322	 Robert Mulligan\n(I)\n(1925–2008)\n	Robert Mulligan was born on August 23, 1925 in The Bronx, New York City, New York, USA as Robert Patrick Mulligan Jr. He was a director and producer, known for To Kill a Mockingbird (1962), Summer of '42 (1971) and The Other (1972). He was married to Sandy Mulligan and Jane Lee Sutherland. He died on December 20, 2008 in Lyme, Connecticut, USA.	https://m.media-amazon.com/images/M/MV5BMTk4NjQ2ODY1NF5BMl5BanBnXkFtZTcwODA1NjcxMw@@._V1_FMjpg_UX1000_.jpg	Born:  August 23,  1925  in The Bronx, New York City, New York, USA	Died:  December 20,  2008  (age 83) in Lyme, Connecticut, USA
479	nm0497369	/name/nm0497369	 Harper Lee\n(I)\n(1926–2016)\n	Nelle Harper Lee grew up in Monroeville, Alabama in the 1920s. It was a time of hostility between whites and blacks in the United States, especially in Alabama. Her father, a lawyer, also ran a local newspaper. Her mother suffered from mental illness and oftentimes stayed inside from others; she was thought to suffer from bipolar disorder. Harper ...	https://m.media-amazon.com/images/M/MV5BMTkwNjQ2Njk4N15BMl5BanBnXkFtZTcwNzcxNDMwNQ@@._V1_FMjpg_UX1000_.jpg	Born:  April 28,  1926  in Monroeville, Alabama, USA	Died:  February 19,  2016  (age 89) in Monroeville, Alabama, USA
480	nm0285210	/name/nm0285210	 Horton Foote\n(1916–2009)\n	Horton Foote, the Pulitzer Prize-winning dramatist and Oscar-winning screenwriter, was born on March 14, 1916, in Wharton, Texas. He says at the age of ten, he had a "calling" to become an actor, and when he was 16 he convinced his parents to allow him to go to acting school. With their blessing he went to Pasadena, California, where he studied ...	https://m.media-amazon.com/images/M/MV5BMjMxMmY3ZDYtOTBiNC00N2E1LWIwYmYtYzMzYzM1MzdjMDI4XkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  March 14,  1916  in Wharton, Texas, USA	Died:  March 4,  2009  (age 92) in Hartford, Connecticut, USA
481	nm0000060	/name/nm0000060	 Gregory Peck\n(1916–2003)\n	Eldred Gregory Peck was born on April 5, 1916 in La Jolla, California, to Bernice Mary (Ayres) and Gregory Pearl Peck, a chemist and druggist in San Diego. He had Irish (from his paternal grandmother), English, and some German, ancestry. His parents divorced when he was five years old. An only child, he was sent to live with his grandmother. He ...	https://m.media-amazon.com/images/M/MV5BMjA0ODc0NTE2NF5BMl5BanBnXkFtZTYwNjYyMjQ2._V1_FMjpg_UX1000_.jpg	Born:  April 5,  1916  in La Jolla [now in San Diego], California, USA	Died:  June 12,  2003  (age 87) in Los Angeles, California, USA
482	nm0576345	/name/nm0576345	 John Megna\n(1952–1995)\n	John Megna was born on November 9, 1952 in Queens, New York, USA as John Anthony Ingolia. He was an actor, known for To Kill a Mockingbird (1962), The Cannonball Run (1981) and Hush...Hush, Sweet Charlotte (1964). He died on September 5, 1995 in Los Angeles, California, USA.	https://m.media-amazon.com/images/M/MV5BYjJhNDE3MjMtN2I1My00N2FiLWFhZTktZjlhZmQ0YTA0ZWFjXkEyXkFqcGdeQXVyMzk3NTUwOQ@@._V1_FMjpg_UX1000_.jpg	Born:  November 9,  1952  in Queens, New York, USA	Died:  September 5,  1995  (age 42) in Los Angeles, California, USA
483	nm0653942	/name/nm0653942	 Frank Overton\n(1918–1967)\n	Perpetually serious-looking New York-born character actor, who showed up to good effect in many TV shows of the 50's and 60's. His quietly authoritarian demeanor lent itself ideally to portraying characters with badges or uniforms: Sheriff Heck Tate in To Kill a Mockingbird (1962), General Bogan of Strategic Air Command in Fail Safe (1964) and ...	https://m.media-amazon.com/images/M/MV5BMTU0Mjg0OTQ2Ml5BMl5BanBnXkFtZTcwNzE5NjMzMQ@@._V1_FMjpg_UX1000_.jpg	Born:  March 12,  1918  in Babylon, New York, USA	Died:  April 24,  1967  (age 49) in Malibu, California, USA
484	nm0677037	/name/nm0677037	Bob Peterson	Bob Peterson was born in Wooster, Ohio, USA, in 1961. He studied mechanical engineering at Ohio Northern University, where he took computer graphics courses and graduated in 1983. He continued his studies in mechanical engineering at Purdue University where he earned a master's degree in 1986. While a student, he wrote and drew a cartoon strip ...	https://m.media-amazon.com/images/M/MV5BMTU4NTQ4ODI5N15BMl5BanBnXkFtZTYwNzIwODA3._V1_FMjpg_UX1000_.jpg	Born:  January 9,  1961  in Wooster, Ohio, USA	
485	nm0000799	/name/nm0000799	 Edward Asner\n	Ed Asner is a television legend, the winner of seven acting Emmy Awards (which puts him tied with Mary Tyler Moore, both of whom rank second to their "Mary Tyler Moore (1970) Show" co-star, Cloris Leachman who has nine). In all, he has been nominated 20 times for an Emmy Award, with 17 nods for a Primetime Emmy and three for a Daytime award. (All ...	https://m.media-amazon.com/images/M/MV5BMTk0MDI4ODk5NF5BMl5BanBnXkFtZTcwMzg3ODQ3MQ@@._V1_FMjpg_UX1000_.jpg	Born:  November 15,  1929  in Kansas City, Missouri, USA	
486	nm2973712	/name/nm2973712	 Jordan Nagai\n	Jordan Nagai was born on February 5, 2000 in Los Angeles, California, USA. He is an actor, known for Up (2009), Up (2009) and The Simpsons (1989).	https://m.media-amazon.com/images/M/MV5BMTQ0NjczNDczNl5BMl5BanBnXkFtZTcwMDMwMTc1Mg@@._V1_FMjpg_UX1000_.jpg	Born:  February 5,  2000  in Los Angeles, California, USA	
487	nm0001652	/name/nm0001652	 John Ratzenberger\n(I)\n	John started the improvisational duo group, "Sal's Meat Market", in Bridgeport, Connecticut with fellow actor and friend Ray Hassett. He was later affiliated with the ensemble group, "The Downtown Cabaret". Coincidentally, he was a friend of Susan Ryan, the mother of Meg Ryan. A mutual friend, also associated with "The Downtown Cabaret", was the ...	https://m.media-amazon.com/images/M/MV5BMjljYTUwNGMtMjhhMC00MzY3LWEwNjQtMjBmMzJhM2ViNmExXkEyXkFqcGdeQXVyMTc5Mjc5OTc@._V1_FMjpg_UX1000_.jpg	Born:  April 6,  1947  in Bridgeport, Connecticut, USA	
488	nm0090151	/name/nm0090151	 Jeffrey Boam\n(1946–2000)\n	Jeffrey Boam was born on November 30, 1946 in Rochester, New York, USA. He was a writer and producer, known for Indiana Jones and the Last Crusade (1989), The Dead Zone (1983) and The Phantom (1996). He was married to Paula M. Boam. He died on January 26, 2000 in Los Angeles, California, USA.		Born:  November 30,  1946  in Rochester, New York, USA	Died:  January 26,  2000  (age 53) in Los Angeles, California, USA
489	nm0000125	/name/nm0000125	 Sean Connery\n(1930–2020)\n	The tall, handsome and muscular Scottish actor Sean Connery is best known as the original actor to portray James Bond in the hugely successful movie franchise, starring in seven films between 1962 and 1983. Some believed that such a career-defining role might leave him unable to escape it, but he proved the doubters wrong, becoming one of the most...	https://m.media-amazon.com/images/M/MV5BMzcwNTM4MzctYjQzMi00NTA2LTljYWItNTYzNmE1MTYxN2RlXkEyXkFqcGdeQXVyMDI2NDg0NQ@@._V1_FMjpg_UX1000_.jpg	Born:  August 25,  1930  in Edinburgh, Scotland, UK	Died:  October 31,  2020  (age 90) in Nassau, Bahamas
490	nm0233145	/name/nm0233145	 Alison Doody\n	Alison Doody was born in Dublin in 1966, in a well-off family. She is the youngest of three children. She was educated in a convent, where she gained a passion for the arts. She later studied at the National College of Fine Arts in Dublin, but left because she lacked the motivation and thought she would take a year off to think it out. Meanwhile, ...	https://m.media-amazon.com/images/M/MV5BMTc5NjI5MTExM15BMl5BanBnXkFtZTcwMjUxNDczMw@@._V1_FMjpg_UX1000_.jpg	Born:  November 11,  1966  in Dublin, Ireland	
491	nm0000520	/name/nm0000520	Michael Mann	A student of London's International Film School, Michael Mann began his career in the late 70s, writing for TV shows like Starsky and Hutch (1975). He directed his first film, the award-winning prison drama The Jericho Mile (1979), in 1979. He followed that in 1981 with his first theatrical release, Thief (1981) starring James Caan as a ...	https://m.media-amazon.com/images/M/MV5BMTU2MjMzODY3Ml5BMl5BanBnXkFtZTYwNjE0OTMz._V1_FMjpg_UX1000_.jpg	Born:  February 5,  1943  in Chicago, Illinois, USA	
492	nm0000174	/name/nm0000174	 Val Kilmer\n	Val Kilmer was born in Los Angeles, California, to Gladys Swanette (Ekstadt) and Eugene Dorris Kilmer, who was a real estate developer and aerospace equipment distributor. His mother, born in Indiana, was from a Swedish family, and his father was from Texas. Val studied at Hollywood's Professional's School and, in his teens, entered Juilliard's ...	https://m.media-amazon.com/images/M/MV5BMTk3ODIzMDA5Ml5BMl5BanBnXkFtZTcwNDY0NTU4Ng@@._V1_FMjpg_UX1000_.jpg	Born:  December 31,  1959  in Los Angeles, California, USA	
493	nm0000436	/name/nm0000436	 Curtis Hanson\n(1945–2016)\n	After small films like The Bedroom Window (1987) and Sweet Kill (1972), Curtis Hanson went on to direct major features including The Hand That Rocks the Cradle (1992), The River Wild (1994) and the Academy Award-winning L.A. Confidential (1997). Setting his sights on another city, Hanson was critically acclaimed for directing Eminem in Universal ...	https://m.media-amazon.com/images/M/MV5BMTM3MzIzMzExOV5BMl5BanBnXkFtZTcwMTEyNjA1Mw@@._V1_FMjpg_UX1000_.jpg	Born:  March 24,  1945  in Reno, Nevada, USA	Died:  September 20,  2016  (age 71) in Los Angeles, California, USA
494	nm0255278	/name/nm0255278	 James Ellroy\n	James Ellroy was born on March 4, 1948 in Los Angeles, California, USA as Lee Earle Elroy. He is a writer and producer, known for L.A. Confidential (1997), Street Kings (2008) and The Black Dahlia (2006). He was previously married to Helen Knode.	https://m.media-amazon.com/images/M/MV5BMTg0MjE0NjcwMF5BMl5BanBnXkFtZTYwNTgxMzM3._V1_FMjpg_UX1000_.jpg	Born:  March 4,  1948  in Los Angeles, California, USA	
495	nm0001338	/name/nm0001338	 Brian Helgeland\n	Brian Helgeland was born on January 17, 1961 in Providence, Rhode Island, USA as Brian Thomas Helgeland. He is a writer and director, known for A Knight's Tale (2001), Man on Fire (2004) and 42 (2013). He is married to Nancy 'Nan' Helgeland. They have two children.	https://m.media-amazon.com/images/M/MV5BMTcyOTAyNTE5N15BMl5BanBnXkFtZTgwMTA1NjcwODE@._V1_FMjpg_UX1000_.jpg	Born:  January 17,  1961  in Providence, Rhode Island, USA	
172	nm0000128	/name/nm0000128	Russell Crowe	Russell Ira Crowe was born in Wellington, New Zealand, to Jocelyn Yvonne (Wemyss) and John Alexander Crowe, both of whom catered movie sets. His maternal grandfather, Stanley Wemyss, was a cinematographer. Crowe's recent ancestry includes Welsh (where his paternal grandfather was born, in Wrexham), English, Irish, Scottish, Norwegian, Swedish, ...	https://m.media-amazon.com/images/M/MV5BMTQyMTExNTMxOF5BMl5BanBnXkFtZTcwNDg1NzkzNw@@._V1_FMjpg_UX1000_.jpg	Born:  April 7,  1964  in Wellington, New Zealand	
496	nm0268380	/name/nm0268380	 Peter Farrelly\n(I)\n	Peter Farrelly was born on December 17, 1956 in Phoenixville, Pennsylvania, USA as Peter John Farrelly. He is a producer and writer, known for Green Book (2018), There's Something About Mary (1998) and Dumb and Dumber (1994).	https://m.media-amazon.com/images/M/MV5BMTU5Njg0NjU0M15BMl5BanBnXkFtZTgwNDM5OTg4NjM@._V1_FMjpg_UX1000_.jpg	Born:  December 17,  1956  in Phoenixville, Pennsylvania, USA	
497	nm0885014	/name/nm0885014	 Nick Vallelonga\n	Nick Vallelonga is best known for winning two Academy Awards and two Golden Globes for Original Screenplay and Best Picture for "Green Book". Nick wrote and produced "Green Book" with Peter Farrelly and Brian Hayes Currie, based on the true story of Nick's father Tony Lip, who went on tour of the south with the brilliant pianist Dr. Donald Shirley...	https://m.media-amazon.com/images/M/MV5BMDIwYmVmOGEtNzhjZi00Zjg0LTlmMDQtOTczMGU4YjdiYzJlXkEyXkFqcGdeQXVyNjY5NDE1MDM@._V1_FMjpg_UX1000_.jpg	Born:  September 13,  1959  in Bronx, New York, USA	
498	nm0192942	/name/nm0192942	 Brian Hayes Currie\n	Brian Hayes Currie was born in 1961. He is an actor and writer, known for Green Book (2018), Armageddon (1998) and Con Air (1997).	https://m.media-amazon.com/images/M/MV5BMTg5ODY4NDIxMl5BMl5BanBnXkFtZTgwNjkxMzUyNzM@._V1_FMjpg_UX1000_.jpg	Born:  1961	
499	nm0991810	/name/nm0991810	 Mahershala Ali\n	Mahershala Ali is fast becoming one of the freshest and most in-demand faces in Hollywood with his extraordinarily diverse skill set and wide-ranging background in film, television, and theater. This past fall, Ali wrapped A24's Brad Pitt and Adele Romanski produced independent feature film, Moonlight, as well as reprising his role in The Hunger ...	https://m.media-amazon.com/images/M/MV5BNjQ1MGQ3Y2EtYTgwMS00NTQyLTk1MTUtZGQ3NDQyY2YyM2Q3XkEyXkFqcGdeQXVyMTY5MzAyMDE@._V1_FMjpg_UX1000_.jpg	Born:  February 16,  1974  in Oakland, California, USA	
500	nm0004802	/name/nm0004802	 Linda Cardellini\n	Linda Edna Cardellini was born in Redwood City, California, to Lorraine (Hernan) and Wayne David Cardellini, a businessman. She is of Italian (from her paternal grandfather), Irish (from her mother), German, English, and Scottish descent. Linda grew up in the San Francisco Bay area, California, the youngest of four children. She became interested ...	https://m.media-amazon.com/images/M/MV5BMTQ2MDM4MTM2NF5BMl5BanBnXkFtZTgwMTM4MjYyMDE@._V1_FMjpg_UX1000_.jpg	Born:  June 25,  1975  in Redwood City, California, USA	
501	nm0001532	/name/nm0001532	 John McTiernan\n	John McTiernan was born on January 8, 1951 in Albany, New York, USA as John Campbell McTiernan Jr. He is a director and producer, known for Die Hard (1988), Rollerball (2002) and Predator (1987). He has been married to Gail Sistrunk since 2012. He was previously married to Kate Harrington, Donna Dubrow and Carol Land.	https://m.media-amazon.com/images/M/MV5BMjE4MTIwODY2Ml5BMl5BanBnXkFtZTYwMTk5MDQ3._V1_FMjpg_UX1000_.jpg	Born:  January 8,  1951  in Albany, New York, USA	
502	nm0861636	/name/nm0861636	 Roderick Thorp\n(1936–1999)\n	Novelist, short-story writer, teacher -- and private detective. He wrote two novels that would be turned into theatrical films, "The Detective" (1966), which became The Detective (1968); and "Nothing Lasts Forever" (1979), which became Die Hard (1988). His 1986 novel "Rainbow Drive" was later produced as a made-for-TV movie. He taught literature ...	https://m.media-amazon.com/images/M/MV5BYzJmMDYxYTEtZjIxOC00NTkyLTkwNDQtZDIwYjY3ODlmNWNhXkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_FMjpg_UX1000_.jpg	Born:  September 1,  1936  in The Bronx, New York, USA	Died:  April 28,  1999  (age 62) in Oxnard, California, USA
503	nm0835732	/name/nm0835732	 Jeb Stuart\n(I)\n	Jeb Stuart was born on January 21, 1956 in Little Rock, Arkansas, USA. He is a writer and producer, known for The Fugitive (1993), Die Hard (1988) and Lock Up (1989). He has been married to Mari Stuart since May 2003. He was previously married to Anne Bryant Stuart.	https://m.media-amazon.com/images/M/MV5BYmM0N2IxZmMtYmUyMi00MTg3LWE3MjYtOTYwY2NhMTdkNTE0XkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_FMjpg_UX1000_.jpg	Born:  January 21,  1956  in Little Rock, Arkansas, USA	
505	nm0000614	/name/nm0000614	 Alan Rickman\n(I)\n(1946–2016)\n	Alan Rickman was born on a council estate in Acton, West London, to Margaret Doreen Rose (Bartlett), of English and Welsh descent, and Bernard Rickman, of Irish descent, who worked at a factory. Alan Rickman had an older brother (David), a younger brother (Michael), and a younger sister (Sheila). When Alan was 8 years old, his father died. He ...	https://m.media-amazon.com/images/M/MV5BMTUwNTc4MTg4Ml5BMl5BanBnXkFtZTcwNDY2MjkxOA@@._V1_FMjpg_UX1000_.jpg	Born:  February 21,  1946  in Hammersmith, London, England, UK	Died:  January 14,  2016  (age 69) in London, England, UK
506	nm0000889	/name/nm0000889	 Bonnie Bedelia\n	The native New Yorker was born Bonnie Bedelia Culkin on March 25, 1948, the daughter of Phillip Harley Culkin, a journalist, and Marian Ethel Wagner Culkin, a writer and editor. Trained in ballet, her parents guided all of the children at one time or another into acting (which included Kit Culkin, Terry Culkin and Candace Culkin). Bonnie herself ...	https://m.media-amazon.com/images/M/MV5BNzEyOTA4MTM5OV5BMl5BanBnXkFtZTcwNTQ4NTQzMQ@@._V1_FMjpg_UX1000_.jpg	Born:  March 25,  1948  in New York City, New York, USA	
508	nm0358960	/name/nm0358960	 Christopher Hampton\n(I)\n	Christopher Hampton was born on January 26, 1946 in Faial, Açores, Portugal as Christopher James Hampton. He is a writer, known for The Father (2020), Dangerous Liaisons (1988) and Atonement (2007). He has been married to Laura de Holesch since 1971. They have two children.	https://m.media-amazon.com/images/M/MV5BMTY4MTIxODk3Nl5BMl5BanBnXkFtZTYwNTEwOTQz._V1_FMjpg_UX1000_.jpg	Born:  January 26,  1946  in Faial, Açores, Portugal	
507	nm1725469	/name/nm1725469	Florian Zeller	Florian Zeller is a French writer and director. He is, according to the Times, "the most exciting playwright of our time." He has written more than 10 plays, which have been staged in more than 45 countries. His black-comedy play "The Father" is one of the outstanding hits of recent years. It has won several awards in Paris, London, and New York. ...	https://m.media-amazon.com/images/M/MV5BMzBjODMwN2EtZTliZC00YmQ4LWE4MzUtYWU4MmU1ZWVjOTNiXkEyXkFqcGdeQXVyMTEzNTk3ODUw._V1_FMjpg_UX1000_.jpg	Born:  June 28,  1979  in Paris, France	
509	nm1469236	/name/nm1469236	 Olivia Colman\n	Olivia Colman was born on January 30, 1974 in Norwich, Norfolk, England as Sarah Caroline Olivia Colman. She is an actress, known for The Favourite (2018), Tyrannosaur (2011) and The Lobster (2015). She has been married to Ed Sinclair since August 2001. They have three children.	https://m.media-amazon.com/images/M/MV5BMTY4MzU2ODIzNl5BMl5BanBnXkFtZTgwMTM2OTA1NzM@._V1_FMjpg_UX1000_.jpg	Born:  January 30,  1974  in Norwich, Norfolk, England, UK	
510	nm0309693	/name/nm0309693	 Mark Gatiss\n	Mark Gatiss is an accomplished author, actor and playwright. Originally from Sedgefield, County Durham, he graduated from Bretton Hall Drama College with a BA (honors) in Theatre Arts. He was one-quarter of the award-winning comedy team The League of Gentlemen (1999), and became heavily involved in the post-television Doctor Who (1963) scene, ...	https://m.media-amazon.com/images/M/MV5BMTYzNDIwNzg4NF5BMl5BanBnXkFtZTcwNTI0MTk4OQ@@._V1_FMjpg_UX1000_.jpg	Born:  October 17,  1966  in Sedgefield, England, UK	
511	nm0004170	/name/nm0004170	 Bob Kane\n(I)\n(1915–1998)\n	Bob Kane was an American comic book writer and artist of Jewish descent, most famous for co-creating Batman and several members of Batman's supporting cast. Kane was inducted into the comic book industry's Jack Kirby Hall of Fame in 1994 and into the Will Eisner Comic Book Hall of Fame in 1996. Kane was born under the name "Robert Kahn" in New York...	https://m.media-amazon.com/images/M/MV5BMTM2MDQ2MDAyOV5BMl5BanBnXkFtZTcwMDUyMjcxOA@@._V1_FMjpg_UX1000_.jpg	Born:  October 24,  1915  in New York City, New York, USA	Died:  November 3,  1998  (age 83) in Los Angeles, California, USA
512	nm0275286	/name/nm0275286	 David S. Goyer\n	David S. Goyer was born on December 22, 1965 in Ann Arbor, Michigan, USA as David Samuel Goyer. He is a writer and producer, known for Dark City (1998), The Dark Knight (2008) and Batman Begins (2005). He is married to Marina Black. They have two children.	https://m.media-amazon.com/images/M/MV5BMTIyNDI4MDcyOV5BMl5BanBnXkFtZTYwMjAxODQ3._V1_FMjpg_UX1000_.jpg	Born:  December 22,  1965  in Ann Arbor, Michigan, USA	
513	nm0000323	/name/nm0000323	 Michael Caine\n(I)\n	Michael Caine was born Maurice Joseph Micklewhite in London, to Ellen Frances Marie (Burchell), a charlady, and Maurice Joseph Micklewhite, a fish-market porter. He left school at age 15 and took a series of working-class jobs before joining the British army and serving in Korea during the Korean War, where he saw combat. Upon his return to ...	https://m.media-amazon.com/images/M/MV5BMjAwNzIwNTQ4Ml5BMl5BanBnXkFtZTYwMzE1MTUz._V1_FMjpg_UX1000_.jpg	Born:  March 14,  1933  in Rotherhithe, London, England, UK	
514	nm0913822	/name/nm0913822	 Ken Watanabe\n(I)\n	Ken Watanabe was born on October 21, 1959 in Uonuma, Japan. Both of his parents were teachers: his mother taught general education and his dad taught calligraphy. He became interested in acting at the age of 24, when a director of England's National Theater Company, where he was studying, told him that acting was his special gift. In 1978, he ...	https://m.media-amazon.com/images/M/MV5BMTQzMTUzNjc4Nl5BMl5BanBnXkFtZTcwMTUyODU2Mw@@._V1_FMjpg_UX1000_.jpg	Born:  October 21,  1959  in Uonuma, Japan	
515	nm0867391	/name/nm0867391	 Eijirô Tôno\n(1907–1994)\n	Eijirô Tôno was born on September 17, 1907 in Gunma, Japan. He was an actor, known for Tora! Tora! Tora! (1970), Yojinbo (1961) and Tôkyô monogatari (1953). He died on September 8, 1994.	https://m.media-amazon.com/images/M/MV5BYTYxOWJhNjItYjA0ZS00MTdmLTk1ZWUtOWRiMDdlNzMyMmYzXkEyXkFqcGdeQXVyMTI3MDk3MzQ@._V1_FMjpg_UX1000_.jpg	Born:  September 17,  1907  in Gunma, Japan	Died:  September 8,  1994  (age 86)
516	nm0015611	/name/nm0015611	 Ryûnosuke Akutagawa\n(1892–1927)\n	Ryûnosuke Akutagawa was born on March 1, 1892 in Tokyo, Japan. He was a writer, known for Rashomon (1950), Iron Maze (1991) and Tajomaru (2009). He was married to Tsukamoto Fumi. He died on July 24, 1927 in Tokyo.		Born:  March 1,  1892  in Tokyo, Japan	Died:  July 24,  1927  (age 35) in Tokyo, Japan
517	nm0477553	/name/nm0477553	 Machiko Kyô\n(1924–2019)\n	Machiko Kyô was born on March 25, 1924 in Osaka, Japan as Yano Motoko. She was an actress, known for Rashomon (1950), Jigokumon (1953) and The Teahouse of the August Moon (1956). She died on May 12, 2019 in Tokyo, Japan.	https://m.media-amazon.com/images/M/MV5BMjE4NzAwODgwMV5BMl5BanBnXkFtZTcwNjkxMTMwNw@@._V1_FMjpg_UX1000_.jpg	Born:  March 25,  1924  in Osaka, Japan	Died:  May 12,  2019  (age 95) in Tokyo, Japan
518	nm0605270	/name/nm0605270	 Masayuki Mori\n(I)\n(1911–1973)\n	Masayuki Mori was born on January 13, 1911 in Sapporo, Hokkaido, Japan as Yukimitsu Arishima. He was an actor, known for Rashomon (1950), Warui yatsu hodo yoku nemuru (1960) and Hakuchi (1951). He died on October 7, 1973.	https://m.media-amazon.com/images/M/MV5BMjAzMjU5OTE3MV5BMl5BanBnXkFtZTcwNTU2ODMwNw@@._V1_FMjpg_UX1000_.jpg	Born:  January 13,  1911  in Sapporo, Hokkaido, Japan	Died:  October 7,  1973  (age 62)
519	nm0000416	/name/nm0000416	 Terry Gilliam\n	Terry Gilliam was born near Medicine Lake, Minnesota. When he was 12 his family moved to Los Angeles where he became a fan of MAD magazine. In his early twenties he was often stopped by the police who suspected him of being a drug addict and Gilliam had to explain that he worked in advertising. In the political turmoil in the 60's, Gilliam feared ...	https://m.media-amazon.com/images/M/MV5BODAyMDM0NjEwOF5BMl5BanBnXkFtZTcwMTUyMDY5Mg@@._V1_FMjpg_UX1000_.jpg	Born:  November 22,  1940  in Minneapolis, Minnesota, USA	
520	nm0001402	/name/nm0001402	 Terry Jones\n(I)\n(1942–2020)\n	Terry Jones was born in Colwyn Bay, North Wales, the son of Dilys Louisa (Newnes), a homemaker, and Alick George Parry Jones, a bank clerk. His older brother is production designer Nigel Jones. His grandparents were involved in the entertainment business, having managed the local Amateur Operatic Society and staged Gilbert and Sullivan concerts. ...	https://m.media-amazon.com/images/M/MV5BYjdjODRlMDQtNjEzNS00MDI4LWFjMWItZDdmZWYzMzJkM2I4XkEyXkFqcGdeQXVyMjE5MzM3MjA@._V1_FMjpg_UX1000_.jpg	Born:  February 1,  1942  in Colwyn Bay, Wales, UK	Died:  January 21,  2020  (age 77) in London, England, UK
521	nm0001037	/name/nm0001037	Graham Chapman	Graham Chapman was born on January 8, 1941 in Leicester, England while a German air raid was in progress. Graham's father was a chief police inspector and probably inspired the constables Graham often portrayed later in comedy sketches. Graham studied medicine in college and earned an M.D., but he practiced medicine for only a few years. At ...	https://m.media-amazon.com/images/M/MV5BMjAzODAyODc4NF5BMl5BanBnXkFtZTcwODY5MzAxMw@@._V1_FMjpg_UX1000_.jpg	Born:  January 8,  1941  in Leicester, Leicestershire, England, UK	Died:  October 4,  1989  (age 48) in Maidstone, England, UK
522	nm0000092	/name/nm0000092	John Cleese	John Cleese was born on October 27, 1939, in Weston-Super-Mare, England, to Muriel Evelyn (Cross) and Reginald Francis Cleese. He was born into a family of modest means, his father being an insurance salesman; but he was nonetheless sent off to private schools to obtain a good education. Here he was often tormented for his height, having reached a...	https://m.media-amazon.com/images/M/MV5BMTQ1MTIzMzM1MF5BMl5BanBnXkFtZTYwNjQ3ODI1._V1_FMjpg_UX1000_.jpg	Born:  October 27,  1939  in Weston-Super-Mare, Somerset, England, UK	
523	nm0001385	/name/nm0001385	 Eric Idle\n	Eric Idle is an English comedian, actor, author, singer, playwright, director, and songwriter. co-creator of Monty Python on TV, stage, and five films, including The Life of Brian and The Holy Grail, which he later adapted for the stage with John Du Prez as Monty Python's Spamalot, winning the Tony Award for Best Musical in 2005, a Grammy, a Drama...	https://m.media-amazon.com/images/M/MV5BNzY4NTQwNDA4M15BMl5BanBnXkFtZTYwNTg5Njcz._V1_FMjpg_UX1000_.jpg	Born:  March 29,  1943  in South Shields, Tyne and Wear, England, UK	
524	nm0386570	/name/nm0386570	 Oliver Hirschbiegel\n	Born in Hamburg, Germany, in 1957. In his teens he left high school and worked as a cooker in a boat. Then he studied painting and graphism in the Academy of arts in Hamburg where he also started experimenting with video and photography. Those experimental movies attracted the attention of some producers of the German TV. Hirschbiegel became popular...	https://m.media-amazon.com/images/M/MV5BMTgxMzcyMDc3Nl5BMl5BanBnXkFtZTcwMzQ4OTcyMg@@._V1_FMjpg_UX1000_.jpg	Born:  December 29,  1957  in Hamburg, Germany	
525	nm0251536	/name/nm0251536	 Bernd Eichinger\n(1949–2011)\n	Bernd Eichinger was born on April 11, 1949 in Neuburg an der Donau, Bavaria, Germany. He was a producer, known for Der Untergang (2004), Der Baader Meinhof Komplex (2008) and Perfume: The Story of a Murderer (2006). He was married to Katja Hofmann. He died on January 24, 2011 in Los Angeles, California, USA.	https://m.media-amazon.com/images/M/MV5BMTQwMTY2NDg0Ml5BMl5BanBnXkFtZTcwMzQzOTA0NA@@._V1_FMjpg_UX1000_.jpg	Born:  April 11,  1949  in Neuburg an der Donau, Bavaria, Germany	Died:  January 24,  2011  (age 61) in Los Angeles, California, USA
526	nm0275264	/name/nm0275264	 Joachim Fest\n(1926–2006)\n	Joachim Fest was born on December 8, 1926 in Berlin, Germany as Joachim Clemens Fest. He is known for his work on Der Untergang (2004), Hitler - Eine Karriere (1977) and Hallo Nachbarn! (1963). He was married to Ingrid Ascher. He died on September 11, 2006 in Kronberg im Taunus, Hesse, Germany.		Born:  December 8,  1926  in Berlin, Germany	Died:  September 11,  2006  (age 79) in Kronberg im Taunus, Hesse, Germany
527	nm0004486	/name/nm0004486	 Bruno Ganz\n(1941–2019)\n	Bruno Ganz was an acclaimed Swiss actor who was a prominent figure in German language film and television for over fifty years. He is internationally renowned for portraying Adolf Hitler in the Academy Award-nominated film Downfall (2004). Ganz was born in Zürich, to a Swiss mechanic father and a northern Italian mother. He decided to pursue an ...	https://m.media-amazon.com/images/M/MV5BNjkzYjU2NzAtMmEyZC00YTg2LWJmYTMtOGM1YTMwOTYwZTJjXkEyXkFqcGdeQXVyNDkzNTM2ODg@._V1_FMjpg_UX1000_.jpg	Born:  March 22,  1941  in Zürich-Seebach, Switzerland	Died:  February 16,  2019  (age 77) in Zürich, Switzerland
528	nm0487884	/name/nm0487884	 Alexandra Maria Lara\n	Born on 12 November 1978 in Bucharest, Romania, Alexandra Maria Lara fled to Germany with her parents when she was four and half years old. After graduating at the French High School, she studied acting at the Theaterwerkstatt Charlottenburg from 1997 and 2000, but had already played leading characters in several TV shows and movies such as Die ...	https://m.media-amazon.com/images/M/MV5BMTkzMDQ5ODM4OV5BMl5BanBnXkFtZTcwNjMzODI3MQ@@._V1_FMjpg_UX1000_.jpg	Born:  November 12,  1978  in Bucharest, Romania	
529	nm0559890	/name/nm0559890	 Ulrich Matthes\n	Ulrich Matthes was born on May 9, 1959 in West Berlin, West Germany. He is an actor, known for Der Untergang (2004), Feuerreiter (1998) and Der neunte Tag (2004).	https://m.media-amazon.com/images/M/MV5BMTMzNjU0NDcxNV5BMl5BanBnXkFtZTYwMzQ3NTEz._V1_FMjpg_UX1000_.jpg	Born:  May 9,  1959  in West Berlin, West Germany	
530	nm0006498	/name/nm0006498	Majid Majidi	Majid Majidi was born on April 17, 1959 in Tehran, Iran to a middle class family. He started acting in amateur theater groups at the age of fourteen. After receiving his high school diploma, he started studying art at the Institute of Dramatic Art in Tehran. After the Islamic Revolution of 1979, his interest in cinema brought him to act in various...	https://m.media-amazon.com/images/M/MV5BZmExNWI0MTgtMTQyZi00YjA3LWE1NDMtZDFhZTNiNmUxNTM1XkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  1959  in Tehran, Iran	
531	nm0619870	/name/nm0619870	 Mohammad Amir Naji\n	Mohammad Amir Naji is an actor, known for Avaze gonjeshk-ha (2008), Bacheha-Ye aseman (1997) and Sargije (2007).	https://m.media-amazon.com/images/M/MV5BOGQwOTBhODUtMDVmNS00YWUyLWFmMmMtMWI1ZjBiM2U0MGMyXkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg		
532	nm0268488	/name/nm0268488	 Amir Farrokh Hashemian\n	Amir Farrokh Hashemian is an actor, known for Bacheha-Ye aseman (1997).	https://m.media-amazon.com/images/M/MV5BMTI1MzUzMjkyOV5BMl5BanBnXkFtZTYwMzUxNDY2._V1_FMjpg_UX1000_.jpg		
533	nm0781245	/name/nm0781245	 Bahare Seddiqi\n	Bahare Seddiqi is an actress, known for Bacheha-Ye aseman (1997).	https://m.media-amazon.com/images/M/MV5BMTI0NzkwMDM2MV5BMl5BanBnXkFtZTYwMTUxNDY2._V1_FMjpg_UX1000_.jpg		
534	nm0855417	/name/nm0855417	 Akira Terao\n(I)\n	Akira Terao is the son of the famous actor Jukichi Uno. After graduating from Bunka Gakuin University, he formed a rock band "The Savage" which experienced brief success thanks to their hit 'Itsumademo, Itsumademo'. In 1967, Kei Kuma hired him to play alongside his father in his film 'Tunnel of Kurobe'. Terao then signed a contract with Ishihara ...		Born:  May 18,  1947  in Kanagawa, Japan	
537	nm0000432	/name/nm0000432	 Gene Hackman\n	Eugene Allen Hackman was born in San Bernardino, California, the son of Anna Lyda Elizabeth (Gray) and Eugene Ezra Hackman, who operated a newspaper printing press. He is of Pennsylvania Dutch (German), English, and Scottish ancestry, partly by way of Canada, where his mother was born. After several moves, his family settled in Danville, Illinois....	https://m.media-amazon.com/images/M/MV5BMTE5Njk0NDQ4OV5BMl5BanBnXkFtZTYwNjA0Mzc1._V1_FMjpg_UX1000_.jpg	Born:  January 30,  1930  in San Bernardino, California, USA	
469	nm0224634	/name/nm0224634	I.A.L. Diamond	I.A.L. Diamond was born on June 27, 1920 in Ungheni, Romania as Itek Domnici. He was a writer and producer, known for The Apartment (1960), Some Like It Hot (1959) and The Private Life of Sherlock Holmes (1970). He was married to Barbara Diamond. He died on April 21, 1988 in Beverly Hills, California, USA.	https://m.media-amazon.com/images/M/MV5BNjJhNTM0ODgtMTk5Zi00YzNmLTkzOTQtOTFkMDJjNGM2MTI1XkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  June 27,  1920  in Ungheni, Romania [now Moldova]	Died:  April 21,  1988  (age 67) in Beverly Hills, California, USA
538	nm0000054	/name/nm0000054	 Marilyn Monroe\n(1926–1962)\n	Marilyn Monroe was an American actress, comedienne, singer, and model. She became one of the world's most enduring iconic figures and is remembered both for her winsome embodiment of the Hollywood sex symbol and her tragic personal and professional struggles within the film industry. Her life and death are still the subjects of much controversy ...	https://m.media-amazon.com/images/M/MV5BNzQzNDMxMjQxNF5BMl5BanBnXkFtZTYwMTc5NTI2._V1_FMjpg_UX1000_.jpg	Born:  June 1,  1926  in Los Angeles, California, USA	Died:  August 5,  1962  (age 36) in Los Angeles, California, USA
539	nm0000348	/name/nm0000348	 Tony Curtis\n(I)\n(1925–2010)\n	Tony Curtis was born Bernard Schwartz, the eldest of three children of Helen (Klein) and Emanuel Schwartz, Jewish immigrants from Hungary. Curtis himself admits that while he had almost no formal education, he was a student of the "school of hard knocks" and learned from a young age that the only person who ever had his back was himself, so he ...	https://m.media-amazon.com/images/M/MV5BMTI4NTkwNTEyNF5BMl5BanBnXkFtZTYwNzAxNjI2._V1_FMjpg_UX1000_.jpg	Born:  June 3,  1925  in Manhattan, New York City, New York, USA	Died:  September 29,  2010  (age 85) in Henderson, Nevada, USA
470	nm0000493	/name/nm0000493	Jack Lemmon	Jack Lemmon was born in Newton, Massachusetts, to Mildred Lankford Noel and John Uhler Lemmon, Jr., the president of a doughnut company. His ancestry included Irish (from his paternal grandmother) and English. Jack attended Ward Elementary near his Newton, MA home. At age 9 he was sent to Rivers Country Day School, then located in nearby Brookline...	https://m.media-amazon.com/images/M/MV5BMTE5NTE3ODE1N15BMl5BanBnXkFtZTYwOTU1MTM2._V1_FMjpg_UX1000_.jpg	Born:  February 8,  1925  in Newton, Massachusetts, USA	Died:  June 27,  2001  (age 76) in Los Angeles, California, USA
540	nm1168510	/name/nm1168510	 Diana Wynne Jones\n(1934–2011)\n			Born:  August 16,  1934  in London, England, UK	Died:  March 26,  2011  (age 76) in Bristol, England, UK
541	nm0047962	/name/nm0047962	 Chieko Baishô\n	Chieko Baishô was born on June 29, 1941 in Tokyo, Japan. She is an actress, known for Hauru no ugoku shiro (2004), Otoko wa tsurai yo: Torajiro haibisukasu no hana (1980) and Otoko wa tsurai yo: Boukyou hen (1970). She has been married to Reijiro Koroku since 1993. She was previously married to Mamoru Komiya.		Born:  June 29,  1941  in Tokyo, Japan	
542	nm0454120	/name/nm0454120	 Takuya Kimura\n(I)\n	Takuya Kimura was born on November 13, 1972 in Tokyo, Japan. He is an actor, known for 2046 (2004), Bushi no ichibun (2006) and Space Battleship Yamato (2010). He has been married to Shizuka Kudô since 2000. They have two children.	https://m.media-amazon.com/images/M/MV5BMjM1ODAxNjIwOF5BMl5BanBnXkFtZTgwMzI2MDYzMjI@._V1_FMjpg_UX1000_.jpg	Born:  November 13,  1972  in Tokyo, Japan	
543	nm0309107	/name/nm0309107	 Tatsuya Gashûin\n	Tatsuya Gashûin was born on December 10, 1950 in Tokyo, Japan as Akinosuke Sugano. He is an actor, known for Sen to Chihiro no kamikakushi (2001), Hauru no ugoku shiro (2004) and Kamen raidâ Daburu (2009).	https://m.media-amazon.com/images/M/MV5BNzkwYTU0MTYtYTVhMC00NGQ3LWJkZmUtOWFlYzhmMDI3MzdmXkEyXkFqcGdeQXVyMjg0MTI5NzQ@._V1_FMjpg_UX1000_.jpg	Born:  December 10,  1950  in Tokyo, Japan	
544	nm0000581	/name/nm0000581	Joseph L. Mankiewicz	Born in Wilkes-Barre, Pennsylvania, on February 11, 1909, Joseph Leo Mankiewicz first worked for the movies as a translator of intertitles, employed by Paramount in Berlin, the UFA's American distributor at the time (1928). He became a dialoguist, then a screenwriter on numerous Paramount productions in Hollywood, most of them Jack Oakie vehicles. ...	https://m.media-amazon.com/images/M/MV5BMjA1MzMwMzEwNF5BMl5BanBnXkFtZTcwMTk5MjgyNw@@._V1_FMjpg_UX1000_.jpg	Born:  February 11,  1909  in Wilkes-Barre, Pennsylvania, USA	Died:  February 5,  1993  (age 83) in Bedford, New York, USA
545	nm0000012	/name/nm0000012	 Bette Davis\n(I)\n(1908–1989)\n	Ruth Elizabeth Davis was born April 5, 1908, in Lowell, Massachusetts, to Ruth Augusta (Favor) and Harlow Morrell Davis, a patent attorney. Her parents divorced when she was 10. She and her sister were raised by their mother. Her early interest was dance. To Bette, dancers led a glamorous life, but then she discovered the stage, and gave up ...	https://m.media-amazon.com/images/M/MV5BMTQ2OTQ4NTU2OF5BMl5BanBnXkFtZTcwMzI3MjY5Ng@@._V1_FMjpg_UX1000_.jpg	Born:  April 5,  1908  in Lowell, Massachusetts, USA	Died:  October 6,  1989  (age 81) in Neuilly-sur-Seine, Hauts-de-Seine, France
546	nm0000879	/name/nm0000879	 Anne Baxter\n(I)\n(1923–1985)\n	Anne Baxter was born in Michigan City, Indiana, on May 7, 1923. She was the daughter of a salesman and his wife, Catherine, who herself was the daughter of Frank Lloyd Wright, the world-renowned architect. Anne was a young girl of 11 when her parents moved to New York City, which at that time was still the hub of the entertainment industry even ...	https://m.media-amazon.com/images/M/MV5BMjA2OTU3MTM0Nl5BMl5BanBnXkFtZTYwMTgwMTM2._V1_FMjpg_UX1000_.jpg	Born:  May 7,  1923  in Michigan City, Indiana, USA	Died:  December 12,  1985  (age 62) in New York City, New York, USA
573	nm3160078	/name/nm3160078	 Eduardo Sacheri\n	Eduardo Sacheri is a writer, known for El secreto de sus ojos (2009), Secret in Their Eyes (2015) and Metegol (2013).			
572	nm0002728	/name/nm0002728	Juan José Campanella	Juan José Campanella was born on July 19, 1959 in Buenos Aires, Argentina. He is a writer and director, known for El secreto de sus ojos (2009), El hombre de tu vida (2011) and El mismo amor, la misma lluvia (1999).	https://m.media-amazon.com/images/M/MV5BMTcxMDgwNDM0NF5BMl5BanBnXkFtZTcwMzczMjMyMw@@._V1_FMjpg_UX1000_.jpg	Born:  July 19,  1959  in Buenos Aires, Argentina	
547	nm0001695	/name/nm0001695	 George Sanders\n(I)\n(1906–1972)\n	George Sanders was born of English parents in St. Petersburg, Russia. He worked in a Birmingham textile mill, in the tobacco business and as a writer in advertising. He entered show business in London as a chorus boy, going from there to cabaret, radio and theatrical understudy. His film debut, in 1936, was as Curly Randall in Find the Lady (1936)...	https://m.media-amazon.com/images/M/MV5BMTgyODU3MDQ4NV5BMl5BanBnXkFtZTcwOTgwOTkxOA@@._V1_FMjpg_UX1000_.jpg	Born:  July 3,  1906  in St. Petersburg, Russian Empire [now Russia]	Died:  April 25,  1972  (age 65) in Castelldefels, Barcelona, Catalonia, Spain
548	nm0000232	/name/nm0000232	 Sharon Stone\n(I)\n	Sharon Stone was born and raised in Meadville, a small town in Pennsylvania. Her strict father was a factory worker, and her mother was a homemaker. She was the second of four children. At the age of 15, she studied in Saegertown High School, Pennsylvania, and at that same age, entered Edinboro State University of Pennsylvania, and graduated with ...	https://m.media-amazon.com/images/M/MV5BMTg0MDU1ODQwNF5BMl5BanBnXkFtZTcwOTc3MjQwNA@@._V1_FMjpg_UX1000_.jpg	Born:  March 10,  1958  in Meadville, Pennsylvania, USA	
549	nm1010540	/name/nm1010540	 Terence Winter\n	Terence Winter was born on October 2, 1960 in Brooklyn, New York, USA as Terence Patrick Winter. He is a producer and writer, known for The Sopranos (1999), The Wolf of Wall Street (2013) and Boardwalk Empire (2010).	https://m.media-amazon.com/images/M/MV5BMTg1MTQxMzQxN15BMl5BanBnXkFtZTYwODY3NDg0._V1_FMjpg_UX1000_.jpg	Born:  October 2,  1960  in Brooklyn, New York, USA	
550	nm0067789	/name/nm0067789	 Jordan Belfort\n	Jordan Belfort was born on July 9, 1962 in Bronx, New York, USA. He is a producer and writer, known for The Wolf of Wall Street (2013), Firestorm (1997) and A Fandemic: 50 Fans Celebrate 50 Years of Cinema (2021). He was previously married to Nadine Caridi and Denise Lombardo.	https://m.media-amazon.com/images/M/MV5BNTkzOTYxMzI4OF5BMl5BanBnXkFtZTgwNDY4MTIyMTE@._V1_FMjpg_UX1000_.jpg	Born:  July 9,  1962  in Bronx, New York, USA	
551	nm1706767	/name/nm1706767	 Jonah Hill\n	Jonah Hill was born and raised in Los Angeles, the son of Sharon Feldstein (née Chalkin), a fashion designer and costume stylist, and Richard Feldstein, a tour accountant for Guns N' Roses. He is the brother of music manager Jordan Feldstein and actress Beanie Feldstein. He graduated from Crossroads School in Santa Monica and went on to The New ...	https://m.media-amazon.com/images/M/MV5BMTUyNDU0NzAwNl5BMl5BanBnXkFtZTcwMzQxMzIzNw@@._V1_FMjpg_UX1000_.jpg	Born:  December 20,  1983  in Los Angeles, California, USA	
552	nm3053338	/name/nm3053338	 Margot Robbie\n	Margot Elise Robbie was born on July 2, 1990 in Dalby, Queensland, Australia to Scottish parents. Her mother, Sarie Kessler, is a physiotherapist, and her father, is Doug Robbie. She comes from a family of four children, having two brothers and one sister. She graduated from Somerset College in Mudgeeraba, Queensland, Australia, a suburb in the ...	https://m.media-amazon.com/images/M/MV5BMTgxNDcwMzU2Nl5BMl5BanBnXkFtZTcwNDc4NzkzOQ@@._V1_FMjpg_UX1000_.jpg	Born:  July 2,  1990  in Dalby, Queensland, Australia	
553	nm0000165	/name/nm0000165	 Ron Howard\n(I)\n	Academy Award-winning filmmaker Ron Howard is one of this generation's most popular directors. From the critically acclaimed dramas A Beautiful Mind (2001) and Apollo 13 (1995) to the hit comedies Parenthood (1989) and Splash (1984), he has created some of Hollywood's most memorable films. Howard made his directorial debut in 1978 with the comedy ...	https://m.media-amazon.com/images/M/MV5BMTkzMDczMjUxNF5BMl5BanBnXkFtZTcwODY1Njk5Mg@@._V1_FMjpg_UX1000_.jpg	Born:  March 1,  1954  in Duncan, Oklahoma, USA	
554	nm0326040	/name/nm0326040	 Akiva Goldsman\n	Akiva Goldsman was born on July 7, 1962 in New York City, New York, USA. He is a producer and writer, known for A Beautiful Mind (2001), Batman & Robin (1997) and Cinderella Man (2005).	https://m.media-amazon.com/images/M/MV5BMTI0Mjg1MTY4NV5BMl5BanBnXkFtZTYwMDM3NDQ1._V1_FMjpg_UX1000_.jpg	Born:  July 7,  1962  in New York City, New York, USA	
555	nm0621586	/name/nm0621586	 Sylvia Nasar\n	Sylvia Nasar was born on August 17, 1947 in Rosenheim, Germany. She is known for her work on A Beautiful Mind (2001), 1st Look (2011) and American Experience (1988).		Born:  August 17,  1947  in Rosenheim, Germany	
365	nm0000124	/name/nm0000124	Jennifer Connelly	Jennifer Connelly was born in the Catskill Mountains, New York, to Ilene (Schuman), a dealer of antiques, and Gerard Connelly, a clothing manufacturer. Her father had Irish and Norwegian ancestry, and her mother was from a Jewish immigrant family. Jennifer grew up in Brooklyn Heights, just across the Brooklyn Bridge from Manhattan, except for the ...	https://m.media-amazon.com/images/M/MV5BOTczNTgzODYyMF5BMl5BanBnXkFtZTcwNjk4ODk4Mw@@._V1_FMjpg_UX1000_.jpg	Born:  December 12,  1970  in Catskill Mountains, New York, USA	
557	nm0836328	/name/nm0836328	 John Sturges\n(1910–1992)\n	John Sturges was an American film director, mostly remembered for his outstanding Western films. In 1992, Sturges was awarded a Golden Boot Award for his lifelong contribution to the Western genre. Sturges was born in the village of Oak Park, Illinois, within the Chicago metropolitan area. By 1930, the village had a population of 64,000 people. ...	https://m.media-amazon.com/images/M/MV5BMTM0NzkwODQwMl5BMl5BanBnXkFtZTcwMzQ1NjEwMw@@._V1_FMjpg_UX1000_.jpg	Born:  January 3,  1910  in Oak Park, Illinois, USA	Died:  August 18,  1992  (age 82) in San Luis Obispo, California, USA
558	nm0108595	/name/nm0108595	 Paul Brickhill\n(1916–1991)\n	Paul Brickhill was born on December 20, 1916 in Melbourne, Victoria, Australia as Paul Chester Jerome Brickhill. He was a writer, known for The Great Escape (1963), Reach for the Sky (1956) and The Dam Busters (1955). He was married to Margaret (Margot) Olive Slater. He died on April 23, 1991 in Victoria.		Born:  December 20,  1916  in Melbourne, Victoria, Australia	Died:  April 23,  1991  (age 74) in Victoria, Australia
559	nm0165412	/name/nm0165412	 James Clavell\n(1921–1994)\n	James Clavell was born on October 10, 1921, in Sydney, New South Wales, as Charles Edmund Dumaresq Clavell. He was a film and TV writer and producer. During World War II, he was a British soldier and a Japanese prisoner on Java and in Singapore, which led to his great interest in things East Asian and Japanese, and the experiences of prisoners of ...	https://m.media-amazon.com/images/M/MV5BMjEzZWIxNWQtZTA3Mi00MGI1LTg1OGEtN2IxMmNhM2E1NDIwXkEyXkFqcGdeQXVyMjUyNDk2ODc@._V1_FMjpg_UX1000_.jpg	Born:  October 10,  1921  in Sydney, New South Wales, Australia	Died:  September 7,  1994  (age 72) in Vevey, Vaud, Switzerland
560	nm0000537	/name/nm0000537	 Steve McQueen\n(I)\n(1930–1980)\n	He was the ultra-cool male film star of the 1960s, and rose from a troubled youth spent in reform schools to being the world's most popular actor. Over 40 years after his untimely death from mesothelioma in 1980, Steve McQueen is still considered hip and cool, and he endures as an icon of popular culture. McQueen was born in Beech Grove, Indiana, ...	https://m.media-amazon.com/images/M/MV5BMTQ3Mjk2MTU1MV5BMl5BanBnXkFtZTcwMTA5MTkzNA@@._V1_FMjpg_UX1000_.jpg	Born:  March 24,  1930  in Beech Grove, Indiana, USA	Died:  November 7,  1980  (age 50) in Ciudad Juárez, Chihuahua, Mexico
561	nm0001258	/name/nm0001258	 James Garner\n(I)\n(1928–2014)\n	Amiable and handsome James Garner had obtained success in both films and television, often playing variations of the charming anti-hero/con-man persona he first developed in Maverick, the offbeat western TV series that shot him to stardom in the late 1950s. James Garner was born James Scott Bumgarner in Norman, Oklahoma, to Mildred Scott (Meek) and...	https://m.media-amazon.com/images/M/MV5BMTM1Nzk2NTA3Nl5BMl5BanBnXkFtZTcwMzEzODI0NA@@._V1_FMjpg_UX1000_.jpg	Born:  April 7,  1928  in Norman, Oklahoma, USA	Died:  July 19,  2014  (age 86) in Brentwood, Los Angeles, California, USA
562	nm0000277	/name/nm0000277	 Richard Attenborough\n(1923–2014)\n	Lord Richard Attenborough was born in Cambridge, England, the son of Mary (née Clegg), a founding member of the Marriage Guidance Council, and Frederick Levi Attenborough, a scholar and academic administrator who was a don at Emmanuel College and wrote a standard text on Anglo-Saxon law. The family later moved to Leicester where his father was ...	https://m.media-amazon.com/images/M/MV5BMTkwMDQzMTAwN15BMl5BanBnXkFtZTcwNTI4NTgwMw@@._V1_FMjpg_UX1000_.jpg	Born:  August 29,  1923  in Cambridge, Cambridgeshire, England, UK	Died:  August 24,  2014  (age 90) in Denville Hall, Northwood, Hillingdon, London, England, UK
563	nm0868219	/name/nm0868219	Guillermo del Toro	Guillermo del Toro was born October 9, 1964 in Guadalajara, Jalisco, Mexico. Raised by his Catholic grandmother, del Toro developed an interest in filmmaking in his early teens. Later, he learned about makeup and effects from the legendary Dick Smith (The Exorcist (1973)) and worked on making his own short films. At the age of 21, del Toro ...	https://m.media-amazon.com/images/M/MV5BOTUzNTYwNjE0N15BMl5BanBnXkFtZTcwMjc0ODM1Mw@@._V1_FMjpg_UX1000_.jpg	Born:  October 9,  1964  in Guadalajara, Jalisco, Mexico	
564	nm1419440	/name/nm1419440	 Ivana Baquero\n	Ivana was born on June 11th, 1994, in Barcelona, Spain. She graduated High School at The American School of Barcelona in 2012. She got her big break in 2006 when Guillermo Del Toro cast her as the lead in his critically acclaimed fantasy thriller "Pan's Labyrinth." The role of Ofelia was originally intended for an eight-year-old girl, but the ...	https://m.media-amazon.com/images/M/MV5BMzkwZjkyZjgtOGYxNy00NDQyLTlkYjMtNTQ4MTIzY2RhZmU2XkEyXkFqcGdeQXVyNjgzMTk0NQ@@._V1_FMjpg_UX1000_.jpg	Born:  June 11,  1994  in Barcelona, Barcelona, Catalonia, Spain	
565	nm0317725	/name/nm0317725	 Ariadna Gil\n(I)\n	Born in January, 1969, she's the daughter of August Gil Matamala, a prestigious lawyer. Grew up studying singing, dancing and the violin. She even appeared occasionally singing with her two brothers in their banda named "Matamala". At 17, she appeared on the cover of an avant-garde Catalonian magazine and from there she began working in local ...	https://m.media-amazon.com/images/M/MV5BMTYxODMxNjU4N15BMl5BanBnXkFtZTYwMTM1NjA0._V1_FMjpg_UX1000_.jpg	Born:  January 23,  1969  in Barcelona, Barcelona, Catalonia, Spain	
566	nm0530365	/name/nm0530365	 Sergi López\n(I)\n	Sergi López is a Spanish actor, whose specialty is villains of all types but whose range also includes dramatizing romantic and comedic roles with equal mastery. He was born outside of Barcelona in the seaside town of Villanova i la Geltrú on December 22nd, 1965. As a youth he was inclined towards the performance arts and headed to France for ...	https://m.media-amazon.com/images/M/MV5BMTIzMDc3NzE4NV5BMl5BanBnXkFtZTYwNjQwODc1._V1_FMjpg_UX1000_.jpg	Born:  December 22,  1965  in Vilanova i la Geltrú, Barcelona, Catalonia, Spain	
567	nm0000759	/name/nm0000759	Paul Thomas Anderson	Anderson was born in 1970. He was one of the first of the "video store" generation of film-makers. His father was the first man on his block to own a V.C.R., and from a very early age Anderson had an infinite number of titles available to him. While film-makers like Spielberg cut their teeth making 8 mm films, Anderson cut his teeth shooting films...	https://m.media-amazon.com/images/M/MV5BMTQwNjc5NjY2NV5BMl5BanBnXkFtZTcwNDIxMzg1MQ@@._V1_FMjpg_UX1000_.jpg	Born:  June 26,  1970  in Studio City, California, USA	
568	nm0801737	/name/nm0801737	 Upton Sinclair\n(1878–1968)\n	Upton Sinclair was born on September 20, 1878 in Baltimore, Maryland, USA as Upton Beall Sinclair. He was a writer and producer, known for There Will Be Blood (2007), The Wet Parade (1932) and Maiden No More. He was married to Mary Elizabeth Hard Willis, Mary Craig Sinclair and Meta Fuller. He died on November 25, 1968 in Bound Brook, New Jersey, ...		Born:  September 20,  1878  in Baltimore, Maryland, USA	Died:  November 25,  1968  (age 90) in Bound Brook, New Jersey, USA
569	nm0000358	/name/nm0000358	 Daniel Day-Lewis\n	Born in London, England, Daniel Michael Blake Day-Lewis is the second child of Cecil Day-Lewis (pseudonym Cecil Day-Lewis), Poet Laureate of the U.K., and his second wife, actress Jill Balcon. His maternal grandfather was Sir Michael Balcon, an important figure in the history of British cinema and head of the famous Ealing Studios. His older ...	https://m.media-amazon.com/images/M/MV5BMjE2NDY2NDc1Ml5BMl5BanBnXkFtZTcwNjAyMjkwOQ@@._V1_FMjpg_UX1000_.jpg	Born:  April 29,  1957  in Greenwich, London, England, UK	
570	nm0200452	/name/nm0200452	 Paul Dano\n	An actor for all seasons and all kinds of roles (from dark, difficult characters to more loving ones) Paul Dano has an extensive body work that includes working with directors such as Paul Thomas Anderson, Steve McQueen, Dayton & Ferris, Ang Lee, Denis Villenueve and Paolo Sorrentino; acting with heavyweights such as Harrison Ford, Daniel ...	https://m.media-amazon.com/images/M/MV5BMjMwMzE1OTc0OF5BMl5BanBnXkFtZTcwMDU2NTg0Nw@@._V1_FMjpg_UX1000_.jpg	Born:  June 19,  1984  in New York City, New York, USA	
571	nm0001354	/name/nm0001354	 Ciarán Hinds\n	Ciarán Hinds was born in Belfast, Northern Ireland on February 9, 1953. He was one of five children and the only son. His father was a doctor who hoped to have Ciarán follow in his footsteps, but that was not to be. It was his mother Moya, an amateur actress, who was the real influence behind his decision to become an actor. Though he did enroll ...	https://m.media-amazon.com/images/M/MV5BMTIyNjM0MzU0NF5BMl5BanBnXkFtZTcwOTIxMzg1MQ@@._V1_FMjpg_UX1000_.jpg	Born:  February 9,  1953  in Belfast, Northern Ireland, UK	
574	nm0201857	/name/nm0201857	 Ricardo Darín\n	Ricardo Darín was born in Buenos Aires, Argentina, on January 16, 1957. He works since he was a little boy, and has obtained with the years a remarkable evolution from soap opera gallant and tv comedies to an excellent leading figure of the most importants Argentinian movies. At the age of 10 he made his debut in a play along with his parents, ...	https://m.media-amazon.com/images/M/MV5BMTgxOTAyMTAzNV5BMl5BanBnXkFtZTcwODE2MTUzOA@@._V1_FMjpg_UX1000_.jpg	Born:  January 16,  1957  in Buenos Aires, Federal District, Argentina	
575	nm0897845	/name/nm0897845	 Soledad Villamil\n	Soledad Villamil was born on June 19, 1969 in La Plata, Buenos Aires, Argentina. She is an actress, known for El secreto de sus ojos (2009), El mismo amor, la misma lluvia (1999) and No sos vos, soy yo (2004). She has been married to Federico Olivera since February 2021. They have two children.	https://m.media-amazon.com/images/M/MV5BMTM2OTkwOTk3NF5BMl5BanBnXkFtZTcwMjA2MzAyOA@@._V1_FMjpg_UX1000_.jpg	Born:  June 19,  1969  in La Plata, Buenos Aires, Argentina	
576	nm0706567	/name/nm0706567	 Pablo Rago\n(I)\n	Pablo Rago was born on September 24, 1972 in Buenos Aires, Federal District, Argentina as Pablo Adrián Ragonese. He is an actor, known for El secreto de sus ojos (2009), Vientos de agua (2006) and Mosca y Smith en el Once (2004).	https://m.media-amazon.com/images/M/MV5BMGViOTMyOTUtN2MyYi00YTU2LWE0N2QtMDQyYTA5MTBlZTE0XkEyXkFqcGdeQXVyNjU0ODkwMTU@._V1_FMjpg_UX1000_.jpg	Born:  September 24,  1972  in Buenos Aires, Federal District, Argentina	
577	nm0006452	/name/nm0006452	 Stanley Kramer\n(I)\n(1913–2001)\n	Stanley Kramer was born on September 29, 1913 in Hell's Kitchen [now Clinton], Manhattan, New York City, New York, USA as Stanley Earl Abramson. He was a producer and director, known for Judgment at Nuremberg (1961), Guess Who's Coming to Dinner (1967) and Inherit the Wind (1960). He was married to Karen Sharpe, Anne P. Kramer and Marilyn Erskine....	https://m.media-amazon.com/images/M/MV5BMTYwNDAwNjk0NV5BMl5BanBnXkFtZTgwMzEyMTM1NzM@._V1_FMjpg_UX1000_.jpg	Born:  September 29,  1913  in Hell's Kitchen [now Clinton], Manhattan, New York City, New York, USA	Died:  February 19,  2001  (age 87) in Woodland Hills, Los Angeles, California, USA
578	nm0542631	/name/nm0542631	Abby Mann	Abby Mann was born on December 1, 1927 in Philadelphia, Pennsylvania, USA as Abraham Goodman. He was a writer and producer, known for Judgment at Nuremberg (1961), Kojak (1973) and Skag (1980). He was married to Myra Mann. He died on March 25, 2008 in Beverly Hills, Los Angeles, California, USA.	https://m.media-amazon.com/images/M/MV5BNzA4ZWI2MzEtZGNiNS00OTViLWFiM2ItZmE1NWQ3Yzg4MjAwXkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  December 1,  1927  in Philadelphia, Pennsylvania, USA	Died:  March 25,  2008  (age 80) in Beverly Hills, Los Angeles, California, USA
579	nm0000075	/name/nm0000075	 Spencer Tracy\n(I)\n(1900–1967)\n	Spencer Tracy was the second son born on April 5, 1900, to truck salesman John Edward and Caroline Brown Tracy in Milwaukee, Wisconsin. While attending Marquette Academy, he and classmate Pat O'Brien quit school to enlist in the Navy at the start of World War I. Tracy was still at Norfolk Navy Yard in Virginia at the end of the war. After playing ...	https://m.media-amazon.com/images/M/MV5BMTIwNjE5NTc0OV5BMl5BanBnXkFtZTYwNDU5ODI2._V1_FMjpg_UX1000_.jpg	Born:  April 5,  1900  in Milwaukee, Wisconsin, USA	Died:  June 10,  1967  (age 67) in Beverly Hills, Los Angeles, California, USA
580	nm0000044	/name/nm0000044	 Burt Lancaster\n(1913–1994)\n	Burt Lancaster, one of five children, was born in Manhattan, to Elizabeth (Roberts) and James Henry Lancaster, a postal worker. All of his grandparents were immigrants from Northern Ireland. He was a tough street kid who took an early interest in gymnastics. He joined the circus as an acrobat and worked there until he was injured. It was in the ...	https://m.media-amazon.com/images/M/MV5BMTM0MjM1MTYyOF5BMl5BanBnXkFtZTYwMjExOTE2._V1_FMjpg_UX1000_.jpg	Born:  November 2,  1913  in New York City, New York, USA	Died:  October 20,  1994  (age 80) in Century City, California, USA
581	nm0001847	/name/nm0001847	 Richard Widmark\n(1914–2008)\n	Richard Widmark established himself as an icon of American cinema with his debut in the 1947 film noir Kiss of Death (1947), in which he won a Best Supporting Actor Academy Award nomination as the killer Tommy Udo. Kiss of Death (1947) and other noir thrillers established Widmark as part of a new generation of American movie actors who became ...	https://m.media-amazon.com/images/M/MV5BMTU0MjgwODQ3M15BMl5BanBnXkFtZTcwMjIxMjUyNA@@._V1_FMjpg_UX1000_.jpg	Born:  December 26,  1914  in Sunrise Township, Chisago County, Minnesota, USA	Died:  March 24,  2008  (age 93) in Roxbury, Connecticut, USA
582	nm0002076	/name/nm0002076	 Jason Flemyng\n	Jason Flemyng was born on September 25, 1966 in Putney, London, England as Jason Iain Flemyng. He is an actor and producer, known for The Curious Case of Benjamin Button (2008), Lock, Stock and Two Smoking Barrels (1998) and Deep Rising (1998). He has been married to Elly Fairman since June 6, 2008.	https://m.media-amazon.com/images/M/MV5BMjA0MjUxNTk5MV5BMl5BanBnXkFtZTcwOTE0OTEyOA@@._V1_FMjpg_UX1000_.jpg	Born:  September 25,  1966  in Putney, London, England, UK	
583	nm0002077	/name/nm0002077	 Dexter Fletcher\n(I)\n	BAFTA-nominee Dexter Fletcher is a British actor turned director from London. He began his career at the age of 6 and at the age of 9 starred as Baby Face in Alan Parker's Bugsy Malone. Fletcher continued to work in the industry on screen for the next four decades, appearing on-screen alongside acting greats Al Pacino, Anthony Hopkins, Robert de ...	https://m.media-amazon.com/images/M/MV5BZDFjYjI0ZWMtZWI4Yy00NDQ2LWEyNTAtZDJiZmNmY2Q2MmE0XkEyXkFqcGdeQXVyMTQ0NDg1MDY@._V1_FMjpg_UX1000_.jpg	Born:  January 31,  1966  in London, England, UK	
584	nm0602941	/name/nm0602941	 Nick Moran\n(I)\n	Nick Moran was born on December 23, 1969 in East End, London, England as Nick James Moran. He is an actor and writer, known for Lock, Stock and Two Smoking Barrels (1998), Harry Potter and the Deathly Hallows: Part 1 (2010) and The Musketeer (2001). He was previously married to Sienna Guillory.	https://m.media-amazon.com/images/M/MV5BNDgyODM2NDM2N15BMl5BanBnXkFtZTcwODExODU4NQ@@._V1_FMjpg_UX1000_.jpg	Born:  December 23,  1969  in East End, London, England, UK	
585	nm0483766	/name/nm0483766	 Jake LaMotta\n(1922–2017)\n	Jake LaMotta had one of the best chins in boxing history. In over 110 fights against the greatest middleweights in history, LaMotta was only knocked to the canvas once in his entire 14 year career. Turning pro in the early 1940s, Lamotta ran up an impressive undefeated streak before losing. He was the first fighter to defeat the great Sugar Ray ...	https://m.media-amazon.com/images/M/MV5BMjI3MzcxNjMyOF5BMl5BanBnXkFtZTcwNTI1ODExOA@@._V1_FMjpg_UX1000_.jpg	Born:  July 10,  1922  in The Bronx, New York, USA	Died:  September 19,  2017  (age 95) in Aventura, Florida, USA
586	nm0141734	/name/nm0141734	 Joseph Carter\n(I)\n	Contribute to IMDb. Add a bio, trivia, and more.\nUpdate information for Joseph Carter »			
587	nm0001550	/name/nm0001550	 Cathy Moriarty\n	Bronx-born character actress Cathy Moriarty was just 18 years old, fresh out of high school and had no idea that her life was about to change. Joe Pesci discovered her competing in a bathing-beauty contest at a bar. He invited her to audition for the part of Vikki LaMotta, second wife to champion boxer Jake LaMotta, portrayed by Robert De Niro, in ...	https://m.media-amazon.com/images/M/MV5BMTAzOTc1NjU4MjFeQTJeQWpwZ15BbWU2MDc3NjgzMw@@._V1_FMjpg_UX1000_.jpg	Born:  November 29,  1960  in The Bronx, New York, USA	
588	nm0847054	/name/nm0847054	 Hitoshi Takagi\n(1925–2004)\n	Hitoshi Takagi was born on February 26, 1925. He was an actor, known for Tonari no Totoro (1988), Kumonosu-jo (1957) and Shurayukihime (1973). He died on February 11, 2004 in Japan.		Born:  February 26,  1925	Died:  February 11,  2004  (age 78) in Japan
589	nm0383022	/name/nm0383022	 Noriko Hidaka\n	Noriko Hidaka was born on May 31, 1962 in Tokyo, Japan as Noriko Nagai. She is an actress, known for Tonari no Totoro (1988), Rurôni Kenshin - Meiji kenkaku romantan (1996) and Ranma ½ (1989).		Born:  May 31,  1962  in Tokyo, Japan	
590	nm0757076	/name/nm0757076	 Chika Sakamoto\n	Chika Sakamoto was born on August 17, 1959 in Tokyo, Japan as Chika Ishihara. She is an actress, known for Kaze no tani no Naushika (1984), Tonari no Totoro (1988) and Dejimon Adobenchâ (1999).		Born:  August 17,  1959  in Tokyo, Japan	
591	nm0001379	/name/nm0001379	John Huston	An eccentric rebel of epic proportions, this Hollywood titan reigned supreme as director, screenwriter and character actor in a career that endured over five decades. The ten-time Oscar-nominated legend was born John Marcellus Huston in Nevada, Missouri, on August 5, 1906. His ancestry was English, Scottish, Scots-Irish, distant German and very ...	https://m.media-amazon.com/images/M/MV5BMjI0OTcyMDcxMF5BMl5BanBnXkFtZTcwNDY0MjE3Mw@@._V1_FMjpg_UX1000_.jpg	Born:  August 5,  1906  in Nevada, Missouri, USA	Died:  August 28,  1987  (age 81) in Middletown, Rhode Island, USA
592	nm0871252	/name/nm0871252	 B. Traven\n(I)\n(1882–1969)\n	B. Traven was born on February 23, 1882 in Schwiebus, Prussia, Germany as Ret Marut. He was a writer and actor, known for The Treasure of the Sierra Madre (1948), La rebelión de los colgados (1954) and Macario (1960). He was married to Rosa Elena Lujan. He died on March 27, 1969 in Mexico City, Distrito Federal, Mexico.		Born:  February 23,  1882  in Schwiebus, Prussia, Germany [now Swiebodzin, Lubuskie, Poland]	Died:  March 27,  1969  (age 87) in Mexico City, Distrito Federal, Mexico
208	nm0000007	/name/nm0000007	Humphrey Bogart	Humphrey DeForest Bogart was born in New York City, New York, to Maud Humphrey, a famed magazine illustrator and suffragette, and Belmont DeForest Bogart, a moderately wealthy surgeon (who was secretly addicted to opium). Bogart was educated at Trinity School, NYC, and was sent to Phillips Academy in Andover, Massachusetts, in preparation for ...	https://m.media-amazon.com/images/M/MV5BMTIyOTE3MDM5Ml5BMl5BanBnXkFtZTYwMzA2MTM2._V1_FMjpg_UX1000_.jpg	Born:  December 25,  1899  in New York City, New York, USA	Died:  January 14,  1957  (age 57) in Los Angeles, California, USA
593	nm0404158	/name/nm0404158	 Walter Huston\n(1883–1950)\n	For many years Walter Huston had two passions: his career as an engineer and his vocation for the stage. In 1909 he dedicated himself to the theatre, and made his debut on Broadway in 1924. In 1929 he journeyed to Hollywood, where his talent and ability made him one of the most respected actors in the industry. He won a Best Supporting Actor ...	https://m.media-amazon.com/images/M/MV5BMTU1MDMwNjUzOF5BMl5BanBnXkFtZTYwMjk1MjI2._V1_FMjpg_UX1000_.jpg	Born:  April 5,  1883  in Toronto, Ontario, Canada	Died:  April 7,  1950  (age 67) in Hollywood, Los Angeles, California, USA
594	nm0392529	/name/nm0392529	 Tim Holt\n(I)\n(1919–1973)\n	As they say, like father, like son. Cowboy hero Tim Holt avidly followed in the boots of his famous character-actor dad, the granite-jawed Jack Holt (b. Charles John Holt), who appeared in hundreds of silents and talkies (many of them westerns) over the years. The two actually appeared together as father and son in the western The Arizona Ranger (...	https://m.media-amazon.com/images/M/MV5BMTYwMjQ5NzU0MF5BMl5BanBnXkFtZTcwODkyNDYwOA@@._V1_FMjpg_UX1000_.jpg	Born:  February 5,  1919  in Beverly Hills, Los Angeles, California, USA	Died:  February 15,  1973  (age 54) in Shawnee, Oklahoma, USA
595	nm0461425	/name/nm0461425	Frederick Knott			Born:  August 28,  1916  in Hankow, China	Died:  December 17,  2002  (age 86) in New York City, New York, USA
596	nm0001537	/name/nm0001537	 Ray Milland\n(1907–1986)\n	Ray Milland became one of Paramount's most bankable and durable stars, under contract from 1934 to 1948, yet little in his early life suggested a career as a motion picture actor. Milland was born Alfred Reginald Jones in the Welsh town of Neath, Glamorgan, to Elizabeth Annie (Truscott) and Alfred Jones. He spent his youth in the pursuit of sports....	https://m.media-amazon.com/images/M/MV5BMjAyMjgyNDYwN15BMl5BanBnXkFtZTYwNjUxNjI2._V1_FMjpg_UX1000_.jpg	Born:  January 3,  1907  in Neath, Glamorgan, Wales, UK	Died:  March 10,  1986  (age 79) in Torrance, California, USA
597	nm0191950	/name/nm0191950	 Robert Cummings\n(I)\n(1910–1990)\n	Effective light comedian of '30s and '40s films and '50s and '60s TV series, Robert Cummings was renowned for his eternally youthful looks (which he attributed to a strict vitamin and health-food diet). He was educated at Carnegie Tech and the American Academy of Dramatic Arts. Deciding that Broadway producers would be more interested in an ...	https://m.media-amazon.com/images/M/MV5BMTUzNTg2NjU4NV5BMl5BanBnXkFtZTYwMDEwMTM2._V1_FMjpg_UX1000_.jpg	Born:  June 9,  1910  in Joplin, Missouri, USA	Died:  December 2,  1990  (age 80) in Woodland Hills, Los Angeles, California, USA
598	nm0436164	/name/nm0436164	 Laeta Kalogridis\n	Laeta Kalogridis was born on August 30, 1965 as Laeta Elizabeth Kalogridis. She is a writer and producer, known for Shutter Island (2010), Alita: Battle Angel (2019) and Alexander (2004).	https://m.media-amazon.com/images/M/MV5BZmVhMTlmNDYtMTdmYi00NmYxLTllYTUtNTAyNTZlNzJmNGE5XkEyXkFqcGdeQXVyMDE3NDQzNQ@@._V1_FMjpg_UX1000_.jpg	Born:  August 30,  1965	
599	nm1212331	/name/nm1212331	 Dennis Lehane\n(II)\n	Dennis Lehane was born on August 4, 1965 in Dorchester, Massachusetts, USA as Dennis Joseph Lehane. He is a producer and writer, known for Mystic River (2003), The Drop (2014) and Live by Night (2016). He was previously married to Dr. Angela Mililani (Lieb) Bernardo and Sheila Fort Lawn.	https://m.media-amazon.com/images/M/MV5BMTk2OTA5ODE1N15BMl5BanBnXkFtZTgwNzc4ODE2MjE@._V1_FMjpg_UX1000_.jpg	Born:  August 4,  1965  in Dorchester, Massachusetts, USA	
600	nm0607865	/name/nm0607865	 Emily Mortimer\n	English actress Emily Kathleen Anne Mortimer was born in Hammersmith, London, England, to writer and barrister Sir John Mortimer and his second wife, Penelope (née Gollop). She was educated at St Paul's Girls' School in West London, and it was whilst there she began acting. Mortimer moved on from school to Lincoln College, Oxford University, where...	https://m.media-amazon.com/images/M/MV5BMTM2NjIzMDg3NV5BMl5BanBnXkFtZTcwNDQ5MzczNA@@._V1_FMjpg_UX1000_.jpg	Born:  December 1,  1971  in London, England, UK	
602	nm0000531	/name/nm0000531	 Frances McDormand\n	Frances Louise McDormand was born on June 23, 1957, in Gibson City, Illinois. She was adopted by Canadian-born parents Noreen Eloise (Nickleson), a nurse from Ontario, and Rev. Vernon Weir McDormand, a Disciples of Christ minister from Nova Scotia, who raised her in the suburbs of Pittsburgh. She earned a BA in theater from Bethany College in 1979...	https://m.media-amazon.com/images/M/MV5BMjI3NzgxNjYzOF5BMl5BanBnXkFtZTgwNTIxMjExNzE@._V1_FMjpg_UX1000_.jpg	Born:  June 23,  1957  in Gibson City, Illinois, USA	
603	nm0000437	/name/nm0000437	 Woody Harrelson\n	Academy Award-nominated and Emmy Award-winning actor Woodrow Tracy Harrelson was born on July 23, 1961 in Midland, Texas, to Diane Lou (Oswald) and Charles Harrelson. He grew up in Lebanon, Ohio, where his mother was from. After receiving degrees in theater arts and English from Hanover College, he had a brief stint in New York theater. He was ...	https://m.media-amazon.com/images/M/MV5BMTU3NDc2ODc4MF5BMl5BanBnXkFtZTcwODk2MzAyMg@@._V1_FMjpg_UX1000_.jpg	Born:  July 23,  1961  in Midland, Texas, USA	
604	nm0005377	/name/nm0005377	 Sam Rockwell\n	Sam Rockwell was born on November 5, 1968, in San Mateo, California, the only child of two actors, Pete Rockwell and Penny Hess. The family moved to New York when he was two years old, living first in the Bronx and later in Manhattan. When Sam was five years old, his parents separated, at which point he and his father moved to San Francisco, where...	https://m.media-amazon.com/images/M/MV5BMTc2NTM3MzE5NF5BMl5BanBnXkFtZTcwMjg4NDMwNA@@._V1_FMjpg_UX1000_.jpg	Born:  November 5,  1968  in Daly City, California, USA	
605	nm0841501	/name/nm0841501	 Mack Swain\n(1876–1935)\n	Mack Swain was born in 1876 and soon became a talented vaudevillian. In 1913 he was hired by Mack Sennett and appeared in a few Mabel Normand pictures until a year later he became even bigger when 'Charlie Chaplin' arrived at the Keystone Studio. Swain later created a character by the name of Ambrose whom he appeared with Mr. Walrus (Played by ...	https://m.media-amazon.com/images/M/MV5BOGRkZjljYmQtMGVmZS00OWNhLWIzZjAtMzBhYTM1NjQ4NDZlXkEyXkFqcGdeQXVyMDUyOTUyNQ@@._V1_FMjpg_UX1000_.jpg	Born:  February 16,  1876  in Salt Lake City, Utah, USA	Died:  August 25,  1935  (age 59) in Tacoma, Washington, USA
606	nm0615306	/name/nm0615306	 Tom Murray\n(I)\n(1873–1935)\n	Tom Murray was born on September 8, 1873 in Stonefoot, Illinois, USA as Thomas Henderson Murray. He was an actor, known for The Gold Rush (1925), Tramp, Tramp, Tramp (1926) and Into Her Kingdom (1926). He was married to Louise Carver. He died on August 27, 1935 in Hollywood, California, USA.	https://m.media-amazon.com/images/M/MV5BNTFkOTk0YzctNDcyOS00YmFlLWEzMzktMmNlMGQ1Njg2MzllXkEyXkFqcGdeQXVyMzI5NDcxNzI@._V1_FMjpg_UX1000_.jpg	Born:  September 8,  1873  in Stonefoot, Illinois, USA	Died:  August 27,  1935  (age 61) in Hollywood, California, USA
607	nm1463981	/name/nm1463981	Çagan Irmak	Çagan Irmak was born on April 4, 1970 in Izmir, Turkey. He is a director and writer, known for Babam ve Oglum (2005), Issiz Adam (2008) and Ulak (2008).	https://m.media-amazon.com/images/M/MV5BMzAyOGI2YzgtMDMyNi00ZTkwLWJiNDctYWUwOGU1Njk1MTYyXkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  April 4,  1970  in Izmir, Turkey	
608	nm12232673	/name/nm12232673	 Eser Sariyar\n	Eser Sariyar was born June 24, 2004 in Odense, Danmark. He is an actor. And now he lives in Turkey. and still studying in Turkey Eser Sariyar is considered to be one of Turkey's best young actors and most respected artists today. Also involved in software development . Known from Turkish movies.			
609	nm1002038	/name/nm1002038	 Çetin Tekindor\n	Çetin Tekindor is considered to be one of Turkey's best actors and most respected artists today. He was born in Sivas, Turkey in 1945. He graduated from Ankara State Conservatory in 1970, and his stage career started with the play "Murat IV". He is one of the most impressive performers in Turkish film and television thanks to his charismatic ...	https://m.media-amazon.com/images/M/MV5BMDU5MTJkMzMtMWFiNC00NmY5LTk1ODUtYTg5OTZlZDY0Nzg2XkEyXkFqcGdeQXVyNzg5OTk2OA@@._V1_FMjpg_UX1000_.jpg	Born:  July 16,  1945  in Sivas, Turkey	
610	nm0476334	/name/nm0476334	 Fikret Kuskan\n	He was born in 1965, Kuskan was graduated from Istanbul University State Conservatory. Right after his graduation, he starred in various Film and TV projects. Along with tie International Antalya Golden Orange Film Festival and Istanbul/ Ankara Film Festivals. He was awarded for his Outstanding performances on stage and in movies as well.		Born:  April 22,  1965  in Istanbul, Turkey	
149	nm0000591	/name/nm0000591	Roman Polanski	Roman Polanski is a Polish film director, producer, writer and actor. Having made films in Poland, Britain, France and the USA, he is considered one of the few truly international filmmakers. Roman Polanski was born in Paris in 1933. His parents returned to Poland from France in 1936, three years before World War II began. On Germany's invasion in ...	https://m.media-amazon.com/images/M/MV5BMTAzNzgwMzMyNDNeQTJeQWpwZ15BbWU2MDg0MDkzNA@@._V1_FMjpg_UX1000_.jpg	Born:  August 18,  1933  in Paris, France	
611	nm0001801	/name/nm0001801	 Robert Towne\n(I)\n	Writer, director, producer, actor. Born in Los Angeles, California, USA, and raised in the seaport town of San Pedro. Got his start acting and writing for legendary exploitation director/producer Roger Corman. Came into his own during the 1970s when he was regarded as one of the finest screenwriters in Hollywood. Began directing with mixed success...	https://m.media-amazon.com/images/M/MV5BMTY4NjA2ODA0Nl5BMl5BanBnXkFtZTYwNzM5Mjg1._V1_FMjpg_UX1000_.jpg	Born:  November 23,  1934  in Los Angeles, California, USA	
612	nm0001159	/name/nm0001159	 Faye Dunaway\n	An icy, elegant blonde with a knack for playing complex and strong-willed female leads, enormously popular actress Faye Dunaway starred in several films which defined what many would come to call Hollywood's "second Golden Age." During her tenure at the top of the box office, she was a more than capable match for some of the biggest macho stars of...	https://m.media-amazon.com/images/M/MV5BMTk4OTU5MDY0OV5BMl5BanBnXkFtZTYwNTc0MTM1._V1_FMjpg_UX1000_.jpg	Born:  January 14,  1941  in Bascom, Florida, USA	
614	nm0001054	/name/nm0001054	Joel Coen	Joel Coen was born on November 29, 1954 in Minneapolis, Minnesota, USA as Joel Daniel Coen. He is a producer and writer, known for The Ballad of Buster Scruggs (2018), Fargo (1996) and Barton Fink (1991). He has been married to Frances McDormand since April 1, 1984. They have one child.	https://m.media-amazon.com/images/M/MV5BMTg3MjgwMzUzOF5BMl5BanBnXkFtZTcwODM5Nzk4MQ@@._V1_FMjpg_UX1000_.jpg	Born:  November 29,  1954  in Minneapolis, Minnesota, USA	
613	nm0001053	/name/nm0001053	Ethan Coen	Ethan Coen was born on September 21, 1957 in Minneapolis, Minnesota, USA as Ethan Jesse Coen. He is a producer and writer, known for The Ballad of Buster Scruggs (2018), Inside Llewyn Davis (2013) and A Serious Man (2009). He has been married to Tricia Cooke since October 2, 1990. They have two children.	https://m.media-amazon.com/images/M/MV5BMTI3NjIwNzQ2N15BMl5BanBnXkFtZTcwNTY0ODkyMg@@._V1_FMjpg_UX1000_.jpg	Born:  September 21,  1957  in Minneapolis, Minnesota, USA	
615	nm0000169	/name/nm0000169	 Tommy Lee Jones\n(I)\n	Tommy Lee Jones was born in San Saba, Texas, the son of Lucille Marie (Scott), a police officer and beauty shop owner, and Clyde C. Jones, who worked on oil fields. Tommy himself worked in underwater construction and on an oil rig. He attended St. Mark's School of Texas, a prestigious prep school for boys in Dallas, on a scholarship, and went to ...	https://m.media-amazon.com/images/M/MV5BMTkyNjc4MDc0OV5BMl5BanBnXkFtZTcwOTc5OTUwOQ@@._V1_FMjpg_UX1000_.jpg	Born:  September 15,  1946  in San Saba, Texas, USA	
616	nm0000849	/name/nm0000849	 Javier Bardem\n	Javier Bardem belongs to a family of actors that have been working on films since the early days of Spanish cinema. He was born in Las Palmas de Gran Canaria, Spain, to actress Pilar Bardem (María del Pilar Bardem Muñoz) and businessman José Carlos Encinas Doussinague. His maternal grandparents were actors Rafael Bardem and Matilde Muñoz Sampedro, ...	https://m.media-amazon.com/images/M/MV5BMTY1NTc4NTYzMF5BMl5BanBnXkFtZTcwNDIwOTY1NA@@._V1_FMjpg_UX1000_.jpg	Born:  March 1,  1969  in Las Palmas de Gran Canaria, Gran Canaria, Canary Islands, Spain	
617	nm0000982	/name/nm0000982	 Josh Brolin\n	Rugged features and a natural charm have worked for Josh Brolin, the son of actor James Brolin. He has played roles as a policeman, a hunter, and the President of the United States. Brolin was born February 12, 1968 in Santa Monica, California, to Jane Cameron (Agee), a Texas-born wildlife activist, and James Brolin. Josh was not interested at ...	https://m.media-amazon.com/images/M/MV5BMTQ1MzYyMjQ0Nl5BMl5BanBnXkFtZTcwMTA0ODkyMg@@._V1_FMjpg_UX1000_.jpg	Born:  February 12,  1968  in Santa Monica, California, USA	
618	nm0574625	/name/nm0574625	 James McTeigue\n	James McTeigue is a director and assistant director, known for V for Vendetta (2005), The Raven (2012) and Ninja Assassin (2009).	https://m.media-amazon.com/images/M/MV5BMTUxNTQwNDQ1MV5BMl5BanBnXkFtZTcwOTI2MDUwNg@@._V1_FMjpg_UX1000_.jpg		
619	nm0915989	/name/nm0915989	 Hugo Weaving\n	Hugo Wallace Weaving was born on April 4, 1960 in Nigeria, to English parents Anne (Lennard), a tour guide and teacher, and Wallace Weaving, a seismologist. Hugo has an older brother, Simon, and a younger sister, Anna, who both also live and work in Australia. During his early childhood, the Weaving family spent most of their time traveling ...	https://m.media-amazon.com/images/M/MV5BMjAxMzAyNDQyMF5BMl5BanBnXkFtZTcwOTM4ODcxMw@@._V1_FMjpg_UX1000_.jpg	Born:  April 4,  1960  in Ibadan, Nigeria	
620	nm0001291	/name/nm0001291	 Rupert Graves\n	Britain's Rupert Graves made his professional stage debut in 1983 in The Killing of Mr. Toad and went on to co-star with Harvey Fierstein in the London production of Torch Song Trilogy. By the mid-80s he was a presence in quality films and TV, including Merchant Ivory films Room With A View where he played Freddy Honeychurch and Maurice where he ...	https://m.media-amazon.com/images/M/MV5BMDliNGMyY2YtNDM1Yi00YzlhLTlkM2ItZTY4ODNiM2JkMjBhXkEyXkFqcGdeQXVyNzE3NzU1OQ@@._V1_FMjpg_UX1000_.jpg	Born:  June 30,  1963  in Weston-super-Mare, Somerset, England, UK	
621	nm0215455	/name/nm0215455	Ronnie Del Carmen	Ronnie del Carmen joined Pixar Animation Studios in the summer of 2000 during the production of "Finding Nemo" and became a story supervisor on the film. He did production design on the Academy Award®-nominated short film, "One Man Band" and story work on Oscar®-winning, "Ratatouille." Del Carmen was Head of Story on Disney/Pixar's Academy Award ...	https://m.media-amazon.com/images/M/MV5BMTk3OTA4NjgwM15BMl5BanBnXkFtZTgwMTg0MzMwNjE@._V1_FMjpg_UX1000_.jpg	Born:  December 31,  1959  in Philippines	
622	nm0688132	/name/nm0688132	 Amy Poehler\n	Amy Meredith Poehler was born in Newton, Massachusetts, to high school teachers Eileen Frances (Milmore) and William Grinstead Poehler. Her brother is comedian Greg Poehler. She is of Irish (from her mother) and English, Irish, German, and Portuguese (from her father) descent. Amy was first involved with sketch comedy when she joined the group My ...	https://m.media-amazon.com/images/M/MV5BYjIzMDA0NmUtMTlhZi00ZDU3LTkzYWMtZDhkYTU1ZDJlMGRkXkEyXkFqcGdeQXVyNzcwODE0OTk@._V1_FMjpg_UX1000_.jpg	Born:  September 16,  1971  in Burlington, Massachusetts, USA	
623	nm0352778	/name/nm0352778	 Bill Hader\n	Bill Hader was born on June 7, 1978 in Tulsa, Oklahoma, USA. He is an actor and writer, known for The Skeleton Twins (2014), Inside Out (2015) and It Chapter Two (2019). He was previously married to Maggie Carey.	https://m.media-amazon.com/images/M/MV5BNTY3MzgwMjE3N15BMl5BanBnXkFtZTcwNjc2MjE3NA@@._V1_FMjpg_UX1000_.jpg	Born:  June 7,  1978  in Tulsa, Oklahoma, USA	
624	nm0085400	/name/nm0085400	 Lewis Black\n(I)\n	Lewis Black was born on August 30, 1948 in Silver Spring, Maryland, USA as Lewis Niles Black. He is an actor and producer, known for Inside Out (2015), Accepted (2006) and Man of the Year (2006).	https://m.media-amazon.com/images/M/MV5BMTgwMzYyNzQwMV5BMl5BanBnXkFtZTcwOTI5NDY5Mw@@._V1_FMjpg_UX1000_.jpg	Born:  August 30,  1948  in Silver Spring, Maryland, USA	
625	nm0000118	/name/nm0000118	 John Carpenter\n(I)\n	John Howard Carpenter was born in Carthage, New York, to mother Milton Jean (Carter) and father Howard Ralph Carpenter. His family moved to Bowling Green, Kentucky, where his father, a professor, was head of the music department at Western Kentucky University. He attended Western Kentucky University and then USC film school in Los Angeles. He began...	https://m.media-amazon.com/images/M/MV5BMTAzMzgwNDgzODBeQTJeQWpwZ15BbWU4MDA2OTk2NDEx._V1_FMjpg_UX1000_.jpg	Born:  January 16,  1948  in Carthage, New York, USA	
626	nm0484111	/name/nm0484111	 Bill Lancaster\n(I)\n(1947–1997)\n	Bill was known by his friends as "Billy", when he was a youth. He attended "public" school, as many actor's sons and daughters did in the 1960s. He was never athletic since he was stricken with a childhood disease. He was well liked at Emerson Junior High School in West Los Angeles, California. He graduated from Emerson in June 1962. He was known ...		Born:  November 17,  1947  in Los Angeles County, California, USA	Died:  January 4,  1997  (age 49) in Los Angeles, California, USA
627	nm0132168	/name/nm0132168	 John W. Campbell Jr.\n(1910–1971)\n	John W. Campbell, Jr. was an American science fiction writer and editor, known predominantly for the sub-genre 'Hard Science Fiction', and further credited for his role in the Golden Age of Science Fiction. He began writing science fiction in his teens and attended Massachusetts Institute of Technology. He then studied at Duke University where he ...		Born:  June 8,  1910  in Newark, New Jersey, USA	Died:  July 11,  1971  (age 61) in Mountainside, New Jersey, USA
628	nm0000621	/name/nm0000621	 Kurt Russell\n(I)\n	Kurt Vogel Russell on March 17, 1951 in Springfield, Massachusetts to Louise Julia Russell (née Crone), a dancer & Bing Russell, an actor. He is of English, German, Scottish and Irish descent. His first roles were as a child on television series, including a lead role on the Western series The Travels of Jaimie McPheeters (1963). Russell landed a ...	https://m.media-amazon.com/images/M/MV5BMTk3MjkxNzQwMV5BMl5BanBnXkFtZTYwNDk4ODM1._V1_FMjpg_UX1000_.jpg	Born:  March 17,  1951  in Springfield, Massachusetts, USA	
629	nm0000979	/name/nm0000979	 Wilford Brimley\n(I)\n(1934–2020)\n	Wilford Brimley was born on September 27, 1934 in Salt Lake City, Utah, USA as Anthony Wilford Brimley. He was an actor, known for Cocoon (1985), The Thing (1982) and The Natural (1984). He was married to Beverly Berry and Lynne Brimley. He died on August 1, 2020 in St. George, Utah.	https://m.media-amazon.com/images/M/MV5BMDIyMDg0M2ItZTU5Yi00MzM2LWFjYzItMWZlZjc1MDk3NmZlXkEyXkFqcGdeQXVyMTI3MDk3MzQ@._V1_FMjpg_UX1000_.jpg	Born:  September 27,  1934  in Salt Lake City, Utah, USA	Died:  August 1,  2020  (age 85) in St. George, Utah, USA
630	nm0202966	/name/nm0202966	 Keith David\n(I)\n	Keith David is a classically trained actor, winning 3 Emmys out of 6 nominations as well as being nominated for a Tony award. He starred in the recently concluded TV series "Greenleaf" for Oprah Winfrey's OWN network. Upcoming films include "Horizon Line" with Allison Williams ("Get Out") and "Black As Night," for Amazon. In "Greenleaf" Keith ...	https://m.media-amazon.com/images/M/MV5BMTI5OTU4ODI1MF5BMl5BanBnXkFtZTcwMjU1NjkyNA@@._V1_FMjpg_UX1000_.jpg	Born:  June 4,  1956  in Harlem, New York City, New York, USA	
631	nm0000186	/name/nm0000186	 David Lynch\n(I)\n	Born in precisely the kind of small-town American setting so familiar from his films, David Lynch spent his childhood being shunted from one state to another as his research scientist father kept getting relocated. He attended various art schools, married Peggy Lynch and then fathered future director Jennifer Lynch shortly after he turned 21. That...	https://m.media-amazon.com/images/M/MV5BMTQ1MTY2MTY2Nl5BMl5BanBnXkFtZTcwMDg1ODYwNA@@._V1_FMjpg_UX1000_.jpg	Born:  January 20,  1946  in Missoula, Montana, USA	
632	nm0212246	/name/nm0212246	 Christopher De Vore\n	Christopher De Vore is a writer and actor, known for The Elephant Man (1980), Hamlet (1990) and Frances (1982).			
633	nm0075015	/name/nm0075015	 Eric Bergren\n(1954–2016)\n	Eric Bergren was born on April 27, 1954 in Pasadena, California, USA as Eric Lee Bergren. He was a writer and director, known for The Elephant Man (1980), Frances (1982) and The Dark Wind (1991). He died on July 14, 2016 in Pasadena.		Born:  April 27,  1954  in Pasadena, California, USA	Died:  July 14,  2016  (age 62) in Pasadena, California, USA
634	nm0000843	/name/nm0000843	 Anne Bancroft\n(I)\n(1931–2005)\n	Anne Bancroft was born on September 17, 1931 in the Bronx, the middle daughter of Michael Italiano (1905-2001), a dress pattern maker, and Mildred DiNapoli (1908-2010), a telephone operator. She made her cinema debut in Don't Bother to Knock (1952) in 1952 and over the next five years appeared in a lot of undistinguished movies as a supporting ...	https://m.media-amazon.com/images/M/MV5BMTg2MzQ3MTk4OV5BMl5BanBnXkFtZTcwMzIzNzgzNA@@._V1_FMjpg_UX1000_.jpg	Born:  September 17,  1931  in The Bronx, New York City, New York, USA	Died:  June 6,  2005  (age 73) in New York City, New York, USA
635	nm0000005	/name/nm0000005	Ingmar Bergman	Ernst Ingmar Bergman was born July 14, 1918, the son of a priest. The film and T.V. series, Den goda viljan (1992) is biographical and shows the early marriage of his parents. The film 'Söndagsbarn' depicts a bicycle journey with his father. In the miniseries Enskilda samtal (1996) is the trilogy closed. Here, as in 'Den Goda Viljan' Pernilla ...	https://m.media-amazon.com/images/M/MV5BMTc4MjQwMzY0N15BMl5BanBnXkFtZTcwNTI1NTM1MQ@@._V1_FMjpg_UX1000_.jpg	Born:  July 14,  1918  in Uppsala, Uppsala län, Sweden	Died:  July 30,  2007  (age 89) in Fårö, Gotlands län, Sweden
636	nm0001884	/name/nm0001884	 Max von Sydow\n(1929–2020)\n	Max von Sydow was born Carl Adolf von Sydow on April 10, 1929 in Lund, Skåne, Sweden, to a middle-class family. He was the son of Baroness Maria Margareta (Rappe), a teacher, and Carl Wilhelm von Sydow, an ethnologist and folklore professor. His surname traces back to his partial German ancestry. When he was in high school, he and a few fellow ...	https://m.media-amazon.com/images/M/MV5BMTI3MDQzOTMwN15BMl5BanBnXkFtZTYwMDgyMjM1._V1_FMjpg_UX1000_.jpg	Born:  April 10,  1929  in Lund, Skåne län, Sweden	Died:  March 8,  2020  (age 90) in Seillans, Var, France
637	nm0085038	/name/nm0085038	 Gunnar Björnstrand\n(1909–1986)\n	Being the son of an acting father, Oscar Johanson, it isn't surprising that he wanted to be an actor already as a child. However, he first worked as a baker's apprentice, in a barber shop or in the docks. After the conscription he got his first role, a bit part on the theater Lilla Teatern in Stockholm, while he took acting lessons. One of his ...	https://m.media-amazon.com/images/M/MV5BMTUzODQ4NjI3M15BMl5BanBnXkFtZTcwMTUyMDEyOA@@._V1_FMjpg_UX1000_.jpg	Born:  November 13,  1909  in Stockholm, Stockholms län, Sweden	Died:  May 26,  1986  (age 76) in Stockholm, Stockholms län, Sweden
638	nm0252345	/name/nm0252345	 Bengt Ekerot\n(1920–1971)\n	Bengt Ekerot was born on February 8, 1920 in Stockholm, Stockholms län, Sweden as Nils Bengt Folke Ekerot. He was an actor and director, known for Det sjunde inseglet (1957), Ansiktet (1958) and Det glada kalaset (1946). He was married to Margareta Hallin and Antoinette Gram. He died on November 26, 1971 in Stockholm.	https://m.media-amazon.com/images/M/MV5BMTczOTY5MTU3MF5BMl5BanBnXkFtZTYwNzE0OTM2._V1_FMjpg_UX1000_.jpg	Born:  February 8,  1920  in Stockholm, Stockholms län, Sweden	Died:  November 26,  1971  (age 51) in Stockholm, Stockholms län, Sweden
639	nm0796117	/name/nm0796117	M. Night Shyamalan	Born in Puducherry, India, and raised in the posh suburban Penn Valley area of Philadelphia, Pennsylvania, M. Night Shyamalan is a film director, screenwriter, producer, and occasional actor, known for making movies with contemporary supernatural plots. He is the son of Jayalakshmi, a Tamil obstetrician and gynecologist, and Nelliate C. Shyamalan, ...	https://m.media-amazon.com/images/M/MV5BMTczMTA5OTMxMl5BMl5BanBnXkFtZTcwMDA4NDg1Mw@@._V1_FMjpg_UX1000_.jpg	Born:  August 6,  1970  in Mahé, Pondicherry, India	
504	nm0000246	/name/nm0000246	Bruce Willis	Actor and musician Bruce Willis is well known for playing wisecracking or hard-edged characters, often in spectacular action films. Collectively, he has appeared in films that have grossed in excess of $2.5 billion USD, placing him in the top ten stars in terms of box office receipts. Walter Bruce Willis was born on March 19, 1955, in ...	https://m.media-amazon.com/images/M/MV5BMjA0MjMzMTE5OF5BMl5BanBnXkFtZTcwMzQ2ODE3Mw@@._V1_FMjpg_UX1000_.jpg	Born:  March 19,  1955  in Idar-Oberstein, West Germany	
640	nm0005286	/name/nm0005286	 Haley Joel Osment\n	Haley Joel Osment is an American actor who has proven himself as one of the best young actors of his generation. He is the first millennial male to have received an Academy Award nomination for acting. Osment was born in Los Angeles, California, to Theresa (Seifert), a teacher, and actor Eugene Osment. His sister is actress Emily Osment. His ...	https://m.media-amazon.com/images/M/MV5BZjY0MjRhNjEtNGVlYi00YzZhLWFhNDEtMjlhNjBiNzM3Y2RkXkEyXkFqcGdeQXVyMjQxMDQzMjA@._V1_FMjpg_UX1000_.jpg	Born:  April 10,  1988  in Los Angeles, California, USA	
641	nm0001057	/name/nm0001057	 Toni Collette\n	Toni Collette is an Academy Award-nominated Australian actress, best known for her roles in The Sixth Sense (1999) and Little Miss Sunshine (2006). Collette was born Toni Collett (she later added an "e") on November 1, 1972, in Blacktown, Sydney, New South Wales, Australia. She is the first of three children of Judith (Cook), a customer service ...	https://m.media-amazon.com/images/M/MV5BODYzOTE3ODc1Ml5BMl5BanBnXkFtZTgwODYwMjE4NTM@._V1_FMjpg_UX1000_.jpg	Born:  November 1,  1972  in Sydney, New South Wales, Australia	
642	nm0640334	/name/nm0640334	Gavin O'Connor	Gavin O'Connor was born on December 24, 1963 in Long Island, New York, USA as Gavin James O'Connor. He is a producer and director, known for The Accountant (2016), Pride and Glory (2008) and Warrior (2011). He has been married to Brooke Burns since June 22, 2013. They have one child. He was previously married to Angela Shelton.	https://m.media-amazon.com/images/M/MV5BMTc2MzQyNzE1N15BMl5BanBnXkFtZTcwMDQxOTYyMQ@@._V1_FMjpg_UX1000_.jpg	Born:  December 24,  1963  in Long Island, New York, USA	
643	nm3294574	/name/nm3294574	 Anthony Tambakis\n	Anthony Tambakis is a former Professor of Creative Writing, an award-winning short story writer, and recipient of a Paul Bowles Fellowship for fiction writing. His novel Swimming with Bridgeport Girls will be published by Simon & Schuster in Spring 2017. Tambakis is also adapting the 1961 novel and film The Hustler for Broadway. A native of ...	https://m.media-amazon.com/images/M/MV5BNmExOTZjN2EtOTA4NC00OTBiLWJlMjctNTUwZDM1Mzg1Y2Y4XkEyXkFqcGdeQXVyNTQ1MDg4NTM@._V1_FMjpg_UX1000_.jpg	Born:  May 22,  1967  in Fairfield, Connecticut, USA	
293	nm0362766	/name/nm0362766	Tom Hardy	With his breakthrough performance as Eames in Christopher Nolan's sci-fi thriller Inception (2010), English actor Tom Hardy has been brought to the attention of mainstream audiences worldwide. However, the versatile actor has been steadily working on both stage and screen since his television debut in the miniseries Band of Brothers (2001). After ...	https://m.media-amazon.com/images/M/MV5BMTQ3ODEyNjA4Nl5BMl5BanBnXkFtZTgwMTE4ODMyMjE@._V1_FMjpg_UX1000_.jpg	Born:  September 15,  1977  in Hammersmith, London, England, UK	
644	nm0000560	/name/nm0000560	 Nick Nolte\n	Nick Nolte was born in Omaha, Nebraska and began his career on stage at the Pasadena Playhouse and in regional theatre productions. His breakthrough role was in the TV miniseries Rich Man, Poor Man (1976), playing the role of "Tom/Tommy Jordache". Nick Nolte said that when he played a young man in the early scenes of the project, he weighed about ...	https://m.media-amazon.com/images/M/MV5BMTU1ODAzMDk3Ml5BMl5BanBnXkFtZTYwOTEzMzE0._V1_FMjpg_UX1000_.jpg	Born:  February 8,  1941  in Omaha, Nebraska, USA	
645	nm0249291	/name/nm0249291	 Joel Edgerton\n	Joel Edgerton was born on June 23, 1974 in Blacktown, New South Wales, Australia, to Marianne (van Dort) and Michael Edgerton, who is a solicitor and property developer. His brother is filmmaker Nash Edgerton. His mother is a Dutch immigrant. Joel went to Hills Grammar School in the Western Suburbs of Sydney, and after leaving, he attended Nepean ...	https://m.media-amazon.com/images/M/MV5BMTA0ODI1ODk4NzdeQTJeQWpwZ15BbWU3MDkwNjkzOTY@._V1_FMjpg_UX1000_.jpg	Born:  June 23,  1974  in Blacktown, New South Wales, Australia	
646	nm0000341	/name/nm0000341	Michael Crichton	Michael Crichton was born in Chicago, Illinois, but grew up in Roslyn, New York. His father was a journalist and encouraged him to write and to type. Michael gave up studying English at Harvard University, having become disillusioned with the teaching standards--the final straw came when he submitted an essay by George Orwell that was given a "B-....	https://m.media-amazon.com/images/M/MV5BMTgwOTQ1NTAyM15BMl5BanBnXkFtZTgwMTk4NzU0MDI@._V1_FMjpg_UX1000_.jpg	Born:  October 23,  1942  in Chicago, Illinois, USA	Died:  November 4,  2008  (age 66) in Los Angeles, California, USA
647	nm0000554	/name/nm0000554	 Sam Neill\n(I)\n	Sam Neill was born in Omagh, Co. Tyrone, Northern Ireland, to army parents, an English-born mother, Priscilla Beatrice (Ingham), and a New Zealand-born father, Dermot Neill. His family moved to the South Island of New Zealand in 1954. He went to boarding schools and then attended the universities at Canterbury and Victoria. He has a BA in English ...	https://m.media-amazon.com/images/M/MV5BMjUyMTU0MzA0MF5BMl5BanBnXkFtZTgwNTA4MTQ4NjM@._V1_FMjpg_UX1000_.jpg	Born:  September 14,  1947  in Omagh, Co. Tyrone, Northern Ireland, UK	
648	nm0000368	/name/nm0000368	 Laura Dern\n	Laura Dern was born on February 10, 1967 in Los Angeles, the daughter of actors Bruce Dern and Diane Ladd. Dern was exposed to movie sets and the movie industry from infancy, and obtained several bit parts as a child. Her parents divorced when Dern was two and Dern lost contact with her father for several years as a result. Her parents' background ...	https://m.media-amazon.com/images/M/MV5BMjI3NzY0MDQxMF5BMl5BanBnXkFtZTcwNzMwMzcyNw@@._V1_FMjpg_UX1000_.jpg	Born:  February 10,  1967  in Saint John's Health Center, Santa Monica, Los Angeles County, California, USA	
649	nm0000156	/name/nm0000156	 Jeff Goldblum\n	Jeffrey Lynn Goldblum was born October 22, 1952 in Pittsburgh, Pennsylvania, one of four children of Shirley (Temeles), a radio broadcaster who also ran an appliances firm, and Harold L. Goldblum, a doctor. His father was of Russian Jewish descent and his mother was of Austrian Jewish ancestry. Goldblum began his career on the New York stage after ...	https://m.media-amazon.com/images/M/MV5BY2ViNDIwNmUtZGQ5Ni00MDYxLWI5YTktNWU1NGRlYWQ1ZDg0XkEyXkFqcGdeQXVyOTAyMDgxODQ@._V1_FMjpg_UX1000_.jpg	Born:  October 22,  1952  in Pittsburgh, Pennsylvania, USA	
651	nm3582089	/name/nm3582089	 Carlos Martínez López\n	Contribute to IMDb. Add a bio, trivia, and more.\nUpdate information for Carlos Martínez López »			
650	nm0655053	/name/nm0655053	Sergio Pablos	Sergio Pablos' career in animation spans over three decades. His work is well known as a Supervising Animator on Disney films such as "Tarzan" and "Treasure Planet". At the helm of his company The SPA Studios, he's also known for having developed the original story upon which films like "Despicable Me" and "Smallfoot" are based on. In addition to ...	https://m.media-amazon.com/images/M/MV5BYTUxYWI5MmMtNDYzOS00OWM2LWE1ZDMtMTg3NzI4MmMxNWNkXkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_FMjpg_UX1000_.jpg		
652	nm0005403	/name/nm0005403	 Jason Schwartzman\n	Jason Schwartzman was born on June 26, 1980 in Los Angeles, California, USA as Jason Francesco Schwartzman. He is an actor, known for Rushmore (1998), The Darjeeling Limited (2007) and Moonrise Kingdom (2012). He has been married to Brady Cunningham since July 11, 2009. They have two children.	https://m.media-amazon.com/images/M/MV5BMjAyNjY0NTgzNF5BMl5BanBnXkFtZTcwOTQ0ODk2Mw@@._V1_FMjpg_UX1000_.jpg	Born:  June 26,  1980  in Los Angeles, California, USA	
187	nm0799777	/name/nm0799777	J.K. Simmons	J.K. Simmons is an American actor. He was born Jonathan Kimble Simmons in Grosse Pointe, Michigan, to Patricia (Kimble), an administrator, and Donald William Simmons, a music teacher. He attended the Ohio State University, Columbus, OH; University of Montana, Missoula, MT (BA in Music). He had originally planned to be a singer and studied at the ...	https://m.media-amazon.com/images/M/MV5BMzg2NTI5NzQ1MV5BMl5BanBnXkFtZTgwNjI1NDEwMDI@._V1_FMjpg_UX1000_.jpg	Born:  January 9,  1955  in Grosse Pointe, Michigan, USA	
653	nm0429069	/name/nm0429069	 Rashida Jones\n(I)\n	Rashida Jones was born in Los Angeles, California, the younger daughter of media mogul, producer, and musician Quincy Jones and actress Peggy Lipton. She has an older sister, Kidada Jones, and five half-siblings by her father's other relationships. Her father is African-American and her mother is Ashkenazi Jewish (a descendant of emigrants from ...	https://m.media-amazon.com/images/M/MV5BMjA0ODM2MzQ2NV5BMl5BanBnXkFtZTcwMTAxNTUxOQ@@._V1_FMjpg_UX1000_.jpg	Born:  February 25,  1976  in Los Angeles, California, USA	
654	nm0000965	/name/nm0000965	 Danny Boyle\n	Danny Boyle was born on October 20, 1956 in Radcliffe, Greater Manchester, England as Daniel Francis Boyle. He is a director and producer, known for 127 Hours (2010), 28 Days Later... (2002) and Slumdog Millionaire (2008).	https://m.media-amazon.com/images/M/MV5BMTc2NTU0ODQ0M15BMl5BanBnXkFtZTcwNjYzMzc5Mg@@._V1_FMjpg_UX1000_.jpg	Born:  October 20,  1956  in Radcliffe, Greater Manchester, England, UK	
655	nm0920543	/name/nm0920543	 Irvine Welsh\n	Welsh's books have made him a cult figure within the writing world since the 1990s. Several of his books have become best sellers and all have a mixture of comedy, drama and hard-hitting issues...the best-known being Trainspotting (1996) which was made into a box-office smash worldwide at the movies in 1996. Of his other works, one other has been ...	https://m.media-amazon.com/images/M/MV5BNTRmZjI4NjItOGFiOC00YjE5LTg2ZjEtYTk1NWMzMDg2YTE0XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_FMjpg_UX1000_.jpg	Born:  September 27,  1958  in Leith, Edinburgh, Scotland, UK	
656	nm0388076	/name/nm0388076	 John Hodge\n(I)\n	John Hodge was born in 1964 in Glasgow, Scotland. He is a writer and actor, known for Trainspotting (1996), T2 Trainspotting (2017) and Shallow Grave (1994).	https://m.media-amazon.com/images/M/MV5BMTcxMjAxMTE4N15BMl5BanBnXkFtZTgwODAwMzIyMTI@._V1_FMjpg_UX1000_.jpg	Born:  1964  in Glasgow, Scotland, UK	
657	nm0000191	/name/nm0000191	 Ewan McGregor\n	Ewan Gordon McGregor was born on March 31, 1971 in Perth, Perthshire, Scotland, to Carol Diane (Lawson) and James Charles McGregor, both teachers. His uncle is actor Denis Lawson. He was raised in Crieff. At age 16, he left Morrison Academy to join the Perth Repertory Theatre. His parents encouraged him to leave school and pursue his acting goals ...	https://m.media-amazon.com/images/M/MV5BMTg1MjQ0MDg0Nl5BMl5BanBnXkFtZTcwNjYyNjI5Mg@@._V1_FMjpg_UX1000_.jpg	Born:  March 31,  1971  in Perth, Perthshire, Scotland, UK	
658	nm0001971	/name/nm0001971	 Ewen Bremner\n(I)\n	Born in Edinburgh, Scotland, Ewen Bremner has worked with many of the most respected directors in world cinema, including Danny Boyle, Mike Leigh, Ridley Scott, Joon-Ho Bong, Werner Herzog and Woody Allen. Ewen has established himself by creating unique characters in critically acclaimed films, as well as going toe to toe with many of Hollywood's ...	https://m.media-amazon.com/images/M/MV5BNTVjNzNhNzItNjc1ZC00YTJjLWI2MjctMDc4MmMxOGZkZGUxXkEyXkFqcGdeQXVyMTg0NTYyNjU@._V1_FMjpg_UX1000_.jpg	Born:  January 23,  1972  in Edinburgh, Scotland, UK	
659	nm0001538	/name/nm0001538	 Jonny Lee Miller\n	Jonny (sometimes credited as Johnny) Lee Miller was born on November 15, 1972, in Kingston, England, UK. He is the son of actors Anna Lee and Alan Miller and the grandson of actor Bernard Lee. After appearing in many high school plays at his selective state grammar school, Jonny dropped out at 17 to pursue acting full time. Although he was ...	https://m.media-amazon.com/images/M/MV5BMjIyMjc0NTA2M15BMl5BanBnXkFtZTcwMTA4MzQ2OQ@@._V1_FMjpg_UX1000_.jpg	Born:  November 15,  1972  in Kingston upon Thames, Surrey, England, UK	
660	nm0001837	/name/nm0001837	 Peter Weir\n(I)\n	Peter Weir was born on August 21, 1944 in Sydney, New South Wales, Australia as Peter Lindsay Weir. He is a director and writer, known for Master and Commander: The Far Side of the World (2003), The Way Back (2010) and Witness (1985). He has been married to Wendy Stites since 1966. They have two children.	https://m.media-amazon.com/images/M/MV5BMTIzNDg2NTIyN15BMl5BanBnXkFtZTYwNzQyNDY1._V1_FMjpg_UX1000_.jpg	Born:  August 21,  1944  in Sydney, New South Wales, Australia	
661	nm0629272	/name/nm0629272	 Andrew Niccol\n	New Zealand-born screenwriter-director Andrew Niccol began his career in London, successfully directing TV commercials before moving to Los Angeles in order to make films "longer than 60 seconds." He interested high-powered producer Scott Rudin in his The Truman Show (1998) script, but Rudin was not willing to gamble on a rookie director, ...	https://m.media-amazon.com/images/M/MV5BMTI5ODQ2ODU2M15BMl5BanBnXkFtZTcwNjM2NDg5Mg@@._V1_FMjpg_UX1000_.jpg	Born:  June 10,  1964  in Paraparaumu, New Zealand	
382	nm0000120	/name/nm0000120	Jim Carrey	Jim Carrey, Canadian-born and a U.S. citizen since 2004, is an actor and producer famous for his rubbery body movements and flexible facial expressions. The two-time Golden Globe-winner rose to fame as a cast member of the Fox sketch comedy In Living Color (1990) but leading roles in Ace Ventura: Pet Detective (1994), Dumb and Dumber (1994) and ...	https://m.media-amazon.com/images/M/MV5BMTQwMjAwNzI0M15BMl5BanBnXkFtZTcwOTY1MTMyOQ@@._V1_FMjpg_UX1000_.jpg	Born:  January 17,  1962  in Newmarket, Ontario, Canada	
556	nm0000438	/name/nm0000438	Ed Harris	By transforming into his characters and pulling the audience in, Ed Harris has earned a reputation as one of the most talented actors of our time. Ed Harris was born in Tenafly, New Jersey, to Margaret (Sholl), a travel agent, and Robert Lee Harris, a bookstore worker who also sang professionally. Both of his parents were originally from Oklahoma. ...	https://m.media-amazon.com/images/M/MV5BMjE4NDM4ODc2OV5BMl5BanBnXkFtZTcwNzA5NjQ5MQ@@._V1_FMjpg_UX1000_.jpg	Born:  November 28,  1950  in Tenafly, New Jersey, USA	
662	nm0001473	/name/nm0001473	 Laura Linney\n	Laura Leggett Linney was born in New York City on February 5, 1964, into a theatre family. Her father was prominent playwright Romulus Linney, whose own great-grandfather was a congressman from North Carolina. Her mother, Miriam Anderson (Leggett), is a nurse. Although she did not live in her father's house (her parents having divorced when she ...	https://m.media-amazon.com/images/M/MV5BMTMyMDc3Mzc2M15BMl5BanBnXkFtZTcwMjc5OTcyMg@@._V1_FMjpg_UX1000_.jpg	Born:  February 5,  1964  in New York City, New York, USA	
663	nm0281808	/name/nm0281808	 Victor Fleming\n(I)\n(1889–1949)\n	Victor Fleming entered the film business as a stuntman in 1910, mainly doing stunt driving - which came easy to him, as he had been a mechanic and professional race-car driver. He became interested in working on the other side of the camera, and eventually got a job as a cameraman on many of the films of Douglas Fairbanks. He soon began directing,...	https://m.media-amazon.com/images/M/MV5BMWU2NTRjMGItMzM4MC00MjRlLWEyYjItYTEwNGQ5YzJmYmU3XkEyXkFqcGdeQXVyMjUxODE0MDY@._V1_FMjpg_UX1000_.jpg	Born:  February 23,  1889  in La Cañada, California, USA	Died:  January 6,  1949  (age 59) in Cottonwood, Arizona, USA
664	nm0002030	/name/nm0002030	 George Cukor\n(1899–1983)\n	George Cukor was an American film director of Hungarian-Jewish descent, better known for directing comedies and literary adaptations. He once won the Academy Award for Best Director, and was nominated other four times for the same Award. In 1899, George Dewey Cukor was born on the Lower East Side of New York City. His parents were assistant ...	https://m.media-amazon.com/images/M/MV5BMTkzNjU2MTI2Nl5BMl5BanBnXkFtZTcwMDQzNTgxMw@@._V1_FMjpg_UX1000_.jpg	Born:  July 7,  1899  in Lower East Side, Manhattan, New York City, New York, USA	Died:  January 24,  1983  (age 83) in Beverly Grove, Los Angeles, California, USA
665	nm0593565	/name/nm0593565	 Margaret Mitchell\n(I)\n(1900–1949)\n	Margaret Mitchell was born on November 8, 1900 in Atlanta, Georgia, USA as Margaret Munnerlyn Mitchell. She is known for her work on Gone with the Wind (1939), Luan shi yao ji (1956) and E o Vento Levou (1956). She was married to John R. Marsh and Berrien Kinnard "Red" Upshaw. She died on August 16, 1949 in Atlanta.	https://m.media-amazon.com/images/M/MV5BMGU2OWRmNjQtZGNlZC00NWI3LTg2OTAtYmVhNjdlNTM5MjJkL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTc4MzI2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  November 8,  1900  in Atlanta, Georgia, USA	Died:  August 16,  1949  (age 48) in Atlanta, Georgia, USA
666	nm0397608	/name/nm0397608	 Sidney Howard\n(I)\n(1891–1939)\n			Born:  June 26,  1891  in Oakland, California, USA	Died:  August 23,  1939  (age 48) in Tyringham, Massachusetts, USA
667	nm0000022	/name/nm0000022	 Clark Gable\n(I)\n(1901–1960)\n	William Clark Gable was born on February 1, 1901 in Cadiz, Ohio, to Adeline (Hershelman) and William Henry Gable, an oil-well driller. He was of German, Irish, and Swiss-German descent. When he was seven months old, his mother died, and his father sent him to live with his maternal aunt and uncle in Pennsylvania, where he stayed until he was two. ...	https://m.media-amazon.com/images/M/MV5BMjE1NDY5MjM5Ml5BMl5BanBnXkFtZTYwNTU1OTQ2._V1_FMjpg_UX1000_.jpg	Born:  February 1,  1901  in Cadiz, Ohio, USA	Died:  November 16,  1960  (age 59) in Los Angeles, California, USA
668	nm0000046	/name/nm0000046	 Vivien Leigh\n(I)\n(1913–1967)\n	If a film were made of the life of Vivien Leigh, it would open in India just before World War I, where a successful British businessman could live like a prince. In the mountains above Calcutta, a little princess is born. Because of the outbreak of World War I, she is six years old the first time her parents take her to England. Her mother thinks ...	https://m.media-amazon.com/images/M/MV5BMTI2NTkwMTQ5NF5BMl5BanBnXkFtZTYwNDExNjI2._V1_FMjpg_UX1000_.jpg	Born:  November 5,  1913  in Darjeeling, Bengal Presidency, British India [now West Bengal, India]	Died:  July 8,  1967  (age 53) in Belgravia, London, England, UK
669	nm0593775	/name/nm0593775	 Thomas Mitchell\n(I)\n(1892–1962)\n	Thomas Mitchell was one of the great American character actors, whose credits read like a list of the greatest American films of the 20th century: Lost Horizon (1937); Stagecoach (1939); The Hunchback of Notre Dame (1939); Mr. Smith Goes to Washington (1939); Gone with the Wind (1939); It's a Wonderful Life (1946) and High Noon (1952). His ...	https://m.media-amazon.com/images/M/MV5BOTcwNjAwMDI2M15BMl5BanBnXkFtZTcwNDMyNTUwOA@@._V1_FMjpg_UX1000_.jpg	Born:  July 11,  1892  in Elizabeth, New Jersey, USA	Died:  December 17,  1962  (age 70) in Beverly Hills, Los Angeles, California, USA
670	nm0000983	/name/nm0000983	 Albert Brooks\n(I)\n	Albert Brooks was born on July 22, 1947 in Beverly Hills, California, USA as Albert Lawrence Einstein. He is an actor and writer, known for Drive (2011), Broadcast News (1987) and Defending Your Life (1991). He has been married to Kimberly Shlain since March 15, 1997. They have two children.	https://m.media-amazon.com/images/M/MV5BMTM4MzEwMTMxN15BMl5BanBnXkFtZTcwNTQwMTc2NQ@@._V1_FMjpg_UX1000_.jpg	Born:  July 22,  1947  in Beverly Hills, California, USA	
671	nm0001122	/name/nm0001122	 Ellen DeGeneres\n	Emmy-winning talk show host Ellen Lee DeGeneres was born in Metairie, Louisiana, a New Orleans suburb. She is the daughter of Betty DeGeneres (née Elizabeth Jane Pfeffer), a speech therapist, and Elliott Everett DeGeneres, an insurance agent. Her brother is musician and producer Vance DeGeneres. Her parents divorced when she was 16 years old. Her ...	https://m.media-amazon.com/images/M/MV5BNDAwMzAyNDEzMV5BMl5BanBnXkFtZTcwMDU3MTAxMw@@._V1_FMjpg_UX1000_.jpg	Born:  January 26,  1958  in Metairie, Louisiana, USA	
672	nm1071252	/name/nm1071252	 Alexander Gould\n	Gould was born and raised in Los Angeles, California. He began acting at the age of two and is perhaps best known for providing the voice of the title character of Disney/Pixar's film Finding Nemo (2003) and starring as Shane Botwin on the Showtime dark comedy-drama series Weeds (2005). His on-camera credits include guest spots on the television ...	https://m.media-amazon.com/images/M/MV5BNDY3OWIxYmYtZGYyMi00ZGYzLWJiNjEtMDIxMGJlNmY4ZGRjXkEyXkFqcGdeQXVyODU1MTAxMDg@._V1_FMjpg_UX1000_.jpg	Born:  May 4,  1994  in Los Angeles, California, USA	
673	nm0001789	/name/nm0001789	 Andrei Tarkovsky\n(1932–1986)\n	The most famous Soviet film-maker since Sergei M. Eisenstein, Andrei Tarkovsky (the son of noted poet Arseniy Tarkovsky) studied music and Arabic in Moscow before enrolling in the Soviet film school V.G.I.K. He shot to international attention with his first feature, Ivanovo detstvo (1962), which won the top prize at the Venice Film Festival. This ...	https://m.media-amazon.com/images/M/MV5BMTk3NDU2MjQ4OF5BMl5BanBnXkFtZTgwOTAzMzE5MTE@._V1_FMjpg_UX1000_.jpg	Born:  April 4,  1932  in Zavrazhe, Yurevetskiy rayon, Ivanovskaya Promyshlennaya oblast, RSFSR, USSR [now Ivanovskaya oblast, Russia]	Died:  December 29,  1986  (age 54) in Neuilly-sur-Seine, Hauts-de-Seine, France
674	nm0835297	/name/nm0835297	 Arkadiy Strugatskiy\n(1925–1991)\n	Born on August 28, 1925 in Batumi, Georgian SSR, Transcaucasian SFSR, USSR (now in Georgia), Arkadiy Natanovich Strugatskiy was a Soviet/Russian sci-fi writer, often writing in collaboration with his younger brother Boris Strugatskiy. Strugatskiys' father Natan Strugatskiy was a Jewish art critic and their mother was a Russian Orthodox teacher. ...		Born:  August 28,  1925  in Batumi, Georgian SSR, Transcaucasian SFSR, USSR [now Republic of Georgia]	Died:  October 12,  1991  (age 66) in Moscow, Russia
675	nm0835298	/name/nm0835298	 Boris Strugatskiy\n(1933–2012)\n	Born 1933 in Leningrad, RSFSR, USSR (now Saint Petersburg in Russia), Boris Natanovich Strugatskiy was a Soviet/Russian sci-fi writer, often writing in collaboration with his older brother Arkadiy Strugatskiy. Strugatskiys' father Natan Strugatskiy was a Jewish art critic and their mother was a Russian Orthodox teacher. Living in Leningrad with ...		Born:  April 15,  1933  in Leningrad, RSFSR, USSR [now St. Petersburg, Russia]	Died:  November 19,  2012  (age 79) in St. Petersburg, Russia
676	nm0293981	/name/nm0293981	 Alisa Freyndlikh\n	Alisa Brunovna Freindlikh was born on December 8, 1934, in Leningrad, USSR (now St. Petersburg, Russia). Her father, named Bruno Frejndlikh, was a notable actor. Alisa Freindlikh graduated from Leningrad Institute of Theatre, Music, and Cinematography in 1957. From 1961-1983 Alisa Freindlikh was a permanent member of the Leningrad Theatre of ...	https://m.media-amazon.com/images/M/MV5BMjI4Njc0MTQ0M15BMl5BanBnXkFtZTcwMTI1ODc0NQ@@._V1_FMjpg_UX1000_.jpg	Born:  December 8,  1934  in Leningrad, RSFSR, USSR [now St. Petersburg, Russia]	
677	nm0435289	/name/nm0435289	 Aleksandr Kaydanovskiy\n(1946–1995)\n	Alexandr Kajdanovsky, Russian actor, director and screenwriter, now best remembered for his work in Andrei Tarkovsky's films. Kajdanovsky left Junior High School to enroll in technical college where he was training to become a welder. Apparently a prospect of becoming a worker did not appeal to him and in 1965 he started studying acting at The ...	https://m.media-amazon.com/images/M/MV5BMTA5ODY4NTk3MTdeQTJeQWpwZ15BbWU4MDU0ODEyNjEx._V1_FMjpg_UX1000_.jpg	Born:  July 23,  1946  in Rostov-na-Donu, Rostovskaya oblast, RSFSR, USSR [now Russia]	Died:  December 2,  1995  (age 49) in Moscow, Russia
678	nm0813463	/name/nm0813463	 Anatoliy Solonitsyn\n(1934–1982)\n	The famous Russian actor was discovered by Andrei Tarkovsky. He was looking for an actor to play the part of Andrei Rublev for his second full-length film and accidentally found the completely unknown Solonitsyn in Chelyabinsk. He worked there as an amateur actor. After Andrei Rublev, he played main parts in many of Russia's best movies.	https://m.media-amazon.com/images/M/MV5BNjIzNDIwNjEwN15BMl5BanBnXkFtZTgwMzQ4MTI2MTE@._V1_FMjpg_UX1000_.jpg	Born:  August 30,  1934  in Bogorodsk, Bogorodskiy rayon, Gorkovskaya oblast, RSFSR, USSR [now Nizhegorodskaya oblast, Russia]	Died:  June 11,  1982  (age 47) in Moscow, RSFSR, USSR [now Russia]
679	nm1323286	/name/nm1323286	 Kwang-rim Kim\n	Contribute to IMDb. Add a bio, trivia, and more.\nUpdate information for Kwang-rim Kim »			
680	nm1235292	/name/nm1235292	 Kim Sang-kyung\n	Kim Sang-kyung was born on June 1, 1972 in South Korea. He is an actor, known for Salinui chueok (2003), Hwa-ryeo-han-hyoo-ga (2007) and Gajokggiri Wae Irae (2014).	https://m.media-amazon.com/images/M/MV5BMTQxNzI0ODExN15BMl5BanBnXkFtZTgwMTA3NzE1MjE@._V1_FMjpg_UX1000_.jpg	Born:  June 1,  1972  in South Korea	
681	nm1323287	/name/nm1323287	 Roe-ha Kim\n	Roe-ha Kim was born on November 15, 1965 in Gyeonggi-do, South Korea. He is an actor, known for Salinui chueok (2003), Dalkomhan insaeng (2005) and Gwoemul (2006).	https://m.media-amazon.com/images/M/MV5BYjJiZDE2NjQtZTI5Yy00ZDViLTgxMGYtOTU1MDk0ZTE0NTljL2ltYWdlXkEyXkFqcGdeQXVyMzQ2MDUxMTg@._V1_FMjpg_UX1000_.jpg	Born:  November 15,  1965  in Gyeonggi-do, South Korea	
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.photo (id, image, movie_id) FROM stdin;
1	https://m.media-amazon.com/images/S/sash/LcDGvOC9oM0y1al.png._V1_FMjpg_UX1000_.jpg	172
\.


--
-- Data for Name: producer_identifier; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.producer_identifier (movie_id, producer_id) FROM stdin;
\.


--
-- Data for Name: writer_identifier; Type: TABLE DATA; Schema: public; Owner: movies
--

COPY public.writer_identifier (movie_id, writer_id) FROM stdin;
1	2
1	1
2	7
2	6
3	6
3	7
4	14
4	13
5	19
6	24
6	25
7	30
7	31
8	35
8	36
9	41
9	40
10	30
10	31
11	47
11	48
12	53
12	54
13	13
14	30
14	31
15	62
15	63
16	68
16	67
17	73
18	77
18	78
19	82
19	83
20	87
21	90
21	89
22	95
22	96
23	101
23	102
24	107
24	108
25	112
26	115
27	2
27	1
28	118
29	14
29	13
30	125
31	129
32	134
32	83
33	140
33	141
34	146
35	150
35	151
36	155
36	156
37	52
37	160
38	165
39	167
40	171
41	176
41	177
42	181
42	182
43	167
44	185
45	189
45	191
46	196
46	195
47	14
47	13
48	202
48	40
49	206
49	207
50	211
51	215
51	216
52	219
53	223
53	6
54	13
54	14
55	167
56	63
56	115
57	35
58	232
59	236
59	237
60	242
60	243
61	246
61	247
62	251
62	252
63	2
63	236
64	258
64	259
65	264
65	263
66	268
66	263
67	274
67	275
68	280
68	281
69	118
69	285
70	236
70	289
71	14
71	13
72	294
72	295
73	298
74	155
74	302
75	305
75	307
76	258
76	259
77	312
77	313
78	318
79	322
80	325
80	326
81	328
81	247
82	331
82	332
83	336
83	337
84	341
85	35
86	113
86	348
87	63
87	115
88	351
89	35
90	236
90	357
91	362
92	367
92	366
93	371
93	372
94	376
94	375
95	381
95	380
96	386
96	385
97	390
97	391
98	395
99	401
99	402
100	167
101	408
101	409
102	236
102	413
103	82
103	83
104	419
105	422
106	427
107	236
107	430
108	317
108	434
109	438
109	439
110	443
111	445
112	328
112	246
113	451
114	456
114	457
115	462
115	461
116	376
117	263
117	469
118	40
118	473
119	263
119	475
120	479
120	480
121	247
121	484
122	488
122	115
123	491
124	494
124	495
125	497
125	498
126	502
126	503
127	508
127	507
128	511
128	512
129	82
130	516
130	82
131	521
131	522
132	525
132	526
133	530
134	82
134	325
135	536
136	263
136	469
137	118
137	540
138	544
139	73
140	549
140	550
141	554
141	555
142	558
142	559
143	563
144	567
144	568
145	573
145	572
146	578
147	419
148	585
148	586
149	118
150	591
150	592
151	595
152	598
152	599
153	601
154	167
155	607
156	611
157	614
157	613
158	68
158	67
159	247
159	621
160	626
160	627
161	632
161	633
162	635
163	639
164	642
164	643
165	646
166	650
167	655
167	656
168	661
169	665
169	666
170	246
171	674
171	675
172	125
172	679
\.


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: movies
--

SELECT pg_catalog.setval('public.country_id_seq', 60, true);


--
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: movies
--

SELECT pg_catalog.setval('public.genre_id_seq', 21, true);


--
-- Name: job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: movies
--

SELECT pg_catalog.setval('public.job_id_seq', 26, true);


--
-- Name: movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: movies
--

SELECT pg_catalog.setval('public.movie_id_seq', 172, true);


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: movies
--

SELECT pg_catalog.setval('public.people_id_seq', 681, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: movies
--

SELECT pg_catalog.setval('public.photo_id_seq', 1, true);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: job job_pkey; Type: CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- Name: movie movie_imdb_id_key; Type: CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_imdb_id_key UNIQUE (imdb_id);


--
-- Name: movie movie_imdb_url_key; Type: CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_imdb_url_key UNIQUE (imdb_url);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- Name: people people_imdb_id_key; Type: CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_imdb_id_key UNIQUE (imdb_id);


--
-- Name: people people_imdb_url_key; Type: CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_imdb_url_key UNIQUE (imdb_url);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: artist_identifier artist_identifier_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.artist_identifier
    ADD CONSTRAINT artist_identifier_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.people(id);


--
-- Name: artist_identifier artist_identifier_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.artist_identifier
    ADD CONSTRAINT artist_identifier_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- Name: country_identifier country_identifier_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.country_identifier
    ADD CONSTRAINT country_identifier_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- Name: country_identifier country_identifier_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.country_identifier
    ADD CONSTRAINT country_identifier_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- Name: director_identifier director_identifier_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.director_identifier
    ADD CONSTRAINT director_identifier_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.people(id);


--
-- Name: director_identifier director_identifier_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.director_identifier
    ADD CONSTRAINT director_identifier_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- Name: genre_identifier genre_identifier_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.genre_identifier
    ADD CONSTRAINT genre_identifier_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(id);


--
-- Name: genre_identifier genre_identifier_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.genre_identifier
    ADD CONSTRAINT genre_identifier_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- Name: job_identifier job_identifier_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.job_identifier
    ADD CONSTRAINT job_identifier_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.job(id);


--
-- Name: job_identifier job_identifier_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.job_identifier
    ADD CONSTRAINT job_identifier_people_id_fkey FOREIGN KEY (people_id) REFERENCES public.people(id);


--
-- Name: photo photo_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- Name: producer_identifier producer_identifier_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.producer_identifier
    ADD CONSTRAINT producer_identifier_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- Name: producer_identifier producer_identifier_producer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.producer_identifier
    ADD CONSTRAINT producer_identifier_producer_id_fkey FOREIGN KEY (producer_id) REFERENCES public.people(id);


--
-- Name: writer_identifier writer_identifier_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.writer_identifier
    ADD CONSTRAINT writer_identifier_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movie(id);


--
-- Name: writer_identifier writer_identifier_writer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: movies
--

ALTER TABLE ONLY public.writer_identifier
    ADD CONSTRAINT writer_identifier_writer_id_fkey FOREIGN KEY (writer_id) REFERENCES public.people(id);


--
-- PostgreSQL database dump complete
--

