swarm.addJob '<JobSpecification>
	<Name>QC_Test</Name>
	<Priority>1</Priority>
	<Server>ED013_FTDMU01.nmatrix.com</Server>
	<Database>Second_DMX12_0</Database>
	<SID>
		<Service>
			<Name>QCService</Name>
			<Capabilities>
				<Capability Name="Languages">Unicode</Capability>
				<Capability Name="Application version">8.0.0.2</Capability>
			</Capabilities>
		</Service>
	</SID>
	<Configuration ServiceName="Imager">
		<eDataMatrixConfiguration MediaID="" Custodian="" Action="Export" Version="2.34.2.1" ProjectName="" ClientName="">
			<QCModuleDetails>
				<UpdateTopLevelStats>false</UpdateTopLevelStats>
			</QCModuleDetails>
			<DMX>
				<Access encrypted="True">
					<connection>
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
							<serverEndpoint name="EDServer CodingFormService URI" value="net.tcp://172.17.161.45/EDServer/CodingFormService.svc/CodingFormService" /> 
							<serverEndpoint name="EDServer ColumnSetService URI" value="net.tcp://172.17.161.45/EDServer/ColumnSetService.svc/ColumnSetService" /> 
							<serverEndpoint name="EDServer DocumentListService URI" value="net.tcp://172.17.161.45/EDServer/DocumentListService.svc/DocumentListService" /> 
							<serverEndpoint name="EDServer DocumentService URI" value="net.tcp://172.17.161.45/EDServer/DocumentService.svc/DocumentService" /> 
							<serverEndpoint name="EDServer ExportXmlSettingService URI" value="net.tcp://172.17.161.45/EDServer/ExportXmlSettingService.svc/ExportXmlSettingService" /> 
							<serverEndpoint name="EDServer FieldGroupService URI" value="net.tcp://172.17.161.45/EDServer/FieldGroupService.svc/FieldGroupService" /> 
							<serverEndpoint name="EDServer FieldService URI" value="net.tcp://172.17.161.45/EDServer/FieldService.svc/FieldService" /> 
							<serverEndpoint name="EDServer FolderService URI" value="net.tcp://172.17.161.45/EDServer/FolderService.svc/FolderService" /> 
							<serverEndpoint name="EDServer ImageStoreService URI" value="net.tcp://172.17.161.45/EDServer/ImageStoreService.svc/ImageStoreService" /> 
							<serverEndpoint name="EDServer MergeFieldService URI" value="net.tcp://172.17.161.45/EDServer/MergeFieldService.svc/MergeFieldService" /> 
							<serverEndpoint name="EDServer SearchService URI" value="net.tcp://172.17.161.45/EDServer/SearchService.svc/SearchService" /> 
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
			<FileTypeSpecific>
				<AddType Name="DMXImport">
					<Adjust Enable="true" AdjustFilesRelativeToImportFile="true" Validate="false"/>
				</AddType>
				<AddType Name="Lotus Notes">
					<Extract TryRTF="true" TryStylizedText="true" OmitTinyImageAttachments="false"/>
					<Archives>
						<ProcessItems All="Yes" AllWithAttachments="Yes">
							<Types/>
						</ProcessItems>
					</Archives>
				</AddType>
				<AddType Name="Outlook">
					<Extract TryRTF="true" TryStylizedText="true" OmitTinyImageAttachments="false"/>
					<Archives>
						<ProcessItems All="Yes" AllWithAttachments="Yes">
							<Types/>
						</ProcessItems>
					</Archives>
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
						<print-track-changes>true</print-track-changes>
						<scale-by-percent>true</scale-by-percent>
						<paper-size>Letter</paper-size>
						<extract-native-subtext>false</extract-native-subtext>
						<remove-headers-footers>false</remove-headers-footers>
						<print-comments>true</print-comments>
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
						<print-track-changes>true</print-track-changes>
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
						<print-track-changes>true</print-track-changes>
						<scale-by-percent/>
						<paper-size>Letter</paper-size>
						<extract-native-subtext>false</extract-native-subtext>
						<remove-headers-footers>false</remove-headers-footers>
						<print-metadata/>
						<print-comments/>
						<print-hidden/>
					</powerpoint-imaging>
				</AddType>
			</FileTypeSpecific>
		</eDataMatrixConfiguration>
	</Configuration>
	<Configuration ServiceName="QCService">
		<QCServicesSettings>
	<DMXStartSettings encrypted="True">
		<connection>
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
				<serverEndpoint name="EDServer CodingFormService URI" value="net.tcp://172.17.161.45/EDServer/CodingFormService.svc/CodingFormService" /> 
				<serverEndpoint name="EDServer ColumnSetService URI" value="net.tcp://172.17.161.45/EDServer/ColumnSetService.svc/ColumnSetService" /> 
				<serverEndpoint name="EDServer DocumentListService URI" value="net.tcp://172.17.161.45/EDServer/DocumentListService.svc/DocumentListService" /> 
				<serverEndpoint name="EDServer DocumentService URI" value="net.tcp://172.17.161.45/EDServer/DocumentService.svc/DocumentService" /> 
				<serverEndpoint name="EDServer ExportXmlSettingService URI" value="net.tcp://172.17.161.45/EDServer/ExportXmlSettingService.svc/ExportXmlSettingService" /> 
				<serverEndpoint name="EDServer FieldGroupService URI" value="net.tcp://172.17.161.45/EDServer/FieldGroupService.svc/FieldGroupService" /> 
				<serverEndpoint name="EDServer FieldService URI" value="net.tcp://172.17.161.45/EDServer/FieldService.svc/FieldService" /> 
				<serverEndpoint name="EDServer FolderService URI" value="net.tcp://172.17.161.45/EDServer/FolderService.svc/FolderService" /> 
				<serverEndpoint name="EDServer ImageStoreService URI" value="net.tcp://172.17.161.45/EDServer/ImageStoreService.svc/ImageStoreService" /> 
				<serverEndpoint name="EDServer MergeFieldService URI" value="net.tcp://172.17.161.45/EDServer/MergeFieldService.svc/MergeFieldService" /> 
				<serverEndpoint name="EDServer SearchService URI" value="net.tcp://172.17.161.45/EDServer/SearchService.svc/SearchService" /> 
			</serverEndpoints>
		</connection>
	</DMXStartSettings>
	<ProcessDocuments>
		<ResFile>Q:\Development\Ilya\QCTesting.res</ResFile>
		<!-- <JobID>4059</JobID>-->
	</ProcessDocuments>
	<RequestedProcess>
		<Service>
			<Name>QCProcess_Service</Name>
		</Service>
		<ServiceConfiguration>
			<Processor>
				<Name>TOD</Name>
				<State>TOD_INIT</State>
				<ProcessorConfiguration>
					<RemoveImages>true</RemoveImages>
					<ImageFileExtensions>
						<Extension>pdf</Extension>
						<Extension>gif</Extension>
						<Extension>bmp</Extension>
						<Extension>tiff</Extension>
						<Extension>tif</Extension>
						<Extension>jpeg</Extension>
						<Extension>jpg</Extension>
					</ImageFileExtensions>
				</ProcessorConfiguration>
			</Processor>
			<!--<Processor>
				<Name>FILETYPE</Name>
				<State>FILETYPE_INIT</State>
			</Processor>-->
		</ServiceConfiguration>
	</RequestedProcess>
	<ApplicationVersions>
		<ApplicationVersion Name="Imager">8.0.0.2</ApplicationVersion>
		<ApplicationVersion Name="DmxServices">8.0.0.2</ApplicationVersion>
		<ApplicationVersion Name="OCR">8.9.9.9</ApplicationVersion>
	</ApplicationVersions>
