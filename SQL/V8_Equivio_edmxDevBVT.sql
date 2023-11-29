swarm.addJob '<JobSpecification>
	<Priority>1</Priority>
	<Server>ED013_FTDMU01.nmatrix.com</Server>
	<Database>edmxSwarm_11_5</Database>
	<SID>
		<Service>
			<Name>EquivioProcessService</Name>
			<Capabilities>
				<Capability Name="Application version">8.0.0.0</Capability>
			</Capabilities>
		</Service>
	</SID>
	<Configuration ServiceName="EquivioProcessService">
		<EquivioConfiguration>
			<UserInterfaceData CaseName="eDMX7 Testing" ProjectName="AA0001 - Barr" ClientName="Allergan" DbDomain="EdmxDev" SwarmVersion="6.0.0.56" SwarmVersionID="39" QCImagerVersionID="" QCDmxServicesVersionID="" eDMXVersion="" DatabaseID="0" Database="" DcdHost="" DcdPort="0"/>
			<SourceDMXSettings>
				<DCD encrypted="True">
					<connection>
						<displayName>eDMxDev</displayName>
						<domain>Admin Domain</domain>
						<loginDomain>Admin Domain</loginDomain>
						<caseName>eDMxDev</caseName>
						<database>eDMxDevelopment</database>
						<databaseKey>50000128</databaseKey>
						<username>AaoRhok3AANMwKeJbpiJNednJTDf1DVKbRwChlYz7/M=</username>
						<password>OASZE76kPfR80a+i5YOjIQ==</password>
						<host>ddev</host>
						<port>5790</port>
						<maxConnections>1000000</maxConnections>
						<clientHost/>
						<clientIp/>
						<clientUsername/>
						<service>
							<serviceType>DCDServer</serviceType>
							<connectionType>Socket</connectionType>
							<port>5790</port>
							<order>0</order>
							<host>ddev.nmatrix.com</host>
							<maxConnections>1000000</maxConnections>
						</service>
						<imstoreConnectionInfo>USER ID=dev_imstore;PASSWORD=dev_imstore;DATA SOURCE=ed016-ftrc1an-cluster.amer.epiqcorp.com:1521/imstore.amer.epiqcorp.com;PERSIST SECURITY INFO=True;POOLING=True</imstoreConnectionInfo>
						<serverEndpoints>
							<serverEndpoint name="EDServer CodingFormService URI" value="net.tcp://172.17.161.45/EDServer/CodingFormService.svc/CodingFormService"/>
							<serverEndpoint name="EDServer ColumnSetService URI" value="net.tcp://172.17.161.45/EDServer/ColumnSetService.svc/ColumnSetService"/>
							<serverEndpoint name="EDServer DocumentListService URI" value="net.tcp://172.17.161.45/EDServer/DocumentListService.svc/DocumentListService"/>
							<serverEndpoint name="EDServer DocumentService URI" value="net.tcp://172.17.161.45/EDServer/DocumentService.svc/DocumentService"/>
							<serverEndpoint name="EDServer ExportXmlSettingService URI" value="net.tcp://172.17.161.45/EDServer/ExportXmlSettingService.svc/ExportXmlSettingService"/>
							<serverEndpoint name="EDServer FieldGroupService URI" value="net.tcp://172.17.161.45/EDServer/FieldGroupService.svc/FieldGroupService"/>
							<serverEndpoint name="EDServer FieldService URI" value="net.tcp://172.17.161.45/EDServer/FieldService.svc/FieldService"/>
							<serverEndpoint name="EDServer FolderService URI" value="net.tcp://172.17.161.45/EDServer/FolderService.svc/FolderService"/>
							<serverEndpoint name="EDServer ImageStoreService URI" value="net.tcp://172.17.161.45/EDServer/ImageStoreService.svc/ImageStoreService"/>
							<serverEndpoint name="EDServer MergeFieldService URI" value="net.tcp://172.17.161.45/EDServer/MergeFieldService.svc/MergeFieldService"/>
							<serverEndpoint name="EDServer SearchService URI" value="net.tcp://172.17.161.45/EDServer/SearchService.svc/SearchService"/>
						</serverEndpoints>
					</connection>
				</DCD>
				<ODBC>
					<username>eDMxDev</username>
					<password>eDMxDev</password>
					<TNS>172.17.188.92:1521/usp02dv.amer.epiqcorp.com</TNS>
				</ODBC>
			</SourceDMXSettings>
			<ProcessDocuments>
				<ResFile>Q:\Development\isa\temp\HavNFsAndImages.res</ResFile>
			</ProcessDocuments>
			<Options>
				<Action>Process</Action>
				<EquiLevel>80</EquiLevel>
				<PivotPolicy>MaxWordCount</PivotPolicy>
				<ProcessType>Both</ProcessType>
				<Incremental/>
			</Options>
			<LicenseServer>
				<host>192.168.32.34</host>
				<port>2000</port>
			</LicenseServer>
			<EquivioDBSettings>
				<server>172.17.161.40</server>
				<username>WJEfQDj3KhayNb4B8Y4SBdqEZFujfmOIgb00TV4jDYg=</username>
				<password>rj+t810uzOQ8UGZSmhRwFA==</password>
				<dbName>A</dbName>
			</EquivioDBSettings>
			<CaseFolder>Q:\Development\Malcolm\EquivioCaseFolders\A</CaseFolder>
		</EquivioConfiguration>
	</Configuration>
	<Name>MP Equivio Test</Name>
	<Attributes>
    </Attributes>
	<MaxNumMachines>10</MaxNumMachines>
