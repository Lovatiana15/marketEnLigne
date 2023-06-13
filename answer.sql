--3/a- On veut faire la pub de la diversité des articles : afficher le nombre d’articles dans la base de données.
Select count(*) from article;
--3/b- On veut donner une idée sur les prix du magasin: pour chaque type de d’article, afficher en même temps le prix unitaire le moins cher, et le prix unitaire le plus cher.
--Ex : Pour le type d’articles “informatique” l’article le moins cher coûte 5000 Ar, et l’article le plus cher coûte 12.000.000 Ar.
SELECT type_article, MIN(article.prix_unitaire) AS moins_cher, MAX(article.prix_unitaire) AS plus_cher
From type_articles
INNER JOIN article  ON type_article.id = article.id_type_article
GROUP BY type_article.type_article;

--3/c- Afficher chaque commande de Rakoto avec notamment le prix total payé par commande.
SELECT commande.id, commande.date_commande, SUM(article.prix_unitaire * ligne_de_commande.quantite) AS prix_total
From commande
INNER JOIN client ON commande.id_client = client.id
INNER JOIN ligne_de_commande ON commande.id = ligne_de_commande.id_commande
INNER JOIN article ON ligne_de_commande.id_article = article.id
WHERE client.first_name = 'Rakoto'
GROUP BY commande.id;

--3/d - Quels produits se vendent bien ? pour le savoir: affichez chaque nom d’article, 
--avec la quantité totale vendue pour celle-ci. On triera bien évidemment le tout par quantité vendue décroissante.
Select article.article_name, SUM(ligne_de_commande.quantite) AS quantite_vendue
From article
INNER JOIN ligne_de_commande ON ligne_de_commande.id_article = article.id
GROUP BY article.article_name
ORDER BY quantite_vendue DESC;

--3/e - Combien on a gagné cette année ? Pour le savoir: affichez le total des commandes payées pour cette année ci.
SELECT SUM(article.prix_unitaire * contain.quantite) AS total_revenue
FROM commande
INNER JOIN ligne_de_commande ON commande.id = ligne_de_commande.id_commande
INNER JOIN article ON ligne_de_commande.id_article = article.id
WHERE date_part('year',date_commande) = '2023';

--4. Bonus si c’est bien expliqué : Si nous étions le directeur du magasin, cela nous intéresserait vraiment d’avoir un bilan mensuel.
--Cherchez la requête SQL qui permet d’afficher les 12 mois de l’année actuelle, avec le nombre total de commandes reçues à chaque mois,
--ainsi que le montant total que ces commandes ont rapporté ce mois-là, auquel vous allez concaténer le mot “Ar”.

create view vue_mois as select to_char(generate_series('2023-01-01'::date,'2023-12-01'::date,'1 month'),'month') as mois;

select mois , SUM(ligne_de_commande.quantite) as total_commande,  SUM(article.prix_unitaire * ligne_de_commande.quantite)
from mois_view 
left join commande on to_char(date_part('month',date_commande), 'month') = mois
group by mois;

