-- mf01 Donner la liste des noms des jeunes trader et leurs classe actifs ; où jeune si moins de 5 ans d'expérience.
SELECT nom, classe_actif FROM `trader` WHERE anneeExperience < 5;

--mf02 Donner la liste des différentes classes d’actifs de l’équipe 1
SELECT classe_actif, nomEquipe FROM trader WHERE nomEquipe = 'equipe1';

--mf03 Donner toutes les informations sur les traders commodities
SELECT * FROM trader  WHERE classe_actif = 'commodities';

--mf04 Donner la liste des classes d’actifs des traders de plus de 20 ans d'expérience.
SELECT classe_actif, anneeExperience FROM trader  WHERE anneeExperience > 20

--mf05 Donner la liste des noms des traders ayant entre 5 et 10 ans d'expérience (bornes incluses).
SELECT nom, anneeExperience FROM trader WHERE anneeExperience BETWEEN 5 AND 11

--mf06 Donner la liste des classes d’actifs commençant par « ch » (e.g. change...)
SELECT classe_actif FROM trader WHERE classe_actif LIKE 'ch%'

--mf07 Donner la liste des noms des équipes utilisant l’arbitrage statistique
SELECT nom, style FROM `equipe` WHERE style = 'arbitrage statistique';

--mf08 Donner la liste des noms des équipes dont le chef est Smith.
SELECT nom, chef FROM `equipe` WHERE chef = 'Smith'

--mf09 Donner la liste des transactions triés par ordre alphabétique.
SELECT * FROM `transaction` ORDER BY nom

--mf10 Donner la liste des transactions se déroulant le 20 Avril 2019  à Hong Kong 
SELECT * FROM `transaction` WHERE date = '2019-04-20' AND lieu = 'HONK HONG'

--mf11 Donner la liste des marchés ( lieux)  où le prix est supérieur à 150 euros.
SELECT lieu, prix FROM `transaction` WHERE prix > 150

--mf12 Donner la liste des transactions se déroulant à Paris pour moins de 50 euros.
SELECT * FROM `transaction` WHERE lieu = 'Paris' AND prix < 50

--mf13 Donner la liste des marchés ( lieux)  ayant eu lieu en 2014.
SELECT lieu, date FROM `transaction` WHERE year(date) = 2014;

-- mmtj01 Donner la liste des noms et classes d’actifs des traders ayant plus de 3 ans d'expérience et faisant partie d'une équipe de style arbitrage statistique. On affichera par ordre alphabétique sur les noms. 
SELECT t.nom, t.classe_actif, t.anneeExperience, e.style 
FROM trader t JOIN equipe e 
ON t.nomEquipe = e.nom
WHERE t.anneeExperience > 3 AND e.style = 'arbitrage statistique'

--mmtj02 Donner les différents marchés(lieux), triés par ordre alphabétique, des transactions effectuées dans l'équipe du chef Smith avec un prix inférieur à 20. 
SELECT tran.lieu, tran.prix, e.chef
FROM transaction tran JOIN equipe e 
ON tran.nomEquipe = e.nom
WHERE tran.prix < 20 AND e.chef = 'Smith'
ORDER BY tran.lieu

-- mmtj03 Donner le nombre de marchés sur lesquels intervenaient les traders  de style Market Making  en 2021. 
SELECT count(*) as total, e.style, tran.date
FROM transaction tran JOIN equipe e 
ON tran.nomEquipe = e.nom
WHERE e.style = "market making" AND year(tran.date) = 2021

-- mmtj04 Donner le prix moyen des actifs traités par les traders de market making par zone géographique de transaction 
SELECT avg(tran.prix) as prix_moyen, tran.lieu, e.style FROM transaction tran JOIN equipe e WHERE e.style = 'market making' GROUP BY lieu; 

-- mmtj05 Donner la liste des classes d’actifs des traders qui ont effectué des transactions le 1ER Janvier 2016 sous le management de monsieur Smith
SELECT t.classe_actif, tran.date, e.chef
FROM trader t 
JOIN equipe e ON t.nomEquipe = e.nom 
JOIN transaction tran ON e.nom = tran.nomEquipe
WHERE tran.date = '2016-01-01' AND e.chef = 'Smith'

--mmtj21 Donner le nombre moyen d'années d'expérience des traders d’action par style de stratégie d’équipe
SELECT AVG(t.anneeExperience) as experience_moyenne, e.style 
FROM trader t JOIN equipe e 
ON t.nomEquipe = e.nom
GROUP BY e.style

--mmts01 Donner la liste des noms et classes d’actifs des traders ayant plus de 3 ans d'expérience et faisant partie d'une équipe de style arbitrage statistique. On affichera par ordre alphabétique sur les noms.
SELECT nom, classe_actif
FROM `trader`
WHERE anneeExperience > 3 AND nomEquipe IN (
    SELECT nom
    FROM `equipe`
    WHERE style = 'arbitrage statistique'
  )
ORDER BY nom

-- mmts02 Donner les différents marchés(lieux), triés par ordre alphabétique, des transactions effectuées dans  l'équipe du chef Smith avec un prix inférieur à 20.
SELECT lieu FROM `transaction`
WHERE prix < 20 AND nomEquipe IN (
    SELECT nom 
    FROM `equipe`
    WHERE chef = 'Smith'
)
ORDER BY lieu


--mmts03 Donner le nombre de marchés sur lesquels sont intervenus les traders de volatilite en 2015. 
SELECT count(*) as total_market FROM `transaction`
WHERE year(date) = 2015
AND nomEquipe IN (
    SELECT nom 
    FROM `equipe`
    WHERE style = 'trading de volatilite'
)

-- mmts04 Donner le prix moyen des actifs traités par les traders de market making par zone géographique de transaction

SELECT avg(prix) as prix_moyen, lieu FROM `transaction`
WHERE nomEquipe IN (
    SELECT nom 
    FROM `equipe`
    WHERE style = 'market making'
)

--mmts05 Donner la liste des classes d’actifs des traders qui ont effectué des transactions le 1ER Janvier 2016 sous le management de monsieur Smith
SELECT *
FROM `trader`
WHERE nomEquipe  IN (
    SELECT nom 
    FROM `equipe`
    WHERE chef='Smith'
)
AND nomEquipe  IN (
    SELECT nomEquipe 
    FROM `transaction`
    WHERE date = '2016-01-01'
)