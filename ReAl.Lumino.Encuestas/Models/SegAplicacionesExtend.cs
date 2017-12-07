#region 
/***********************************************************************************************************
	NOMBRE:       SegAplicaciones
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_aplicaciones

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegAplicaciones
	{
		public const string StrNombreTabla = "Seg_aplicaciones";
		public const string StrAliasTabla = "seg_aplicaciones";
		public enum Fields
		{
			Idsap
			,Sigla
			,Nombre
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

