CREATE PROCEDURE [dbo].[ConsultaTransito]
	@FechaDesde [varchar](8),
	@FechaHasta [varchar](8),
	@Identificador [varchar](10),
	@Tipo [varchar](1),
	@Resultado [varchar](10) OUTPUT,
	@Mensaje [nvarchar](4000) OUTPUT
AS
BEGIN TRY

	CREATE TABLE #temp
	(
	    [ID] [int] IDENTITY(1,1) NOT NULL,
	    [NAME1] [nvarchar](15),
	    [NAME2] [nvarchar](15),
	    [NAME3] [nvarchar](15),
	    [NAME4] [nvarchar](15),
	    [NAME5] [nvarchar](15)
	)

	INSERT INTO #temp ([NAME1], [NAME2], [NAME3], [NAME4], [NAME5]) VALUES ('Test1','Test2','Test3','Test4','Test5')
	INSERT INTO #temp ([NAME1], [NAME2], [NAME3], [NAME4], [NAME5]) VALUES ('Test1','Test2','Test3','Test4','Test5')

	SELECT [NAME1],[NAME2],[NAME3],[NAME4],[NAME5] FROM #temp

	DROP TABLE #temp

	IF @@trancount > 0 COMMIT TRANSACTION;

	SET @Resultado = 'EXITOSO';
	SET @Mensaje = 'OK';

END TRY
BEGIN CATCH
	
	IF @@trancount > 0 ROLLBACK TRANSACTION;
	SET @Resultado = 'FALLIDO';
	SET @Mensaje = ERROR_PROCEDURE() + ' '+ ERROR_MESSAGE(); 
	
END CATCH

