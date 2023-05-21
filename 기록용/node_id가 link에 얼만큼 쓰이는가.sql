SELECT a.id,COUNT(b.id) FROM tt_node a, tt_link b 
WHERE (a.id = cast(b.strt_node_id AS INT) )
GROUP BY a.id ; 

SELECT a.id,COUNT(b.id) FROM tt_node a, tt_link b 
WHERE (a.id = cast(b.end_node_id AS INT) )
GROUP BY a.id ; 