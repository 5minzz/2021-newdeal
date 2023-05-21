/*SELECT id , grid_id , node_code , sw_cd, sw_nm FROM tb_node WHERE node_code = '1' AND ((count_end_node_id IS NULL AND count_strt_node_id = 1) OR (count_strt_node_id IS NULL AND count_end_node_id =1)
) ; */

SELECT id , grid_id , strt_node_id , end_node_id , sw_nm , sw_cd, c_wkr FROM "TB_LINK" WHERE (strt_node_id is NULL OR end_node_id IS NULL) AND sw_nm IS NULL ;

