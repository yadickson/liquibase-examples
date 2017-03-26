CREATE PROCEDURE [dbo].[LogTransito]	@Entrada [nvarchar](4000),	@Codigo [varchar](20),	@Resultado [varchar] (10) OUTPUT,	@Mensaje [nvarchar](4000) OUTPUTASBEGIN TRY  	INSERT INTO [dbo].[LogConsultaTransito]	(		[Mensaje],		[Codigo]	)	VALUES	(		@Entrada,		@Codigo	);	IF @@trancount > 0 COMMIT TRANSACTION;	SET @Resultado = 'EXITOSO';	SET @Mensaje = 'OK';END TRYBEGIN CATCH	IF @@trancount > 0 ROLLBACK TRANSACTION;	SET @Resultado = 'FALLIDO';	SET @Mensaje = ERROR_PROCEDURE() + ' '+ ERROR_MESSAGE();END CATCH