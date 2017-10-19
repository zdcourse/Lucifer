use sogou;

insert overwrite local directory '/output/select08' row format delimited fields terminated by '\t'
select keyword, count(*) as cnt
from sogou.sogou_ext_20111230
group by keyword order by cnt desc limit 50;