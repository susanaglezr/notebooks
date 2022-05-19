use master2;

SELECT * FROM netflix_titles;

SELECT * FROM netflix_activity;

SELECT * FROM netflix_users;

# ¿Qué actividad corresponde a cada usuario?
SELECT u.user_id, u.nombre, a.show
FROM netflix_users as u
LEFT JOIN netflix_activity as a
ON u.user_id = a.user_id;

#Qué título le corresponde cada actividad?
#T
#show_id
#title
#A
#show
#view_date

SELECT t.show_id, t.title, a.user_id, a.view_date
FROM netflix_titles as t
LEFT JOIN netflix_activity as a
ON t.show_id = a.show;

# ¿Qué usuarios ven cada show?
# T
# show_id
# type
# title

# A
# user_id
# show

# U
# user_id
# nombre

SELECT t.show_id, t.type, t.title, a.user_id, u.nombre
FROM netflix_titles as t
INNER JOIN netflix_activity as a
ON t.show_id = a.show
LEFT JOIN netflix_users as u
USING (user_id)
ORDER BY nombre;

# Muestra solo los títulos que sean Películas
SELECT *
FROM netflix_titles
WHERE type = 'Movie';

# Cuenta cuantos usuarios han visto cada película y ordena por show_id
# T
# show_id
# title
# type

# A
# show
SELECT t.show_id, t.type, t.title, COUNT(*)
FROM netflix_titles as t
INNER JOIN netflix_activity as a
ON t.show_id = a.show
WHERE type = 'Movie'
GROUP BY show_id
ORDER BY show_id;

# Cuenta cuantos usuarios han visto cada película del 2021 y ordena por show_id 
SELECT t.show_id, t.type, t.title, t.release_year, COUNT(*)
FROM netflix_titles as t
INNER JOIN netflix_activity as a
ON t.show_id = a.show
WHERE type = 'Movie' and release_year = 2021
GROUP BY show_id
ORDER BY show_id;

#Todas las series que sean 'country' de 'United States' o 'United Kingdom' y sean arriba del 2010
SELECT type, title, release_year, country
FROM netflix_titles
WHERE type = 'TV Show' and (country = 'United States' or country = 'United Kingdom') AND release_year > 2010;






