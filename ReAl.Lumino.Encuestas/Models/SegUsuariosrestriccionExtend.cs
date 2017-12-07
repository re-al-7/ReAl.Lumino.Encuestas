#region 
/***********************************************************************************************************
	NOMBRE:       SegUsuariosrestriccion
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_usuarios_restriccion

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegUsuariosrestriccion
	{
		public const string StrNombreTabla = "Seg_usuarios_restriccion";
		public const string StrAliasTabla = "seg_usuarios_restriccion";
		public enum Fields
		{
			Idsur
			,Idsus
			,Idsro
			,Rolactivo
			,Restriccion
			,Vigente
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

