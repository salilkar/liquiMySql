set @rowCount=0;

set @rowCount=coalesce((select jobClassificationId from jobClassificationLocale where jobClassification='events' ),0) ;
 
insert into jobClassification (
 jobClassificationId
,parentJobClassificationId
,defaultLanguageId
,isDemo )
select 30,null,264,0 from jobClassification 
where @rowCount=0 limit 1;


insert into jobClassificationLocale
select a.*from (
	select 30 jobClassificationId,'Events' as jobClassification,264 as languageId  union
	select 30,'Events',352 
)a left join jobClassificationLocale jcl on jcl.jobClassificationId=a.jobClassificationId and jcl.languageId=a.languageId
where jcl.jobClassificationId is null ;


insert into jobSubClassification
select a.jobSubClassificationId,264 from (
	select jobSubClassificationId + 252 as jobSubClassificationId from jobSubClassification 
	order by jobSubClassificationId 
	limit 5 
)a left join jobSubClassification jcl on a.jobSubClassificationId=jcl.jobSubClassificationId
where jcl.jobSubClassificationId is null;

insert into jobSubClassificationLocale
select a.* from (
	select  253 jobSubClassificationId,'Events Manager' as jobSubClassification,264 as languageId  union 
	select  254,'DJ',264  union 
	select  255,'Band',264  union 
	select  256,'Photo Booth',264  union 
	select  257,'AV',264  union 
	select  253,'Events Manager',352  union 
	select  254,'DJ',352  union 
	select  255,'Band',352  union 
	select  256,'Photo Booth',352  union 
	select  257,'AV',352  
)a left join jobSubClassificationLocale jscl on a.jobSubClassificationId=jscl.jobSubClassificationId and a.languageId=jscl.languageId
where jscl.jobSubClassificationId is null ;

insert into jobClassificationSubClassification
select a.* from (
	select 30 as jobClassificationId,253  as jobSubClassificationId union  
	select 30,254  union  
	select 30,255  union  
	select 30,256  union  
	select 30,257   
)a left join jobClassificationSubClassification jcs on a.jobClassificationId=jcs.jobClassificationId and a.jobSubClassificationId=jcs.jobSubClassificationId
where jcs.jobSubClassificationId is null ;

insert into employmentProfile
select jsc.* from jobSubClassification jsc
left join  employmentProfile ep  on ep.employmentProfileId=jsc.jobSubClassificationId 
where ep.employmentProfileId is null ;

insert into employmentProfileLocale
select jsc.* from jobSubClassificationLocale jsc
left join  employmentProfileLocale ep  on ep.employmentProfileId=jsc.jobSubClassificationId and ep.languageId=jsc.languageId
where ep.employmentProfileId is null ;





