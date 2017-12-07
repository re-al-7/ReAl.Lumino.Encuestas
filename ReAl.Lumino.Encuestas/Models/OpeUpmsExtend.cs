#region 
/***********************************************************************************************************
	NOMBRE:       OpeUpms
	DESCRIPCION:
		Clase que define un objeto para la Tabla ope_upms

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class OpeUpms
	{
		public const string StrNombreTabla = "Ope_upms";
		public const string StrAliasTabla = "ope_upms";
		public enum Fields
		{
			Idoup
			,Idopy
			,Idcde
			,Codigo
			,Nombre
			,Fecinicio
			,Latitud
			,Longitud
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

