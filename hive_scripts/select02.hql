use sogou;

insert overwrite local directory '/output/select02' row format delimited fields terminated by '\t'
select url from sogou_ext_20111230 limit 10;

