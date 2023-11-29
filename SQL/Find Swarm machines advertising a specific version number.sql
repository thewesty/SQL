SELECT		distinct p.ID
FROM		swarm.PM p with(nolock) inner join 
			swarm.ServiceInstanceOnPM sip with(nolock) on p.ID = sip.PMID inner join
			swarm.ServiceInstance si with(nolock) on si.ID = sip.ServiceInstanceID inner join
			swarm.ServiceCapabilityClusterDefinition sccd with(nolock) on sccd.ServiceCapabilityClusterID = si.ServiceCapabilityClusterID inner join
			swarm.ServiceCapability sc with(nolock) on sc.ID = sccd.ServiceCapabilityID inner join
			swarm.Service s with(nolock) on s.ID = sc.ServiceID
WHERE		sc.Value='9.3.6.22'
order by p.ID


