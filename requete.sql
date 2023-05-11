--1- Proposez un MCD pour cette base de données, mettez vous d’accord, et implémentez le dans une base de données. 
--2- Insérez des données fictives, notamment un utilisateur (nom = Rakoto) qui a acheté 5 yaourts avec MVola.
Insert into utilisateur values
(1, 'Rakoto', 'rakoto@gmail.com', 'ivandry', '0342838122'),
(2, 'RAsoa', 'rasoa@gmail.com', 'isotry', '0341214756'),
(3, 'Lovatiana', 'Randria', 'lova@gmail.com', '0645224557');

INSERT INTO commande(id_client, date_commande, mode_payement)
VALUES (1, '2023-05-10', 'cash');
INSERT INTO commande(id_client, date_commande, mode_payement)
VALUES(2, '2023-05-11', 'mvola');
INSERT INTO commande(id_client, date_commande, mode_payement) 
VALUES (3, '2023-04-04', 'cash');

INSERT INTO type_articles(type_article) 
VALUES ('electromenager'),('informatique'),('nourriture'),('vetements');

INSERT INTO article(article_name, descriptions, prix_unitaire, id_type_article) VALUES
('Yaourt iti', 'Yaourt au vanille', 1000, 3),
('Yaourt izy', 'Yaourt au coco', 900, 3),
('Chocolat', 'mini_choco de jb', 300, 3),
('Stylo', 'Stylo bic', 500, 2);

-- insert les deux commandes :
-- un client qui achète 3 yaourts et 5 chocolats.
INSERT INTO ligne_de_commande(id_commande, id_article, quantite) VALUES
(1, 2, 3),
(1, 3, 5);
-- une même client qui fait un autre commande de 1 yaourt et 20 stylos
INSERT INTO ligne_de_commande(id_commande, id_article, quantite) VALUES
(2, 1, 1),
(2, 4, 20);
