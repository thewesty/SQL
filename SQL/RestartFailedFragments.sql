DECLARE @ID bigInt  
DECLARE @jobID bigInt  
DECLARE @parentFragmentID bigInt  

DECLARE my_precious_cursor CURSOR FOR  
select ID, JobID, ParentFragmentID from swarm.jobfragment with(nolock) where JobID IN (SOME_JOB_IDS) AND ID IN (SOME_FRAG_IDS)

OPEN my_precious_cursor    
-- Perform the first fetch.  
FETCH NEXT FROM my_precious_cursor INTO @ID, @jobID, @parentFragmentID    

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.  
WHILE @@FETCH_STATUS = 0  
BEGIN     
	begin transaction     
		BEGIN TRY    
			-- Batch fragment handling    
			update swarm.assignment set state = 7 where JobID = @jobID AND JobFragmentID = @ID
			update swarm.jobfragment set State = 1, CompletedTime = NULL, ConcludedTime = NULL where JobID = @jobID AND ID = @ID

			-- Parent fragment handling    
			update swarm.jobFragment set NumFragmentsFailed = NumFragmentsFailed - 1, ConcludedTime = NULL where JobID = @jobID AND ID = @parentFragmentID  
			
			-- Job handling    
			update swarm.job set NumFragmentsFailed = NumFragmentsFailed -1, CompletedTime = NULL, State = 1 where id = @jobID      
			
			update swarm.jobFragment set State = 3 where JobID = @jobID AND ID = @parentFragmentID AND State = 5

			IF @@ROWCOUNT > 0     
			BEGIN    
				-- Job handling     
				update swarm.job set NumFragmentsSucceeded = NumFragmentsSucceeded - 1 where id = @jobID     
			END   
		END TRY   
		BEGIN CATCH       
			rollback transaction   
		END CATCH     
	commit transaction     

	select @ID, @jobID, @parentFragmentID       
	-- This is executed as long as the previous fetch succeeds.     
	FETCH NEXT FROM my_precious_cursor INTO @ID, @jobID, @parentFragmentID  
END    
CLOSE my_precious_cursor  
DEALLOCATE my_precious_cursor  