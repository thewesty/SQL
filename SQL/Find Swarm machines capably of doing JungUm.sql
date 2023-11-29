select distinct(pmid) From swarm.serviceinstanceonPM where serviceinstanceid in
(
   select id from swarm.serviceinstance where servicecapabilityclusterid in
   (
      select distinct(servicecapabilityclusterid) From swarm.servicecapabilityclusterdefinition where servicecapabilityid in
      (
         select id from swarm.servicecapability where serviceid in
         (
            select id From swarm.service where name like '%jungum%'
         )
      )
   )
)
order by pmid