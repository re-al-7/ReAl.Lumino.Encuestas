#region 
/***********************************************************************************************************
	NOMBRE:       SegTablas
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_tablas

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegTablas
	{
		public const string StrNombreTabla = "Seg_tablas";
		public const string StrAliasTabla = "seg_tablas";
		public enum Fields
		{
			Idsta
			,Idsap
			,Nombretabla
			,Alias
			,Descripcion
			,Beforestatement
			,Beforerow
			,Afterstatement
			,Afterrow
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

