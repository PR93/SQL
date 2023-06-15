SELECT name, definition, type_desc 
FROM sys.sql_modules m 
INNER JOIN sys.objects o 
ON m.object_id=o.object_id
WHERE type_desc like '%function%' and definition like '%set xxx%' 

SELECT name, definition, type_desc 
FROM sys.sql_modules m 
INNER JOIN sys.objects o 
ON m.object_id=o.object_id
WHERE definition like '%update xxx%' 