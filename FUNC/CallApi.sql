declare @Command varchar(max); set @Command = CONCAT('http://*:8084/api/Controller/', @Id);

Declare @Object as Int;
Declare @ResponseText as Varchar(8000);
Declare @HttpStatus int;


Exec sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
Exec sp_OAMethod @Object, 'open', NULL, 'POST',
                    @Command,
                    'false'
Exec sp_OAMethod @Object, 'send'
Exec sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT
EXEC sp_OAGetProperty @Object, 'status', @httpStatus OUT

Select @ResponseText, @HttpStatus

Exec sp_OADestroy @Object

--sp_configure 'show advanced options', 1;
--GO
--RECONFIGURE;
--GO
--sp_configure 'Ole Automation Procedures', 1;
--GO
--RECONFIGURE;
--GO

--add to the appropriate database user
--GRANT EXECUTE ON [sys].[sp_OACreate] TO [guest] 
--GRANT EXECUTE ON [sys].[sp_OAMethod] TO [guest]
--GRANT EXECUTE ON [sys].[sp_OAGetProperty] TO [guest]
--GRANT EXECUTE ON [sys].[sp_OADestroy] TO [guest]