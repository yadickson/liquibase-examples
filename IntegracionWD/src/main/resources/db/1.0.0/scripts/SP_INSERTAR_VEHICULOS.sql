CREATE PROCEDURE [dbo].[SP_INSERTAR_VEHICULOS]
     @Patente [nchar](10),
     @Marca [nvarchar](50),
     @Modelo [nvarchar](50),
     @Anio [nchar](10),
     @TipoVehiculo [nvarchar](50),
     @Contrato [nvarchar](50),
     @RazonSocial [nvarchar](50),
     @FechaExpiracion [nchar](10),
     @MotivoRechazo [nvarchar](4000),
     @Resultado [nvarchar](50) OUTPUT,
     @Mensaje [nvarchar](4000) OUTPUT
AS
BEGIN TRY

     INSERT INTO [dbo].[Vehiculos]
     (
	      [Patente],
	      [Marca],
	      [Modelo],
	      [Anio],
	      [TipoVehiculo],
	      [Contrato],
	      [RazonSocial],
	      [FechaExpiracion],
	      [MotivoRechazo]
	 )
	 VALUES
	 (
	      @Patente,
	      @Marca,
	      @Modelo,
	      @Anio,
	      @TipoVehiculo,
	      @Contrato,
	      @RazonSocial,
	      @FechaExpiracion,
	      @MotivoRechazo
	 );
	 
	 IF @@trancount > 0 COMMIT TRANSACTION;
	 
	 SET @Resultado = 'EXITOSO';
	 SET @Mensaje = 'OK';

END TRY
BEGIN CATCH

     IF @@trancount > 0 ROLLBACK TRANSACTION;

     SET @Resultado = 'FALLIDO';
     SET @Mensaje = ERROR_PROCEDURE() + ' '+ ERROR_MESSAGE();

END CATCH