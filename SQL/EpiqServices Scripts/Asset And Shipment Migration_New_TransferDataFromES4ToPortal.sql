SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;

DECLARE @PortalProjectId int = 00000;
DECLARE @ES4ProjectId    varchar(255) = 'CO00495-CA0010-P004';

DECLARE @tmp_MissingShipmentMedia TABLE(
	[MediaCode]             nvarchar(14) NULL,
	[Source_ShipmentID]     int NOT NULL,
	[MediaItemID]           int NULL,
	[ShipmentID]            int NULL,
	[InsertedOn]            datetime2(7) NOT NULL,
	[InsertedByUserID]      int NOT NULL);

DECLARE @tmp_MissingShipment TABLE(
	[ShipmentID]            int NULL,
	[Source_ShipmentID]     int NULL,
	[ProjectID]             int NULL,
	[ShipmentName]          nvarchar(350) NULL,
	[ShippingNumber]        nvarchar(300) NULL,
	[ClientPointOfContact]  nvarchar(50) NULL,
	[InTransit]             bit NOT NULL,
	[Description]           nvarchar(1000) NULL,
	[Contents]              nvarchar(100) NULL,
	[IsActive]              bit NOT NULL,
	[InsertedOn]            datetime2(7) NOT NULL,
	[UpdatedOn]             datetime2(7) NOT NULL,
	[InsertedByUserID]      int NOT NULL,
	[UpdatedByUserID]       int NOT NULL,
	[ShipmentDate]          datetime2(7) NULL,
	[ShipmentType]          nvarchar(20) NULL);
	
DECLARE @tmp_MissingShipmentAddress TABLE(
	[ShipmentID]            int NULL,
	[Source_ShipmentID]     int NULL,
	[ShipmentAddressID]     int NULL,
	[ShippingProviderID]    int NULL,
	[CompanyName]           nvarchar(50) NULL,
	[FirstName]             nvarchar(50) NULL,
	[LastName]              nvarchar(50) NULL,
	[Address1]              nvarchar(60) NULL,
	[Address2]              nvarchar(50) NULL,
	[City]                  nvarchar(50) NULL,
	[StateProvince]         nvarchar(50) NULL,
	[PostalCode]            nvarchar(50) NULL,
	[Country]               nvarchar(50) NULL,
	[Phone1]                nvarchar(50) NULL,
	[Phone2]                nvarchar(50) NULL,
	[TrackingNumber]        nvarchar(100) NULL,
	[IsSenderAddress]       bit NOT NULL);


--   MissingDocuments is being removed from this script until it is determined that it is needed

--DECLARE @tmp_MissingDocuemnts TABLE(
--	[Source_DocumentID]     bigint NOT NULL,
--	[Source_MediaItemID]    int NULL,
--	[MediaCode]             nvarchar(14) NULL,
--	[MediaItemID]           int NULL,
--	[MediaGroupID]          int NULL,
--	[ShipmentID]            int NULL,
--	[Name]                  nvarchar(50) NOT NULL,
--	[DestinationFullPath]   nvarchar(500) NOT NULL,
--	[OriginalFullPath]      nvarchar(500) NOT NULL,
--	[IsActive]              bit NOT NULL,
--	[InsertedOn]            smalldatetime NOT NULL,
--	[UpdatedOn]             smalldatetime NOT NULL,
--	[InsertedByUserID]      int NOT NULL,
--	[UpdatedByUserID]       int NOT NULL);

DECLARE @SenderAddress TABLE(
	[ID]                    int NULL, 
	[Name]                  nvarchar(100) NULL,
	[FirstName]             nvarchar(100) NULL, 
	[LastName]              nvarchar(100) NULL, 
	[Company]               nvarchar(200) NULL, 
	[TrackingNumber]        nvarchar(100) NULL);

DECLARE @RecipientAddress TABLE(
	[ID]                    int NULL,
	[Name]                  nvarchar(100) NULL, 
	[FirstName]             nvarchar(100) NULL, 
	[LastName]              nvarchar(100) NULL, 
	[Company]               nvarchar(200) NULL, 
	[TrackingNumber]        nvarchar(100) NULL);

