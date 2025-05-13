CREATE OR REPLACE PROCEDURE spGenerarEncuentrosGrupo(
	idgrupogenerar INTEGER
)
LANGUAGE plpgsql
AS $$
	DECLARE idcampeonatogrupo INTEGER;
		registropais1 RECORD;
		registropais2 RECORD;
		cursorPaises CURSOR FOR
			SELECT idpais
				FROM grupopais
				WHERE idgrupo = idgrupogenerar
				ORDER BY idpais;
		cursorOtrosPaises CURSOR(idpaisprocesado INTEGER) FOR
			SELECT idpais
				FROM grupopais
				WHERE idgrupo = idgrupogenerar
					AND idpais > idpaisprocesado
				ORDER BY idpais;

BEGIN
	--obtener el ID del campeonato
	SELECT idcampeonato INTO idcampeonatogrupo
		FROM grupo
		WHERE id = idgrupogenerar;

	--abrir el cursor con la lista de paises del grupo
	OPEN cursorPaises;

	--Ciclo recorriendo el cursor
	LOOP
		--obtener el siguiente registro del cursor
		FETCH cursorPaises INTO registropais1;
		--salida del ciclo
		EXIT WHEN NOT FOUND;

		--abrir el cursor con la lista de los otros paises del grupo
		OPEN cursorOtrosPaises(registropais1.idpais);
		
		LOOP
			--obtener el siguiente registro del cursor de los otros paises
			FETCH cursorOtrosPaises INTO registropais2;
			--salida del ciclo
			EXIT WHEN NOT FOUND;

			IF NOT EXISTS(SELECT * FROM encuentro
				WHERE ((idpais1=registropais1.idpais AND idpais2=registropais2.idpais) OR
					(idpais1=registropais2.idpais AND idpais2=registropais1.idpais)) 
					AND idfase=1 AND idcampeonato=idcampeonatogrupo) THEN
				INSERT INTO encuentro
					(idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
					VALUES(registropais1.idpais, null, registropais2.idpais, null, null, 0, 1, idcampeonatogrupo);
			END IF;
		END LOOP;
		CLOSE cursorOtrosPaises;
	END LOOP;
	CLOSE cursorPaises;
END
$$;
