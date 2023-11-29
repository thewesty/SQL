---------------------------------------------------------------------------
-- This generic script is designed for swapping Value of a Service Capability
-- of ALL jobfragments of a PAUSED swarm job. The target value has to exist in the 
-- swarm database or this script will not proceed. To use this script,
-- please replace the following four parameters directly under this comment:
--
-- (1). A swarm JobID
-- (2). The name of the swarm Service
-- (3). The name of the swarm Service Capability
-- (4). The target value that will replace whatever current codings are
--
-- The sample value in this template codes all fragment of job 7761 to use
-- eDMX version 4.2.0.23 instead
--
---------------------------------------------------------------------------

DECLARE @JobID bigint
DECLARE @ServiceName VarCHAR(128)
DECLARE @ServiceCapabilityName VarCHAR(128)
DECLARE @ServiceCapabilityValue VarCHAR(128)

---------- This is the JobID ----------------------------------------
SET @JobID					=	7761
---------- This is the name of the service of which the Service Capability belongs to -------
SET @ServiceName			=	'eDataMatrix_service'
---------- The name of the target Service Capability --------
SET @ServiceCapabilityName	=	'Application version'
---------- The new value of the target Service Capability -------
SET @ServiceCapabilityValue	=	'4.2.0.23'

---------------------------------------------------------------------------
-- Other variables and temp tables
---------------------------------------------------------------------------

DECLARE @targetSCCID bigint
DECLARE @targetSCID bigint
DECLARE @sourceSCID bigint
DECLARE @sourceSCCID bigint
DECLARE @tempSCCID bigint
DECLARE @tempSCID bigint
DECLARE @tempPopulation bigint
DECLARE @tempID bigint
DECLARE @newPopulation int
DECLARE @newSCID bigint
DECLARE @SourceSCIDTable TABLE (
	ID BigInt
)
DECLARE @TargetSCC TABLE (
	Population Int,
	ServiceCapabilityID BigInt
)

SET @targetSCID				=	0

---------------------------------------------------------------------------
--#1. Locate the target ServiceCapability ID
---------------------------------------------------------------------------

SELECT @targetSCID = swarm.ServiceCapability.ID from swarm.Service with(nolock)
JOIN swarm.ServiceCapability with(nolock) on swarm.Service.ID = swarm.ServiceCapability.ServiceID
where swarm.Service.Name = @ServiceName
and swarm.ServiceCapability.Name = @ServiceCapabilityName
and swarm.ServiceCapability.Value = @ServiceCapabilityValue

IF @targetSCID = 0
BEGIN
	PRINT 'The target Capability value does not exist'
	RETURN
END

---------------------------------------------------------------------------
--#2. Locate all source ServiceCapability ID
---------------------------------------------------------------------------

DECLARE my_cursor_2 CURSOR FOR
SELECT swarm.ServiceCapability.ID from swarm.Service with(nolock)
JOIN swarm.ServiceCapability with(nolock) on swarm.Service.ID = swarm.ServiceCapability.ServiceID
WHERE swarm.Service.Name = @ServiceName
AND swarm.ServiceCapability.Name = @ServiceCapabilityName
AND swarm.ServiceCapability.Value != @ServiceCapabilityValue

OPEN my_cursor_2

FETCH NEXT FROM my_cursor_2 INTO @sourceSCID

WHILE @@FETCH_STATUS = 0
BEGIN
	INSERT INTO @SourceSCIDTable (ID) Values (@sourceSCID)

	FETCH NEXT FROM my_cursor_2 INTO @sourceSCID
END

CLOSE my_cursor_2
DEALLOCATE my_cursor_2

---------------------------------------------------------------------------
--#3. Get all ServiceCapabilityCluster(s) of the target job
---------------------------------------------------------------------------

DECLARE my_cursor_3 CURSOR FOR
SELECT swarm.JobFragment.ServiceCapabilityClusterID
FROM swarm.Service with(nolock)
JOIN swarm.ServiceCapability with(nolock) on swarm.Service.ID = swarm.ServiceCapability.ServiceID
JOIN swarm.ServiceCapabilityClusterDefinition with(nolock) on swarm.ServiceCapability.ID = swarm.ServiceCapabilityClusterDefinition.ServiceCapabilityID 
JOIN swarm.JobFragment with(nolock) on swarm.JobFragment.ServiceCapabilityClusterID = ServiceCapabilityClusterDefinition.ServiceCapabilityClusterID
WHERE swarm.ServiceCapability.Name = @ServiceCapabilityName
AND swarm.Service.Name = @ServiceName
AND swarm.JobFragment.JobID = @JobID
group by swarm.JobFragment.ServiceCapabilityClusterID

OPEN my_cursor_3

FETCH NEXT FROM my_cursor_3 INTO @sourceSCCID

