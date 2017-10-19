use sogou;

insert overwrite local directory '/output/select07' row format delimited fields terminated by '\t'
select avg(a.cnt)
from (select size(split(keyword, '\\s+')) as cnt
from sogou.sogou_ext_20111230) a;