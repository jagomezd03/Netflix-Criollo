CREATE TABLE "Grupo 8"."USER"(
    id_user serial NOT NULL,
    email varchar(100) NOT NULL,
    password varchar(50) NOT NULL,
    avatar varchar(100),
    payment varchar(100),
    CONSTRAINT pk_user PRIMARY KEY (id_user)
);

CREATE TABLE "Grupo 8"."PLAN"(
	id_plan serial NOT NULL,
	description varchar(25) NOT NULL,
	CONSTRAINT pk_plan PRIMARY KEY (id_plan)
);

CREATE TABLE "Grupo 8"."SUBSCRIPTION"(
	id_plan serial NOT NULL,
	id_user serial NOT NULL,
	due_date date,
	active bit,
	CONSTRAINT fk_plan FOREIGN KEY (id_plan) REFERENCES "Grupo 8"."PLAN"(id_plan),
	CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES "Grupo 8"."USER"(id_user)
);

CREATE TABLE "Grupo 8"."PROFILE"(
    id_user serial NOT NULL,
    id_country serial NOT NULL,
    member_since date NOT NULL,
    phone varchar(15),
    birth_date date,
	name varchar(50),
	surname varchar(50),
	CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES "Grupo 8"."USER"(id_user),
	CONSTRAINT fk_country FOREIGN KEY (id_country) REFERENCES "Grupo 8"."COUNTRY"(id_country)
);

CREATE TABLE "Grupo 8"."COUNTRY"(
	id_country serial NOT NULL,
	name_country varchar(15) NOT NULL,
	CONSTRAINT pk_country PRIMARY KEY (id_country)
);

CREATE TABLE "Grupo 8"."STATE"(
	id_state serial NOT NULL,
	id_country serial NOT NULL,
	name_state varchar(20) NOT NULL,
	CONSTRAINT pk_state PRIMARY KEY (id_state),
	CONSTRAINT fk_country FOREIGN KEY (id_country) REFERENCES "Grupo 8"."COUNTRY"(id_country)
);

CREATE TABLE "Grupo 8"."CITY"(
	id_city serial NOT NULL,
	id_state serial NOT NULL,
	name_city varchar(25) NOT NULL,
	CONSTRAINT pk_city PRIMARY KEY (id_city),
	CONSTRAINT fk_state FOREIGN KEY (id_state) REFERENCES "Grupo 8"."STATE"(id_state)
);

CREATE TABLE "Grupo 8"."FAVOURITES_MOVIE"(
	id_user serial NOT NULL,
	id_movie serial NOT NULL,
	active bit,
	CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES "Grupo 8"."USER"(id_user),
	CONSTRAINT fk_movie FOREIGN KEY (id_movie) REFERENCES "Grupo 8"."MOVIE"(id_movie)
);

CREATE TABLE "Grupo 8"."RATING"(
	id_user serial NOT NULL,
	id_movie serial,
	id_series serial,
	rate int(1),
	CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES "Grupo 8"."USER"(id_user),
	CONSTRAINT fk_movie FOREIGN KEY (id_movie) REFERENCES "Grupo 8"."MOVIE"(id_movie),
	CONSTRAINT fk_series FOREIGN KEY (id_series) REFERENCES "Grupo 8"."SERIES"(id_series)
);

CREATE TABLE "Grupo 8"."WATCHED"(
	id_user serial NOT NULL,
	id_movie serial,
	id_series serial,
	active bit,
	CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES "Grupo 8"."USER"(id_user),
	CONSTRAINT fk_movie FOREIGN KEY (id_movie) REFERENCES "Grupo 8"."MOVIE"(id_movie),
	CONSTRAINT fk_series FOREIGN KEY (id_series) REFERENCES "Grupo 8"."SERIES"(id_series)
);

CREATE TABLE "Grupo 8"."FAVOURITES_SERIES"(
	id_user serial NOT NULL,
	id_series serial NOT NULL,
	active boolean,
	CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES "Grupo 8"."USER"(id_user),
	CONSTRAINT fk_series FOREIGN KEY (id_series) REFERENCES "Grupo 8"."SERIES" (id_series)
);