--For each of the Service Capability Cluster
WHILE @@FETCH_STATUS = 0
BEGIN
	---------------------------------------------------------------------------
	--#3_1 Get the cluster component
	---------------------------------------------------------------------------
	DECLARE my_cursor_3_1 CURSOR FOR
	SELECT swarm.ServiceCapabilityClusterDefinition.Population, swarm.ServiceCapabilityClusterDefinition.ServiceCapabilityID from swarm.ServiceCapabilityClusterDefinition with (nolock)
	WHERE swarm.ServiceCapabilityClusterDefinition.ServiceCapabilityClusterID = @sourceSCCID

	OPEN my_cursor_3_1

	---------------------------------------------------------------------------
	--# Handling the first Service Capability in each Cluster
	---------------------------------------------------------------------------
	FETCH NEXT FROM my_cursor_3_1 INTO @tempPopulation, @tempSCID

	---------------------------------------------------------------------------
	--# Check each Service Capability against the list to be replaced. If so, replace it with the target
	---------------------------------------------------------------------------
	SET @tempID = 0
	SELECT @tempID = ID from @SourceSCIDTable WHERE ID = @tempSCID
	IF @tempID > 0
	BEGIN
		SET @tempSCID = @targetSCID
	END

	---------------------------------------------------------------------------
	--Keep a copy image of the target SCC
	---------------------------------------------------------------------------
	INSERT INTO @TargetSCC (Population, ServiceCapabilityID) Values (@tempPopulation, @tempSCID)

	SELECT swarm.ServiceCapabilityClusterDefinition.ServiceCapabilityClusterID
	INTO #targetSCCIDTable
	FROM swarm.ServiceCapabilityClusterDefinition with(nolock)
	WHERE swarm.ServiceCapabilityClusterDefinition.Population = @tempPopulation
	AND swarm.ServiceCapabilityClusterDefinition.ServiceCapabilityID = @tempSCID

	FETCH NEXT FROM my_cursor_3_1 INTO @tempPopulation, @tempSCID

	---------------------------------------------------------------------------
	--# For each of the Service Capability in each Cluster
	---------------------------------------------------------------------------
	WHILE @@FETCH_STATUS = 0
	BEGIN
		---------------------------------------------------------------------------
		--#3_1_1 Check each Service Capability against the list to be replaced. If so, replace it with the target
		---------------------------------------------------------------------------
		SET @tempID = 0
		SELECT @tempID = ID from @SourceSCIDTable WHERE ID = @tempSCID
		IF @tempID > 0
		BEGIN
			SET @tempSCID = @targetSCID
		END

		---------------------------------------------------------------------------
		--Keep a copy image of the target SCC
		---------------------------------------------------------------------------
		INSERT INTO @TargetSCC (Population, ServiceCapabilityID) Values (@tempPopulation, @tempSCID)

		---------------------------------------------------------------------------
		--#3_1_2 Loop through the Service Capabilities to identify the target ServiceCapabilityClusterID
		---------------------------------------------------------------------------

		SELECT ServiceCapabilityClusterID INTO #tempSCCID FROM #targetSCCIDTable;

		DELETE FROM #targetSCCIDTable;

		DECLARE my_cursor_3_1_2_1 CURSOR FOR
		SELECT swarm.ServiceCapabilityClusterDefinition.ServiceCapabilityClusterID
		FROM swarm.ServiceCapabilityClusterDefinition with(nolock)
		JOIN #tempSCCID on swarm.ServiceCapabilityClusterDefinition.ServiceCapabilityClusterID = #tempSCCID.ServiceCapabilityClusterID
		WHERE swarm.ServiceCapabilityClusterDefinition.Population = @tempPopulation
		AND swarm.ServiceCapabilityClusterDefinition.ServiceCapabilityID = @tempSCID;

		OPEN my_cursor_3_1_2_1

		FETCH NEXT FROM my_cursor_3_1_2_1 INTO @tempSCCID 

		WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO #targetSCCIDTable (ServiceCapabilityClusterID) Values (@tempSCCID)

			FETCH NEXT FROM my_cursor_3_1_2_1 INTO @tempSCCID
		END

		CLOSE my_cursor_3_1_2_1
		DEALLOCATE my_cursor_3_1_2_1

		DROP Table #tempSCCID;

		FETCH NEXT FROM my_cursor_3_1 INTO @tempPopulation, @tempSCID
	END

	CLOSE my_cursor_3_1
	DEALLOCATE my_cursor_3_1

	SET @targetSCCID = 0
	SELECT @targetSCCID = ServiceCapabilityClusterID FROM #targetSCCIDTable

	---------------------------------------------------------------------------
	--#3_2 If no ServiceCapabilityClusterID is identified we'll make a new one here
	---------------------------------------------------------------------------
	IF @targetSCCID = 0
	BEGIN
		INSERT INTO swarm.ServiceCapabilityCluster DEFAULT VALUES

		SELECT @targetSCCID = SCOPE_IDENTITY();

		DECLARE my_cursor_3_2 CURSOR FOR
		SELECT Population, ServiceCapabilityID FROM @TargetSCC

		OPEN my_cursor_3_2

		FETCH NEXT FROM my_cursor_3_2 INTO @newPopulation, @newSCID

		WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO swarm.ServiceCapabilityClusterDefinition (ServiceCapabilityClusterID, Population, ServiceCapabilityID) Values (@targetSCCID, @newPopulation, @newSCID)

			FETCH NEXT FROM my_cursor_3_2 INTO @newPopulation, @newSCID
		END

		CLOSE my_cursor_3_2
		DEALLOCATE my_cursor_3_2
	END

	DELETE FROM @TargetSCC;

	---------------------------------------------------------------------------
	--#3_3 Loop through the map, and update all JobFragment in the job accordingly
	---------------------------------------------------------------------------

	UPDATE swarm.JobFragment SET ServiceCapabilityClusterID = @targetSCCID
	WHERE swarm.JobFragment.JobID = @JobID
	AND ServiceCapabilityClusterID = @sourceSCCID

	DROP Table #targetSCCIDTable

	FETCH NEXT FROM my_cursor_3 INTO @sourceSCCID
END

CLOSE my_cursor_3
DEALLOCATE my_cursor_3

