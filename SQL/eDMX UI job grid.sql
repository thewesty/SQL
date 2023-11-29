   SELECT 
        j.ID, 
        j.Position, 
        j.Name, 
        j.MaxConcurrency as MaxNumMachines, 
        j.State, 
        j.NumFragments, 
        j.NumFragmentsSucceeded, 
        j.NumFragmentsFailed, 
        j.CreationTime, 
        j.StartTime, 
        j.CompletedTime, 
        d.[Name] as DmxDatabase, 
        srvr.[Name] as DmxServer, 
        s.[Name] as SID, 
        ISNULL(stats.TopLevelCount, 0) as TopLevelCount, 
        ISNULL(stats.TopLevelCountComplete, 0) as CompletedTopLevelDocs, 
        ISNULL(stats.TotalDocsProcessed, 0) as TotalDocsProcessed, 
        Project.Name as ProjectName, 
        Client.Name as ClientName, 
        AdUser.SortName as SortName, 
        IndiJobs.ConfigurationID, 
        IndiJobs.ExcludeFromStatistics, 
        Config.Name as ConfigurationName, 
        IndiJobs.JobAutoNum, 
        IndiJobs.ApplicationVersion, 
        IndiJobs.WorkOrderId as WorkOrderNo, 
        EdataAttributes.ProcessingPath, -- only needed for eDMX jobs
        EdataAttributes.MediaWorker, -- only needed for eDMX jobs
        NearDupeProc.IsExported, -- only needed for NearDupeProcessing jobs
        EDMedia.Code -- only needed for NearDupeProcessing jobs
    FROM 
        swarm.Job j  
        INNER JOIN swarm.Service s  
            on j.ServiceId = s.Id 
        INNER JOIN swarm.JobConfiguration swarmConfig  
            on j.ID = swarmConfig.JobID 
            and j.ServiceID=swarmconfig.ServiceID 
        INNER JOIN swarm.[Database] d  
            on j.DatabaseId = d.Id 
        INNER JOIN swarm.[Server] srvr  
            on d.ServerId = srvr.Id 
        LEFT JOIN indi.JobStatistics stats  
            on j.ID = stats.JobID 

        LEFT JOIN dbo.SwarmJobs IndiJobs  
            on IndiJobs.JobID = j.ID 
        LEFT JOIN dbo.SwarmJobConfigurations Config  
            on IndiJobs.ConfigurationID=Config.SwarmJobConfigID 
        LEFT JOIN dbo.SwarmEdataJobAttributes EdataAttributes  
            on IndiJobs.JobAutoNum=EdataAttributes.JobAutoNum 
        LEFT JOIN dbo.SwarmNearDupeProcessJob NearDupeProc  
            on IndiJobs.JobAutoNum=NearDupeProc.JobAutoNum 
        LEFT JOIN dbo.EDMedia EDMedia  
            on EdataAttributes.EDMediaID=EDMedia.EDMediaID 

        LEFT JOIN dbo.Project Project  
            on Project.ProjectID=IndiJobs.ProjectID 
        LEFT JOIN dbo.Client Client  
            on Project.ClientID=Client.ClientID 
        LEFT JOIN dbo.[User] AdUser  
            on AdUser.UserID=IndiJobs.UserID 
    WHERE 
        j.id < 0
    ORDER BY j.id
