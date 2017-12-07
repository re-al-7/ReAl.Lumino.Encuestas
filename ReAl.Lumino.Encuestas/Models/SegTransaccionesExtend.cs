#region 
/***********************************************************************************************************
	NOMBRE:       SegTransacciones
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_transacciones

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegTransacciones
	{
		public const string StrNombreTabla = "Seg_transacciones";
		public const string StrAliasTabla = "seg_transacciones";
		public enum Fields
		{
			Idstr
			,Idsta
			,Transaccion
			,Sentencia
			,Descripcion
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

