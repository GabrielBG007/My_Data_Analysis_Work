SELECT * FROM Significant_Volcano_Eruptions

--Total number of significant volcano eruptions since 4360 BC
SELECT COUNT(*) AS Number_Of_Eruptions
FROM Significant_Volcano_Eruptions

--Total number of deaths since 4360 BC
SELECT SUM(TOTAL_DEATHS) AS Total_Deaths
FROM Significant_Volcano_Eruptions

--Volcano eruption type since 4360 BC
SELECT Eruption_Type,COUNT(Eruption_Type) *100*1.0  / (SELECT COUNT(Eruption_Type) FROM Significant_Volcano_Eruptions) AS "% OF TOTAL"
FROM Significant_Volcano_Eruptions
GROUP BY Eruption_Type
ORDER BY "% OF TOTAL" DESC

--Volcano eruption type since 2000
SELECT Eruption_Type,COUNT(Eruption_Type) *100*1.0  / (SELECT COUNT(Eruption_Type) FROM Significant_Volcano_Eruptions WHERE Year >= 2000) AS "% OF TOTAL"
FROM Significant_Volcano_Eruptions
WHERE Year >= 2000
GROUP BY Eruption_Type
ORDER BY "% OF TOTAL" DESC

-- Top 10 highest volcanos
SELECT DISTINCT TOP 10 "Name", Elevation
FROM Significant_Volcano_Eruptions
ORDER BY Elevation DESC

-- Top 10 lowest volcanos
UPDATE Significant_Volcano_Eruptions
SET "Name" = 'Unnamed'
WHERE "Name" = 'No Record'
SELECT DISTINCT TOP 10 "Name", Elevation
FROM Significant_Volcano_Eruptions
ORDER BY Elevation ASC

-- Top 10 deathliest volcanos--
SELECT TOP 10 "Name",SUM(TOTAL_DEATHS) AS "Total Deaths"
FROM Significant_Volcano_Eruptions
GROUP BY "Name"
ORDER BY "Total Deaths" DESC, "Name"