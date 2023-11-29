
--
-- Get failure frequencies
--
select reasonforfailure as 'Message', count(reasonforfailure) as 'Frequency'
from swarm.assignment with(nolock)
where (jobID >= 349272 and jobid <= 349325)
and state = 4
group by reasonforfailure
order by count(reasonforfailure) desc

--
-- Get failure occurrences
--
select startTime - '04:00:00' as 'Start time (EST)', reasonforfailure as 'Message', pmid as 'PMID', JobFragmentID
from swarm.assignment with(nolock)
where (jobID >= 347992)--and jobid <= 251014)
and state = 4
order by startTime desc

--
-- Get the number of failed fragments
--
select count(*)
from swarm.jobfragment with(nolock)
where (jobID >= 347880)-- and jobid <= 251014)
and state = 6

--
-- Get performance of a range of completed jobs
--
select j.id as 'Job ID', j.starttime - '04:00:00' as 'Start time (EST)', 
j.completedtime - '04:00:00' as 'End time (EST)',
convert(decimal(9,2), datediff(SECOND, j.starttime, j.completedtime)/60.0) as 'Duration (m)',
sum(jf.v19)/NULLIF(sum(jf.v1),0) as 'Avg. bulk code time (ms)',
sum(jf.v14)/NULLIF(sum(jf.v1),0) as 'Avg. imstore upload time (ms)',
(sum(jf.v13)/NULLIF(sum(jf.v1),0))/1024 as 'Avg. imstore upload size (KB)',
convert(decimal(5,3), (sum(jf.v13)/NULLIF(sum(jf.v14),0))*1000/(1024*1024.0)) as 'Avg. imstore upload rate (MB/s)',
sum(jf.v1) as '# items',
sum(jf.v2) as '# top level items',
sum(jf.v7) as '# duplicates',
convert(decimal(5,2), 100.0*sum(1.0*jf.v7)/NULLIF(sum(1.0*jf.v2),0)) as '% duplicates',
convert(decimal(8,3), sum(jf.v5)/(1024*1024*1024.0)) as 'Contribution size (GB)',
convert(decimal(8,2), sum(jf.v5)*(240.0/(1024*1024*1024.0))) as '$ Revenue (approx.)',
convert(decimal(8,2), (sum(jf.v5)*(240.0/(1024*1024*1024.0)))/(datediff(SECOND, j.starttime, j.completedtime)/3600.0)) as '$/hour'
from swarm.jobfragment jf with(nolock), swarm.job j with(nolock)
where (jf.jobID >= 250974 and jf.jobid <= 251014)
and jf.jobid=j.id
and j.CompletedTime is not null 
and jf.v14 < 4294900000
and jf.v19 < 4294900000
group by j.id, j.starttime, j.completedtime

--
-- Get performance over time for a range of jobs
-- Note: For # items, all are counted as at the start time of the fragment (inaccurate for long-lived fragments)
-- Revenue is computed as follows: $100 for pre-processing, $700 for full processing, 20% is fully processed ==> $240/GB
--
select DatePart(dd, jf.StartTime - '04:00:00') as 'Month day',
DatePart(hh, jf.StartTime - '04:00:00') as 'Hour (EST)',
sum(jf.v1) as '# Items (approx)',
sum(jf.v19)/sum(jf.v1) as 'Avg. bulk code time (ms)',
sum(jf.v14)/sum(jf.v1) as 'Avg. imstore upload time (ms)',
(sum(jf.v13)/sum(jf.v1))/1024 as 'Avg. imstore upload size (KB)',
convert(decimal(5,3), (sum(jf.v13)/nullif(sum(jf.v14),0))*1000/(1024*1024.0)) as 'Avg. imstore upload rate (MB/s)',
sum(jf.v2) as '# top level items',
sum(jf.v7) as '# duplicates',
convert(decimal(5,2), 100.0*sum(1.0*jf.v7)/nullif(sum(1.0*jf.v2),0)) as '% duplicates',
convert(decimal(8,3), sum(jf.v5)/(1024*1024*1024.0)) as 'Contribution size (GB)',
convert(decimal(8,2), sum(jf.v5)*(240.0/(1024*1024*1024.0))) as '$ Revenue (approx.)'
from swarm.jobfragment jf with(nolock)
where (jf.jobID >= 349272 and jf.jobid <= 349325)
and jf.StartTime is not null and jf.CompletedTime is not null
and jf.v1 != 0
and jf.v14 < 4294900000
and jf.v19 < 4294900000
group by DatePart(dd, jf.StartTime - '04:00:00'), DatePart(hh, jf.StartTime - '04:00:00')
order by DatePart(dd, jf.StartTime - '04:00:00') asc, DatePart(hh, jf.StartTime - '04:00:00') asc

-- same as above by database

