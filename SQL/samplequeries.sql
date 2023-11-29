swarm.addJob '<JobSpecification>
	<Name>TT6353_Test</Name>
	<Position>1</Position>
	<Server>etest1</Server>
	<Database>ORACLE-Edmx_Oracle</Database>
	<SID>
		<Service>
			<Name>eDataMatrix_service</Name>
			<Capabilities>
				<Capability Name="Languages">Unicode</Capability>
				<Capability Name="Application version">5.0.0.5</Capability>
			</Capabilities>
		</Service>
	</SID>
	<Configuration ServiceName="eDataMatrix_service">
	<eDataMatrixConfiguration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" MediaID="" Custodian="" Action="Export" Version="2.34.2.11" ClientName="" ProjectName="">
		<QCModuleDetails>
			<UpdateTopLevelStats>true</UpdateTopLevelStats>
		</QCModuleDetails>
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
		<CaptureText Enable="yes" Name="Text of Document" IncludeSubDocumentText="yes"/>
		<DigitalFingerprints Enable="yes" Name="eDMx: Digital fingerprint"/>
		<ProcessingCheckpoint>
			<edmxItem>0</edmxItem>
			<document/>
			<file/>
		</ProcessingCheckpoint>
		<ProcessFiles CopyFiles="true" Root="Q:\Development\Malcolm\TT6353\TT6353.pst" Action="Enumerate">
			<Sort By="Name" Ascending="yes"/>
			<Enumerate WithSubdirectories="true"/>
			<Extensions Action="Exclude">
				<ExcludeAttachments/>
				<AddExtension Value="*.exe"/>
				<AddExtension Value=" *.dll"/>
				<AddExtension Value=" *.lib"/>
			</Extensions>
			<DateRange Enable="no"/>
		</ProcessFiles>
		<DMX>
			<Access encrypted="True">
				<connection>
					<displayName>ORACLE-Edmx_Oracle</displayName>
					<domain>Admin Domain</domain>
					<database>ORACLE-Edmx_Oracle</database>
					<databaseKey>2500020</databaseKey>
					<username>xzBHj/2pLpSUXeViwWwzeA==</username>
					<password>UuJCFwA/ZenKpZzu+YPyHg==</password>
					<service>
						<serviceType>DCDServer</serviceType>
						<connectionType>Socket</connectionType>
						<port>5790</port>
						<order>0</order>
						<host>ed004-ftdcd01.nmatrix.com</host>
					</service>
				</connection>
			</Access>
			<DocPrefix Enable="yes" Name="MP_6353C_"/>
			<UpdateDocuments Enable="no" UpdateImages="no" UpdateNativeFile="no" UpdateFields="no" UpdateAllFields="no" FieldsFile="" LimitDocuments="no" DocumentsToUpdateFile=""/>
		</DMX>
		<CreateImages ImageMode="None" EnableFileSizeLimit="no" FileSizeLimit="2" ProvideDefaultIfNecessary="no">
			<NativePrinterSettings>
				<PaperSize>Letter</PaperSize>
			</NativePrinterSettings>
		</CreateImages>
		<CodeProperties Action="CodeAll"/>
		<CodeFixedDefaults/>
		<SendEmail Enable="false" Server="mail">
			<Regularly Enable="true" When="EveryHalfHour" Interval="15"/>
		</SendEmail>
		<ConditionalCoding Enable="false" FieldName="" FieldValue=""/>
		<FileTypeSpecific>
			<AddType Name="DMXImport">
				<Adjust Enable="true" AdjustFilesRelativeToImportFile="true" Validate="false"/>
			</AddType>
			<AddType Name="Microsoft Office">
				<excel-imaging LimitIsEnabled="no" Limit="1">
					<color-mode>1-bit</color-mode>
					<print-as-intended>false</print-as-intended>
					<fit-to-pages-tall/>
					<fit-to-page-wide/>
					<center-vertically/>
					<orientation>landscape</orientation>
					<zoom>75</zoom>
					<replace-autofields>true</replace-autofields>
					<autodate-format>Use Text</autodate-format>
					<center-horizontally/>
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
					<print-gridlines/>
					<print-headings/>
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
					<print-black-and-white/>
					<allow-repteaded-rows/>
					<allow-repeated-columns/>
					<autopage-format>Renumber</autopage-format>
					<circular-ref-format>Circular Ref tag</circular-ref-format>
				</excel-imaging>
				<word-imaging LimitIsEnabled="no" Limit="1">
					<color-mode>1-bit</color-mode>
					<print-as-intended>false</print-as-intended>
					<fit-to-pages-tall/>
					<fit-to-page-wide/>
					<center-vertically/>
					<orientation>portrait</orientation>
					<zoom>1</zoom>
					<replace-autofields>true</replace-autofields>
					<autodate-format>Use Text</autodate-format>
					<center-horizontally/>
					<disable-macros>true</disable-macros>
					<disble-update-links>true</disble-update-links>
					<print-track-changes>false</print-track-changes>
					<scale-by-percent/>
					<paper-size/>
					<extract-native-subtext>false</extract-native-subtext>
					<remove-headers-footers>false</remove-headers-footers>
					<print-comments/>
					<print-metadata/>
					<print-hidden/>
				</word-imaging>
				<powerpoint-imaging LimitIsEnabled="no" Limit="1">
					<color-mode>1-bit</color-mode>
					<print-slides>false</print-slides>
					<print-handouts>false</print-handouts>
					<print-speakernotes>true</print-speakernotes>
					<print-outline>false</print-outline>
					<print-as-intended>false</print-as-intended>
					<fit-to-pages-tall/>
					<fit-to-page-wide/>
					<center-vertically/>
					<orientation>landscape</orientation>
					<zoom/>
					<replace-autofields>true</replace-autofields>
					<autodate-format>Use Text</autodate-format>
					<center-horizontally/>
					<disable-macros>true</disable-macros>
					<disble-update-links>true</disble-update-links>
					<print-track-changes>false</print-track-changes>
					<scale-by-percent/>
					<paper-size>Letter</paper-size>
					<extract-native-subtext>false</extract-native-subtext>
					<remove-headers-footers>false</remove-headers-footers>
					<print-metadata/>
					<print-comments/>
					<print-hidden/>
				</powerpoint-imaging>
			</AddType>
			<AddType Name="Outlook">
				<Extract TryRTF="false" TryStylizedText="false" OmitTinyImageAttachments="false"/>
				<Archives>
					<ProcessItems All="Yes" AllWithAttachments="Yes">
						<Types/>
					</ProcessItems>
				</Archives>
			</AddType>
			<AddType Name="Lotus Notes">
				<Extract TryRTF="true" TryStylizedText="false" OmitTinyImageAttachments="false"/>
				<Archives>
					<ProcessItems All="Yes" AllWithAttachments="Yes">
						<Types/>
					</ProcessItems>
				</Archives>
			</AddType>
		</FileTypeSpecific>
		<InputProcessing>
			<FingerprintsExclusions>
				<FingerprintFile>C:\FiEx.txt</FingerprintFile>
			</FingerprintsExclusions>
			<DirectoryCoding crop="false" cropDepth="0"/>
			<ExtractAttachedImages>
				<Documents Extract="yes">
					<MinSize>0</MinSize>
				</Documents>
				<Email Extract="yes">
					<MinSize>0</MinSize>
				</Email>
			</ExtractAttachedImages>
		</InputProcessing>
		<CustomFingerprints Enable="no"/>
		<FieldMappingDetails FieldMapFileName="" FieldMapIsEnabled="No"/>
	</eDataMatrixConfiguration>
	</Configuration>
	<Attributes>
  </Attributes>
	<MaxNumMachines>10</MaxNumMachines>
