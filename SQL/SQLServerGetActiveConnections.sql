-- Get logins that are connected and how many sessions they have (Connection Counts) 
SELECT 
    login_name 
  , [program_name] 
  , COUNT( session_id ) AS [session_count] 
FROM 
    sys.dm_exec_sessions 
GROUP  BY 
    login_name 
    , [program_name] 
ORDER  BY 
    COUNT( session_id ) DESC;
