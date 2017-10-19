use sogou;

insert overwrite local directory '/output/select16' row format delimited fields terminated by '\t'
select sum(if(instr(url, keyword)>0,1,0)) from (select * from sogou.sogou_ext_20111230 where keyword like '%www%') a;