DECLARE @Holding TABLE(
	[MediaID]               int NULL, 
	[sFirstName]            nvarchar(100) NULL, 
	[sLastName]             nvarchar(100) NULL, 
	[ShippingProvider]      nvarchar(100) NULL, 
	[sCompany]              nvarchar(100) NULL, 
	[TrackingNumber]        nvarchar(100) NULL, 
	[rFirstName]            nvarchar(100) NULL, 
	[rLastName]             nvarchar(100) NULL, 
	[rCompany]              nvarchar(100) NULL, 
	[InsertedOn]            datetime2(0) NULL);

INSERT INTO @tmp_MissingShipmentMedia
(MediaItemID, MediaCode, Source_ShipmentID, InsertedOn, InsertedByUserID)
SELECT
   CASE WHEN  mi.[MediaItemID] IS NULL THEN NULL ELSE mi.[MediaItemID] END
  ,CASE WHEN  ca.[AssetID] IS NULL     THEN NULL ELSE ca.[AssetID] END
  ,casx.[CasesAssetsShippingDetailsID]
  ,GETUTCDATE()
  ,-1
FROM [ELSOPERATIONS].[dbo].[CompanyAssetsShipmentXREF] casx
INNER JOIN [ELSOPERATIONS].[dbo].[CasesAssets] ca      ON ca.[ID] = casx.[AssetID]
INNER JOIN [ELSOPERATIONS].[dbo].[CompanyShipments] cs ON cs.[ID] = casx.[CasesAssetsShippingDetailsID]
INNER JOIN [EpiqPortal].[eds].[MediaItem] mi           ON mi.[MediaCode] = ca.[AssetID]
WHERE ca.ProjectID = @ES4ProjectId;

INSERT INTO @tmp_MissingShipment
([Source_ShipmentID], [ShipmentName],[ShippingNumber],[ClientPointOfContact],[InTransit],[Description],[Contents],[IsActive]
,[InsertedOn],[UpdatedOn],[InsertedByUserID],[UpdatedByUserID])
SELECT DISTINCT
   CASE WHEN cs.[ID] IS NULL                   THEN NULL ELSE cs.[ID] END
  ,CASE WHEN cs.[ShipmentName] IS NULL         THEN NULL ELSE cs.[ShipmentName] END
  ,CASE WHEN cs.[ShippingNumber] IS NULL       THEN NULL ELSE cs.[ShippingNumber] END
  ,CASE WHEN cs.[ClientPointOfContact] IS NULL THEN NULL ELSE cs.[ClientPointOfContact] END
  ,CASE WHEN cs.[InTransit] IS NULL            THEN NULL ELSE cs.[InTransit] END
  ,CASE WHEN cs.[Description] IS NULL          THEN NULL ELSE cs.[Description] END
  ,CASE WHEN cs.[ContentsOfShipment] IS NULL   THEN NULL ELSE cs.[ContentsOfShipment] END
  ,CASE WHEN cs.[IsActive] IS NULL             THEN NULL ELSE cs.[IsActive] END
  ,CASE WHEN cs.[CreatedDate] IS NULL          THEN NULL ELSE cs.[CreatedDate] END
  ,CASE WHEN cs.[ModifiedDate] IS NULL         THEN cs.[CreatedDate] ELSE cs.[ModifiedDate] END
  ,cs.[CreatedBy]
  ,CASE WHEN cs.[ModifiedBy] IS NULL           THEN -1 ELSE cs.[ModifiedBy] END
FROM [ELSOPERATIONS].[dbo].[CompanyShipments] cs
INNER JOIN [ELSOPERATIONS].[dbo].[CompanyAssetsShipmentXREF] casx ON casx.[CasesAssetsShippingDetailsID] = cs.[ID]
INNER JOIN [ELSOPERATIONS].[dbo].[CasesAssets] ca                 ON ca.[ID] = casx.[AssetID]
WHERE ca.[ProjectID] = @ES4ProjectId;

