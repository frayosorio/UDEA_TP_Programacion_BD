DO $$
DECLARE
	nuevoIdPais INTEGER; idPaisSede INTEGER; nuevoIdCampeonato INTEGER;
	nuevoIdCiudad INTEGER; nuevoIdEstadio INTEGER; nuevoIdGrupo INTEGER; nuevoIdEncuentro INTEGER;
	idciudad1 INTEGER; idciudad2 INTEGER; idciudad3 INTEGER; idciudad4 INTEGER; idciudad5 INTEGER;
	idEstadio1 INTEGER; idEstadio2 INTEGER; idEstadio3 INTEGER; idEstadio4 INTEGER;
	idEstadio5 INTEGER; idEstadio6 INTEGER; idEstadio7 INTEGER; idEstadio8 INTEGER;
	totalGrupos INTEGER; totalPaisesGrupo INTEGER;
	idPais1Grupo INTEGER; idPais2Grupo INTEGER; idPais3Grupo INTEGER; idPais4Grupo INTEGER;
BEGIN
	SELECT MAX(id)+1 INTO nuevoIdPais FROM pais;


	--validar si ya existe el país sede
	SELECT id INTO idPaisSede FROM pais WHERE pais='Catar';
	IF idPaisSede IS NULL THEN
		INSERT INTO pais
			(id, pais, entidad)
			VALUES(nuevoIdPais, 'Catar', '');
		idPaisSede := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

	--validar si ya existe el campeonato
	SELECT id INTO nuevoIdCampeonato FROM campeonato WHERE campeonato='FIFA World Cup 2022';
	IF nuevoIdCampeonato IS NULL THEN
		SELECT MAX(id)+1 INTO nuevoIdCampeonato FROM campeonato;
		INSERT INTO campeonato
			(id, campeonato, año, idpais)
			VALUES(nuevoIdCampeonato, 'FIFA World Cup 2022', 2022, idPaisSede);
		nuevoIdCampeonato := nuevoIdCampeonato + 1;
	END IF;

