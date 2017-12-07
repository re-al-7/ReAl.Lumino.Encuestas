#region 
/***********************************************************************************************************
	NOMBRE:       EncInformantes
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_informantes

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class EncInformantes
	{
		public const string StrNombreTabla = "Enc_informantes";
		public const string StrAliasTabla = "enc_informantes";
		public enum Fields
		{
			Idein
			,Idein_tab
			,Idein_padre
			,Idein_tab_padre
			,Idcnv
			,Idomv
			,Idoup
			,Latitud
			,Longitud
			,Codigo
			,Descripcion
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