INSERT INTO @tmp_MissingShipmentAddress
([Source_ShipmentID],[ShippingProviderID],[CompanyName],[FirstName],[LastName],[Address1],[Address2],
[City],[StateProvince],[PostalCode],[Country],[Phone1],[Phone2],[TrackingNumber],[IsSenderAddress])
SELECT DISTINCT
   CASE WHEN cs.[ID] IS NULL                             THEN NULL ELSE cs.[ID] END
  ,CASE WHEN cs.[SentShippingServicesProviderID] IS NULL THEN NULL ELSE cs.[SentShippingServicesProviderID] END
  ,CASE WHEN cs.[SenderCompany] IS NULL                  THEN NULL ELSE cs.[SenderCompany] END
  ,CASE WHEN cs.[SenderFirstName] IS NULL                THEN NULL ELSE cs.[SenderFirstName] END
  ,CASE WHEN cs.[SenderLastName] IS NULL                 THEN NULL ELSE cs.[SenderLastName] END
  ,CASE WHEN cs.[SenderAddress1] IS NULL                 THEN NULL ELSE cs.[SenderAddress1] END
  ,CASE WHEN cs.[SenderAddress2] IS NULL                 THEN NULL ELSE cs.[SenderAddress2] END
  ,CASE WHEN cs.[SenderCity] IS NULL                     THEN NULL ELSE cs.[SenderCity] END
  ,CASE WHEN cs.[SenderStateProvince] IS NULL            THEN NULL ELSE cs.[SenderStateProvince] END
  ,CASE WHEN cs.[SenderZipCode] IS NULL                  THEN NULL ELSE cs.[SenderZipCode] END
  ,CASE WHEN cs.[SenderCountry] IS NULL                  THEN NULL ELSE cs.[SenderCountry] END
  ,CASE WHEN cs.[SenderPhone1] IS NULL                   THEN NULL ELSE cs.[SenderPhone1] END
  ,CASE WHEN cs.[SenderPhone2] IS NULL                   THEN NULL ELSE cs.[SenderPhone2] END
  ,CASE WHEN cs.[SentTrackingNumber] IS NULL             THEN NULL ELSE cs.[SentTrackingNumber] END
  ,1
FROM       [ELSOPERATIONS].[dbo].[CompanyShipments] cs
INNER JOIN [ELSOPERATIONS].[dbo].[CompanyAssetsShipmentXREF] casx ON casx.[CasesAssetsShippingDetailsID] = CS.ID
INNER JOIN [ELSOPERATIONS].[dbo].[CasesAssets] ca                 ON ca.[ID] = casx.[AssetID]
WHERE ca.[ProjectID] = @ES4ProjectId;

INSERT INTO @tmp_MissingShipmentAddress
([Source_ShipmentID],[ShippingProviderID],[CompanyName],[FirstName],[LastName],[Address1],[Address2],
[City],[StateProvince],[PostalCode],[Country],[Phone1],[Phone2],[TrackingNumber],[IsSenderAddress])
SELECT DISTINCT
  CASE WHEN cs.[ID] IS NULL                                 THEN NULL ELSE cs.[ID] END
  ,CASE WHEN cs.[ReceivedShippingServicesProviderID] IS NULL THEN NULL ELSE cs.[ReceivedShippingServicesProviderID] END
  ,CASE WHEN cs.[RecipientCompany] IS NULL                   THEN NULL ELSE cs.[RecipientCompany] END
  ,CASE WHEN cs.[RecipientFirstName] IS NULL                 THEN NULL ELSE cs.[RecipientFirstName] END
  ,CASE WHEN cs.[RecipientLastName] IS NULL                  THEN NULL ELSE cs.[RecipientLastName] END
  ,CASE WHEN cs.[RecipientAddress1] IS NULL                  THEN NULL ELSE cs.[RecipientAddress1] END
  ,CASE WHEN cs.[RecipientAddress2] IS NULL                  THEN NULL ELSE cs.[RecipientAddress2] END
  ,CASE WHEN cs.[RecipientCity] IS NULL                      THEN NULL ELSE cs.[RecipientCity] END
  ,CASE WHEN cs.[RecipientStateProvince] IS NULL             THEN NULL ELSE cs.[RecipientStateProvince] END
  ,CASE WHEN cs.[RecipientZipCode] IS NULL                   THEN NULL ELSE cs.[RecipientZipCode] END
  ,CASE WHEN cs.[RecipientCountry] IS NULL                   THEN NULL ELSE cs.[RecipientCountry] END
  ,CASE WHEN cs.[RecipientPhone1] IS NULL                    THEN NULL ELSE cs.[RecipientPhone1] END
  ,CASE WHEN cs.[RecipientPhone2] IS NULL                    THEN NULL ELSE cs.[RecipientPhone2] END
  ,CASE WHEN cs.[ReceivedTrackingNumber] IS NULL             THEN NULL ELSE cs.[ReceivedTrackingNumber] END
  ,0
