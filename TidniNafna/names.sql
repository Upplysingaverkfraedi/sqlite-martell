--Hér er bara hrein SQL skipanaskrá enginn R notkun. 



DROP TABLE IF EXISTS names;

CREATE TABLE names (
    name TEXT NOT NULL,
    year INTEGER NOT NULL,
    frequency INTEGER NOT NULL,
    type TEXT NOT NULL,
    PRIMARY KEY (name, year, type)
);

--Skrifa í skipana línu: sqlite3 names_freq.db < names.sql

-- Til að lesa gögn inn í töflu skaltu þarftu að fara út fyrir SQL skipanaskrána. Nota t.d. command lineið í SQL
-- Til að importa csv-filein ef þau eru á sama directory svæði og þú ert að vinna í gerðu: 
--.mode csv
--.import first_names_freq.csv names
--.import middle_names_freq.csv names



-- Svör við spurningum í lið 2

--a) Hvaða hópmeðlimur á algengasta eiginnafnið?

SELECT name, 
       MAX(frequency) AS max_tidni, 
       type
FROM names
WHERE name IN ('Brynjar', 'Jakob', 'Halldór') AND type = 'eiginnafn'
GROUP BY name, type
HAVING MAX(frequency) = (
    SELECT MAX(frequency)
    FROM names AS sub
    WHERE sub.name = names.name AND sub.type = 'eiginnafn'
)
ORDER BY name;


SELECT name, 
       frequency AS max_tidni, 
       type
FROM names
WHERE name IN ('Brynjar', 'Jakob', 'Halldór') 
  AND type = 'eiginnafn'
ORDER BY frequency DESC
LIMIT 1;

--b) Hvenær voru öll nöfnin vinsælust?


SELECT name, 
       year, 
       frequency AS max_tidni, 
       type
FROM names
WHERE name IN ('Brynjar', 'Jakob', 'Halldór')
  AND (name, frequency) IN (
      SELECT name, MAX(frequency)
      FROM names
      WHERE name IN ('Brynjar', 'Jakob', 'Halldór')
      GROUP BY name
  )
ORDER BY name, type;

-- c) Hvenær komu nöfnin fyrst fram?

SELECT name, year AS fyrst_fram, type
FROM names
WHERE (name, year) IN (
    SELECT name, MIN(year) AS min_year
    FROM names
    WHERE name IN ('Brynjar', 'Jakob', 'Halldór')
    GROUP BY name
)
ORDER BY name;
