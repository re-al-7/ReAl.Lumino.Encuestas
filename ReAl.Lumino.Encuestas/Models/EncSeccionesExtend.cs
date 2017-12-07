#region 
/***********************************************************************************************************
	NOMBRE:       EncSecciones
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_secciones

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class EncSecciones
	{
		public const string StrNombreTabla = "Enc_secciones";
		public const string StrAliasTabla = "enc_secciones";
		public enum Fields
		{
			Idese
			,Idopy
			,Idcnv
			,Codigo
			,Seccion
			,Abierta
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

