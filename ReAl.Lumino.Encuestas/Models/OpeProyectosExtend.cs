#region 
/***********************************************************************************************************
	NOMBRE:       OpeProyectos
	DESCRIPCION:
		Clase que define un objeto para la Tabla ope_proyectos

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class OpeProyectos
	{
		public const string StrNombreTabla = "Ope_proyectos";
		public const string StrAliasTabla = "ope_proyectos";
		public enum Fields
		{
			Idopy
			,Nombre
			,Codigo
			,Descripcion
			,Fecinicio
			,Fecfin
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

