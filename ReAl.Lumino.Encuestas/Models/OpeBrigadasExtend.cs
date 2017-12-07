#region 
/***********************************************************************************************************
	NOMBRE:       OpeBrigadas
	DESCRIPCION:
		Clase que define un objeto para la Tabla ope_brigadas

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class OpeBrigadas
	{
		public const string StrNombreTabla = "Ope_brigadas";
		public const string StrAliasTabla = "ope_brigadas";
		public enum Fields
		{
			Idobr
			,Idcde
			,Idopy
			,Codigo
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

