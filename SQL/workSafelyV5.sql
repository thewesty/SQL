select * from swarm.jobconfiguration where jobid = 1362

swarm.addJob '<JobSpecification>
	<Priority>1</Priority>
	<Server>ED013_FTDMU01.nmatrix.com</Server>
	<Database>edmxSwarm_11_5</Database>
	<SID>
		<Service>
			<Name>EquivioProcessService</Name>
		</Service>
	</SID>
	<Configuration ServiceName="EquivioProcessService">
		<EquivioConfiguration>
			<UserInterfaceData CaseName="Csharp4" ProjectName="A Bostic Ch 11 TCMS Web" ClientName="Luper, Neidenthal &amp; Logan LLC" DbDomain="Csharp_DmxServer" SwarmVersion="6.0.0.5" SwarmVersionID="442" QCImagerVersionID="" QCDmxServicesVersionID="" eDMXVersion="" DatabaseID="0" Database="" DcdHost="" DcdPort="0"></UserInterfaceData>
			<SourceDMXSettings>
				<DCD encrypted="True">
					<connection>
						<displayName>Csharp4_DmxServer4</displayName>
						<loginDomain>Admin Domain</loginDomain>
						<caseName>Csharp4</caseName>
						<database>DmxServer4</database>
						<databaseKey>4000441</databaseKey>
						<username>UwpmUw1/G4wutIGSmVpBqw==</username>
						<password>zdZ8YnzTpdLIJS941HSCYg==</password>
						<host>ED013-FTDMU01.nmatrix.com</host>
						<port>5782</port>
						<maxConnections>1000000</maxConnections>
						<clientHost></clientHost>
						<clientIp></clientIp>
						<clientUsername></clientUsername>
						<service>
							<serviceType>DCDServer</serviceType>
							<connectionType>Socket</connectionType>
							<port>5790</port>
							<order>0</order>
							<host>ed004-ftdcd01.nmatrix.com</host>
							<maxConnections>1000000</maxConnections>
						</service>
					</connection>
				</DCD>
				<ODBC>
					<username>CSHARP4_DMXSERVER4</username>
					<password>Csharp4_DmxServer4</password>
					<TNS>(DESCRIPTION=(LOAD_BALANCE=off)(ADDRESS=(PROTOCOL=tcp)(HOST=ed013-qaraca1)(PORT=1521))(ADDRESS=(PROTOCOL=tcp)(HOST=ed013-qaraca2)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=usp01qa1)))</TNS>
				</ODBC>
			</SourceDMXSettings>
			<ProcessDocuments>
				<ResFile>q:\Development\isa\temp\round2.csv</ResFile>
			</ProcessDocuments>
			<Options>
				<Action>Process</Action>
				<EquiLevel>80</EquiLevel>
				<PivotPolicy>MaxWordCount</PivotPolicy>
				<ProcessType>Both</ProcessType>
				<Incremental></Incremental>
			</Options>
			<LicenseServer>
				<host>172.18.40.243</host>
				<port>2000</port>
			</LicenseServer>
			<EquivioDBSettings>
				<server>172.18.40.153</server>
				<username>WJEfQDj3KhayNb4B8Y4SBdqEZFujfmOIgb00TV4jDYg=</username>
				<password>rj+t810uzOQ8UGZSmhRwFA==</password>
				<dbName>CSharp4_Isa</dbName>
			</EquivioDBSettings>
			<CaseFolder>Q:\Development\Isa\EquivioCaseFolders\CSharp4_Isa</CaseFolder>
		</EquivioConfiguration>
	</Configuration>
	<Name>Isa Equivio Test</Name>
	<Attributes>
    </Attributes>
	<MaxNumMachines>10</MaxNumMachines>
</JobSpecification>', ''





select * from swarm.jobfragment where jobid = 2045
--update swarm.job set State = 3 where id =2049


select * From swarm.pm where online = 1
--update swarm.pm set online = 0 where id != 172017008124

