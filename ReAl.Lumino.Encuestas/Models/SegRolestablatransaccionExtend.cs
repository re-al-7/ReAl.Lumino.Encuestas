#region 
/***********************************************************************************************************
	NOMBRE:       SegRolestablatransaccion
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_roles_tabla_transaccion

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegRolestablatransaccion
	{
		public const string StrNombreTabla = "Seg_roles_tabla_transaccion";
		public const string StrAliasTabla = "seg_roles_tabla_transaccion";
		public enum Fields
		{
			Idstt
			,Idsro
			,Idsta
			,Idstr
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

