CREATE FUNCTION [DateToClarion] (@dt DATETIME = NULL)
RETURNS INT
AS
BEGIN
        RETURN DATEDIFF(dd, '1800-12-28', coalesce(@dt, getdate()))
END
