CALL spGenerarEncuentrosGrupo(31);

SELECT *
	FROM vGrupo
	WHERE campeonato='FIFA World Cup 2022';

SELECT *
	FROM vEncuentro
	WHERE campeonato='FIFA World Cup 2022';

DELETE FROM encuentro
	WHERE id>=58;