select 
db.name,
DatePart(dd, jf.StartTime - '04:00:00') as 'Month day',
DatePart(hh, jf.StartTime - '04:00:00') as 'Hour (EST)',
sum(jf.v1) as '# Items (approx)',
sum(jf.v19)/sum(jf.v1) as 'Avg. bulk code time (ms)',
sum(jf.v14)/sum(jf.v1) as 'Avg. imstore upload time (ms)',
(sum(jf.v13)/sum(jf.v1))/1024 as 'Avg. imstore upload size (KB)',
convert(decimal(5,3), (sum(jf.v13)/nullif(sum(jf.v14),0))*1000/(1024*1024.0)) as 'Avg. imstore upload rate (MB/s)',
sum(jf.v2) as '# top level items',
sum(jf.v7) as '# duplicates',
convert(decimal(5,2), 100.0*sum(1.0*jf.v7)/nullif(sum(1.0*jf.v2),0)) as '% duplicates',
convert(decimal(8,3), sum(jf.v5)/(1024*1024*1024.0)) as 'Contribution size (GB)',
convert(decimal(8,2), sum(jf.v5)*(240.0/(1024*1024*1024.0))) as '$ Revenue (approx.)'
from swarm.jobfragment jf with(nolock), swarm.job j with (nolock), [swarm].[Database] db with (nolock)
where (jf.jobID >= 347785 and jf.jobid <= 347892)
and jf.JobID = j.ID
and j.DatabaseID = db.id
--and db.Name like '%UATJune25_Case12%'
and jf.StartTime is not null and jf.CompletedTime is not null
and jf.v1 != 0
and jf.v14 < 4294900000
and jf.v19 < 4294900000
group by db.Name, DatePart(dd, jf.StartTime - '04:00:00'), DatePart(hh, jf.StartTime - '04:00:00')
order by db.Name, DatePart(dd, jf.StartTime - '04:00:00') asc, DatePart(hh, jf.StartTime - '04:00:00') asc

--
-- Find assignments that have a very large upload-to-imstore time
--
select a.id as 'Assignment ID',
a.pmid as 'PMID',
a.starttime - '04:00:00' as 'Start time (EST)',
a.completedtime - '04:00:00' as 'End time (EST)',
convert(decimal(9,2), datediff(SECOND, a.starttime, a.completedtime)/60.0) as 'Duration (m)',
jf.v14/1000 as 'Total imstore upload time (s)',
jf.v1 as '# items',
jf.v14/jf.v1 as 'Imstore upload time/item (ms)'
from swarm.jobfragment jf with(nolock),
swarm.assignment a with(nolock)
where jf.jobid>=346726
and jf.id = a.jobfragmentid
and jf.v14 > 500
and jf.v14 < 4294900000
and jf.v1 != 0
and (a.state=3 or a.state=4)
order by jf.v14 desc

--
-- Find assignments that have a very large bulk-code time
--
select a.id as 'Assignment ID',
a.pmid as 'PMID',
a.starttime - '04:00:00' as 'Start time (EST)',
a.completedtime - '04:00:00' as 'End time (EST)',
convert(decimal(9,2), datediff(SECOND, a.starttime, a.completedtime)/60.0) as 'Duration (m)',
jf.v19/1000 as 'Bulk-code time (s)',
jf.v1 as '# items',
jf.v19/jf.v1 as 'Avg. imstore upload time (ms)'
from swarm.jobfragment jf with(nolock),
swarm.assignment a with(nolock)
where jf.jobid>=346726
and jf.id = a.jobfragmentid
and jf.v19 > 500
and jf.v19 < 4294900000
and jf.v1 != 0
and (a.state=3 or a.state=4)
order by jf.v19 desc

--
-- Average assignment time for a range of jobs.
--
select jf.jobid as 'Job ID',
convert(decimal(5,2), avg(datediff(ms, a.startTime, a.completedtime)/jf.v1)/1000.0) as 'Avg. duration/item (s)'
from swarm.assignment a with(nolock), swarm.jobfragment jf with(nolock)
where jf.jobid=6269
and jf.id = a.jobfragmentid
and (a.state=3 or a.state=4)
and jf.v1!=0
group by jf.jobid
order by jf.jobid asc


--
-- # of assignments for a range of jobs
--
select jobid, count(*) from swarm.assignment with(nolock)
where jobid>=6244 and jobid<=6259
group by jobid

--
-- # of fragments w/ 1 item having more than 1 MB bytes.
--
select * from swarm.jobfragment with(nolock)
where jobid>=94774
and v1 = 1
and v5 > (1024*1024)
and v13 > 0
and state = 5
and numfragments < 10


--
-- Cluster/capabilities
--
exec swarm.getSIDsFromClusters '<Clusters><Cluster ID="32" /></Clusters>'

select MAX(id) from swarm.Job




----
---- Daily swarm worker utilization in an environment
----
select 
CONVERT(varchar(2),DatePart(mm, a.StartTime + '01:00:00')) + '-' + CONVERT(varchar(2), DatePart(dd, a.StartTime + '01:00:00')) as 'Date',
--based on 224 machines online
100.0 * sum(a.ExecutionTime/1000.0) / (224*24*60*60.0) as utilization
from swarm.assignment a with(nolock)
where
a.ExecutionTime > 0 and
--filter by last 3 months
a.StartTime >= '2014-05-21'
group by DatePart(mm, a.StartTime + '01:00:00'), DatePart(dd, a.StartTime + '01:00:00') 
order by DatePart(mm, a.StartTime + '01:00:00'), DatePart(dd, a.StartTime + '01:00:00') asc