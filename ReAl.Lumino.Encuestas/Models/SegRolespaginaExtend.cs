#region 
/***********************************************************************************************************
	NOMBRE:       SegRolespagina
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_roles_pagina

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegRolespagina
	{
		public const string StrNombreTabla = "Seg_roles_pagina";
		public const string StrAliasTabla = "seg_roles_pagina";
		public enum Fields
		{
			Idsrp
			,Idsro
			,Idspg
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

