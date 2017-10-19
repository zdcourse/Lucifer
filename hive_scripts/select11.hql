use sogou;

insert overwrite local directory '/output/select11' row format delimited fields terminated by '\t'
select count(a.uid) from (select uid, count(*) as cnt from sogou.sogou_ext_20111230 group by uid having cnt > 2) a;