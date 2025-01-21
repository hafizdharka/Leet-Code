WITH cte AS
(
    SELECT pid, 
        tiv_2015, 
        tiv_2016, 
        COUNT(CONCAT(lat, lon)) OVER (PARTITION BY CONCAT(lat, lon)) AS cnt1, 
        COUNT(tiv_2015) OVER(PARTITION BY tiv_2015) AS cnt
    FROM insurance)

SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016 FROM cte WHERE cnt1=1 AND cnt!=1