FROM       [ELSOPERATIONS].[dbo].[CompanyShipments] cs
INNER JOIN [ELSOPERATIONS].[dbo].[CompanyAssetsShipmentXREF] casx ON casx.[CasesAssetsShippingDetailsID] = cs.[ID]
INNER JOIN [ELSOPERATIONS].[dbo].[CasesAssets] ca                 ON ca.[ID] = casx.[AssetID]
WHERE ca.ProjectID = @ES4ProjectId;

DECLARE @LastError int = 0;
DECLARE @ErrorMsg varchar(200) = '';

BEGIN TRAN

--    SR - The values below for [MediaDataTypeID], [MediaGroupID], [LatestMediaActionID], [CustodyHolder] are all 
--         currently just null values and were never populated to the original @tmp_MissingMediaItems table.  So in the
--         code below, NULL values were inserted in their place.

INSERT INTO [EpiqPortal].[eds].[MediaItem]
([ProjectID],[MediaTypeID],[MediaIntakeTypeID],[MediaDataTypeID],[MediaManufacturerID],[MediaGroupID],[LatestMediaActionID],[MediaCode],[Description]
,[Model],[Capacity],[SerialNumber],[BoxNumber],[ShelfNumber],[HasLetter],[AssetMap],[EncryptionPassword],[EncryptionType],[DateOfFirstContact],[LogicalSize]
,[IsCheckedIn],[SwarmMediaID],[FileCount],[InternalNote],[ServerPath],[IsActive],[InsertedOn],[UpdatedOn],[InsertedByUserID],[UpdatedByUserID],[CustodyHolder])
SELECT @PortalProjectID,[AssetTypeID],[ClassificationID],NULL,[ManufacturerID],NULL,NULL,[AssetID],[Description],
[Model],[Capacity],[SerialNumber],[BoxNumber],[ShelfNumber],[HasLetter],[AssetMap],[EncryptionPassword],[EncryptionType],[DateOfFirstContact],[LogicalSize],
[IsCheckedIn],[SwarmMediaID],[FileCount],[InternalNote],[ServerPath],[Status],[CreatedDate],getutcdate(),[CreatedBy],-1,NULL
FROM [ELSOPERATIONS].[dbo].[CasesAssets] ca
WHERE ca.ProjectId = @ES4ProjectId
AND NOT EXISTS(SELECT 1 FROM [EpiqPortal].[eds].[MediaItem] mi WHERE mi.[MediaCode] = ca.[AssetID]);

SELECT @LastError = @@ERROR;
IF @LastError <> 0 
  BEGIN
    SET @ErrorMsg = 'Error Inserting Records Into [EpiqPortal].[eds].[MediaItem]   (Error Code ' + CAST(@LastError AS nvarchar(max)) + ')'
    GOTO END_OF_INSERTS;
  END;