</JobSpecification>', ''


swarm.addJob '<JobSpecification>
	<Priority>1</Priority>
	<Server>ED013_FTDMU01.nmatrix.com</Server>
	<Database>edmxSwarm_11_5</Database>
	<SID>
		<Service>
			<Name>EquivioExportService</Name>
			<Capabilities>
				<Capability Name="Application version">8.0.0.0</Capability>
			</Capabilities>
		</Service>
	</SID>	<Configuration ServiceName="EquivioExportService">
		<EquivioConfiguration>
			<LicenseServer>
				<host>192.168.32.29</host>
				<port>2000</port>
			</LicenseServer>
			<DestinationDMXSettings>
				<DCD encrypted="True">
					<connection>
						<displayName>eDMxDev</displayName>
						<domain>Admin Domain</domain>
						<loginDomain>Admin Domain</loginDomain>
						<caseName>eDMxDev</caseName>
						<database>eDMxDevelopment</database>
						<databaseKey>50000128</databaseKey>
						<username>AaoRhok3AANMwKeJbpiJNednJTDf1DVKbRwChlYz7/M=</username>
						<password>OASZE76kPfR80a+i5YOjIQ==</password>
						<host>ddev</host>
						<port>5790</port>
						<maxConnections>1000000</maxConnections>
						<clientHost/>
						<clientIp/>
						<clientUsername/>
						<service>
							<serviceType>DCDServer</serviceType>
							<connectionType>Socket</connectionType>
							<port>5790</port>
							<order>0</order>
							<host>ddev.nmatrix.com</host>
							<maxConnections>1000000</maxConnections>
						</service>
						<imstoreConnectionInfo>USER ID=dev_imstore;PASSWORD=dev_imstore;DATA SOURCE=ed016-ftrc1an-cluster.amer.epiqcorp.com:1521/imstore.amer.epiqcorp.com;PERSIST SECURITY INFO=True;POOLING=True</imstoreConnectionInfo>
						<serverEndpoints>
							<serverEndpoint name="EDServer CodingFormService URI" value="net.tcp://172.17.161.45/EDServer/CodingFormService.svc/CodingFormService"/>
							<serverEndpoint name="EDServer ColumnSetService URI" value="net.tcp://172.17.161.45/EDServer/ColumnSetService.svc/ColumnSetService"/>
							<serverEndpoint name="EDServer DocumentListService URI" value="net.tcp://172.17.161.45/EDServer/DocumentListService.svc/DocumentListService"/>
							<serverEndpoint name="EDServer DocumentService URI" value="net.tcp://172.17.161.45/EDServer/DocumentService.svc/DocumentService"/>
							<serverEndpoint name="EDServer ExportXmlSettingService URI" value="net.tcp://172.17.161.45/EDServer/ExportXmlSettingService.svc/ExportXmlSettingService"/>
							<serverEndpoint name="EDServer FieldGroupService URI" value="net.tcp://172.17.161.45/EDServer/FieldGroupService.svc/FieldGroupService"/>
							<serverEndpoint name="EDServer FieldService URI" value="net.tcp://172.17.161.45/EDServer/FieldService.svc/FieldService"/>
							<serverEndpoint name="EDServer FolderService URI" value="net.tcp://172.17.161.45/EDServer/FolderService.svc/FolderService"/>
							<serverEndpoint name="EDServer ImageStoreService URI" value="net.tcp://172.17.161.45/EDServer/ImageStoreService.svc/ImageStoreService"/>
							<serverEndpoint name="EDServer MergeFieldService URI" value="net.tcp://172.17.161.45/EDServer/MergeFieldService.svc/MergeFieldService"/>
							<serverEndpoint name="EDServer SearchService URI" value="net.tcp://172.17.161.45/EDServer/SearchService.svc/SearchService"/>
						</serverEndpoints>
					</connection>
				</DCD>
			</DestinationDMXSettings>
			<EquivioDBSettings>
				<server>172.17.161.40</server>
				<username>WJEfQDj3KhayNb4B8Y4SBdqEZFujfmOIgb00TV4jDYg=</username>
				<password>rj+t810uzOQ8UGZSmhRwFA==</password>
				<dbName>A</dbName>
			</EquivioDBSettings>
			<CaseFolder>Q:\Development\Malcolm\EquivioCaseFolders\A</CaseFolder>
			<EquivioRowRange start="-1" end="-1"></EquivioRowRange>
			<Options>
				<Action>Process</Action>
				<ProcessType>Both</ProcessType>
				<EquiLevel>80</EquiLevel>
				<PivotPolicy>MedianWordCount</PivotPolicy>
				<Incremental>True</Incremental>
			</Options>
		</EquivioConfiguration>
	</Configuration>
	<Name>test job</Name>
	<Attributes>
	</Attributes>
	<MaxNumMachines>10</MaxNumMachines>
