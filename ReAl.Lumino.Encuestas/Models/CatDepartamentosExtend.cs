#region 
/***********************************************************************************************************
	NOMBRE:       CatDepartamentos
	DESCRIPCION:
		Clase que define un objeto para la Tabla cat_departamentos

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        07/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion



namespace ReAl.Lumino.Encuestas.Models
{
	public partial class CatDepartamentos
	{
		public const string StrNombreTabla = "Cat_departamentos";
		public const string StrAliasTabla = "cat_departamentos";
		public enum Fields
		{
			Idcde
			,Codigo
			,Nombre
			,Latitud
			,Longitud
			,Abreviatura
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		
	}
}

