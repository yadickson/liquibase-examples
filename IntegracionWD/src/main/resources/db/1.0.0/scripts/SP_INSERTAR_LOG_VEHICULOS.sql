CREATE PROCEDURE [dbo].[SP_INSERTAR_LOG_VEHICULOS]	@Entrada [nvarchar](4000),	@Codigo [nvarchar](20),	@Resultado [nvarchar] (50) OUTPUT,	@Mensaje [nvarchar](4000) OUTPUTASBEGIN TRY  	INSERT INTO [dbo].[LogVehiculos]	(		[Mensaje],
		[Codigo]	)	VALUES	(		@Entrada,		@Codigo	);	IF @@trancount > 0 COMMIT TRANSACTION;	SET @Resultado = 'EXITOSO';	SET @Mensaje = 'OK';
END TRYBEGIN CATCH	IF @@trancount > 0 ROLLBACK TRANSACTION;	SET @Resultado = 'FALLIDO';	SET @Mensaje = ERROR_PROCEDURE() + ' '+ ERROR_MESSAGE();
END CATCH