#region 
/***********************************************************************************************************
	NOMBRE:       EncFlujos
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_flujos

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class EncFlujos
	{
		public const string StrNombreTabla = "Enc_flujos";
		public const string StrAliasTabla = "enc_flujos";
		public enum Fields
		{
			Idefl
			,Idopy
			,Idepr
			,Idepr_destino
			,Orden
			,Regla
			,Rpn
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}
	}
}