CREATE TABLE "Grupo 8"."MOVIE"(
	id_movie serial NOT NULL,
	name_movie varchar(50) NOT NULL,
	year int(4),
	duration time NOT NULL,
	director varchar(50),
	clasification varchar(10),
	synopsis varchar(250),
	banner varchar(150),
    CONSTRAINT pk_movie PRIMARY KEY (id_movie)
);

CREATE TABLE "Grupo 8"."CAST"(
	id_cast serial NOT NULL,
	name varchar(50),
	CONSTRAINT pk_cast PRIMARY KEY (id_cast)
);

CREATE TABLE "Grupo 8"."CAST_MOVIE"(
	id_movie serial NOT NULL,
	id_cast serial NOT NULL,
	CONSTRAINT fk_cast FOREIGN KEY (id_cast) REFERENCES "Grupo 8"."CAST"(id_cast),
	CONSTRAINT fk_movie FOREIGN KEY (id_movie) REFERENCES "Grupo 8"."MOVIE"(id_movie)
);

CREATE TABLE "Grupo 8"."CAST_SERIES"(
	id_series serial NOT NULL,
	id_cast serial NOT NULL,
	CONSTRAINT fk_cast FOREIGN KEY (id_cast) REFERENCES "Grupo 8"."CAST"(id_cast),
	CONSTRAINT fk_series FOREIGN KEY (id_series) REFERENCES "Grupo 8"."SERIES"(id_series)
);

CREATE TABLE "Grupo 8"."SERIES"(
	id_series serial NOT NULL,
	name_series varchar(50) NOT NULL,
	year int(4) NOT NULL,
	chapters int(4) NOT NULL,
	synopsis varchar(250),
	clasification varchar(10),
	banner varchar(150),
    CONSTRAINT pk_series PRIMARY KEY (id_series)
);

CREATE TABLE "Grupo 8"."CATEGORY"(
	id_category serial NOT NULL,
	categories varchar(25) NOT NULL,
	CONSTRAINT pk_category PRIMARY KEY (id_category)
);

CREATE TABLE "Grupo 8"."CATEGORY_MOVIE"(
	id_movie serial NOT NULL,
	id_category serial NOT NULL,
	CONSTRAINT fk_category FOREIGN KEY (id_category) REFERENCES "Grupo 8"."CATEGORY"(id_category),
	CONSTRAINT fk_movie FOREIGN KEY (id_movie) REFERENCES "Grupo 8"."MOVIE"(id_movie)
);

CREATE TABLE "Grupo 8"."CATEGORY_SERIES"(
	id_series serial NOT NULL,
	id_category serial NOT NULL,
	CONSTRAINT fk_category FOREIGN KEY (id_category) REFERENCES "Grupo 8"."CATEGORY"(id_category),
	CONSTRAINT fk_series FOREIGN KEY (id_series) REFERENCES "Grupo 8"."SERIES"(id_series),
);

CREATE TABLE "Grupo 8"."LANGUAGES"(
	id_languages serial NOT NULL,
	language varchar(25) NOT NULL,
	CONSTRAINT pk_languages PRIMARY KEY (id_languages)
);

CREATE TABLE "Grupo 8"."LANGUAGE_MOVIE"(
	id_movie serial NOT NULL,
	id_language serial NOT NULL,
	CONSTRAINT fk_language FOREIGN KEY (id_language) REFERENCES "Grupo 8"."LANGUAGES"(id_languages),
	CONSTRAINT fk_movie FOREIGN KEY (id_movie) REFERENCES "Grupo 8"."MOVIE"(id_movie)
);

CREATE TABLE "Grupo 8"."LANGUAGE_SERIES"(
	id_series serial NOT NULL,
	id_language serial NOT NULL,
	CONSTRAINT fk_language FOREIGN KEY (id_language) REFERENCES "Grupo 8"."LANGUAGES"(id_languages),
	CONSTRAINT fk_series FOREIGN KEY (id_series) REFERENCES "Grupo 8"."SERIES"(id_series)
);