</QCServicesSettings>
	</Configuration>
	<Configuration ServiceName="DmxServices">
		<DMXProcessorSettings>
			<DMXStartSettings encrypted="True">
				<connection>
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
						<serverEndpoint name="EDServer CodingFormService URI" value="net.tcp://172.17.161.45/EDServer/CodingFormService.svc/CodingFormService" /> 
						<serverEndpoint name="EDServer ColumnSetService URI" value="net.tcp://172.17.161.45/EDServer/ColumnSetService.svc/ColumnSetService" /> 
						<serverEndpoint name="EDServer DocumentListService URI" value="net.tcp://172.17.161.45/EDServer/DocumentListService.svc/DocumentListService" /> 
						<serverEndpoint name="EDServer DocumentService URI" value="net.tcp://172.17.161.45/EDServer/DocumentService.svc/DocumentService" /> 
						<serverEndpoint name="EDServer ExportXmlSettingService URI" value="net.tcp://172.17.161.45/EDServer/ExportXmlSettingService.svc/ExportXmlSettingService" /> 
						<serverEndpoint name="EDServer FieldGroupService URI" value="net.tcp://172.17.161.45/EDServer/FieldGroupService.svc/FieldGroupService" /> 
						<serverEndpoint name="EDServer FieldService URI" value="net.tcp://172.17.161.45/EDServer/FieldService.svc/FieldService" /> 
						<serverEndpoint name="EDServer FolderService URI" value="net.tcp://172.17.161.45/EDServer/FolderService.svc/FolderService" /> 
						<serverEndpoint name="EDServer ImageStoreService URI" value="net.tcp://172.17.161.45/EDServer/ImageStoreService.svc/ImageStoreService" /> 
						<serverEndpoint name="EDServer MergeFieldService URI" value="net.tcp://172.17.161.45/EDServer/MergeFieldService.svc/MergeFieldService" /> 
						<serverEndpoint name="EDServer SearchService URI" value="net.tcp://172.17.161.45/EDServer/SearchService.svc/SearchService" /> 
					</serverEndpoints>
				</connection>
			</DMXStartSettings>
			<UpdateTopLevelStats>false</UpdateTopLevelStats>
			<StarterFragment>true</StarterFragment>
		</DMXProcessorSettings>
	</Configuration>
	<Configuration ServiceName="OCR_service">
		<OcrServicesSetting>
			<SharedPath>Q:\Development\Ilya\SharedStorage</SharedPath>
			<IsUnicode>True</IsUnicode>
			<OcrJobSpec>
				<documentlistsize>1</documentlistsize>
				<input_type>image</input_type>
				<output_location>database</output_location>
				<output_textfield>Text of Document</output_textfield>
				<overwrite_text_output>true</overwrite_text_output>
				<engine_type>PRIME_OCR_ENGINE</engine_type>
				<options>&lt;OcrOptions&gt;50349049&lt;/OcrOptions&gt;</options>
				<status_fieldname>DMX: OCR Status</status_fieldname>
			</OcrJobSpec>
			<DatabaseSettings encrypted="True">
				<connection>
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
						<serverEndpoint name="EDServer CodingFormService URI" value="net.tcp://172.17.161.45/EDServer/CodingFormService.svc/CodingFormService" /> 
						<serverEndpoint name="EDServer ColumnSetService URI" value="net.tcp://172.17.161.45/EDServer/ColumnSetService.svc/ColumnSetService" /> 
						<serverEndpoint name="EDServer DocumentListService URI" value="net.tcp://172.17.161.45/EDServer/DocumentListService.svc/DocumentListService" /> 
						<serverEndpoint name="EDServer DocumentService URI" value="net.tcp://172.17.161.45/EDServer/DocumentService.svc/DocumentService" /> 
						<serverEndpoint name="EDServer ExportXmlSettingService URI" value="net.tcp://172.17.161.45/EDServer/ExportXmlSettingService.svc/ExportXmlSettingService" /> 
						<serverEndpoint name="EDServer FieldGroupService URI" value="net.tcp://172.17.161.45/EDServer/FieldGroupService.svc/FieldGroupService" /> 
						<serverEndpoint name="EDServer FieldService URI" value="net.tcp://172.17.161.45/EDServer/FieldService.svc/FieldService" /> 
						<serverEndpoint name="EDServer FolderService URI" value="net.tcp://172.17.161.45/EDServer/FolderService.svc/FolderService" /> 
						<serverEndpoint name="EDServer ImageStoreService URI" value="net.tcp://172.17.161.45/EDServer/ImageStoreService.svc/ImageStoreService" /> 
						<serverEndpoint name="EDServer MergeFieldService URI" value="net.tcp://172.17.161.45/EDServer/MergeFieldService.svc/MergeFieldService" /> 
						<serverEndpoint name="EDServer SearchService URI" value="net.tcp://172.17.161.45/EDServer/SearchService.svc/SearchService" /> 
					</serverEndpoints>
				</connection>
			</DatabaseSettings>
		</OcrServicesSetting>
	</Configuration>
	<Attributes>
  </Attributes>
	<MaxNumMachines>10</MaxNumMachines>
</JobSpecification>', ''

/** Stop a running job **/
--update swarm.job set State = 3 where state = 1 and id = 4354
--select State from swarm.job where id = 4354
/*
exec swarm.executeAsynchronizeTransaction
GO
exec swarm.applyJobTableUpdates
GO
*/
