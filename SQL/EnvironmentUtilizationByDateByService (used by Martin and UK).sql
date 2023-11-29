IF OBJECT_ID('tempdb..#MyServiceUtilization') IS NOT NULL DROP TABLE #MyServiceUtilization

select s.* into #MyServiceUtilization from
(
select
s.name as 'Service',
CONVERT(varchar(2),DatePart(mm, jf.StartTime + '01:00:00')) + '-' + CONVERT(varchar(2), DatePart(dd, jf.StartTime + '01:00:00')) as 'Date',
convert(decimal(4,2), 100 * sum(datediff(ss, jf.StartTime, jf.CompletedTime)) / ((select count(1) from swarm.pm where online = 1)*24*60*60.0)) as 'utilization'
from swarm.jobfragment jf
join swarm.job j on j.id = jf.jobid
join swarm.service s on s.id = j.serviceid
where
--filter by fragments that ran in the last 7 days (not including today)
(datediff(dd, j.StartTime + '01:00:00', getUTCDate()) <= 7 and datediff(dd, j.StartTime + '01:00:00', getUTCDate()) > 0)
and
--filter by fragments that ran in the last 7 days (not including today)
(datediff(dd, jf.StartTime + '01:00:00', getUTCDate()) <= 7 and datediff(dd, jf.StartTime + '01:00:00', getUTCDate()) > 0)
group by DatePart(mm, jf.StartTime + '01:00:00'), DatePart(dd, jf.StartTime + '01:00:00'), s.name
--order by DatePart(mm, jf.StartTime + '01:00:00'), DatePart(dd, jf.StartTime + '01:00:00') asc, s.name
) s;

DECLARE @columns VARCHAR(512);

SELECT @columns = COALESCE(@columns + ',[' + cast(Date as varchar) + ']',
'[' + cast(Date as varchar)+ ']')
FROM #MyServiceUtilization 
GROUP BY Date
order by Date;


DECLARE @nonNullColumns VARCHAR(512);

SELECT @nonNullColumns = COALESCE(@nonNullColumns + ', isnull([' + cast(Date as varchar) + '],0) as "' + cast(Date as varchar) + '"',
'isnull([' + cast(Date as varchar)+ '],0) as "' + cast(Date as varchar) + '"' )
FROM #MyServiceUtilization
GROUP BY Date
order by Date;

DECLARE @query VARCHAR(8000);

SET @query = '
SELECT service,' 
+ @nonNullColumns +
'FROM #MyServiceUtilization
PIVOT
(
avg(utilization)
FOR Date
IN (' + @columns + ')
)
AS p';

--select @query
EXECUTE(@query);

DROP TABLE #MyServiceUtilization
