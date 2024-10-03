.tables 
.headers on 



select count(*) as adalpersonur from books;

select count(id) as persónur from books;

select count(*) as Þrengill from books where characters like '%Þengill%';

select count(*) as Paladin from books where characters like '%Paladín%';

select count(*) as illi from family where chosen_one like '%evil%';

select AVG(birth) as fædingartidni from family where gender like '%F%';

select MAX(pages) as fjoldiBls from books;

select AVG(length) as medaltal from storytel_iskisur;