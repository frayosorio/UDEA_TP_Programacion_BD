--Consulta para saber los datos de los encuentros
SELECT E.id, E.fecha, P1.pais, E.goles1, p2.pais, E.goles2, C.campeonato, P.pais, S.estadio, CI.ciudad
	FROM encuentro E
		JOIN pais P1 ON E.idpais1=P1.id
		JOIN pais P2 ON E.idpais2=P2.id
		JOIN campeonato C ON E.idcampeonato=C.id
		JOIN pais P ON C.idpais=P.id
		JOIN estadio S ON E.idestadio=S.id
		JOIN ciudad CI ON CI.id = S.idciudad
	WHERE C.campeonato='FIFA U-20 Women''s World Cup Colombia 2024'
		--AND (P1.pais='Fiyi' OR P2.pais='Fiyi')
		
--Cuantos goles metio Brasil en el mundial femenino sub20
SELECT SUM(CASE WHEN P.id=E.idpais1 THEN E.goles1
						WHEN P.id=E.idpais2 THEN E.goles2
						ELSE 0
						END) totalGoles
	FROM encuentro E
		JOIN pais P ON P.id IN (E.idpais1, E.idpais2)
		JOIN campeonato C ON E.idcampeonato=C.id
	WHERE C.campeonato='FIFA U-20 Women''s World Cup Colombia 2024'
		AND P.pais='Brasil'


--Contar cuantos goles marcó cada seleccion en el mundial femenino sub20
SELECT P.pais, SUM(CASE WHEN P.id=E.idpais1 THEN E.goles1
						WHEN P.id=E.idpais2 THEN E.goles2
						ELSE 0
						END) totalGoles
	FROM encuentro E
		JOIN pais P ON P.id IN (E.idpais1, E.idpais2)
		JOIN campeonato C ON E.idcampeonato=C.id
	WHERE C.campeonato='FIFA U-20 Women''s World Cup Colombia 2024'
	GROUP BY P.pais

--Indicar cuales equipos marcaron mas de 10 goles en el mundial femenino sub20
SELECT P.pais, SUM(CASE WHEN P.id=E.idpais1 THEN E.goles1
						WHEN P.id=E.idpais2 THEN E.goles2
						ELSE 0
						END) totalGoles
	FROM encuentro E
		JOIN pais P ON P.id IN (E.idpais1, E.idpais2)
		JOIN campeonato C ON E.idcampeonato=C.id
	WHERE C.campeonato='FIFA U-20 Women''s World Cup Colombia 2024'
	GROUP BY P.pais
	HAVING SUM(CASE WHEN P.id=E.idpais1 THEN E.goles1
						WHEN P.id=E.idpais2 THEN E.goles2
						ELSE 0
						END)>10

--Total de encuentros jugados en cada estadio en el mundial femenino sub20
SELECT S.estadio, COUNT(*)
	FROM encuentro E
		JOIN estadio S ON E.idestadio=S.id
		JOIN campeonato C ON E.idcampeonato=C.id
	WHERE C.campeonato='FIFA U-20 Women''s World Cup Colombia 2024'
	GROUP BY S.estadio
	
--En cuales estadios se jugaron mas de 5 encuentros en el mundial femenino sub20
SELECT S.estadio, COUNT(*)
	FROM encuentro E
		JOIN estadio S ON E.idestadio=S.id
		JOIN campeonato C ON E.idcampeonato=C.id
	WHERE C.campeonato='FIFA U-20 Women''s World Cup Colombia 2024'
	GROUP BY S.estadio
	HAVING COUNT(*)>5

--***** Reasignar el generador autonumerico de la tabla 'encuentro' ******
--obtener valor maximo de ID actual
SELECT MAX(id) FROM encuentro

--Averiguar nombre del gestor de autonumericos de la tabla 'encuentro'
SELECT pg_get_serial_sequence('encuentro', 'id');

ALTER SEQUENCE encuentro_id_seq RESTART 31

--Agregar el encuentro: 2 de septiembre, Ghana 1:2 Austria, Estadio Metropolitano de Techo, Bogotá
--en el mundial femenino sub20

SELECT * FROM encuentro
SELECT * FROM pais WHERE pais IN ('Ghana', 'Austria')
SELECT * FROM fase
SELECT * FROM campeonato WHERE campeonato='FIFA U-20 Women''s World Cup Colombia 2024'
SELECT * FROM estadio WHERE estadio LIKE '%echo%'

INSERT INTO encuentro
	(idpais1, idpais2, idfase, idcampeonato, idestadio, goles1, goles2)
	VALUES(31, 43, 1, 12, 62, 1, 2)

--Actualizar la fecha del anterior partido
UPDATE encuentro
	SET fecha='2024-09-02'
	WHERE id=33

--Agregar el encuentro: 2 de septiembre, Japón 7:0 Nueva Zelanda, Estadio Metropolitano de Techo, Bogotá
--en el mundial femenino sub20
SELECT * FROM pais WHERE pais IN ('Japón', 'Nueva Zelanda')

INSERT INTO encuentro
	(fecha, idpais1, idpais2, idfase, idcampeonato, idestadio, goles1, goles2)
	VALUES('2024-09-02', 5, 57, 1, 12,  62,  7,  0)


	
