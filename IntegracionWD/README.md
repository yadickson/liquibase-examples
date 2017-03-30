# IntegracionWD
Paquete para administrar la base de datos con liquibase

**Configurar firewall**
------------------------

> Inicio

> Ejecutar

> cmd

```
netsh firewall set portopening protocol = TCP port = 1433 name = SQLPort mode = ENABLE scope = SUBNET profile = CURRENT
```

Habilitar atenciones (listen) del puerto
----------------------------------------

> Inicio

> Microsoft SQL Server 2008 R2

> Configuration Tools

> SQL Server Configuration Manager

```
SQL Server Network Configuration
```

```
TCP/IP --> Enabled
```

[Ver fuente de ayuda](https://msdn.microsoft.com/en-us/library/ms177440.aspx)

Crear Usuario
-------------

> Inicio

> Microsoft SQL Server 2008 R2

> SQL Server Management Studio

```
Boton derecho en el servidor --> Propiedades
```
```
Security --> SQL Server and Windows Authentication Mode --> Aceptar
```
```
Security --> New --> Login --> General
```

> Seleccione __Login Name__

> Seleccione __SQL Server authentication__

> Ingrese __password__

> Confirme __password__

> [x] Enforce password policy

> [ ] Enforce password expiration

```
Server Roles
```
> [x] sysadmin
```
Aceptar
```

```
Reiniciar servidor
```

[Ver fuente de ayuda](http://netgeeksclub.blogspot.cl/2010/08/configuracion-y-creacion-de-usuarios-en.html)

Descargar drivers 6.0 JDBC
--------------------------

[Descarga](http://www.microsoft.com/es-es/download/details.aspx?id=11774)

Instalar drivers JDBC
---------------------
```
mvn install:install-file -Dfile=sqljdbc41.jar -DgroupId=com.microsoft.sqlserver -DartifactId=sqljdbc_6.0 -Dversion=4.1 -Dpackaging=jar
```
```
mvn install:install-file -Dfile=sqljdbc42.jar -DgroupId=com.microsoft.sqlserver -DartifactId=sqljdbc_6.0 -Dversion=4.2 -Dpackaging=jar
```
