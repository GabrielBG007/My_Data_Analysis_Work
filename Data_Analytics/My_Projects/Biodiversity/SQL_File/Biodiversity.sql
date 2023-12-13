SELECT * FROM parks
SELECT * FROM species

/*Total number of species*/
SELECT Park_Name, COUNT(*) AS "Nº of Species"
FROM species
GROUP BY Park_Name
ORDER BY COUNT(*) DESC, Park_Name

--Total Proportion for the Species Category--
SELECT Category , COUNT(*)*100*1.0/(SELECT COUNT(Category) FROM species) AS "% of Total"
FROM species
GROUP BY Category
ORDER BY "% of Total" DESC

--Nativeness Total Proportion--
SELECT Nativeness , COUNT(*)*100*1.0/(SELECT COUNT(Nativeness) FROM species) AS "% of Total"
FROM species
GROUP BY Nativeness
ORDER BY "% of Total" DESC

--Conservation Status Total Proportion--
SELECT Conservation_Status , COUNT(*)*100*1.0/(SELECT COUNT(Conservation_Status) FROM species) AS "% of Total"
FROM species
GROUP BY Conservation_Status
ORDER BY "% of Total" DESC

--Top 10 Parks with the largest number of species--
SELECT TOP 10 Park_Name, COUNT(*) AS "Nº of Species"
FROM species
GROUP BY Park_Name
ORDER BY COUNT(*) DESC, Park_Name

--Species Category % OF TOTAL for the TOP 10 Parks--
SELECT Category , COUNT(*)*100*1.0/(SELECT COUNT(Category) FROM species WHERE Park_Name = 'Great Basin National Park' ) AS "% of Total"
FROM species
WHERE Park_Name = 'Great Basin National Park'
GROUP BY Category
ORDER BY "% of Total" DESC

--BOT 10 Parks with the least number of species--
SELECT TOP 10 Park_Name, COUNT(*) AS "Nº of Species"
FROM species
GROUP BY Park_Name
ORDER BY COUNT(*) ASC, Park_Name

--Species Category % OF TOTAL for the BOT 10 Parks--
SELECT Category , COUNT(*)*100*1.0/(SELECT COUNT(Category) FROM species WHERE Park_Name = 'Katmai National Park and Preserve' ) AS "% of Total"
FROM species
WHERE Park_Name = 'Katmai National Park and Preserve'
GROUP BY Category
ORDER BY "% of Total" DESC
