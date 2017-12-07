#region 
/***********************************************************************************************************
	NOMBRE:       SegGlosas
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_glosas

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegGlosas
	{
		public const string StrNombreTabla = "Seg_glosas";
		public const string StrAliasTabla = "seg_glosas";
		public enum Fields
		{
			Idsgl
			,Iddoc
			,Nombretabla
			,Transaccion
			,Glosa
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

