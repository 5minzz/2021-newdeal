SELECT id , grid_id , node_code , sw_cd, sw_nm FROM tb_node WHERE node_code = '1' AND ((count_end_node_id IS NULL AND count_strt_node_id = 1) OR (count_strt_node_id IS NULL AND count_end_node_id =1)
) ;



SELECT * FROM "TB_LINK" WHERE c_de >= '2021-11-30' OR c_de<= '2021-08-01' ; 

UPDATE "TB_LINK" SET c_de = '2021-11-09' WHERE c_de >= '2021-11-30' OR c_de<= '2021-08-01' ; 
UPDATE tb_node SET c_de = '2021-11-09' WHERE c_de >= '2021-11-30' OR c_de<= '2021-08-01' ; 

SELECT COUNT(*) FROM "TB_LINK" WHERE sgg_cd IS NULL AND emd_cd IS NULL ;
SELECT * FROM "TB_LINK" WHERE strt_node_id IS NULL OR end_node_id IS NULL ;