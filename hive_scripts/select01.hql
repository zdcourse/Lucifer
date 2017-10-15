use sogou;
insert overwrite local directory '/output/select01' row format delimited fields terminated by '\t'
select * from sogou_ext_20111230 limit 10;

