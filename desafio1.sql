--Parte 1

--1 Crear Base de datos post
CREATE DATABASE post;

--2 Crear tabla post, con atributos id, nombre de usuario, fecha de ceracion, contenido, descripcion
CREATE TABLE post (id SERIAL, nombre_de_usuario VARCHAR(30), fecha_de_creacion DATE, contenido VARCHAR(255), descripcion VARCHAR(100) PRIMARY KEY (id));

--3 Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos"
INSERT INTO post(nombre_de usuario, fecha_de_creacion, contenido, descripción) 
VALUES ('Pamela', CURRENT_TIMESTAMP, 'Primer post de pamela', 'first post'), 
('Pamela', CURRENT_TIMESTAMP, 'Segundo post de pamela', 'second post'),
('Carlos', CURRENT_TIMESTAMP, 'Primer post de Carlos', 'first post');

--4 Modificar la tabla post, agregando la columna titulo
ALTER TABLE post ADD COLUMN titulo VARCHAR(25);

--5 Agregar titulo a las publicaciones ya ingresadas
UPDATE post SET titulo = 'aqui comienza';

--6 Insertar 2 post para el usuario Pedro
INSERT INTO post(nombre_de usuario, fecha_de_creacion, contenido, descripción) 
VALUES ('Pedro', CURRENT_TIMESTAMP, 'Primer post de pedro', 'first post'), 
('Pedro', CURRENT_TIMESTAMP, 'Segundo post de pedro', 'second post');

--7 Eliminar el post de Carlos
DELETE FROM post WHERE nomre_de_usuario = 'Carlos';

--8 Ingresar un nuevo post para el usuario Carlos
INSERT INTO post(nombre_de usuario, fecha_de_creacion, contenido, descripción) 
VALUES ('Carlos', CURRENT_TIMESTAMP, 'Segundo post de Carlos', 'second post');


--Parte 2
--9 crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación, contenido, que se relaciones con la tabla post
CREATE TABLE comentarios(id SERIAL, fecha_y_hora_de_creacion DATE, contenido VARCHAR(255), id_post INT, FOREIGN KEY id_post REFERENCES post(id));

--10 Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos"
INSERT INTO comentarios (fecha_y_hora_de_creacion, contenido, id_post) 
VALUES (CURRENT_TIMESTAMP, 'comentario 1 de primer post de pamela', 1), 
(CURRENT_TIMESTAMP, 'comentario 2 de primer post de pamela', 1), 
(CURRENT_TIMESTAMP, 'comentario 1 de segundo post de Carlos', 5);

--11 Crear un nuevo post para "Margarita"
INSERT INTO post(nombre_de usuario, fecha_de_creacion, contenido, descripción) 
VALUES ('Margarita', CURRENT_TIMESTAMP, 'Primer post de Margarita', 'primer post');

--12 Ingresar 5 comentarios para el post de Margarita
INSERT INTO comentarios (fecha_y_hora_de_creacion, contenido, id_post) 
VALUES (CURRENT_TIMESTAMP, 'comentario 1 de primer post de margarita', 6),
(CURRENT_TIMESTAMP, 'comentario 2 de primer post de margarita', 6),
(CURRENT_TIMESTAMP, 'comentario 3 de primer post de margarita', 6),
(CURRENT_TIMESTAMP, 'comentario 4 de primer post de margarita', 6),
(CURRENT_TIMESTAMP, 'comentario 5 de primer post de margarita', 6);

