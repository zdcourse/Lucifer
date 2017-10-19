use sogou;

insert overwrite local directory '/output/select17' row format delimited fields terminated by '\t'
select uid,count(*) as cnt from sogou.sogou_ext_20111230  where keyword='仙剑奇侠传' group by uid having cnt > 3;
