use sogou;

insert overwrite local directory '/output/select15' row format delimited fields terminated by '\t'
select count(*) from sogou.sogou_ext_20111230 where keyword like '%www%';
