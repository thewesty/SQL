select min(d.document_id) as minid, 

max(d.document_id) as maxid, 

count(1) as docs_to_ingest 

from document d

inner join document_text dt on dt.document_id=d.document_id 

inner join document_details dd on dd.document_id=d.document_id
where d.doc_state IN (2,3)

and dd.added_to_analytics_date is null

