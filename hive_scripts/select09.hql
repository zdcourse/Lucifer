use sogou;

insert overwrite local directory '/output/select09' row format delimited fields terminated by '\t'
select sum(if(uids.cnt=1, 1, 0)),sum(if(uids.cnt=2,1,0)), sum(if(uids.cnt=3,1,0)), sum(if(uids.cnt>3,1,0))
from
(select uid, count(*) as cnt from sogou.sogou_ext_20111230 group by uid) uids;