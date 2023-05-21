BEGIN ;
SAVEPOINT a5458zz ;
UPDATE node_master SET sgg_cd = a.sgg_cd FROM link_master a WHERE node_master.geom = st_startpoint(a.geom) AND node_master.sgg_cd IS NULL;

UPDATE node_master SET emd_cd = a.emd_cd FROM link_master a WHERE node_master.geom = st_startpoint(a.geom) AND node_master.emd_cd IS NULL;

UPDATE node_master SET sgg_cd = a.sgg_cd FROM link_master a WHERE node_master.geom = st_endpoint(a.geom) AND node_master.sgg_cd IS NULL;

UPDATE node_master SET emd_cd = a.emd_cd FROM link_master a WHERE node_master.geom = st_endpoint(a.geom) AND node_master.emd_cd IS NULL;

ROLLBACK TO a5458zz ; 
COMMIT ;
END ; 
SELECT COUNT(*) FROM node_master WHERE sgg_cd IS NULL OR emd_cd IS NULL ; 
SELECT * FROM node_master WHERE sgg_cd IS NULL OR emd_cd IS NULL ; 