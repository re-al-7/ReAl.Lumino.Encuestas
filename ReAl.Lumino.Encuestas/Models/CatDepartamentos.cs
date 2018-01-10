#region 
/***********************************************************************************************************
	NOMBRE:       CatDepartamentos
	DESCRIPCION:
		Clase que define un objeto para la Tabla cat_departamentos

	REVISIONES:
		Ver        FECHA       Autor            Descripcion 
		---------  ----------  ---------------  ------------------------------------
		1.0        29/12/2017  R Alonzo Vera A  Creacion 

*************************************************************************************************************/
#endregion


#region
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
#endregion

namespace ReAl.Lumino.Encuestas.Models
{
	[Table("cat_departamentos")]
	public class CatDepartamentos
	{
		public static readonly  string StrNombreTabla = "Cat_departamentos";
		public static readonly  string StrAliasTabla = "cat_departamentos";

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

		#region Constructoress
		
		public CatDepartamentos()
		{
			OpeBrigadas = new HashSet<OpeBrigadas>();
			OpeUpms = new HashSet<OpeUpms>();
			SegUsuariosRestriccion = new HashSet<SegUsuariosRestriccion>();
			SegUsuarios = new HashSet<SegUsuarios>();

			//Inicializacion de Variables
			Codigo = null;
			Nombre = null;
			Latitud = null;
			Longitud = null;
			Abreviatura = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public CatDepartamentos(CatDepartamentos obj)
		{
			OpeBrigadas = new HashSet<OpeBrigadas>();
			OpeUpms = new HashSet<OpeUpms>();
			SegUsuariosRestriccion = new HashSet<SegUsuariosRestriccion>();
			SegUsuarios = new HashSet<SegUsuarios>();

			Idcde = obj.Idcde;
			Codigo = obj.Codigo;
			Nombre = obj.Nombre;
			Latitud = obj.Latitud;
			Longitud = obj.Longitud;
			Abreviatura = obj.Abreviatura;
			Apiestado = obj.Apiestado;
			Apitransaccion = obj.Apitransaccion;
			Usucre = obj.Usucre;
			Feccre = obj.Feccre;
			Usumod = obj.Usumod;
			Fecmod = obj.Fecmod;
		}
		
		#endregion
		
		/// <summary>
		/// 	 Llave primaria del identificador del departamento
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: Yes
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idcde")]
		[Display(Name = "Idcde", Description = "Llave primaria del identificador del departamento")]
		[Required(ErrorMessage = "Idcde es un campo requerido.")]
		[Key]
		public long Idcde { get; set; }

		/// <summary>
		/// 	 Codigo de departamento
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("codigo")]
		[StringLength(2, MinimumLength=0)]
		[Display(Name = "Codigo", Description = "Codigo de departamento")]
		public string Codigo { get; set; }

		/// <summary>
		/// 	 Nombre del Departamento
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("nombre")]
		[StringLength(10, MinimumLength=0)]
		[Display(Name = "Nombre", Description = "Nombre del Departamento")]
		public string Nombre { get; set; }

		/// <summary>
		/// 	 Latitud del punto CERO de la Capital de Departamento
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("latitud")]
		[Display(Name = "Latitud", Description = "Latitud del punto CERO de la Capital de Departamento")]
		public Decimal? Latitud { get; set; }

		/// <summary>
		/// 	 Longitud del punto CERO de la Capital de Departamento
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("longitud")]
		[Display(Name = "Longitud", Description = "Longitud del punto CERO de la Capital de Departamento")]
		public Decimal? Longitud { get; set; }

		/// <summary>
		/// 	 Abreviatura del Departamento
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("abreviatura")]
		[StringLength(3, MinimumLength=0)]
		[Display(Name = "Abreviatura", Description = "Abreviatura del Departamento")]
		public string Abreviatura { get; set; }

		/// <summary>
		/// 	 Estado en el que se encuentra el registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("apiestado")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Apiestado", Description = "Estado en el que se encuentra el registro")]
		public string Apiestado { get; set; }

		/// <summary>
		/// 	 Ultima transacción realizada en el registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("apitransaccion")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Apitransaccion", Description = "Ultima transacción realizada en el registro")]
		public string Apitransaccion { get; set; }

		/// <summary>
		/// 	 Login o nombre de usuario que ha creado el registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("usucre")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Usucre", Description = "Login o nombre de usuario que ha creado el registro")]
		public string Usucre { get; set; }

		/// <summary>
		/// 	 Fecha de creacion del registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("feccre")]
		[Display(Name = "Feccre", Description = "Fecha de creacion del registro")]
		public DateTime Feccre { get; set; }

		/// <summary>
		/// 	 Login o nombre de usuario que ha realizado la ULTIMA modificacion registro
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("usumod")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Usumod", Description = "Login o nombre de usuario que ha realizado la ULTIMA modificacion registro")]
		public string Usumod { get; set; }

		/// <summary>
		/// 	 Fecha en la que se ha realizado la ULTIMA modificacion registro
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("fecmod")]
		[Display(Name = "Fecmod", Description = "Fecha en la que se ha realizado la ULTIMA modificacion registro")]
		public DateTime? Fecmod { get; set; }


		[InverseProperty("IdcdeNavigation")]
		public ICollection<OpeBrigadas> OpeBrigadas { get; set; }
		[InverseProperty("IdcdeNavigation")]
		public ICollection<OpeUpms> OpeUpms { get; set; }
		[InverseProperty("IdcdeNavigation")]
		public ICollection<SegUsuariosRestriccion> SegUsuariosRestriccion { get; set; }
		[InverseProperty("IdcdeNavigation")]
		public ICollection<SegUsuarios> SegUsuarios { get; set; }		
	}
}

