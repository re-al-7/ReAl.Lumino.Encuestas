#region 
/***********************************************************************************************************
	NOMBRE:       SegConfiguracion
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_configuracion

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class SegConfiguracion
	{
		public const string StrNombreTabla = "Seg_configuracion";
		public const string StrAliasTabla = "seg_configuracion";
		public enum Fields
		{
			Idscf
			,Idsta
			,Configuracion
			,Funcion
			,Parametrosentrada
			,Parametrossalida
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

