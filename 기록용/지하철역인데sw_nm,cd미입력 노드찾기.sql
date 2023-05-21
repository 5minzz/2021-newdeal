select *
from (select *
   from tb_node tn 
   where geom in (select st_startpoint(tl.geom)
            from "TB_LINK" tl
            where tp_uw is true and (sw_cd is not null and sw_nm is not null))) as foo
where sw_cd is null or sw_nm is NULL ;

select *
from (select *
   from tb_node tn 
   where geom in (select st_endpoint(tl.geom)
            from "TB_LINK" tl
            where tp_uw is true and (sw_cd is not null and sw_nm is not null))) as foo
where sw_cd is null or sw_nm is NULL ;