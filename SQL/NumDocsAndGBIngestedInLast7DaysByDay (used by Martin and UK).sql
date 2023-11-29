IF OBJECT_ID('tempdb..#MyNumDocs') IS NOT NULL DROP TABLE #MyNumDocs

select s.* into #MyNumDocs from
(
select
CONVERT(varchar(2),DatePart(mm, jf.StartTime + '01:00:00')) + '-' + CONVERT(varchar(2), DatePart(dd, jf.StartTime + '01:00:00')) as 'Date',
sum(jf.v1) as 'NumDocs'
--convert(decimal(8,3), sum(jf.v5)/(1024*1024*1024.0)) as 'Contribution size (GB)'
from swarm.jobfragment jf
join swarm.job j on j.id = jf.jobid
join swarm.service s on s.id = j.serviceid
where
--eDMX service only
s.id in (select id from swarm.service where name like '%edatamatrix%')
and
--filter by fragments that ran in the last 7 days (not including today)
(datediff(dd, j.StartTime + '01:00:00', getUTCDate()) <= 7 and datediff(dd, j.StartTime + '01:00:00', getUTCDate()) > 0)
and
--filter by fragments that ran in the last 7 days (not including today)
(datediff(dd, jf.StartTime + '01:00:00', getUTCDate()) <= 7 and datediff(dd, jf.StartTime + '01:00:00', getUTCDate()) > 0)
group by DatePart(mm, jf.StartTime + '01:00:00'), DatePart(dd, jf.StartTime + '01:00:00'), s.name
) s;

DECLARE @columns VARCHAR(512);

SELECT @columns = COALESCE(@columns + ',[' + cast(Date as varchar) + ']',
'[' + cast(Date as varchar)+ ']')
FROM #MyNumDocs 
GROUP BY Date
order by Date;


DECLARE @nonNullColumns VARCHAR(512);

SELECT @nonNullColumns = COALESCE(@nonNullColumns + ', isnull([' + cast(Date as varchar) + '],0) as "' + cast(Date as varchar) + '"',
'isnull([' + cast(Date as varchar)+ '],0) as "' + cast(Date as varchar) + '" ' )
FROM #MyNumDocs
GROUP BY Date
order by Date;

DECLARE @query VARCHAR(8000);

SET @query = '
SELECT' + CHAR(39) + 'NumDocs' + CHAR(39) + ' as Metric, s.* from (SELECT ' 
+ @nonNullColumns +
'FROM #MyNumDocs
PIVOT
(
sum(NumDocs)
FOR Date
IN (' + @columns + ')
)
AS p ) s';

----------------------

IF OBJECT_ID('tempdb..#MyGBProcessed') IS NOT NULL DROP TABLE #MyGBProcessed

select s.* into #MyGBProcessed from
(
select
CONVERT(varchar(2),DatePart(mm, jf.StartTime + '01:00:00')) + '-' + CONVERT(varchar(2), DatePart(dd, jf.StartTime + '01:00:00')) as 'Date',
--sum(jf.v1) as 'NumItems'
convert(decimal(8,3), sum(jf.v5)/(1024*1024*1024.0)) as 'GBProcessed'
from swarm.jobfragment jf
join swarm.job j on j.id = jf.jobid
join swarm.service s on s.id = j.serviceid
where
--eDMX service only
s.id in (select id from swarm.service where name like '%edatamatrix%')
and
--filter by fragments that ran in the last 7 days (not including today)
(datediff(dd, j.StartTime + '01:00:00', getUTCDate()) <= 7 and datediff(dd, j.StartTime + '01:00:00', getUTCDate()) > 0)
and
--filter by fragments that ran in the last 7 days (not including today)
(datediff(dd, jf.StartTime + '01:00:00', getUTCDate()) <= 7 and datediff(dd, jf.StartTime + '01:00:00', getUTCDate()) > 0)
group by DatePart(mm, jf.StartTime + '01:00:00'), DatePart(dd, jf.StartTime + '01:00:00'), s.name
) s;

DECLARE @columnsB VARCHAR(512);

SELECT @columnsB = COALESCE(@columnsB + ',[' + cast(Date as varchar) + ']',
'[' + cast(Date as varchar)+ ']')
FROM #MyGBProcessed 
GROUP BY Date
order by Date;


DECLARE @nonNullColumnsB VARCHAR(512);

SELECT @nonNullColumnsB = COALESCE(@nonNullColumnsB + ', isnull([' + cast(Date as varchar) + '],0) as "' + cast(Date as varchar) + '"',
'isnull([' + cast(Date as varchar)+ '],0) as "' + cast(Date as varchar) + '" ' )
FROM #MyGBProcessed
GROUP BY Date
order by Date;

DECLARE @queryB VARCHAR(8000);

SET @queryB = '
SELECT' + CHAR(39) + 'GBProcessed' + CHAR(39) + ' as Metric, s.* from (SELECT ' 
+ @nonNullColumnsB +
'FROM #MyGBProcessed
PIVOT
(
sum(GBProcessed)
FOR Date
IN (' + @columnsB + ')
)
AS p ) s';

DECLARE @finalQuery VARCHAR(8000);
SET @finalQuery = @query + ' UNION ' + @queryB;

--select @finalQuery
EXECUTE(@finalQuery);


DROP TABLE #MyNumDocs
DROP TABLE #MyGBProcessed