INSERT INTO [EpiqPortal].[eds].[MediaHistory]
([MediaItemID],[MediaLocationID],[MediaActionID],[UserID],[Date],[Comments],[IsActive],[LegacyUserName])
SELECT mi.MediaItemID, ch.[EncoreDataPhysicalLocationID], ch.[EntityActionID], ch.[EmployeeID], ch.[Date], ch.[Comments], ch.[Status], co.[FirstName]
FROM [ELSOPERATIONS].[dbo].[CasesAssetsHistory] ch
INNER JOIN [ELSOPERATIONS].[dbo].[CasesAssets] ca ON ca.[ID] = ch.[CaseAssetId]
INNER JOIN [ELSOPERATIONS].[dbo].[Contacts] co    ON co.[ID] = ch.[EmployeeID]
INNER JOIN [EpiqPortal].[eds].[MediaItem] mi      ON mi.[MediaCode] = ca.[AssetID] 
WHERE ca.[ProjectId] = @ES4ProjectId;

SELECT @LastError = @@ERROR;
IF @LastError <> 0 
  BEGIN
    SET @ErrorMsg = 'Error Inserting Records Into [EpiqPortal].[eds].[MediaHistory]   (Error Code ' + CAST(@LastError AS nvarchar(max)) + ')'
    GOTO END_OF_INSERTS;
  END;

--   MissingDocuments is being removed from this script until it is determined that it is needed
--UPDATE TMD 
--SET MediaItemID = MI.MediaItemID
--FROM @tmp_MissingDocuemnts TMD 
--INNER JOIN [EpiqPortal].[eds].[MediaItem] MI ON MI.MediaCode = TMD.MediaCode;

--Grab the identity on insert by cursoring through the @tmp_MissingShipment records 
DECLARE @NewShipmentID int, @HoldingShipmentID int;

DECLARE shipment_cursor CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR 
	SELECT [Source_ShipmentID] FROM @tmp_MissingShipment tms
	ORDER BY [Source_ShipmentID];

OPEN shipment_cursor;

FETCH NEXT FROM shipment_cursor INTO @HoldingShipmentID;

WHILE @@FETCH_STATUS = 0
BEGIN

--    SR - The values below for [ShipmentDate] and [ShipmentType] are all currently just null values and were 
--         never populated to the original @tmp_MissingShipment table.  So, in the code below, NULL values 
--         were inserrted in their place

    INSERT INTO [EpiqPortal].[eds].[Shipment]
    ([ShipmentName],[ShippingNumber],[ClientPointOfContact],[InTransit],[Description],[Contents],[IsActive]
    ,[InsertedOn],[UpdatedOn],[InsertedByUserID],[UpdatedByUserID],[ShipmentDate],[ShipmentType])
	SELECT [ShipmentName],[ShippingNumber],[ClientPointOfContact],[InTransit],[Description],[Contents],[IsActive],
	[InsertedOn],[UpdatedOn],[InsertedByUserID],[UpdatedByUserID],[ShipmentDate],[ShipmentType] 
	FROM @tmp_MissingShipment TMS WHERE TMS.[Source_ShipmentID] = @HoldingShipmentID
	SELECT @LastError = @@ERROR, @NewShipmentID = SCOPE_IDENTITY();

	IF @LastError <> 0 
      BEGIN
        SET @ErrorMsg = 'Error Inserting Records Into [EpiqPortal].[eds].[Shipment]   (Error Code ' + CAST(@LastError AS nvarchar(max)) + ')'
        GOTO END_OF_INSERTS;
      END;

	UPDATE @tmp_MissingShipment
	SET ShipmentID = @NewShipmentID WHERE Source_ShipmentID = @HoldingShipmentID;

	FETCH NEXT FROM shipment_cursor INTO @HoldingShipmentID;
END;

CLOSE shipment_cursor;
DEALLOCATE shipment_cursor;

--Update the @tmp_MissingShipmentMedia ShipmentId from @tmp_MissingShipment
UPDATE msm
SET [ShipmentID] = tms.[ShipmentID]
FROM @tmp_MissingShipmentMedia msm
INNER JOIN @tmp_MissingShipment tms ON tms.[Source_ShipmentID] = msm.[Source_ShipmentID];

--Insert the ShipmentMedia Records
INSERT INTO [EpiqPortal].[eds].[ShipmentMedia]
([ShipmentID],[MediaItemID],[InsertedOn],[InsertedByUserID])
SELECT [ShipmentID],[MediaItemID],[InsertedOn],[InsertedByUserID] 
FROM @tmp_MissingShipmentMedia
WHERE [MediaItemID] IS NOT NULL;