select max(id) from swarm.job

select * from swarm.scheduler

--update swarm.scheduler set online = 0 where ip != '172.18.40.36'

--<Capability Name="Languages">Unicode</Capability>

select max(id) from swarm.job
select * from swarm.jobfragment with (nolock) where jobid = 2027

select distinct reasonforfailure from swarm.assignment with (nolock) where reasonforfailure != ''



swarm.syncScheduler
select max(ID) from swarm.job
--insert into swarm.pm (ID, Online) Values (172018040157, 1)

select MAX( CompletedTime - StartTime) from swarm.JobFragment with(nolock) where jobID = 1940 
select * from swarm.JobFragment with(nolock) where jobID = 1942 and ( CompletedTime - StartTime) = '1900-01-01 00:21:21.620'
select * from swarm.JobFragment with(nolock) where jobID = 1916 and v9 = 36844
select MAX( v9 ) from swarm.JobFragment with(nolock) where jobID = 1916 
select AVG (v9) from swarm.JobFragment with(nolock) where jobID = 1069 

select ID, (CompletedTime - StartTime) as Duration, v9, name from swarm.JobFragment with(nolock) where jobID = 1069 
select Max (CompletedTime - StartTime) from swarm.JobFragment with(nolock) where jobID = 1069 and v9 < 5000

select * from [swarm].[Assignment] WITH (nolock) where ID = 224171 
select * from swarm.View_ActiveAssignments order by JobID desc
update swarm.assignment set state = 5 where ID in (select ID from swarm.View_ActiveAssignments) 
select * from swarm.View_ActiveAssignments where JobFragmentID NOT IN (75308, 75286, 75339,75386,75446) order by JobID

select * from swarm.jobconfiguration with(nolock) where jobID = 2662
select * from swarm.jobFragment where jobid = 1892 and v1 = 1
select * from swarm.jobfragment with(nolock) where ID = 1595

select * from swarm.jobfragment with(nolock) where jobID = 1015 and state = 6

select * from swarm.jobfragment with(nolock) where jobID = 1875 and state != 5 and ServiceCapabilityClusterID != 73
select * from swarm.assignment with(nolock) where jobID = 1916 and jobfragmentID = 14394

select * from swarm.assignment where JobID = 1803 and reasonforfailure is not null
select * from swarm.job with(nolock) where id > 1845

select * from swarm.jobFragment with(nolock) where name like '%OCR QC fragment%'
select COUNT (completedtime) from swarm.jobFragment with(nolock) where name like '%QC%' and JobID = 192 and completedtime <> '' and concludedtime is NULL
select * from swarm.jobFragment with(nolock) where name like '%QC%' and JobID > 15650 and completedtime <> '' and concludedtime is NULL

(2602, 2603, 2606, 2607, 2662, 2807, 2813)

select * from swarm.jobconfiguration with(nolock) where jobID = 1220

--update swarm.jobfragment set state = 0 where jobID = 35

--update swarm.assignment set State = 7 where id = 64619

select * from swarm.pm with(nolock) where online = 1

--update swarm.job set Position = 1 where ID = 98
--update swarm.pm set Online = 0 where ID = 172017008042
--update swarm.pm set Online = 0 where ID = 172017008146
--update swarm.pm set Online = 0 where ID = 172017008149
--update swarm.pm set Online = 1 where ID = 172018040009
--update swarm.pm set Online = 1 where ID = 172018040006
--update swarm.pm set Online = 0 where ID = 172018040157
--update swarm.pm set Online = 1 where ID = 172018040166
--update swarm.pm set Online = 0 where ID = 172018040160
--update swarm.pm set Online = 1 where ID = 172018040168
--update swarm.pm set Online = 0 where ID = 172018040159 
--update swarm.pm set Online = 0 where ID = 172018040159 
--update swarm.pm set Online = 0 where ID = 172017008124
--update swarm.pm set Online = 0 where ID = 172018042200
--update swarm.service set Allocation = 40 where ID = 2 


