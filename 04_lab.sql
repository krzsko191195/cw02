use infs_skorzynskik;

-- zad 1

alter table zadanie drop foreign key fk_pracownik;
alter table zadanie drop index fk_pracownik;
alter table projekt drop foreign key projekt_ibfk_1;
alter table projekt drop index menadzer_projektu;

alter table pracownik modify column id_pracownika int;
alter table pracownik drop primary key;

alter table pracownik add primary key (id_pracownika);
alter table zadanie add constraint fk_pracownik foreign key (pracownik) references pracownik(id_pracownika) on delete set null;
alter table projekt add constraint fk_menadzer foreign key (menadzer_projektu) references pracownik(id_pracownika);

-- zad 2
alter table zadanie add column godziny_szacowane int default 8;

update zadanie set godziny_szacowane = ceil(rand() * 12) where id_zadania between 1 and 5;

alter table zadanie alter column godziny_szacowane set default 6;

insert into zadanie (nazwa_zadania) values ('Wolne');

-- zad 3
alter table projekt add column opis_kratki varchar(50);
alter table projekt modify column opis_kratki varchar(200);
update projekt
set opis_kratki = ELT(FLOOR(RAND() * 3 + 1), 'MVP', 'Pilne wdrożenie', 'Rozbudowa infrastruktury')
where id_projektu between 1 and 3;
-- select ELT(FLOOR(RAND() * 3 + 1), 'MVP', 'Pilne wdrożenie', 'Rozbudowa infrastruktury');
alter table projekt drop column opis_kratki;


-- zad 4

alter table zadanie drop constraint fk_projekt;
alter table zadanie drop foreign key fk_projekt;

alter table zadanie add constraint fk_projekt foreign key (projekt) references projekt(id_projektu) on delete set null;

delete from projekt where id_projektu = 2;

select * from zadanie;




-- helpers

select * from projekt;
select * from pracownik;

insert into projekt values
(1, 'Modernizacja maszyn CNC', CURRENT_DATE(), null, 1),
(2, 'Budowa nowej siedziby w Niemczech', '2027-02-12', null, 2),
(4, 'Utworzenie nowej linii produkcyjnej', CURRENT_DATE(), null, 3);

insert into zadanie values
(1, 'Zakup 30 nowych maszyn CNC', 'normalny', null, 2, 1, null),
(2, 'Wymiana obrabiarek w maszynach CNC', 'wysoki', null, 2, 1, null),
(4, 'Zakup ziemii pod nową siedzibę', 'niski', null, null, 2, null),
(5, 'Szkolenie BHP nowych pracowników', 'wysoki', null, null, null, null);

