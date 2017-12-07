#region 
/***********************************************************************************************************
	NOMBRE:       CatTipospregunta
	DESCRIPCION:
		Clase que define un objeto para la Tabla cat_tipos_pregunta

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class CatTipospregunta
	{
		public const string StrNombreTabla = "Cat_tipos_pregunta";
		public const string StrAliasTabla = "cat_tipos_pregunta";

		public enum Fields
		{
			Idctp,
			Tipo_pregunta,
			Descripcion,
			Respuesta_valor,
			Exportar_codigo,
			Apiestado,
			Apitransaccion,
			Usucre,
			Feccre,
			Usumod,
			Fecmod
		}
	}
}

