#region 
/***********************************************************************************************************
	NOMBRE:       SegUsuarios
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_usuarios

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegUsuarios
	{
		public const string StrNombreTabla = "Seg_usuarios";
		public const string StrAliasTabla = "seg_usuarios";
		public enum Fields
		{
			Idsus
			,Login
			,Password
			,Nombres
			,Apellidos
			,Correo
			,Vigente
			,Idcde
			,Idobr
			,Tablet
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		
	}
}

