CREATE FUNCTION [CDN].[DateToTS] (@dt DATETIME = NULL, @itscdn bit)
RETURNS INT
AS
BEGIN
  IF (@itscdn=1)
    RETURN DATEDIFF(ss, '1990-01-01', coalesce(@dt, getdate()))
  RETURN DATEDIFF(ss, '1800-12-28', coalesce(@dt, getdate()))
END
