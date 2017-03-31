CREATE PROCEDURE [dbo].[ConsultaIdentificador]
	@Identificador [varchar](10),
	@Tipo [varchar](1),
	@Id [varchar](20) OUTPUT,
	@Resultado [varchar](10) OUTPUT,
	@Mensaje [nvarchar](4000) OUTPUT
AS
BEGIN TRY
	SET @Id = '0';	

	CREATE TABLE #temp
	(
		Id [varchar](20)
 	); 
	
	INSERT INTO #temp	  	
	EXECUTE DIEBOLD.DBO.SP_GET_IDENTIFICADOR @Identificador, @Tipo;
	  	
	SET @Id = (SELECT * FROM #tempIdentificador)

	IF @@trancount > 0 COMMIT TRANSACTION;
	SET @Resultado = 'EXITOSO';
	SET @Mensaje = 'OK';

	IF OBJECT_ID(N'tempdb..#tempIdentificador', N'U') IS NOT NULL   
		DROP TABLE #tempIdentificador
	  
END TRY
BEGIN CATCH
	
	IF @@trancount > 0 ROLLBACK TRANSACTION;
	SET @Resultado = 'FALLIDO';
	SET @Mensaje = ERROR_PROCEDURE() + ' '+ ERROR_MESSAGE(); 
	
	IF OBJECT_ID(N'tempdb..#tempIdentificador', N'U') IS NOT NULL   
		DROP TABLE #tempIdentificador

END CATCH

