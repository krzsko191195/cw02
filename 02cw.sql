-- zad 1 

create table pracownik (
	id_pracownika int auto_increment primary key,
    imie varchar(40) not null,
    nazwisko varchar(60) not null,
    data_urodzenia DATE not null
);

insert into pracownik (imie, nazwisko, data_urodzenia) values
('Jan', 'Kowalski', '2006-09-01'),
('Grażyna', 'Nowak', '1999-05-24'),
('Bartosz', 'Kmicic', '1976-12-31');

UPDATE pracownik SET data_urodzenia = '1956-02-21' WHERE id_pracownika = 2;

SELECT * FROM pracownik;

-- zad 2

create table zadanie (
	id_zadania int auto_increment primary key,
    nazwa_zadania varchar(150) not null,
    priorytet enum('normalny', 'wysoki', 'niski'),
    opis LONGTEXT,
    pracownik int,
    constraint fk_pracownik
    foreign key (pracownik)
    references pracownik(id_pracownika)
    on delete set null
);

-- alter table zadanie modify column priorytet enum('normalny', 'wysoki', 'niski') default 'normalny';
alter table zadanie alter column priorytet set default 'normalny';

insert into zadanie (nazwa_zadania, pracownik) values
('Zatrudnić stażystę', 1),
('Zaktualizować system', 2),
('Uzupełnić tabelkę w EXCELu', 3);

SELECT * FROM zadanie;

-- zad 3

create table projekt (
	id_projektu int auto_increment primary key,
    nazwa_projektu varchar(150) not null,
    data_rozpoczecia DATE not null,
    data_zakonczenia date
);

alter table projekt add column menadzer_projektu int;
alter table projekt add foreign key (menadzer_projektu)
references pracownik(id_pracownika);

insert into projekt (nazwa_projektu, data_rozpoczecia, menadzer_projektu) values
('Nowy oddział w Elblągu', CURRENT_DATE(), 1),
('Nowy system kontroli czasu pracy', CURRENT_DATE(), 2);

alter table zadanie add column projekt int;
alter table zadanie add constraint fk_projekt
foreign key (projekt)
references projekt(id_projektu)
on delete cascade;

update 

select * from projekt;

-- zad 4

create table sprint (
	id_sprintu int auto_increment primary key,
    numer_sprintu int unsigned,
    data_rozpoczecia date,
    data_zakonczenia date
);

alter table zadanie add column sprint int;
alter table zadanie
add constraint fk_sprint
foreign key (sprint)
references sprint(id_sprintu)
on delete set null;

insert into sprint (numer_sprintu, data_rozpoczecia) values
(1, CURRENT_DATE());

select * from sprint;

update zadanie set sprint = 1 where id_zadania != 3;

-- zad 5

create table status (
	id_statusu int auto_increment primary key,
    nazwa_statusu varchar(20) not null
);

insert into `status` (nazwa_statusu) values
('w kolejce'),
('w toku'),
('zakończone');

create table zadanie_has_status (
	id_zdarzenia int primary key auto_increment,
    id_zadania int not null,
    id_statusu int not null
);

insert into zadanie_has_status (id_zadania, id_statusu) values
(1, 1),
(2, 2),
(3, 3);

delete from projekt where id_projektu = 2;

drop table sprint;




