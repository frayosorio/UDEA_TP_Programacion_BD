--Consulta para saber los datos de los encuentros
SELECT E.fecha, P1.pais, E.goles1, p2.pais, E.goles2, C.campeonato, P.pais, S.estadio, CI.ciudad
	FROM encuentro E
		JOIN pais P1 ON E.idpais1=P1.id
		JOIN pais P2 ON E.idpais2=P2.id
		JOIN campeonato C ON E.idcampeonato=C.id
		JOIN pais P ON C.idpais=P.id
		JOIN estadio S ON E.idestadio=S.id
		JOIN ciudad CI ON CI.id = S.idciudad
	WHERE C.campeonato='FIFA U-20 Women''s World Cup Colombia 2024'
		--AND (P1.pais='Colombia' OR P2.pais='Colombia')
		
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

--Indicar cuales equipos marcaron mas de 10 goles

		