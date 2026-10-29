CREATE TABLE kategoria (
	id_kategorii int auto_increment primary key,
    nazwa varchar(50) not null
);

SHOW TABLES;

DESC kategoria;

CREATE TABLE produkt (
	id_produktu int auto_increment primary key,
    nazwa varchar(100) not null,
    id_kategorii int,
    constraint fk_kategoria foreign key (id_kategorii) references kategoria(id_kategorii)
);

ALTER TABLE produkt ADD COLUMN data_dodania DATE AFTER nazwa;
ALTER TABLE produkt MODIFY COLUMN data_dodania TIMESTAMP DEFAULT CURRENT_TIMESTAMP();

SELECT NOW();

SELECT * FROM produkt;

INSERT INTO kategoria (nazwa) VALUES ('Komputery'), ('Akcesoria');
INSERT INTO kategoria (nazwa) VALUES ('Sprzet peryferyjny');

SELECT * FROM kategoria;

UPDATE kategoria SET nazwa = "Hodowla jedwabnikow" WHERE id_kategorii = 3;

DELETE FROM kategoria WHERE id_kategorii = 3;

INSERT INTO produkt (nazwa, id_kategorii) VALUES ("Mysz", 2);

ALTER TABLE produkt
DROP CONSTRAINT fk_kategoria;

ALTER TABLE produkt
ADD CONSTRAINT fk_kategoria
FOREIGN KEY (id_kategorii)
REFERENCES kategoria(id_kategorii)
ON DELETE SET NULL;

DELETE FROM kategoria WHERE id_kategorii = 2;

SHOW CREATE TABLE produkt;

DROP TABLE kategoria, produkt;







