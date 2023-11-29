swarm.addJob '<JobSpecification>
	<Priority>1</Priority>
	<Server>ED013_FTDMU01.nmatrix.com</Server>
	<Database>edmxSwarm_11_5</Database>
	<SID>
		<Service>
			<Name>EquivioProcessService</Name>
			<Capabilities>
				<Capability Name="Application version">7.5.0.56</Capability>
			</Capabilities>
		</Service>
	</SID>
	<Configuration ServiceName="EquivioProcessService">
		<EquivioConfiguration>
			<UserInterfaceData CaseName="eDMX7 Testing" ProjectName="AA0001 - Barr" ClientName="Allergan" DbDomain="EdmxDev" SwarmVersion="6.0.0.56" SwarmVersionID="39" QCImagerVersionID="" QCDmxServicesVersionID="" eDMXVersion="" DatabaseID="0" Database="" DcdHost="" DcdPort="0"></UserInterfaceData>
			<SourceDMXSettings>
				<DCD encrypted="True">
					<connection>
						<displayName>eDMxDev</displayName>
						<loginDomain>Admin Domain</loginDomain>
						<caseName>eDMxDev</caseName>
						<database>eDMxDevelopment</database>
						<databaseKey>50000103</databaseKey>
						<username>2i43r1Y8NidHyZFTzSpNGQ==</username>
						<password>6mWqipyN8AvuHP6y1ubv4g==</password>
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
					</connection>
				</DCD>
				<ODBC>
					<username>eDMxDev</username>
					<password>eDMxDev</password>
					<TNS>172.18.40.184:1521/UPIKM1</TNS>
				</ODBC>
			</SourceDMXSettings>
			<ProcessDocuments>
				<ResFile>Q:\Development\Malcolm\res\BVT_EquivioEDMXDev.res</ResFile>
			</ProcessDocuments>
			<Options>
				<Action>Process</Action>
				<EquiLevel>80</EquiLevel>
				<PivotPolicy>MaxWordCount</PivotPolicy>
				<ProcessType>Both</ProcessType>
				<Incremental></Incremental>
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