</JobSpecification>', ''

swarm.executeAsynchronizeTransaction
swarm.syncScheduler
--insert into swarm.pm (ID, Online) Values (172017008042, 1)

select * from [swarm].[Assignment] WITH (nolock) where ID = 224171 

select * from swarm.View_ActiveAssignments order by JobID desc 
select * from swarm.View_ActiveAssignments where JobFragmentID NOT IN (75308, 75286, 75339,75386,75446) order by JobID

select * from swarm.jobconfiguration with(nolock) where jobID = 2662
select * from swarm.jobFragment where jobid = 924 and v1 = 1
select * from swarm.jobfragment with(nolock) where ID = 13814

select * from swarm.jobfragment with(nolock) where jobID = 120 and state = 6

select * from swarm.jobfragment with(nolock) where jobID = 924 and state != 5 and ServiceCapabilityClusterID != 73
select * from swarm.assignment with(nolock) where jobfragmentID = 14394

select * from swarm.assignment where JobID = 62 and reasonforfailure is not null
select * from swarm.job with(nolock) where id = 62

select * from swarm.jobFragment with(nolock) where name like '%OCR QC fragment%'
select COUNT (completedtime) from swarm.jobFragment with(nolock) where name like '%QC%' and JobID = 192 and completedtime <> '' and concludedtime is NULL
select * from swarm.jobFragment with(nolock) where name like '%QC%' and JobID > 15650 and completedtime <> '' and concludedtime is NULL