--update swarm.pm set online = 0 where id != 172018040006
--update swarm.pm set online = 1 where id = 172018040006
--update swarm.pm set online = 0 where id != 172018042124
--update swarm.pm set online = 0 where id = 172017008124


--insert into swarm.pm values ('172018042126', 1)

select AVG( executionTime) from swarm.Assignments
select * from swarm.Job with(nolock) where state NOT IN (0, 2, 3)
select * from swarm.Job with(nolock) where name = 'QC_Test'
select * from swarm.Job with(nolock) where id > 720
select * from swarm.JobConfiguration with(nolock) where jobID = 98
select * from swarm.Job with(nolock) where state not in (2, 3) 
select * from swarm.JobFragment with(nolock) where jobid = 1224
select * from swarm.JobRequirement with(nolock) where jobid = 1682
select * from swarm.ReasonForFailure with(nolock) where ID = 134787
select * from swarm.JobFragmentServiceCapability with(nolock)
select * from swarm.JobAttribute with(nolock) where jobID = 15230
select * from swarm.SIDCapability with(nolock)
select * from swarm.Communicator with(nolock)
select * from swarm.Scheduler with(nolock)
select COUNT (distinct IP )from PM with(nolock) where online = 1
select * from swarm.Assignment with(nolock) where reasonForFailureID in (19, 881,912, 939)
select * from swarm.assignment where reasonforfailure like '%301%'
select * from swarm.communicator with(nolock)
select * from swarm.JobConfiguration with(nolock) where id = 1682
select DISTINCT memo as docno, jobFragmentID, jobFragment.state, reasonforfailureid from assignments with(nolock), jobfragment with(nolock) where jobfragment.state <> 5 and assignments.jobfragmentID = jobfragment.id
select * from swarm.JobFragment with(nolock) where HasFinalFragment = 1
select * from swarm.jobfragment, swarm.Assignment with(nolock) where swarm.assignment.jobID = 214 and swarm.assignment.state = 4 AND swarm.assignment.jobfragmentid = swarm.jobfragment.id
select * from swarm.JobFragment with(nolock) where name like '%qc%'
select COUNT (distinct PMID) from swarm.assignment with(nolock) where jobID = 2179 and state = 6
select distinct pmID from swarm.PMcapability, swarm.sidcapability, swarm.sidname, PM where swarm.sidname.id = 12 and swarm.sidname.id = swarm.sidcapability.sidnameid and swarm.sidcapability.id = swarm.pmcapability.capability and pmid = swarm.pm.ip and swarm.pm.online = 1




swarm.addJob '<JobSpecification>
	<Priority>1</Priority>
	<Server>ED013_FTDMU01.nmatrix.com</Server>
	<Database>edmxSwarm_11_5</Database>
	<SID>
		<Service>
			<Name>eDataMatrix_service</Name>
			<Capabilities>
				<Capability Name="Application version">8.0.0.1</Capability>
			</Capabilities>
		</Service>
	</SID>
	<Configuration ServiceName="eDataMatrix_service">
