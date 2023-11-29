SELECT  
  CASE  
    WHEN s.jobType = '1' THEN 'FCS Jobs'  
    ELSE 'Non-FCS Jobs'  
  END  
  AS JobType, count(1) AS NumJobs  

FROM  
(  
  SELECT Configuration.exist('(eDataMatrixConfiguration/FileCopyService)') AS jobType  

  FROM  
    Swarm.JobConfiguration  

  WHERE  
    ServiceID IN  
      (SELECT ID FROM Swarm.Service WHERE Name LIKE 'eDataMatrix%')  
  AND  
    CreationTime > DATEADD(DAY,-30,GETDATE())  
) s  
GROUP BY s.jobType
