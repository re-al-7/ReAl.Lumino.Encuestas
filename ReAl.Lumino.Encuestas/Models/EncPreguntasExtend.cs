#region 
/***********************************************************************************************************
	NOMBRE:       EncPreguntas
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_preguntas

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class EncPreguntas
	{
		public const string StrNombreTabla = "Enc_preguntas";
		public const string StrAliasTabla = "enc_preguntas";
		public enum Fields
		{
			Idepr
			,Idopy
			,Idcnv
			,Idese
			,Idctp
			,Codigo
			,Pregunta
			,Ayuda
			,Minimo
			,Maximo
			,Catalogo
			,Longitud
			,Codigo_especifique
			,Mostrar_ventana
			,Variable
			,Formula
			,Rpn_formula
			,Regla
			,Rpn
			,Mensaje
			,Revision
			,Instruccion
			,Bucle
			,Variable_bucle
			,Codigo_especial
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

