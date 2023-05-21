UPDATE node_master SET count_strt_node_id = NULL ,count_end_node_id = NULL  ; 

update node_master SET count_end_node_id = i.C
FROM (SELECT B.end_node_id AS end_node, COUNT(B.end_node_id) AS C FROM link_master B GROUP BY B.end_node_id) i
WHERE node_master.id = cast(i.end_node AS INT)  ; 

update node_master SET count_strt_node_id = i.C
FROM (SELECT B.strt_node_id AS strt_node, COUNT(B.strt_node_id) AS C FROM link_master B GROUP BY B.strt_node_id) i
WHERE node_master.id = cast(i.strt_node AS INT)  ; 

SELECT COUNT(*) FROM node_master WHERE count_strt_node_id IS NULL AND count_end_node_id IS null;

SELECT id ,geom ,grid_id FROM node_master WHERE count_strt_node_id IS NULL AND count_end_node_id IS NULL;

