#region 
/***********************************************************************************************************
	NOMBRE:       SegRoles
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_roles

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegRoles
	{
		public const string StrNombreTabla = "Seg_roles";
		public const string StrAliasTabla = "seg_roles";
		public enum Fields
		{
			Idsro
			,Sigla
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

