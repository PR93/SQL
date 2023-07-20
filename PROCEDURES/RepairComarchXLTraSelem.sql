declare @zrdnumer int

declare kursor CURSOR FOR 
select top 1000 trs_zrdnumer from cdn.traselem

open kursor

FETCH NEXT FROM kursor into @zrdnumer

WHILE @@FETCH_STATUS = 0
   BEGIN 


	update cdn.MagSElem set MaS_ZrdLp=null, MaS_SubZrdLp=null where MaS_ZrdNumer=@zrdnumer
	update cdn.MagNag set MaN_ZrdNumer=@zrdnumer, MaN_ZrdTyp=@zrdtyp, MaN_ZrdFirma=1308673, MaN_ZrdLp=0 where MaN_GIDNumer=@magnumer and MaN_GIDTyp=@magtyp

	declare @trsgidlp int
	declare @trssubgidlp int
	declare @twrnumer int
	declare @ilosc decimal(19,4)

	
	declare kursor2 CURSOR FOR 
	select TrE_TwrNumer, TrS_Ilosc, TrS_GIDLp, TrS_SubGIDLp from cdn.TraSElem 
	inner join cdn.TraElem on TrS_GIDNumer=TrE_GIDNumer and TrS_GIDTyp=TrE_GIDTyp and TrS_GIDLp=TrE_GIDLp
	where TrS_GIDNumer=@zrdnumer 

	open kursor2

	FETCH NEXT FROM kursor2 into @twrnumer, @ilosc, @trsgidlp, @trssubgidlp

	WHILE @@FETCH_STATUS = 0
	   BEGIN 
		
			Update t
			Set t.MaS_ZrdLp = @trsgidlp, t.MaS_SubZrdLp=@trssubgidlp 
			From
			(
				select top 1 * from cdn.MagSElem where MaS_ZrdNumer=@zrdnumer and MaS_Ilosc=@ilosc and MaS_TwrNumer=@twrnumer 
					and MaS_ZrdLp is null and MaS_SubZrdLp is null --and MaS_GIDLp=@trsgidlp and MaS_SubGIDLp=@trssubgidlp
			) t

		  FETCH NEXT FROM kursor2 INTO @twrnumer, @ilosc, @trsgidlp, @trssubgidlp
	   END 

	CLOSE kursor2
	DEALLOCATE kursor2


	SET NOCOUNT OFF
					
      FETCH NEXT FROM kursor INTO @zrdnumer
   END 

CLOSE kursor 
DEALLOCATE kursor


SET NOCOUNT OFF