-- Ciudades y estadios
-- 1: Jor       - 1: Estadio Al Bayt
-- 2: Lusail    - 2: Estadio de Lusail
-- 3: Doha      - 3: Estadio 974, 
--                4: Estadio Al Thumama 
-- 4: Rayán     - 5: Estadio Ciudad de la Educación,
--                6: Estadio Áhmad bin Ali,
--                7: Estadio Internacional Khalifa
-- 5: Al Wakrah - 8: Estadio Al Janoub

	SELECT MAX(Id)+1 INTO nuevoIdCiudad FROM ciudad;
	SELECT MAX(Id)+1 INTO nuevoIdEstadio FROM estadio;

	--validar si ya existe el estadio 'Estadio Al Bayt'
	SELECT id INTO idEstadio1 FROM estadio WHERE estadio='Estadio Al Bayt';
	IF idEstadio1 IS NULL THEN
		--validar si ya existe la ciudad de 'Jor'
		SELECT id INTO idciudad1 FROM ciudad WHERE ciudad='Jor';
		IF idciudad1 IS NULL THEN
			INSERT INTO ciudad
			(id, ciudad, idpais)
			VALUES(nuevoIdCiudad, 'Jor', idPaisSede);
			idciudad1 := nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;
		INSERT INTO estadio
			(id, estadio, capacidad, idciudad)
			VALUES(nuevoIdEstadio, 'Estadio Al Bayt', 68895, idciudad1);
		idEstadio1 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;

	--validar si ya existe el estadio 'Estadio de Lusail'
	SELECT id INTO idEstadio2 FROM estadio WHERE estadio='Estadio de Lusail';
	IF idEstadio2 IS NULL THEN
		--validar si ya existe la ciudad de 'Lusail'
		SELECT id INTO idciudad2 FROM ciudad WHERE ciudad='Lusail';
		IF idciudad2 IS NULL THEN
			INSERT INTO ciudad
			(id, ciudad, idpais)
			VALUES(nuevoIdCiudad, 'Lusail', idPaisSede);
			idciudad2 := nuevoIdCiudad;
			nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;
		INSERT INTO estadio
			(id, estadio, capacidad, idciudad)
			VALUES(nuevoIdEstadio, 'Estadio de Lusail', 88966, idciudad2);
		idEstadio2 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;

	--validar si ya existe la ciudad de 'Doha'
	SELECT id INTO idciudad3 FROM ciudad WHERE ciudad='Doha';
	IF idciudad3 IS NULL THEN
		INSERT INTO ciudad
		(id, ciudad, idpais)
		VALUES(nuevoIdCiudad, 'Doha', idPaisSede);
		idciudad3 := nuevoIdCiudad;
		nuevoIdCiudad := nuevoIdCiudad + 1;
	END IF;
	--validar si ya existe el estadio 'Estadio 974'
	SELECT id INTO idEstadio3 FROM estadio WHERE estadio='Estadio 974';
	IF idEstadio3 IS NULL THEN
		INSERT INTO estadio
			(id, estadio, capacidad, idciudad)
			VALUES(nuevoIdEstadio, 'Estadio 974', 44089, idciudad3);
		idEstadio3 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;
	--validar si ya existe el estadio 'Estadio Al Thumama'
	SELECT id INTO idEstadio4 FROM estadio WHERE estadio='Estadio Al Thumama';
	IF idEstadio4 IS NULL THEN
		INSERT INTO estadio
			(id, estadio, capacidad, idciudad)
			VALUES(nuevoIdEstadio, 'Estadio Al Thumama', 44400, idciudad3);
		idEstadio4 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;

	--validar si ya existe la ciudad de 'Rayán'
	SELECT id INTO idciudad4 FROM ciudad WHERE ciudad='Rayán';
	IF idciudad4 IS NULL THEN
		INSERT INTO ciudad
		(id, ciudad, idpais)
		VALUES(nuevoIdCiudad, 'Rayán', idPaisSede);
		idciudad4 := nuevoIdCiudad;
		nuevoIdCiudad := nuevoIdCiudad + 1;
	END IF;
	--validar si ya existe el estadio 'Estadio Ciudad de la Educación'
	SELECT id INTO idEstadio5 FROM estadio WHERE estadio='Estadio Ciudad de la Educación';
	IF idEstadio5 IS NULL THEN
		INSERT INTO estadio
			(id, estadio, capacidad, idciudad)
			VALUES(nuevoIdEstadio, 'Estadio Ciudad de la Educación', 44667, idciudad4);
		idEstadio5 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;
	--validar si ya existe el estadio 'Estadio Áhmad bin Ali'
	SELECT id INTO idEstadio6 FROM estadio WHERE estadio='Estadio Áhmad bin Ali';
	IF idEstadio6 IS NULL THEN
		INSERT INTO estadio
			(id, estadio, capacidad, idciudad)
			VALUES(nuevoIdEstadio, 'Estadio Áhmad bin Ali', 45032, idciudad4);
		idEstadio6 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;
	--validar si ya existe el estadio 'Estadio Internacional Khalifa'
	SELECT id INTO idEstadio7 FROM estadio WHERE estadio='Estadio Internacional Khalifa';
	IF idEstadio7 IS NULL THEN
		INSERT INTO estadio
			(id, estadio, capacidad, idciudad)
			VALUES(nuevoIdEstadio, 'Estadio Internacional Khalifa', 45857, idciudad4);
		idEstadio7 := nuevoIdEstadio;
		nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;

	--validar si ya existe el estadio 'Estadio Al Janoub'
	SELECT id INTO idEstadio8 FROM estadio WHERE estadio='Estadio Al Janoub';
	IF idEstadio8 IS NULL THEN
		--validar si ya existe la ciudad de 'Al Wakrah'
		SELECT id INTO idciudad5 FROM ciudad WHERE ciudad='Al Wakrah';
		IF idciudad5 IS NULL THEN
			INSERT INTO ciudad
			(id, ciudad, idpais)
			VALUES(nuevoIdCiudad, 'Al Wakrah', idPaisSede);
			idciudad5 := nuevoIdCiudad;
			--nuevoIdCiudad := nuevoIdCiudad + 1;
		END IF;
		INSERT INTO estadio
			(id, estadio, capacidad, idciudad)
			VALUES(nuevoIdEstadio, 'Estadio Al Janoub', 44325, idciudad5);
		idEstadio8 := nuevoIdEstadio;
		--nuevoIdEstadio := nuevoIdEstadio + 1;
	END IF;

	SELECT MAX(Id)+1 INTO nuevoIdEncuentro FROM encuentro;

	--validar si ya estan los grupos
	SELECT COUNT(*) INTO totalGrupos
		FROM grupo 
		WHERE idcampeonato=nuevoIdCampeonato;

	IF totalGrupos=0 THEN
		SELECT MAX(Id)+1 INTO nuevoIdGrupo FROM grupo;

		INSERT INTO grupo
			(id, grupo, idcampeonato)
			VALUES
			(nuevoIdGrupo, 'A', nuevoIdCampeonato),
			(nuevoIdGrupo+1, 'B', nuevoIdCampeonato),
			(nuevoIdGrupo+2, 'C', nuevoIdCampeonato),
			(nuevoIdGrupo+3, 'D', nuevoIdCampeonato),
			(nuevoIdGrupo+4, 'E', nuevoIdCampeonato),
			(nuevoIdGrupo+5, 'F', nuevoIdCampeonato),
			(nuevoIdGrupo+6, 'G', nuevoIdCampeonato),
			(nuevoIdGrupo+7, 'H', nuevoIdCampeonato);
	ELSE
		SELECT id INTO nuevoIdGrupo 
			FROM grupo
			WHERE idcampeonato=nuevoIdCampeonato AND grupo='A';
	END IF;

	--***** Encuentros Grupo C ******
	
	--validar si ya existe el pais 'Argentina'
	SELECT id INTO idPais1Grupo FROM pais WHERE pais='Argentina';
	IF idPais1Grupo IS NULL THEN
		INSERT INTO pais
		(id, pais, entidad)
		VALUES(nuevoIdPais, 'Argentina', '');
		idPais1Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

	--validar si ya existe el pais 'Arabia Saudita'
	SELECT id INTO idPais2Grupo FROM pais WHERE pais='Arabia Saudita';
	IF idPais2Grupo IS NULL THEN
		INSERT INTO pais
		(id, pais, entidad)
		VALUES(nuevoIdPais, 'Arabia Saudita', '');
		idPais2Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

	--validar si ya existe el pais 'México'
	SELECT id INTO idPais3Grupo FROM pais WHERE pais='México';
	IF idPais3Grupo IS NULL THEN
		INSERT INTO pais
		(id, pais, entidad)
		VALUES(nuevoIdPais, 'México', '');
		idPais3Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

	--validar si ya existe el pais 'Polonia'
	SELECT id INTO idPais4Grupo FROM pais WHERE pais='Polonia';
	IF idPais4Grupo IS NULL THEN
		INSERT INTO pais
		(id, pais, entidad)
		VALUES(nuevoIdPais, 'Polonia', '');
		idPais4Grupo := nuevoIdPais;
		nuevoIdPais := nuevoIdPais + 1;
	END IF;

		--validar si ya estan los paises en el grupo
	SELECT COUNT(*) INTO totalPaisesGrupo
		FROM grupopais
		WHERE idgrupo=nuevoIdGrupo+2;

	IF totalPaisesGrupo=0 THEN
		INSERT INTO grupopais
			(idgrupo, idpais)
			VALUES
			(nuevoIdGrupo+2, idPais1Grupo),
			(nuevoIdGrupo+2, idPais2Grupo),
			(nuevoIdGrupo+2, idPais3Grupo),
			(nuevoIdGrupo+2, idPais4Grupo);
	END IF;

	--***** Encuentros del Grupo C ******
	
	--Argentina 1:2 Arabia Saudita
	IF NOT EXISTS(SELECT * FROM encuentro 
				WHERE idpais1=idPais1Grupo AND idpais2=idPais2Grupo
				AND idcampeonato=nuevoIdCampeonato AND idfase=1) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES(nuevoIdEncuentro, idPais1Grupo, 1, idPais2Grupo, 2, '2022-11-22', idEstadio2, 1, nuevoIdCampeonato);
		nuevoIdEncuentro := nuevoIdEncuentro + 1;
	END IF;

	--México 0:0 Polonia
	IF NOT EXISTS(SELECT * FROM encuentro 
				WHERE idpais1=idPais3Grupo AND idpais2=idPais4Grupo
				AND idcampeonato=nuevoIdCampeonato AND idfase=1) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES(nuevoIdEncuentro, idPais3Grupo, 0, idPais4Grupo, 0, '2022-11-22', idEstadio3, 1, nuevoIdCampeonato);
		nuevoIdEncuentro := nuevoIdEncuentro + 1;
	END IF;
	
	--Polonia 2:0 Arabia Saudita
	IF NOT EXISTS(SELECT * FROM encuentro 
				WHERE idpais1=idPais4Grupo AND idpais2=idPais2Grupo
				AND idcampeonato=nuevoIdCampeonato AND idfase=1) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES(nuevoIdEncuentro, idPais4Grupo, 2, idPais2Grupo, 0, '2022-11-25', idEstadio5, 1, nuevoIdCampeonato);
		nuevoIdEncuentro := nuevoIdEncuentro + 1;
	END IF;	

	--Argentina 2:0 México
	IF NOT EXISTS(SELECT * FROM encuentro 
				WHERE idpais1=idPais1Grupo AND idpais2=idPais3Grupo
				AND idcampeonato=nuevoIdCampeonato AND idfase=1) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES(nuevoIdEncuentro, idPais1Grupo, 2, idPais3Grupo, 0, '2022-11-25', idEstadio2, 1, nuevoIdCampeonato);
		nuevoIdEncuentro := nuevoIdEncuentro + 1;
	END IF;	
	
	--Polonia 0:2 Argentina. Estadio 974
	IF NOT EXISTS(SELECT * FROM encuentro 
				WHERE idpais1=idPais4Grupo AND idpais2=idPais1Grupo
				AND idcampeonato=nuevoIdCampeonato AND idfase=1) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES(nuevoIdEncuentro, idPais4Grupo, 0, idPais1Grupo, 2, '2022-11-30', idEstadio3, 1, nuevoIdCampeonato);
		nuevoIdEncuentro := nuevoIdEncuentro + 1;
	END IF;	
	
	--Arabia Saudita 1:2 México
	IF NOT EXISTS(SELECT * FROM encuentro 
				WHERE idpais1=idPais2Grupo AND idpais2=idPais3Grupo
				AND idcampeonato=nuevoIdCampeonato AND idfase=1) THEN
		INSERT INTO encuentro
			(id, idpais1, goles1, idpais2, goles2, fecha, idestadio, idfase, idcampeonato)
			VALUES(nuevoIdEncuentro, idPais2Grupo, 1, idPais3Grupo, 2, '2022-11-30', idEstadio2, 1, nuevoIdCampeonato);
		nuevoIdEncuentro := nuevoIdEncuentro + 1;
	END IF;	

-- Ciudades y estadios
-- 1: Jor       - 1: Estadio Al Bayt
-- 2: Lusail    - 2: Estadio de Lusail
-- 3: Doha      - 3: Estadio 974, 
--                4: Estadio Al Thumama 
-- 4: Rayán     - 5: Estadio Ciudad de la Educación,
--                6: Estadio Áhmad bin Ali,
--                7: Estadio Internacional Khalifa
-- 5: Al Wakrah - 8: Estadio Al Janoub
END $$
