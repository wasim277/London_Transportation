#1.Seasonal Trends
SELECT
    year,
    month,
    AVG(journeys_millions) AS avg_journeys
FROM tfl_journeys_final
GROUP BY year, month
ORDER BY year, month;

# 2. Journey Type Comparison Query:
SELECT
    journey_type,
    SUM(journeys_millions) AS total_journeys
FROM tfl_journeys_final
GROUP BY journey_type
ORDER BY total_journeys DESC;

#3.  Year-on-Year Growth Rate Query:

SELECT
    j1.year,
    round((j1.total_journeys - j2.total_journeys) / j2.total_journeys,2) AS growth_rate
FROM
    (SELECT year, SUM(journeys_millions) AS total_journeys FROM tfl_journeys_final GROUP BY year) j1
JOIN
    (SELECT year, SUM(journeys_millions) AS total_journeys FROM tfl_journeys_final GROUP BY year) j2
ON j1.year = j2.year + 1;





