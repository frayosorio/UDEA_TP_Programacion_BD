CREATE VIEW vEncuentro
AS
	SELECT P1.pais pais1, E.goles1 || '-' || E.goles2 marcador, p2.pais pais2, C.campeonato, P.pais paissede, S.estadio, CI.ciudad,
		E.*
	FROM encuentro E
		JOIN pais P1 ON E.idpais1=P1.id
		JOIN pais P2 ON E.idpais2=P2.id
		JOIN campeonato C ON E.idcampeonato=C.id
		JOIN pais P ON C.idpais=P.id
		JOIN estadio S ON E.idestadio=S.id
		JOIN ciudad CI ON CI.id = S.idciudad;

CREATE VIEW vEstadio
AS
	SELECT C.ciudad || ' (' || P.pais || ')' ciudad,
		E.*
		FROM Estadio E
			JOIN ciudad C ON E.idciudad=C.id
			JOIN pais P ON p.id=C.idpais;

CREATE VIEW vGrupo
AS
	SELECT C.id idcampeonato, C.campeonato, 
		C.idpais idpaissede, P.pais paissede, 
		G.grupo, G.id, GP.idpais, PG.pais
		FROM campeonato C
			JOIN pais P ON C.idpais=P.id
			LEFT JOIN grupo G ON C.id=G.idcampeonato
			LEFT JOIN grupopais GP ON GP.idgrupo=G.id
			LEFT JOIN pais PG ON GP.idpais=PG.id;

--*****************************
SELECT *
	FROM vGrupo
	WHERE campeonato='FIFA World Cup 2022';

SELECT *
	FROM vEncuentro
	WHERE campeonato='FIFA World Cup 2022';

SELECT *
	FROM vEstadio
	WHERE ciudad LIKE '%Catar%'