SELECT @LastError = @@ERROR;
IF @LastError <> 0 
  BEGIN
    SET @ErrorMsg = 'Error Inserting Records Into [EpiqPortal].[eds].[ShipmentMedia]   (Error Code ' + CAST(@LastError AS nvarchar(max)) + ')'
    GOTO END_OF_INSERTS;
  END;

--Update @tmp_MissingShipmentAddress with the new ShippingID
UPDATE msa
SET [ShipmentID] = TMS.[ShipmentID]
FROM @tmp_MissingShipmentAddress msa
INNER JOIN @tmp_MissingShipment tms ON tms.Source_ShipmentID = msa.Source_ShipmentID;

--Grab the identity on insert by cursoring through the @tmp_MissingShipmentAddress records (Sender)
DECLARE @NewAddressID int, @AddressShipmentID int;

--Insert the Sender Addresses and grab the new address ids.
DECLARE address_cursor CURSOR LOCAL FORWARD_ONLY READ_ONLY FOR 
	SELECT tms.[ShipmentID] FROM @tmp_MissingShipmentAddress tms WHERE [IsSenderAddress] = 1
	ORDER BY tms.[ShipmentID];

OPEN address_cursor;

FETCH NEXT FROM address_cursor INTO @AddressShipmentID;

WHILE @@FETCH_STATUS = 0
BEGIN
  
    INSERT INTO [EpiqPortal].[eds].[ShipmentAddress]
    ([ShippingProviderID],[CompanyName],[FirstName],[LastName],[Address1],[Address2],[City],[StateProvince],[PostalCode],[Country],[Phone1],[Phone2],[TrackingNumber])
    SELECT [ShippingProviderID],[CompanyName],[FirstName],[LastName],[Address1],[Address2],[City],[StateProvince],[PostalCode],[Country],[Phone1],[Phone2],[TrackingNumber] 
	FROM @tmp_MissingShipmentAddress WHERE [ShipmentID] = @AddressShipmentID AND [IsSenderAddress] = 1
	SELECT @LastError = @@ERROR, @NewAddressID = SCOPE_IDENTITY();

    IF @LastError <> 0 
      BEGIN
        SET @ErrorMsg = 'Error Inserting Records Into [EpiqPortal].[eds].[ShipmentAddress]   (Error Code ' + CAST(@LastError AS nvarchar(max)) + ')'
        GOTO END_OF_INSERTS;
      END;

	--Update @tmp_MissingShipmentAddress AddressID from the Insert Results
	UPDATE @tmp_MissingShipmentAddress
	SET [ShipmentAddressID] = @NewAddressID WHERE [ShipmentID] = @AddressShipmentID AND [IsSenderAddress] = 1;
	
	FETCH NEXT FROM address_cursor INTO @AddressShipmentID;
END;

CLOSE address_cursor;
DEALLOCATE address_cursor;

--Insert the Recipient Addresses and grab the new address ids.
DECLARE address_cursor CURSOR LOCAL FOR 
    SELECT tms.[ShipmentID] FROM @tmp_MissingShipmentAddress tms WHERE [IsSenderAddress] = 0
    ORDER BY tms.[ShipmentID];

OPEN address_cursor;

FETCH NEXT FROM address_cursor INTO @AddressShipmentID;

WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO [EpiqPortal].[eds].[ShipmentAddress]
    ([ShippingProviderID],[CompanyName],[FirstName],[LastName],[Address1],[Address2],[City],[StateProvince],[PostalCode],[Country],[Phone1],[Phone2],[TrackingNumber])
	SELECT DISTINCT [ShippingProviderID],[CompanyName],[FirstName],[LastName],[Address1],[Address2],[City],[StateProvince],[PostalCode],[Country],[Phone1],[Phone2],[TrackingNumber] 
    FROM @tmp_MissingShipmentAddress WHERE [ShipmentID] = @AddressShipmentID AND [IsSenderAddress] = 0
	SELECT @LastError = @@ERROR, @NewAddressID = SCOPE_IDENTITY()

    IF @LastError <> 0 
      BEGIN
        SET @ErrorMsg = 'Error Inserting Records Into [EpiqPortal].[eds].[ShipmentAddress]   (Error Code ' + CAST(@LastError AS nvarchar(max)) + ')'
        GOTO END_OF_INSERTS;
      END;

	--Update @tmp_MissingShipmentAddress AddressID from the Insert Results
	UPDATE @tmp_MissingShipmentAddress 
	SET [ShipmentAddressID] = @NewAddressID WHERE [ShipmentID] = @AddressShipmentID AND [IsSenderAddress] = 0

	FETCH NEXT FROM address_cursor INTO @AddressShipmentID
END;

CLOSE address_cursor;
DEALLOCATE address_cursor;

--Insert sender addresses to the ShipmentSenderAddress table
INSERT INTO [EpiqPortal].[eds].[ShipmentSenderAddress]
([ShipmentID],[ShipmentAddressID])
SELECT [ShipmentID], [ShipmentAddressID]
FROM @tmp_MissingShipmentAddress
WHERE [IsSenderAddress] = 1;

SELECT @LastError = @@ERROR;
IF @LastError <> 0 
  BEGIN
    SET @ErrorMsg = 'Error Inserting Records Into [EpiqPortal].[eds].[ShipmentSenderAddress]   (Error Code ' + CAST(@LastError AS nvarchar(max)) + ')'
    GOTO END_OF_INSERTS;
  END;


--Insert recipients to the addresses to the ShipmentRecipientAddress table
INSERT INTO [EpiqPortal].[eds].ShipmentRecipientAddress
([ShipmentID],[ShipmentAddressID])
SELECT [ShipmentID], [ShipmentAddressID] 
FROM @tmp_MissingShipmentAddress
WHERE [IsSenderAddress] = 0;

SELECT @LastError = @@ERROR;
IF @LastError <> 0 
  BEGIN
    SET @ErrorMsg = 'Error Inserting Records Into [EpiqPortal].[eds].[ShipmentRecipientAddress]   (Error Code ' + CAST(@LastError AS nvarchar(max)) + ')'
    GOTO END_OF_INSERTS;
  END;

--   MissingDocuments is being removed from this script until it is determined that it is needed
--INSERT INTO [EpiqPortal].[eds].[Document]
--([MediaItemID],[MediaGroupID],[Name],[DestinationFullPath],[OriginalFullPath]
--,[IsActive],[InsertedOn],[UpdatedOn],[InsertedByUserID],[UpdatedByUserID])
--SELECT MediaItemID, MediaGroupID, Name, DestinationFullPath, OriginalFullPath,
--	IsActive, InsertedOn, UpdatedOn, InsertedByUserID, UpdatedByUserID
--FROM @tmp_MissingDocuemnts
--WHERE MediaItemID IS NOT NULL;

--SELECT @LastError = @@ERROR;
--IF @LastError <> 0 GOTO END_OF_INSERTS;

INSERT INTO @SenderAddress
SELECT ssa.[ShipmentID], sp.[Name], sa.[FirstName], sa.[LastName], sa.[CompanyName], sa.[TrackingNumber]
FROM [EpiqPortal].eds.[ShipmentAddress] sa
INNER JOIN [EpiqPortal].[eds].[ShippingProvider] sp       ON sp.[ShippingProviderID] = sa.[ShippingProviderID]
INNER JOIN [EpiqPortal].[eds].[ShipmentSenderAddress] ssa ON ssa.[ShipmentAddressID] = sa.[ShipmentAddressID];

INSERT INTO @RecipientAddress
SELECT ssa.[ShipmentID], sp.[Name], sa.[FirstName], sa.[LastName], sa.[CompanyName], sa.[TrackingNumber]
FROM [EpiqPortal].[eds].[ShipmentAddress] sa
INNER JOIN [EpiqPortal].[eds].[ShippingProvider] sp          ON sp.[ShippingProviderID] = sa.[ShippingProviderID]
INNER JOIN [EpiqPortal].[eds].[ShipmentRecipientAddress] ssa ON ssa.[ShipmentAddressID] = sa.[ShipmentAddressID];

