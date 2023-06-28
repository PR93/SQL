CREATE FUNCTION [ClarionToDate] (@dt int)
RETURNS DATETIME
AS 
BEGIN
	return dateadd(day, @dt, '18001228')
END
