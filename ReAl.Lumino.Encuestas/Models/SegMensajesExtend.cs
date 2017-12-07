#region 
/***********************************************************************************************************
	NOMBRE:       SegMensajes
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_mensajes

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegMensajes
	{
		public const string StrNombreTabla = "Seg_mensajes";
		public const string StrAliasTabla = "seg_mensajes";
		public enum Fields
		{
			Idsme
			,Idsap
			,Aplicacionerror
			,Texto
			,Origen
			,Causa
			,Accion
			,Comentario
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

