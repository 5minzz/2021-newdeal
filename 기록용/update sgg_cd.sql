
UPDATE link_master  SET sgg_cd = b.sgg_cd_2 ,emd_cd = b.emd_cd_2 
FROM tb_link_f b
WHERE link_master.geom = b.geom ;

SELECT * FROM link_master WHERE (sgg_cd IS NULL OR emd_cd IS NULL) or (strt_node_id IS NULL OR end_node_id IS NULL) or (geom IS null) ;
SELECT * FROM node_master WHERE (sgg_cd IS NULL OR emd_cd IS NULL) ;

UPDATE node_master  SET sgg_cd = b.col_adm_se ,emd_cd = b.EMD_CD_2
FROM tb_node_f b
WHERE node_master.geom = b.geom ; 

SELECT COUNT(*) FROM "TB_LINK" a , tb_link_f b WHERE a.geom = b.geom ;

SELECT id , grid_id , sgg_cd , emd_cd FROM "TB_LINK" WHERE sgg_cd IS NULL OR emd_cd IS null;

SELECT  id , grid_id , sgg_cd , emd_cd FROM tb_node WHERE sgg_cd IS NULL OR emd_cd IS NULL;

UPDATE tb_node SET sgg_cd = a.sgg_cd FROM "TB_LINK" a WHERE tb_node.geom = st_startpoint(a.geom) AND tb_node.sgg_cd IS NULL;

UPDATE tb_node SET emd_cd = a.emd_cd FROM "TB_LINK" a WHERE tb_node.geom = st_startpoint(a.geom) AND tb_node.emd_cd IS NULL;

UPDATE tb_node SET sgg_cd = a.sgg_cd FROM "TB_LINK" a WHERE tb_node.geom = st_endpoint(a.geom) AND tb_node.sgg_cd IS NULL;

UPDATE tb_node SET emd_cd = a.emd_cd FROM "TB_LINK" a WHERE tb_node.geom = st_endpoint(a.geom) AND tb_node.emd_cd IS NULL;

SELECT COUNT(*) FROM tb_node WHERE sgg_cd IS NULL OR emd_cd IS NULL ; 

UPDATE node_master SET emd_cd = CAST(emd_cd AS INT)*100  WHERE   emd_cd IS NOT null;



SELECT id ,sgg_cd emd_cd FROM node_master WHERE CAST(emd_cd AS INT) >= 1000000000 ;
SELECT id ,sgg_cd emd_cd FROM node_master ;

SELECT COUNT(*) FROM node_master WHERE CAST(emd_cd AS INT) >= 1000000000 ;
SELECT COUNT(*) FROM node_master  ;