<eDataMatrixConfiguration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" MediaID="C000004" Custodian="QA" Action="Export" Version="2.34.2.11" ProjectName="AE0001 - AT" ClientName="Accenture">
  <UserInterfaceData CaseName="" ProjectName="" ClientName="" DbDomain="EdmxDev" SwarmVersion="7.5.0.21" SwarmVersionID="44" QCImagerVersionID="" QCDmxServicesVersionID="" eDMXVersion="5" DatabaseID="0" Database="" DcdHost="" DcdPort="0">
    <QCSettings>
      <ProcessDocuments>
        <JobID>USE_CURRENT</JobID>
      </ProcessDocuments>
      <RequestedProcess>
        <Service>
          <Name>QCProcess_Service</Name>
        </Service>
      </RequestedProcess>
    </QCSettings>
  </UserInterfaceData>
  <QCModuleDetails>
    <UpdateTopLevelStats>true</UpdateTopLevelStats>
  </QCModuleDetails>
  <CaptureText Enable="yes" Name="Text of Document" IncludeSubDocumentText="yes" />
  <DigitalFingerprints Enable="yes" Name="eDMX: Digital fingerprint" HashAlgorithm="SHA-256" />
  <ProcessingCheckpoint>
    <edmxItem>0</edmxItem>
    <document />
    <file />
  </ProcessingCheckpoint>
  <ProcessFiles CopyFiles="true" Root="P:\" Action="Enumerate">
    <Sort By="Name" Ascending="yes" />
    <Enumerate WithSubdirectories="true" />
  </ProcessFiles>
  <DMX>
    <Access encrypted="True">
      <connection serverURI="net.tcp://ed016-dvedsrv05/EDServer/">
        <displayName>eDMxDev 14.0 (Node 5)</displayName>
        <domain>Admin Domain</domain>
        <database>eDMxDev 14.0 (Node 5)</database>
        <databaseKey>50000128</databaseKey>
        <username>AaoRhok3AANMwKeJbpiJNednJTDf1DVKbRwChlYz7/M=</username>
        <password>OASZE76kPfR80a+i5YOjIQ==</password>
        <service>
          <serviceType>DCDServer</serviceType>
          <connectionType>Socket</connectionType>
          <port>5790</port>
          <order>0</order>
          <host>ddev.nmatrix.com</host>
        </service>
        <imstoreConnectionInfo>USER ID=dev_imstore;PASSWORD=dev_imstore;DATA SOURCE=ed016-ftrc1an-cluster.amer.epiqcorp.com:1521/imstore.amer.epiqcorp.com;PERSIST SECURITY INFO=True;POOLING=True</imstoreConnectionInfo> 
	<serverEndpoints>
		<serverEndpoint name = "EDServer CodingFormService URI"  value = "net.tcp://ed016-dvedsrv05/EDServer/CodingFormService.svc/CodingFormService" />
		<serverEndpoint name = "EDServer ColumnSetService URI"  value = "net.tcp://ed016-dvedsrv05/EDServer/ColumnSetService.svc/ColumnSetService" />
		<serverEndpoint name = "EDServer DocumentListService URI"  value = "net.tcp://ed016-dvedsrv05/EDServer/DocumentListService.svc/DocumentListService" />
		<serverEndpoint name = "EDServer DocumentService URI"  value = "net.tcp://ed016-dvedsrv05/EDServer/DocumentService.svc/DocumentService" />
		<serverEndpoint name = "EDServer ExportXmlSettingService URI"  value = "net.tcp://ed016-dvedsrv05/EDServer/ExportXmlSettingService.svc/ExportXmlSettingService" />
		<serverEndpoint name = "EDServer FieldGroupService URI"  value = "net.tcp://ed016-dvedsrv05/EDServer/FieldGroupService.svc/FieldGroupService" />
		<serverEndpoint name = "EDServer FieldService URI"  value = "net.tcp://ed016-dvedsrv05/EDServer/FieldService.svc/FieldService" />
		<serverEndpoint name = "EDServer FolderService URI"  value = "net.tcp://ed016-dvedsrv05/EDServer/FolderService.svc/FolderService" />
		<serverEndpoint name = "EDServer ImageStoreService URI"  value = "net.tcp://ed016-dvedsrv05/EDServer/ImageStoreService.svc/ImageStoreService" />
		<serverEndpoint name = "EDServer MergeFieldService URI"  value = "net.tcp://ed016-dvedsrv05/EDServer/MergeFieldService.svc/MergeFieldService" />
		<serverEndpoint name = "EDServer SearchService URI"  value = "net.tcp://ed016-dvedsrv05/EDServer/SearchService.svc/SearchService" />
	</serverEndpoints>
      </connection>
    </Access>
    <DocPrefix Enable="yes" Name="QA" />
    <UpdateDocuments Enable="no" UpdateImages="no" UpdateNativeFile="no" UpdateFields="no" UpdateAllFields="no" FieldsFile="" LimitDocuments="no" DocumentsToUpdateFile="" />
  </DMX>
  <CreateImages ImageMode="All" EnableFileSizeLimit="no" FileSizeLimit="2" ProvideDefaultIfNecessary="no" OnlyVerifyPotentialRunIssues="">
    <NativePrinterSettings>
      <PaperSize>Letter</PaperSize>
    </NativePrinterSettings>
    <ImagePdfWithGhostScriptAsDefault>false</ImagePdfWithGhostScriptAsDefault>
  </CreateImages>
  <CodeProperties Action="CodeAll">
    <CodeSelected CodeRemaining="" />
  </CodeProperties>
  <CodeFixedDefaults>
    <AddFixedDefault FieldName="eDMX: Source">
      <AddValue>123</AddValue>
    </AddFixedDefault>
    <AddFixedDefault FieldName="EdataMedia">
      <AddValue>123</AddValue>
    </AddFixedDefault>
  </CodeFixedDefaults>
  <SendEmail Enable="false" Server="mail">
    <Regularly Enable="true" When="EveryHalfHour" Interval="15" />
  </SendEmail>
  <ConditionalCoding Enable="false" FieldName="" FieldValue="" />
  <FileTypeSpecific>
    <AddType Name="DMXImport">
      <Adjust Enable="true" AdjustFilesRelativeToImportFile="true" Validate="false" />
    </AddType>
    <AddType Name="Lotus Notes">
      <Extract TryRTF="true" TryHTML="false" TryText="false" OmitTinyImageAttachments="false" />
      <Archives>
        <ProcessItems All="Yes" AllWithAttachments="Yes">
          <Types />
        </ProcessItems>
      </Archives>
    </AddType>
    <AddType Name="Outlook">
      <Extract TryRTF="" TryStylizedText="false" OmitTinyImageAttachments="true" />
      <Archives>
        <ProcessItems All="Yes" AllWithAttachments="">
          <Types />
        </ProcessItems>
      </Archives>
    </AddType>
    <AddType Name="Microsoft Office">
      <excel-imaging LimitIsEnabled="no" Limit="1">
        <color-mode>1-bit</color-mode>
        <print-as-intended>false</print-as-intended>
        <fit-to-pages-tall />
        <fit-to-page-wide />
        <center-vertically />
        <orientation>landscape</orientation>
        <zoom>75</zoom>
        <replace-autofields>true</replace-autofields>
        <autodate-format>Use Text</autodate-format>
        <center-horizontally />
        <disable-macros>true</disable-macros>
        <disble-update-links>true</disble-update-links>
        <print-track-changes>false</print-track-changes>
        <scale-by-percent>true</scale-by-percent>
        <paper-size>Letter</paper-size>
        <extract-native-subtext>false</extract-native-subtext>
        <remove-headers-footers>false</remove-headers-footers>
        <print-comments>false</print-comments>
        <print-metadata>true</print-metadata>
        <print-hidden>true</print-hidden>
        <print-gridlines />
        <print-headings />
        <unhide-columns>true</unhide-columns>
        <unhide-rows>true</unhide-rows>
        <unhide-sheets>true</unhide-sheets>
        <ignore-printarea>true</ignore-printarea>
        <autofit-columns>true</autofit-columns>
        <autofit-rows>true</autofit-rows>
        <print-order>over-then-down</print-order>
        <remove-autopages>false</remove-autopages>
        <remove-autofilter>true</remove-autofilter>
        <remove-repteaded-rows>true</remove-repteaded-rows>
        <remove-repeated-columns>true</remove-repeated-columns>
        <print-black-and-white />
        <allow-repteaded-rows />
        <allow-repeated-columns />
        <autopage-format>Renumber</autopage-format>
        <circular-ref-format>Circular Ref tag</circular-ref-format>
      </excel-imaging>
      <word-imaging LimitIsEnabled="no" Limit="1">
        <color-mode>1-bit</color-mode>
        <print-as-intended>false</print-as-intended>
        <fit-to-pages-tall />
        <fit-to-page-wide />
        <center-vertically />
        <orientation>portrait</orientation>
        <zoom>1</zoom>
        <replace-autofields>true</replace-autofields>
        <autodate-format>Use Text</autodate-format>
        <center-horizontally />
        <disable-macros>true</disable-macros>
        <disble-update-links>true</disble-update-links>
        <print-track-changes>false</print-track-changes>
        <scale-by-percent />
        <paper-size />
        <extract-native-subtext>false</extract-native-subtext>
        <remove-headers-footers>false</remove-headers-footers>
        <print-comments />
        <print-metadata />
        <print-hidden />
      </word-imaging>
      <powerpoint-imaging LimitIsEnabled="no" Limit="1">
        <color-mode>1-bit</color-mode>
        <print-slides>false</print-slides>
        <print-handouts>false</print-handouts>
        <print-speakernotes>true</print-speakernotes>
        <print-outline>false</print-outline>
        <print-as-intended>false</print-as-intended>
        <fit-to-pages-tall />
        <fit-to-page-wide />
        <center-vertically />
        <orientation>landscape</orientation>
        <zoom />
        <replace-autofields>true</replace-autofields>
        <autodate-format>Use Text</autodate-format>
        <center-horizontally />
        <disable-macros>true</disable-macros>
        <disble-update-links>true</disble-update-links>
        <print-track-changes>false</print-track-changes>
        <scale-by-percent />
        <paper-size>Letter</paper-size>
        <extract-native-subtext>false</extract-native-subtext>
        <remove-headers-footers>false</remove-headers-footers>
        <print-metadata />
        <print-comments />
        <print-hidden>true</print-hidden>
      </powerpoint-imaging>
    </AddType>
    <AddType Name="MailTypes">
      <ExtractAdvancedRecipients>true</ExtractAdvancedRecipients>
      <NormalizeSubjectField>true</NormalizeSubjectField>
    </AddType>
  </FileTypeSpecific>
  <CustomFingerprints Enable="no" />
  <FieldMappingDetails FieldMapFileName="" FieldMapIsEnabled="No" />
  <Equivio Enabled="no" TopLevelPath="" />
  <Nist Enabled="false" />
  <DetectLanguages />
  <ProcessingTimeZone HomeTimeZone="(GMT-05:00) Eastern Time (US &amp; Canada)">(GMT-05:00) Eastern Time (US &amp; Canada)</ProcessingTimeZone>
  <ExtractEmbeddings>
    <Word Enable="true" />
    <Excel Enable="true" />
    <PowerPoint Enable="true" />
    <LotusNotes Enable="true" />
    <Outlook Enable="true" />
    <Rtf Enable="true" />
  </ExtractEmbeddings>
  <InputProcessing ExcludeAttachments="true">
    <ExtractAttachedImages>
      <Documents Extract="no" />
      <Email Extract="yes">
        <MinSize>15</MinSize>
      </Email>
    </ExtractAttachedImages>
    <Extensions Action="Exclude">
      <ExcludeAttachments />
      <AddExtension Value="*.dll" />
      <AddExtension Value="*.exe" />
      <AddExtension Value="*.lib" />
    </Extensions>
    <DirectoryCoding crop="true" cropDepth="4" />
  </InputProcessing>
</eDataMatrixConfiguration>
	</Configuration>
	<Name>Isa V8 test</Name>
	<Attributes>
    </Attributes>
	<MaxNumMachines>100</MaxNumMachines>
</JobSpecification>', ''
