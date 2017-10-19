use sogou;

insert overwrite local directory '/output/select05' row format delimited fields terminated by '\t'
select count(*) from (select ts, uid, keyword, url
from sogou.sogou_ext_20111230
group by ts, uid, keyword, url having count(*)=1) a;