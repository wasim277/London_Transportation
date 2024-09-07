# London Transportation Data Analysis

This project analyzes the number of passengers using different modes of transportation on a monthly basis in London, with insights extracted from the `tfl_journeys_final` table. The SQL queries are stored in the `london_transportation.sql` file, allowing you to run all queries at once. 

## SQL Queries

1. **Seasonal Trends**: This query reveals seasonal patterns in passenger journeys, helping to anticipate peak travel times and optimize resources.

    ```sql
    SELECT
        year,
        month,
        AVG(journeys_millions) AS avg_journeys
    FROM tfl_journeys_final
    GROUP BY year, month
    ORDER BY year, month;
    ```

2. **Journey Type Comparison**: This query compares total journeys across different journey types, facilitating targeted improvements in the most utilized transport modes.

    ```sql
    SELECT
        journey_type,
        SUM(journeys_millions) AS total_journeys
    FROM tfl_journeys_final
    GROUP BY journey_type
    ORDER BY total_journeys DESC;
    ```

3. **Year-on-Year Growth Rate**: This query calculates the year-on-year growth rate of passenger journeys, providing insights into trends that inform infrastructure planning and service adjustments.

    ```sql
    SELECT
        j1.year,
        ROUND((j1.total_journeys - j2.total_journeys) / j2.total_journeys, 2) AS growth_rate
    FROM
        (SELECT year, SUM(journeys_millions) AS total_journeys FROM tfl_journeys_final GROUP BY year) j1
    JOIN
        (SELECT year, SUM(journeys_millions) AS total_journeys FROM tfl_journeys_final GROUP BY year) j2
    ON j1.year = j2.year + 1;
    ```

## Usage

To run the SQL queries, download the `london_transportation.sql` file, open your SQL environment, and execute the file to run all queries.

## Conclusion

This analysis serves as a foundation for understanding transportation trends in London, providing valuable insights to improve public transport services and inform decision-making for future developments.
