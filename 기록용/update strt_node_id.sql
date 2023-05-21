UPDATE link_master SET strt_node_id = NULL ,end_node_id = null; 

update link_master A
set strt_node_id = B.id
FROM node_master B
where st_startpoint(A.geom) = B.geom ;

update link_master A
set end_node_id = B.id
FROM node_master B
where st_endpoint(A.geom) = B.geom ;

SELECT b.id , b.grid_id , b.strt_node_id, b.end_node_id FROM  link_master b WHERE b.strt_node_id IS NULL OR b.end_node_id IS NULL ORDER BY id ASC ;

SELECT COUNT(*) FROM  link_master  WHERE strt_node_id IS NULL OR end_node_id IS NULL  ;

UPDATE "TB_LINK" SET strt_node_id = NULL ,end_node_id = null; 

UPDATE "TB_LINK" A
set strt_node_id = B.id
FROM tb_node B
where st_startpoint(A.geom) = B.geom ;

UPDATE "TB_LINK" A
set end_node_id = B.id
FROM tb_node B
where st_endpoint(A.geom) = B.geom ;


SELECT b.id , b.grid_id , b.strt_node_id, b.end_node_id,b.sw_cd, b.sw_nm FROM  "TB_LINK" b WHERE sw_nm IS NOT NULL AND (b.strt_node_id IS NULL OR b.end_node_id IS NULL) ORDER BY id ASC ;

/*
UPDATE tb_node a  SET grid_id = b.grid_id FROM "TB_LINK" b WHERE a.id = cast(b.strt_node_id AS int) ;
*/
