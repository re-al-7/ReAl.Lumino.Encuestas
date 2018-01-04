# LuminoAdmin para Encuestas

[![Build status](https://ci.appveyor.com/api/projects/status/rtwos9dek63gh0hu?svg=true)](https://ci.appveyor.com/project/re_al_/real-lumino-encuestas) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/9ae9d5a6d92548ec941db5b04befaad3)](https://www.codacy.com/app/re_al_/real.lumino.encuestas?utm_source=re_al_@bitbucket.org&amp;utm_medium=referral&amp;utm_content=re_al_/real.lumino.encuestas&amp;utm_campaign=Badge_Grade) [![codecov](https://codecov.io/bb/re_al_/real.lumino.encuestas/branch/master/graph/badge.svg)](https://codecov.io/bb/re_al_/real.lumino.encuestas)

---------------------------------------

Proyecto desarrollado en [.NET Core 2](https://www.microsoft.com/net/) para el uso del template [Lumino](https://medialoot.com/preview/lumino-premium/index.html) y con Conexion a PostgresSql via EntityFramework para la administracion de un sistema de Encuestas


## Crear los modelos desde la BD

Para crear los modelos desde la BD
~~~terminal
dotnet ef dbcontext scaffold "Host=localhost;Database=NOMBRE_BD;Username=USUARIO_BD;Password=PASSWORD_BD" Npgsql.EntityFrameworkCore.PostgreSQL -o Models
~~~

Puede crearse el modelo de una tabla en especifico:
~~~terminal
dotnet ef dbcontext scaffold "Host=localhost;Database=NOMBRE_BD;Username=USUARIO_BD;Password=PASSWORD_BD" Npgsql.EntityFrameworkCore.PostgreSQL -o Models --table NOMBRE_TABLA
~~~

Luego añadir el siguiente constructor en db_seguridadContext.cs:
~~~csharp
    public db_seguridadContext(DbContextOptions<db_seguridadContext> options) :  
    base(options)  
    {  
    }  
~~~

## Scaffolding desde linea de comando
Se ha creado la carpeta TEMPLATES para que el generador de código utilice las plantillas especificas de Lumino Admin Template.
Para crear los controladores y las vistas a partir de los modelos:
~~~terminal
dotnet aspnet-codegenerator --project C:\Users\..\..\ReAl.Template.Lumino\ controller --force --controllerName NAME_OF_Controller --model NAMESPACE.MODEL --dataContext NAMESPACE.EF_CONTEXTO --relativeFolderPath .\Controllers\ --useDefaultLayout
~~~

Ejemplo para SegUsuarios:
~~~terminal
dotnet aspnet-codegenerator --project . controller --force --controllerName SegAplicacionesController --model ReAl.Template.Lumino.Models.SegAplicaciones --dataContext ReAl.Template.Lumino.Models.db_seguridadContext --relativeFolderPath .\Controllers\ --useDefaultLayout
~~~

Si se desea usar el generador para Paginas Razor:
~~~terminal
dotnet aspnet-codegenerator razorpage -m NOMBRE_MODELO -dc NAMESPACE.EF_CONTEXTO -udl -outDir Pages\DIRECTORIO --referenceScriptLibraries
~~~

Ejemplo para SegRoles:
~~~terminal
dotnet aspnet-codegenerator razorpage -m SegRoles -dc db_seguridadContext -udl -outDir Pages\Roles --referenceScriptLibraries
~~~

## Licencia
[MIT](LICENSE)