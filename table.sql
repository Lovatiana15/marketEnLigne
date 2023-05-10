create database marketEnLigne;
create table client(
    id serial primary key not null,
    first_name varchar(50),
    last_name varchar(50),
    adresse varchar (20),
    phone varchar (14),
);
create table commande(
    id serial primary key not null,
    id_client int references client(id),
    date_commande date not null,
    mode_payement varchar(50)
);
CREATE TABLE type_articles(
        id serial  NOT NULL ,
        type_article Varchar (50) NOT NULL
);
create table article(
    id serial primary key not null,
    article_name varchar(50),
    descriptions text,
    id_type_article int references type_articles(id)
);
create table ligne_de_commande(
    id serial primary key,
    id_commande int references commande(id),
    id_article int references article(id),
    quantite int
);