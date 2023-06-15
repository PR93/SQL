SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [CDN].[DAYS_FROM](

@d1 datetime,
@d2 datetime

)

Returns  int
AS
BEGIN

DECLARE @Counter int = datediff(DAY,@d1 ,@d2 )

DECLARE @C int = 0
DECLARE @SUM int = 0


 WHILE  @Counter > 0
  begin
 SET @SUM = @SUM + IIF(DATENAME(dw, 

 DATEADD(day,@c,@d1))IN('Sunday','Monday','Tuesday','Wednesday','Thursday'),1,0)



SET @Counter = @Counter - 1
set @c = @c +1
end

return  @Sum

END