#region 
/***********************************************************************************************************
	NOMBRE:       EncRespuestas
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_respuestas

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class EncRespuestas
	{
		public const string StrNombreTabla = "Enc_respuestas";
		public const string StrAliasTabla = "enc_respuestas";
		public enum Fields
		{
			Idere
			,Idepr
			,Codigo
			,Respuesta
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

