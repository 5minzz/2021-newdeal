/*UPDATE "TB_LINK" AS a  SET tp_uw = TRUE FROM "TB_LINK_sw" b WHERE b.tp_uw IS NULL AND */

SELECT id , len FROM "TB_LINK" WHERE len IS NULL ;
UPDATE link_master SET len = NULL;
UPDATE link_master SET len = to_char(st_length(geom), 'FM999999999.000')::FLOAT8;

SELECT * FROM link_master WHERE len IS NULL ;

SELECT id, geom, grid_id, node_code, sw_cd, sw_nm 
FROM tb_node 
WHERE node_code = '1' AND ((count_end_node_id IS NULL AND count_strt_node_id = 1) OR (count_strt_node_id IS NULL AND count_end_node_id =1))
