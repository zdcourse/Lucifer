use sogou;

insert overwrite local directory '/output/select06' row format delimited fields terminated by '\t'
select count(distinct(uid) from sogou.sogou_ext_20111230;
