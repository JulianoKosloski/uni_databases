DROP DATABASE IF EXISTS lojavinhos;
CREATE DATABASE lojavinhos;
USE lojavinhos;

/**----------------------------------------CREATING TABLES---------------------------------------------**/

/**---REGIONS---**/
CREATE TABLE regiao (
    codRegiao bigint primary key NOT NULL,
    nomeRegiao varchar(100) NOT NULL,
    descricaoRegiao text NOT NULL
);

/**---WINERIES---**/
CREATE TABLE vinicola (
    codVinicola bigint primary key NOT NULL,
    nomeVinicola varchar(100) NOT NULL,
    descricaoVinicola text NOT NULL,
    foneVinicola varchar(15) NOT NULL,
    emailVinicola varchar(30) NOT NULL,
    codRegiao bigint NOT NULL,
    foreign key(codRegiao) REFERENCES regiao(codRegiao)
);

/**---WINES---**/
CREATE TABLE vinho (
    codVinho bigint primary key NOT NULL,
    nomeVinho varchar(50) NOT NULL,
    tipoVinho varchar(30) NOT NULL,
    anoVinho int NOT NULL,
    descricaoVinho text NOT NULL,
    codVinicola bigint NOT NULL,
    foreign key(codVinicola) REFERENCES vinicola(codVinicola)
);

/**----------------------------------------INSERTING DATA---------------------------------------------**/

INSERT INTO regiao VALUES(1,'Bordeaux', 'Bordeaux, in the southwest of France, needs little introduction as one of the most famous, prestigious and prolific wine regions. The majority of Bordeaux wines (nearly 90 percent of production volume) are the dry, medium- and full-bodied red Bordeaux Blends that established its reputation.');
INSERT INTO regiao VALUES(2,'Burgundy', 'Burgundy ("Bourgogne" in French) is an historic and highly respected wine region in eastern France. Burgundy wines have long had devout followers throughout the world and continue to do so today. Although Bordeaux produces about four times as much wine every year, the estimated 30,000 hectares (74,000 acres) of Burgundy vineyards are of equal prominence, producing some of the most exclusive wines on Earth.');
INSERT INTO regiao VALUES(3,'Champagne', 'Many of the most famous wine brands are Champagnes.');
INSERT INTO regiao VALUES(4,'Piedmont', 'Piedmont (Piemonte) enjoys a top seat among the finest wine regions of the world.');
INSERT INTO regiao VALUES(5,'Rhone', 'The Rhône Valley is a key wine-producing region in the southeast of France.');

INSERT INTO vinicola VALUES(1,'Marmelade', 'A beautiful place with sweet wines.', '123456789005', 'marmelade@gmail.com',1);
INSERT INTO vinicola VALUES(2,'Trottoir','Nice tourist place to dine and watch the sunset.', '773456789005', 'trottoir@gmail.com',2);
INSERT INTO vinicola VALUES(3,'Casserole de Maman', 'A place to feel at home.', '1236559112305', 'cassemaman@gmail.com',2);
INSERT INTO vinicola VALUES(4,'Chocolatine', 'Forget the controversial chocolatine vs pain au chocolat dispute and enjoy marvelous wines.', '12355542005', 'chocolatine@gmail.com',3);
INSERT INTO vinicola VALUES(5,'Ça marche bien', 'Cheap and worth the trip.', '882456789005', 'marcheca@gmail.com',4);
INSERT INTO vinicola VALUES(6,'La rivière sympa', 'Loved by tourists and europeans alike.', '779019005', 'larivieresympa@gmail.com',5);

INSERT INTO vinho VALUES(1,'Merlot', 'red' , '1998', 'Structured and classic',1);
INSERT INTO vinho VALUES(2,'Cabernet-Sauvignon', 'red' , '2007', 'Sumptuous',2);
INSERT INTO vinho VALUES(3,'Sauterne', 'white' , '2019', 'Exclusive and woody',3);
INSERT INTO vinho VALUES(4,'Pinot Noir', 'red' , '2022', 'Austere and tannic',4);
INSERT INTO vinho VALUES(5,'Chardonnay', 'red' , '2021', 'Floral and sweet',4);
INSERT INTO vinho VALUES(6,'Grave', 'white' , '2021', 'Heavy and lasting',5);
INSERT INTO vinho VALUES(7,'Merlot', 'red' , '1986', 'Pure and floaty',6);

/**----------------------------------------DATA QUERIES---------------------------------------------**/

SELECT * FROM vinicola;
SELECT nomeVinho, tipoVinho, anoVinho FROM lojavinhos.vinho WHERE anoVinho <= 2020;