</JobSpecification>', ''


exec swarm.applyJobTableUpdates
--update swarm.job set State = 3 where id = 4373
--update swarm.job set State = 3 where id = (select max(ID) from swarm.job)
select * from swarm.View_ActiveAssignments where jobID = 1502 order by JobID desc

select max(ID) from swarm.job
select * from swarm.JobFragment with(nolock) where jobID = (select max(ID) from swarm.job)
select * from swarm.assignment with(nolock) where jobID = (select max(ID) from swarm.job)

select * from swarm.serviceInstanceOnPM with(nolock) 
select * from swarm.JobFragment with(nolock) where jobID = 3476 and state != 5
select * from swarm.JobFragment with(nolock) where jobID = 25046 and ID = 46985721
select * from swarm.assignment with(nolock) where jobID = 3365		and ID = 46985721

select * from swarm.assignment with(nolock) where jobID =  3477 and ID  = 46048426

select jobFragmentID, reasonForFailure from swarm.assignment with(nolock) where jobfragmentID in ( select jobFragmentID from swarm.Assignment with(nolock) where jobID > 2180 and reasonforfailure is NOT NULL )
select * from swarm.job with(nolock) where name = 'MP Equivio Test' and ID > 2400 and NumFragmentsSucceeded > 0

** Service Capability  **********************************************************

select swarm.Service.name, swarm.ServiceCapability.name as capability, swarm.ServiceCapability.value from swarm.Service with (nolock), swarm.ServiceCapability with (nolock) 
	where swarm.ServiceCapability.Id in 
	(select ServiceCapabilityID from swarm.ServiceCapabilityClusterDefinition with (nolock) where ServiceCapabilityClusterID = 280) 
	and swarm.Service.ID = swarm.ServiceCapability.ServiceID

*****************************************************************	

select * from swarm.ServiceInstance with (nolock) where ID = 131
select * from swarm.ServiceInstance with (nolock) where ServiceCapabilityClusterID = 177
select * from swarm.ServiceInstanceOnPM with (nolock) where PMID = 172018042196


