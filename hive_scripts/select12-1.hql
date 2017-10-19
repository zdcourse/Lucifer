use sogou;

insert overwrite local directory '/output/select12-1' row format delimited fields terminated by '\t'
select count(distinct (uid)) from sogou.sogou_ext_20111230;