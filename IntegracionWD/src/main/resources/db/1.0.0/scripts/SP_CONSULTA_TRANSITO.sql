CREATE PROCEDURE [dbo].[SP_CONSULTA_TRANSITO]
	@FechaDesde [varchar](8),
	@FechaHasta [varchar](8),
	@Identificador [varchar](10),
	@Tipo [varchar](1),
	@Listado CURSOR OUTPUT,
	@Resultado [varchar](10) OUTPUT,
	@Mensaje [nvarchar](4000) OUTPUT
AS
BEGIN TRY

	IF @@trancount > 0 COMMIT TRANSACTION;
	SET @Resultado = 'EXITOSO';
	SET @Mensaje = 'OK';
	  
END TRY
BEGIN CATCH
	
	IF @@trancount > 0 ROLLBACK TRANSACTION;
	SET @Resultado = 'FALLIDO';
	SET @Mensaje = ERROR_PROCEDURE() + ' '+ ERROR_MESSAGE(); 
	
END CATCH

