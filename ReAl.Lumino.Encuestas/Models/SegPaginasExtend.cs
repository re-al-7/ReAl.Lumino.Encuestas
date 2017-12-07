#region 
/***********************************************************************************************************
	NOMBRE:       SegPaginas
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_paginas

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegPaginas
	{
		public const string StrNombreTabla = "Seg_paginas";
		public const string StrAliasTabla = "seg_paginas";
		public enum Fields
		{
			Idspg
			,Idsap
			,Paginapadre
			,Nombremenu
			,Sigla
			,Nivel
			,Icono
			,Metodo
			,Accion
			,Descripcion
			,Prioridad
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

