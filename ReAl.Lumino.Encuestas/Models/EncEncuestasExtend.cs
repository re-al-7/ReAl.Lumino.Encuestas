#region 
/***********************************************************************************************************
	NOMBRE:       EncEncuestas
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_encuestas

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class EncEncuestas
	{
		public const string StrNombreTabla = "Enc_encuestas";
		public const string StrAliasTabla = "enc_encuestas";
		public enum Fields
		{
			Idenc
			,Idenc_tab
			,Idein
			,Idomv
			,Idepr
			,Idere
			,Codigo_respuesta
			,Respuesta
			,Observacion
			,Latitud
			,Longitud
			,Id_last
			,Fila
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

