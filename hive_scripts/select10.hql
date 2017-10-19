use sogou;

insert overwrite local directory '/output/select10' row format delimited fields terminated by '\t'
select sum(a.cnt)/count(a.uid) from (select uid, count(*) as cnt from sogou.sogou_ext_20111230 group by uid) a;