(2602, 2603, 2606, 2607, 2662, 2807, 2813)


select * from swarm.pm with(nolock) where online = 1
select * from swarm.jobconfiguration with(nolock) where jobID = 151

--update swarm.jobfragment set state = 0 where jobID = 35
--update swarm.job set State = 3 where id = 129

--update swarm.assignment set State = 7 where id = 64619


--update swarm.job set Position = 1 where ID = 98
--update swarm.pm set Online = 0 where ID = 172017008042
--update swarm.pm set Online = 0 where ID = 172017008149
--update swarm.pm set Online = 1 where Online = 0
--update swarm.pm set Online = 0 where ID = 172018040164
--update swarm.pm set Online = 1 where ID = 172018040166
--update swarm.pm set Online = 1 where ID = 172018040168
--update swarm.pm set Online = 0 where ID = 172018040159 
--update swarm.pm set Online = 0 where ID = 172017008015
--update swarm.service set Allocation = 40 where ID = 2 

select AVG( executionTime) from swarm.Assignments
select * from swarm.Job with(nolock) where state NOT IN (0, 2, 3)
select * from swarm.Job with(nolock) where name = 'QC_Test'
select * from swarm.Job with(nolock) where id = 740
select * from swarm.JobConfiguration with(nolock) where jobID = 98
select * from swarm.Job with(nolock) where state not in (2, 3) 
select * from swarm.JobFragment with(nolock) where jobid = 836
select * from swarm.JobRequirement with(nolock) where jobid = 1682
select * from swarm.ReasonForFailure with(nolock) where ID = 134787
select * from swarm.JobFragmentServiceCapability with(nolock)
select * from swarm.JobAttribute with(nolock) where jobID = 15230
select * from swarm.SIDCapability with(nolock)
select * from swarm.Communicator with(nolock)
select * from swarm.Scheduler with(nolock)
select COUNT (distinct IP )from PM with(nolock) where online = 1
select * from swarm.Assignment with(nolock) where reasonForFailureID in (19, 881,912, 939)

select * from swarm.scheduler with(nolock)
select * from swarm.JobConfiguration with(nolock) where id = 1682
select DISTINCT memo as docno, jobFragmentID, jobFragment.state, reasonforfailureid from assignments with(nolock), jobfragment with(nolock) where jobfragment.state <> 5 and assignments.jobfragmentID = jobfragment.id
select * from swarm.JobFragment with(nolock) where HasFinalFragment = 1
select * from swarm.jobfragment, swarm.Assignment with(nolock) where swarm.assignment.jobID = 214 and swarm.assignment.state = 4 AND swarm.assignment.jobfragmentid = swarm.jobfragment.id
select * from swarm.JobFragment with(nolock) where name like '%qc%'
select COUNT (distinct PMID) from swarm.assignment with(nolock) where jobID = 2179 and state = 6
select distinct pmID from swarm.PMcapability, swarm.sidcapability, swarm.sidname, PM where swarm.sidname.id = 12 and swarm.sidname.id = swarm.sidcapability.sidnameid and swarm.sidcapability.id = swarm.pmcapability.capability and pmid = swarm.pm.ip and swarm.pm.online = 1

