USE agricultura;
SHOW TABLES;

DROP VIEW cierres;

CREATE VIEW cierres AS 
(SELECT Anio, Nomestado, Nommodalidad, Nomcultivo, Sembrada, Cosechada, Siniestrada, Volumenproduccion, Rendimiento, Precio, Valorproduccion
FROM cierre_2021
UNION
SELECT Anio, Nomestado, Nommodalidad, Nomcultivo, Sembrada, Cosechada, Siniestrada, Volumenproduccion, Rendimiento, Precio, Valorproduccion
FROM cierre_2020
UNION
SELECT Anio, Nomestado, Nommodalidad, Nomcultivo, Sembrada, Cosechada, Siniestrada, Volumenproduccion, Rendimiento, Precio, Valorproduccion
FROM cierre_2019
UNION
SELECT Anio, Nomestado, Nommodalidad, Nomcultivo, Sembrada, Cosechada, Siniestrada, Volumenproduccion, Rendimiento, Precio, Valorproduccion
FROM cierre_2018
UNION
SELECT Anio, Nomestado, Nommodalidad, Nomcultivo, Sembrada, Cosechada, Siniestrada, Volumenproduccion, Rendimiento, Precio, Valorproduccion
FROM cierre_2017
UNION
SELECT Anio, Nomestado, Nommodalidad, Nomcultivo, Sembrada, Cosechada, Siniestrada, Volumenproduccion, Rendimiento, Precio, Valorproduccion
FROM cierre_2016
UNION
SELECT Anio, Nomestado, Nommodalidad, Nomcultivo, Sembrada, Cosechada, Siniestrada, Volumenproduccion, Rendimiento, Precio, Valorproduccion
FROM cierre_2015);

SELECT Nomestado, Nomcultivo
FROM cierres;

CREATE VIEW top AS
(SELECT Nomestado, Nomcultivo, sum(Volumenproduccion) AS Prod_total, avg(Precio) AS Precio 
FROM cierres
GROUP BY Nomestado);

SELECT Nomcultivo, count(Nomcultivo) AS Estados
FROM top
GROUP BY Nomcultivo
ORDER BY Estados DESC;


SELECT Nomestado, Nomcultivo, sum(Volumenproduccion) AS Prod_total, avg(Precio) AS Precio 
FROM cierres
GROUP BY Nomcultivo;
	


