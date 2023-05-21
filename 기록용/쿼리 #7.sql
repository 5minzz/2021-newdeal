/*CREATE VIEW a AS SELECT * FROM "TB_LINK" WHERE st_numpoints(geom) > 2 ;

SELECT id , st_astext(geom), st_numpoints(geom) FROM a GROUP BY id,geom ;

UPDATE a SET geom = ST_RemovePoint(geom, ST_NPoints(geom) - 1) ;

ROLLBACK ;*/ 봉인



SELECT id , st_astext(geom), st_numpoints(geom) FROM a GROUP BY id,geom ;

SELECT * FROM a ;



SELECT * FROM "TB_LINK"

