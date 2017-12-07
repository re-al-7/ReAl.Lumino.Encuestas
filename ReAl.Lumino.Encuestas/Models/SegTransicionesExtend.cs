#region 
/***********************************************************************************************************
	NOMBRE:       SegTransiciones
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_transiciones

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegTransiciones
	{
		public const string StrNombreTabla = "Seg_transiciones";
		public const string StrAliasTabla = "seg_transiciones";
		public enum Fields
		{
			Idsts
			,Idsta
			,Idsesini
			,Idstr
			,Idsesfin
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

