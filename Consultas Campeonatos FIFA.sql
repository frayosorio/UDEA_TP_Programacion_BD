--Consulta para saber los datos de los encuentros
SELECT E.fecha, P1.pais, E.goles1, p2.pais, E.goles2, C.campeonato, P.pais, S.estadio, CI.ciudad
	FROM encuentro E
		JOIN pais P1 ON E.idpais1=P1.id
		JOIN pais P2 ON E.idpais2=P2.id
		JOIN campeonato C ON E.idcampeonato=C.id
		JOIN pais P ON C.idpais=P.id
		JOIN estadio S ON E.idestadio=S.id
		JOIN ciudad CI ON CI.id = S.idciudad
		
--Cuantos goles metio Colombia en el mundial femenino sub20
SELECT SUM(CASE WHEN P1.pais='Colombia' THEN E.goles1
			WHEN P2.pais='Colombia' THEN E.goles2
			ELSE 0
			END)
	FROM encuentro E
		JOIN pais P1 ON E.idpais1=P1.id
		JOIN pais P2 ON E.idpais2=P2.id
		JOIN campeonato C ON E.idcampeonato=C.id
	WHERE C.campeonato='FIFA U-20 Women''s World Cup Colombia 2024'
		AND (P1.pais='Colombia' OR P2.pais='Colombia')


SELECT *
	FROM encuentro