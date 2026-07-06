CREATE DATABASE netflix_analysis;
USE netflix_analysis;

SELECT COUNT(*) AS total_titles
FROM netflix_titles;
select * from netflix_titles;

SELECT
SUM(director IS NULL) AS missing_director,
SUM(cast IS NULL) AS missing_cast,
SUM(country IS NULL) AS missing_country
FROM netflix_titles;

SELECT type,
COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY type;

SELECT country,
COUNT(*) AS total_titles
FROM netflix_titles
WHERE country <> ''
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

SELECT
YEAR(STR_TO_DATE(date_added, '%d-%b-%y')) AS year_added,
COUNT(*) AS titles_added
FROM netflix_titles
GROUP BY YEAR(STR_TO_DATE(date_added, '%d-%b-%y'))
ORDER BY year_added;

SELECT rating, COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY rating
ORDER BY total_titles DESC;

SELECT title, rating
FROM netflix_titles
WHERE type = 'Movie'
AND rating = 'TV-MA';

SELECT title, rating
FROM netflix_titles
WHERE type = 'TV Show'
AND rating = 'TV-MA';

SELECT
ROUND(AVG(sentiment),3) AS avg_sentiment
FROM netflix_titles;

SELECT
type,
ROUND(AVG(sentiment),3) AS avg_sentiment
FROM netflix_titles
GROUP BY type;

SELECT
title,
ROUND(sentiment,3) AS sentiment_score
FROM netflix_titles
ORDER BY sentiment DESC
LIMIT 10;

SELECT director,
COUNT(*) AS total_titles
FROM netflix_titles
WHERE director IS NOT NULL
AND director <> ''
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

SELECT
MONTHNAME(STR_TO_DATE(date_added,'%d-%b-%y')) AS month_name,
COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY month_name
ORDER BY total_titles DESC;