DROP DATABASE IF EXISTS sogou CASCADE;
create database sogou;

use sogou;
show tables;

create external table sogou.sogou_ext_20111230(ts string,uid string,keyword string,rank int,sorder int,url string,year int,month int,day int,hour int)row format delimited fields terminated by '\t' stored as textfile location '/sogou_ext/20111230';


create external table sogou.sogou_partition(ts string,uid string,keyword string,rank int,sorder int,url string)partitioned by (year int,month int,day int,hour int) row format delimited fields terminated by '\t' stored as textfile;


set hive.exec.dynamic.partition.mode=nonstrict;
insert overwrite table sogou.sogou_partition partition(year,month,day,hour) select * from sogou.sogou_ext_20111230;



