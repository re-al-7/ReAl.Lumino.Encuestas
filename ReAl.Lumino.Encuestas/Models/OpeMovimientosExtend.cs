#region 
/***********************************************************************************************************
	NOMBRE:       OpeMovimientos
	DESCRIPCION:
		Clase que define un objeto para la Tabla ope_movimientos

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class OpeMovimientos
	{
		public const string StrNombreTabla = "Ope_movimientos";
		public const string StrAliasTabla = "ope_movimientos";
		public enum Fields
		{
			Idomv
			,Idsus
			,Idoup
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

