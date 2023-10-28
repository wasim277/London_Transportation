# London_Transportation
Here we have data about no of passengers using different modes of transportation on a monthly basis in LONDON.
I have done some basic analysis using SQL 

Here I am going to give my code with explanation but I am attaching my .sql file in this repository, So If you want to run those SQL queries you can use that file and can run run those queries in one go.

#1.Seasonal Trends
SELECT
    year,
    month,
    AVG(journeys_millions) AS avg_journeys
FROM tfl_journeys_final
GROUP BY year, month
ORDER BY year, month;

----This query will reveal seasonal patterns, enabling the team to anticipate peak travel times, plan maintenance during low-demand periods, and optimize resources and staff allocation according to demand fluctuations.

# 2. Journey Type Comparison Query:
SELECT
    journey_type,
    SUM(journeys_millions) AS total_journeys
FROM tfl_journeys_final
GROUP BY journey_type
ORDER BY total_journeys DESC;

----Understanding the popularity of different journey types allows for targeted improvements or investments in the most utilized transport modes. It helps in allocating resources, focusing on infrastructure development, and adjusting schedules based on demand for specific types of transport.

#3.  Year-on-Year Growth Rate Query:

SELECT
    j1.year,
    round((j1.total_journeys - j2.total_journeys) / j2.total_journeys,2) AS growth_rate
FROM
    (SELECT year, SUM(journeys_millions) AS total_journeys FROM tfl_journeys_final GROUP BY year) j1
JOIN
    (SELECT year, SUM(journeys_millions) AS total_journeys FROM tfl_journeys_final GROUP BY year) j2
ON j1.year = j2.year + 1;

-----Calculating the year-on-year growth rate provides insights into the growth or decline in public transport usage. It helps in forecasting and planning for infrastructure expansion, service adjustments, and capacity requirements.