select * from swarm.assignment with(nolock) where jobID = 2154
select * from swarm.job with(nolock) where ID > 2800

select * from swarm.jobConfiguration with(nolock) where jobID = 1500

select * from swarm.jobAttribute with(nolock) where jobID = 1500

select * from swarm.service with(nolock) where ID  = 7
 
select * from swarm.assignment with(nolock) where jobID > 2180 and reasonforfailure is not null and pmid = 172018040007

select swarm.assignment.jobID, pmid, swarm.assignment.reasonforfailure, swarm.jobfragment.originalconfiguration, swarm.jobfragment.id as fragID from swarm.assignment with(nolock), swarm.jobfragment with(nolock) where swarm.jobfragment.jobID > 18643 and pmid = 172018040007 and swarm.jobfragment.ID = swarm.assignment.jobfragmentID

select * from swarm.JobFragment with(nolock) where ID = 383626

select * from swarm.jobconfiguration with(nolock) where jobID = 100448 

select * from swarm.jobfragment with(nolock) where jobid IN ( select jobID from swarm.assignment with(nolock) where reasonforfailure like '%Equivio process failed%' )
select DISTINCT pmid from swarm.assignment with(nolock) where jobid IN ( select jobID from swarm.assignment with(nolock) where reasonforfailure like '%Equivio process failed%' )

select * from swarm.jobFragment with(nolock) where jobID = 106351 and ID in (select jobFragmentID from swarm.assignment with(nolock) where jobID = 106351 and reasonforfailure is not null)
select * from swarm.assignment with(nolock) where jobID = 105890 and jobFragmentID in (select jobFragmentID from swarm.assignment with(nolock) where jobID = 105890 and reasonforfailure is not null)

select max (ExecutionTime) from swarm.assignment with(nolock) where jobID = 15912 and ExecutionTime > (select Min (ExecutionTime) from swarm.assignment with(nolock) where jobID = 15912)
 and reasonforfailure is null and jobFragmentID != 33989224

swarm.syncScheduler

select MIN( CompletedTime - StartTime) from swarm.JobFragment with(nolock) where jobID = 1987 
select * from swarm.JobFragment with(nolock) where jobID > 150 and ( CompletedTime - StartTime) = '1900-01-01 00:01:23.423'
select * from swarm.JobFragment with(nolock) where jobID = 81 and v9 = 36844
select MAX( v9 ) from swarm.JobFragment with(nolock) where jobID = 1916 
select AVG (v9) from swarm.JobFragment with(nolock) where jobID = 2589
select (CompletedTime - StartTime) from swarm.Job with(nolock) where ID = 1987
select ID, (CompletedTime - StartTime) as Duration, v9, name from swarm.JobFragment with(nolock) where jobID = 1987 
select Max (CompletedTime - StartTime) from swarm.JobFragment with(nolock) where jobID = 1069 and v9 < 5000

select * from [swarm].[Assignment] WITH (nolock) where ID = 200725 

update swarm.assignment set state = 5 where ID in (select ID from swarm.View_ActiveAssignments) 
select * from swarm.View_ActiveAssignments where JobFragmentID NOT IN (75308, 75286, 75339,75386,75446) order by JobID

select * from swarm.jobconfiguration with(nolock) where jobID = 1581
select * from swarm.jobFragment where jobid = 16 and v1 = 1
select * from swarm.jobfragment with(nolock) where ID = 4610071
select * from swarm.jobfragment with(nolock) where Name = 'QCProcess_TOD'

select * from swarm.jobfragment with(nolock) where jobID = 1015 and state = 6
select * from swarm.jobfragment with(nolock) where jobID = 2954 and name like '%OCR%'
select * from swarm.assignment with(nolock) where jobID = 105890 and reasonforfailure is not null
select * from swarm.assignment with (nolock) where jobfragmentid = 4354590
select * from swarm.assignment with (nolock) where ID = 18511360 

select * from swarm.jobfragment with (nolock) where jobID = 1581 and ID IN 
( select jobfragmentID from swarm.assignment with(nolock) where jobID = 1581 and reasonforfailure is not null )

