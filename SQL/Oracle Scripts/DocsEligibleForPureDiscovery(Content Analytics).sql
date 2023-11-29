Get access to their case and run the query below.
If Unicode text size is the issue (e.g. users are counting characters rather than bytes when they build their expected doc list), then we’ll see the min_txt_len be around 8MB, rather than 16MB.
Also, if the count(0) column doesn’t match the 789 docs they’re expecting, remove the text length > 0 clause and see if there are docs with empty text that they’re counting.

select count(0)
     , min(dbms_lob.getlength(dt.document_text)) as min_txt_len
     , max(dbms_lob.getlength(dt.document_text)) as max_txt_len
  from document doc
  join document_text dt
    on dt.document_id = doc.document_id
  join document_details dd
    on dd.document_id = doc.document_id
where dd.added_to_analytics_date is null               -- hasn't been added to analytics
   and doc.doc_state = 2                               -- in the ECA state
   and dt.document_text is not null                    -- has text
   and dbms_lob.getlength(dt.document_text) > 0        -- text isn't empty
   and dbms_lob.getlength(dt.document_text) < 16277216 -- text isn't too big
