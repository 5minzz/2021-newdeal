/* 다익스트라 알고리즘 길찾기 */
SELECT *
        FROM pgr_dijkstra(
                'SELECT id_0 as id, cast(strt_node_id as int) as source, cast(end_node_id as int) as target , len as cost FROM link_test_a5458zz',
                1808683, 1808716, false) ;
                
                
 /* 좌표값을 받게 되었을 때, 그 점과 가장 가까운 노드 3개 구하기 
 설명: limit 3을 안주면 받은 좌표값과 t__node테이블의 모든 노드와의 거리를 출력하게 되는데,
 limit으로 제한을 두고 가까운 거리순으로 정렬을 해줌으로써 가장 가까운 노드 3개를 출력하게 됨.
 */             
select ST_AsEWKT(geom)
FROM tt_node
WHERE id = 1111111;                
                
SELECT a.id, 
  ST_Transform(a.geom, 5181),
  a.geom <-> 'SRID=5181;POINT(203340.72082093792 452840.5992470559)'::geometry AS dist
FROM
  tt_node a 
ORDER BY
  dist
LIMIT 3;


/* 좌표값 받고 가장 가까운 링크 찾기 */

SELECT a.id, a.strt_node_id, a.end_node_id,
  ST_Transform(a.geom, 5181),
  a.geom <-> a.geom AS dist
FROM
 link_test_a5458zz a 
ORDER BY
  dist
LIMIT 1;


select * from tb_node
where id in
(
SELECT node
        FROM pgr_dijkstra(
                'SELECT id as id, cast(strt_node_id as int) as source, cast(end_node_id as int) as target , 
            len as cost FROM "TB_LINK" where cast(grid_id as int) = 1324 or cast(grid_id as int) = 1249' ,
                1775352, 1836514, false)
) ;

select st_asewkt(st_makeline(geom)) from tb_node
where id in
(
SELECT node
        FROM pgr_dijkstra(
                'SELECT id as id, cast(strt_node_id as int) as source, cast(end_node_id as int) as target , 
            len as cost FROM "TB_LINK" where cast(grid_id as int) = 1324 or cast(grid_id as int) = 1249' ,
                1775352, 1836514, false)
);

SRID=5181;LINESTRING(186035.28200080185 446966.28609146614,185973.9410007393 447089.412591592,
186049.50600081636 447128.4650916316,186014.4540007806 447109.66909161245,
185998.4520007643 447235.7800917411)
                
               
SELECT * FROM link_test_a5458zz WHERE id_0 IS null OR id IS null;

DELETE FROM link_test_a5458zz where strt_node_id = '' OR end_node_id = '' OR len IS NULL OR id IS null ;