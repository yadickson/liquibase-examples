CREATE PROCEDURE [dbo].[SP_CONSULTA_IDENTIFICADOR]
	@Identificador [varchar](10),
	@Tipo [varchar](1),
	@Id [varchar](20) OUTPUT,
	@Resultado [varchar](10) OUTPUT,
	@Mensaje [nvarchar](4000) OUTPUT
AS
BEGIN TRY
	SET @Id = '0';	

  	/*
  	 EXEC SP_GET_IDENTIFICADOR @Identificador, @Tipo, @Id OUTPUT;
  	*/

	IF @@trancount > 0 COMMIT TRANSACTION;
	SET @Resultado = 'EXITOSO';
	SET @Mensaje = 'OK';
	  
END TRY
BEGIN CATCH
	
	IF @@trancount > 0 ROLLBACK TRANSACTION;
	SET @Resultado = 'FALLIDO';
	SET @Mensaje = ERROR_PROCEDURE() + ' '+ ERROR_MESSAGE(); 
	
END CATCH

