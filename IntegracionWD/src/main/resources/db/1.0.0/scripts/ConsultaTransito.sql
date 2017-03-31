CREATE PROCEDURE [dbo].[ConsultaTransito]
	@FechaDesde [varchar](8),
	@FechaHasta [varchar](8),
	@Identificador [varchar](20),
	@Tipo [varchar](1),
	@Resultado [varchar](10) OUTPUT,
	@Mensaje [nvarchar](4000) OUTPUT
AS
DECLARE	
	@DiasConsulta [varchar](50)

BEGIN TRY

	SELECT @DiasConsulta = Valor FROM Parametros WHERE Codigo = 100
	IF DATEDIFF(day,CONVERT(datetime,@FechaDesde,112),CONVERT(DATETIME,@FechaHasta,112)) > @DiasConsulta
	BEGIN
		SET @Resultado = 'FALLIDO'
		SET @Mensaje = 'Dias de consulta superan el parametro configurado de '+ @DiasConsulta + ' dias'
		RETURN
	END

	CREATE TABLE #tempTransito 
	(
		Fecha [varchar](8),
		Sentido [varchar](10) ,
		PuntoControl [varchar](50),
		Identificador [varchar](20),
		Tipo [varchar](1)
	); 
	
	INSERT INTO #tempTransito 
	EXECUTE DIEBOLD.DBO.SP_GET_TRANSITO @FechaDesde,@FechaHasta,@Mensaje OUTPUT

	IF @Mensaje = 'E'
		IF @Identificador IS NOT NULL
			SELECT * FROM #tempTransito
			WHERE
				#tempTransito.Identificador = @Identificador
			AND
				#tempTransito.Tipo = @Tipo
		ELSE
			SELECT * FROM #tempTransito
	ELSE
	BEGIN
		SET @Resultado = 'FALLIDO';
		SET @Mensaje = 'SP_GET_TRANSITO '+ @Mensaje;

		IF OBJECT_ID(N'tempdb..#tempTransito', N'U') IS NOT NULL   
			DROP TABLE #tempTransito
		RETURN
	END	 

	IF @@trancount > 0 COMMIT TRANSACTION;

	SET @Resultado = 'EXITOSO';
	SET @Mensaje = 'OK';

	IF OBJECT_ID(N'tempdb..#tempTransito', N'U') IS NOT NULL   
		DROP TABLE #tempTransito

END TRY
BEGIN CATCH
	
	IF @@trancount > 0 ROLLBACK TRANSACTION;
	SET @Resultado = 'FALLIDO';
	SET @Mensaje = ERROR_PROCEDURE() + ' '+ ERROR_MESSAGE(); 

	IF OBJECT_ID(N'tempdb..#tempTransito', N'U') IS NOT NULL   
		DROP TABLE #tempTransito
	
END CATCH

