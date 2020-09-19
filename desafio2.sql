--1. Crear base de datos llamada películas
CREATE DATABASE peliculas; 
--c\peliculas

--2. Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes, determinando la relación entre ambas tablas.
CREATE TABLE peliculas (id SERIAL, pelicula VARCHAR(60), ano_estreno SMALLINT, director VARCHAR(25), PRIMARY KEY (id) );
CREATE TABLE reparto (id_pelicula INT, actor VARCHAR(40), FOREIGN KEY (id_pelicula) REFERENCES peliculas(id));

--3. Cargar ambos archivos a su tabla correspondiente 
\copy peliculas FROM './peliculas.csv' CSV HEADER;
\copy reparto FROM './reparto.csv' CSV;

--4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película, 
--año de estreno, director y todo el reparto. 
--SELECT pelicula FROM peliculas WHERE pelicula = 'Titanic';

SELECT pelicula, ano_estreno, director, reparto.actor FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.id_pelicula 
WHERE peliculas.pelicula in (SELECT pelicula FROM peliculas WHERE pelicula = 'Titanic');

--5. Listar los titulos de las películas donde actúe Harrison Ford.
SELECT pelicula FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.id_pelicula WHERE reparto.actor IN ('Harrison Ford');

--6. Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100.
SELECT COUNT(*), director FROM peliculas GROUP BY director ORDER BY count DESC LIMIT 10; 

--7. Indicar cuantos actores distintos hay 
SELECT COUNT(DISTINCT actor) FROM reparto; 

--8. Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas por título de manera ascendente.
SELECT pelicula FROM peliculas WHERE (ano_estreno >= 1990) AND (ano_estreno <= 1999) ORDER BY ano_estreno;

--9. Listar el reparto de las películas lanzadas el año 2001
--SELECT * FROM peliculas WHERE ano_estreno = 2001;

SELECT actor, peliculas.pelicula, peliculas.ano_estreno FROM reparto INNER JOIN peliculas ON peliculas.id = reparto.id_pelicula 
WHERE peliculas.ano_estreno = 2001;