INSERT INTO @Holding
SELECT m.[MediaItemID]
      ,ssa.[FirstName]
      ,ssa.[LastName]
      ,CASE WHEN (LOWER(ssa.[Name]) <> 'n/a' AND LOWER(ssa.[Name]) <> 'na' AND ssa.[Name] <> '') THEN ssa.[Name]
            WHEN (LOWER(sra.[Name]) <> 'n/a' AND LOWER(sra.[Name]) <> 'na' AND sra.[Name] <> '') THEN sra.[Name]
			   ELSE '' END AS [ShippingProvider]
      ,ssa.Company 
      ,CASE WHEN (LOWER(ssa.[TrackingNumber]) <> 'n/a' AND LOWER(ssa.[TrackingNumber]) <> 'na' AND ssa.[TrackingNumber] <> '') THEN ssa.[TrackingNumber]
            WHEN (LOWER(sra.[TrackingNumber]) <> 'n/a' AND LOWER(sra.[TrackingNumber]) <> 'na' AND sra.[TrackingNumber] <> '') THEN sra.[TrackingNumber]
			   ELSE '' END AS [TrackingNumber]
      ,sra.[FirstName]
      ,sra.[LastName]
      ,sra.[Company] 
      ,s.[InsertedOn]
FROM [EpiqPortal].eds.[Shipment] s
INNER JOIN [EpiqPortal].[eds].[ShipmentMedia] sm ON sm.[ShipmentID] = s.[ShipmentID]
INNER JOIN [EpiqPortal].[eds].[MediaItem] m      ON m.[MediaItemID] = sm.[MediaItemID]
LEFT JOIN @SenderAddress ssa                     ON ssa.[ID] = s.[ShipmentID]
LEFT JOIN @RecipientAddress sra                  ON sra.[ID] = s.[ShipmentID]
WHERE m.[ProjectID] = @PortalProjectId 
      AND ((ssa.[Name] IS NOT NULL 
	  AND ssa.[Name] <> 'N/A' 
	  AND ssa.[Name] <> '') 
	  OR (sra.[Name] IS NOT NULL 
	  AND sra.[Name] <> 'N/A' 
	  AND sra.[Name] <> ''));

INSERT INTO [EpiqPortal].[eds].[ChainOfCustody] (ActionDate, ReleasedBy, Purpose, ReceivedBy, MediaItemID)
SELECT  [InsertedOn] AS 'To_Date'
       ,CASE WHEN [ShippingProvider] = 'FTP' THEN [ShippingProvider] + ': ' + [sCompany] ELSE [sCompany] END AS 'From_Name'
       ,'Ship to ' + [rCompany] + ' from ' + [sCompany] AS 'Purpose'
	   ,CASE WHEN [TrackingNumber] = '' THEN [rCompany] + ' - ' + [ShippingProvider] ELSE [rCompany] + ' - ' + [ShippingProvider] + ' - ' + [TrackingNumber] END AS 'To_Name'
       ,[MediaID]
FROM @Holding
WHERE [rCompany] IS NOT NULL;

SELECT @LastError = @@ERROR;
IF @LastError <> 0 
  BEGIN
    SET @ErrorMsg = 'Error Inserting Records Into [EpiqPortal].[eds].[ChainOfCustody]   (Error Code ' + CAST(@LastError AS nvarchar(max)) + ')'
    GOTO END_OF_INSERTS;
  END;


PRINT 'END OF SCRIPT'
PRINT ''
END_OF_INSERTS:

IF @LastError <> 0
  BEGIN
    PRINT ''
    PRINT @ErrorMsg
	PRINT 'Rolling back transaction due to errors.'
	ROLLBACK TRAN
  END;
ELSE
  BEGIN
	PRINT 'Script Succeeded: Committing transaction'
	COMMIT TRAN
  END;

