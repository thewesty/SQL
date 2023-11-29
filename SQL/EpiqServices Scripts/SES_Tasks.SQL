-- The script returns all tasks that are not assigned to ED_SES, plus one task for each SR that only has all tasks assigned to ED_SES.
use ServiceRequest
select 
	sr.serviceRequestNumber as 'SR#',
	sr.priority as 'Priority',
	sr.name as 'Name',
	srs_sr.status as 'SR Status',
	srss_sr.subStatus as 'SR Sub Status',
	srcp.varcharValue as 'Application',
	DATEADD(HH,-5,sr.DueDate)as 'Due Date',
	dateadd(hh,-5,sr.InsertedOn) as 'Date Created',
	u.DisplayName as 'Task Owner',
	srt.name as 'Task Name',
	srs_srt.status as 'Task Status',
	srss_srt.subStatus as 'Task Sub Status',
	sr.percentComplete as 'SR % Complete',
	srt.name as 'Template'
from 
	dbo.serviceRequest sr
	inner join dbo.serviceRequestTask srt on srt.serviceRequestID = sr.ServiceRequestID
	inner join dbo.serviceRequestStatus srs_sr on srs_sr.serviceRequestStatusID = sr.serviceRequestStatusID
	inner join dbo.serviceRequestSubStatus srss_sr on srss_sr.serviceRequestSubStatusID = sr.serviceRequestSubStatusID
	inner join dbo.serviceRequestStatus srs_srt on srs_srt.serviceRequestStatusID = srt.serviceRequestStatusID
	inner join dbo.serviceRequestSubStatus srss_srt on srss_srt.serviceRequestSubStatusID = srt.serviceRequestSubStatusID
	inner join dbo.[user] u on u.userID = srt.ownerUserID
	inner join dbo.project p on p.projectID = sr.projectID
	inner join dbo.businessArea ba on ba.businessAreaID = p.businessAreaID
	left join dbo.ServiceRequestCustomProperty srcp on srcp.ServiceRequestID = sr.ServiceRequestID AND srcp.PromptText = 'Application'
where
	srt.serviceRequestTaskID in
	-- Report all tasks for SRs that only have ED_SES owner (i.e. no tasks were properly assigned yet)
	(
		-- Here is a list of all tasks that are not owned by ED_SES
		select distinct srt.serviceRequestTaskID
		from 
			dbo.serviceRequestTask srt
			inner join dbo.serviceRequest sr on srt.serviceRequestID = sr.ServiceRequestID
			inner join dbo.project p on p.projectID = sr.projectID
			inner join dbo.businessArea ba on ba.businessAreaID = p.businessAreaID
			inner join dbo.serviceRequestStatus srs on srs.serviceRequestStatusID = sr.serviceRequestStatusID 
		where
			ba.BusinessAreaID = 15
			and srs.Status <> 'closed'
			and sr.OwnerUserID in (select  userID from [user] where displayName = 'ED_SES')
			and srt.ownerUserID not in (select  userID from [user] where displayName = 'ED_SES')

		UNION
		
		-- Here is a list of all tasks that belong to SRs that only have tasks with ED_SES owner (ie no assigned tasks)
		select subQuery.serviceRequestTaskID from
		(
			select distinct srt.serviceRequestTaskID as serviceRequestTaskID, sr.serviceRequestID, ROW_NUMBER() OVER(PARTITION BY sr.serviceRequestID ORDER BY srt.serviceRequestTaskID DESC) AS rk
			from 
				dbo.serviceRequestTask srt
				inner join dbo.serviceRequest sr on srt.serviceRequestID = sr.ServiceRequestID
			where sr.serviceRequestID in
			(
				-- List of all SRs with only tasks having ED_SES owner
				select distinct sr.serviceRequestID
				from 
					dbo.serviceRequest sr
					inner join dbo.serviceRequestTask srt on srt.serviceRequestID = sr.ServiceRequestID
					inner join dbo.project p on p.projectID = sr.projectID
					inner join dbo.businessArea ba on ba.businessAreaID = p.businessAreaID
					inner join dbo.serviceRequestStatus srs on srs.serviceRequestStatusID = sr.serviceRequestStatusID 
				where
					ba.BusinessAreaID = 15
					and srs.Status <> 'closed'
					and sr.OwnerUserID in (select  userID from [user] where displayName = 'ED_SES')
					and sr.serviceRequestID not in
				(
					-- all SRs that have at least one task that's not owned by ED_SES
					select distinct sr.serviceRequestID
					from 
						dbo.serviceRequest sr
						inner join dbo.serviceRequestTask srt on srt.serviceRequestID = sr.ServiceRequestID
						inner join dbo.project p on p.projectID = sr.projectID
						inner join dbo.businessArea ba on ba.businessAreaID = p.businessAreaID
						inner join dbo.serviceRequestStatus srs on srs.serviceRequestStatusID = sr.serviceRequestStatusID 
					where
						ba.BusinessAreaID = 15
						and srs.Status <> 'closed'
						and sr.OwnerUserID in (select  userID from [user] where displayName = 'ED_SES')
						and srt.ownerUserID not in (select  userID from [user] where displayName = 'ED_SES')
				)
			)
		) subquery
		where subQuery.rk = 1
	)	
order by u.DisplayName, srss_sr.subStatus, sr.ServiceRequestNumber
