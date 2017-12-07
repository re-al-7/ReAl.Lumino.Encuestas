#region 
/***********************************************************************************************************
	NOMBRE:       CatNiveles
	DESCRIPCION:
		Clase que define un objeto para la Tabla cat_niveles

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class CatNiveles
	{
		public const string StrNombreTabla = "Cat_niveles";
		public const string StrAliasTabla = "cat_niveles";
		public enum Fields
		{
			Idcnv
			,Nivel
			,Descripcion
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		
	}
}