select * from swarm.assignment with(nolock) where id = 198450 and reasonforfailure is not null
select distinct(JobID) from swarm.assignment with(nolock) where reasonforfailure like '%Value cannot be%'
select * from swarm.job with(nolock) where id > 18643

select * from swarm.jobFragment with(nolock) where name like '%OCR QC fragment%'
select COUNT (completedtime) from swarm.jobFragment with(nolock) where name like '%QC%' and JobID = 192 and completedtime <> '' and concludedtime is NULL
select * from swarm.jobFragment with(nolock) where name like '%QC%' and JobID > 15650 and completedtime <> '' and concludedtime is NULL

(2602, 2603, 2606, 2607, 2662, 2807, 2813)

select * from swarm.jobconfiguration with(nolock) where jobID = 1581

--update swarm.jobfragment set state = 0 where jobID = 35

--update swarm.assignment set State = 7 where id = 64619

select * from swarm.pm with(nolock) where online = 1
select * from swarm.pm with(nolock) where ID = 172017008042

--insert into swarm.pm (ID, Online) Values (172018042196, 1)

--update swarm.pm set Online = 0 where ID = 172017008017
--update swarm.pm set Online = 1 where ID = 172017008017
--update swarm.pm set Online = 0 where ID = 172017008042
--update swarm.pm set Online = 1 where ID = 172017008042
--update swarm.pm set Online = 0 where ID = 172017008146
--update swarm.pm set Online = 0 where ID = 172017008149
--update swarm.pm set Online = 1 where ID = 172018040009
--update swarm.pm set Online = 1 where ID = 172018040006
--update swarm.pm set Online = 0 where ID = 172018040055
--update swarm.pm set Online = 1 where ID = 172018040166
--update swarm.pm set Online = 0 where ID = 172018040160
--update swarm.pm set Online = 1 where ID = 172018040168
--update swarm.pm set Online = 0 where ID = 172018040159 
--update swarm.pm set Online = 0 where ID = 172018040159 
--update swarm.pm set Online = 0 where ID = 172017008124
--update swarm.pm set Online = 0 where ID = 172018040013 
--update swarm.pm set Online = 0 where ID = 172017161109
--update swarm.pm set Online = 1 where ID = 172017161109
--update swarm.pm set Online = 0 where ID = 172017161110
--update swarm.pm set Online = 1 where ID = 172017161110
--update swarm.pm set Online = 0 where ID = 172018042178
--update swarm.pm set Online = 1 where ID = 172018042195
--update swarm.pm set Online = 0 where ID = 172018042195
--update swarm.pm set Online = 1 where ID = 172018042196
--update swarm.pm set Online = 0 where ID = 172018042196
--update swarm.pm set Online = 1 where ID = 172018042197
--update swarm.pm set Online = 0 where ID = 172018042197
--update swarm.pm set Online = 1 where ID = 172018042198
--update swarm.pm set Online = 0 where ID = 172018042198
--update swarm.pm set Online = 1 where ID = 172018042199
--update swarm.pm set Online = 0 where ID = 172018042199

--update swarm.service set Allocation = 40 where ID = 2 

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

-- Oracle DB queries:
-- doc key: 		SELECT THEKEY,  NORMALIZEDNAME from OBJECTNAMETABLE where OBJECTDEFINITIONKEY = 4 and NORMALIZEDNAME = 'EDMXDEV'
-- TOD: 		SELECT VALUEKEY, VALUE From TEXTCATEGORYTABLE where categorykey = 24 and valuekey = 85
-- SELECT THEKEY FROM OBJECTDEFINITIONTABLE WHERE NORMALIZEDNAME = 'DOCUMENT' AND DATABASEKEY = (SELECT THEKEY FROM DATABASETABLE WHERE NORMALIZEDNAME = 'EDMXDEV' ) 
-- SELECT * FROM DATABASETABLE
-- SELECT THEKEY,  NORMALIZEDNAME from OBJECTNAMETABLE where OBJECTDEFINITIONKEY = 4 and THEKEY = 13656


