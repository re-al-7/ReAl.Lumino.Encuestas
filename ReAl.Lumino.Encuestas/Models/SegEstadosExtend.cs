#region 
/***********************************************************************************************************
	NOMBRE:       SegEstados
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_estados

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegEstados
	{
		public const string StrNombreTabla = "Seg_estados";
		public const string StrAliasTabla = "seg_estados";
		public enum Fields
		{
			Idses
			,Idsta
			,Estado
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

