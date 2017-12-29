#region 
/***********************************************************************************************************
	NOMBRE:       OpeUpms
	DESCRIPCION:
		Clase que define un objeto para la Tabla ope_upms

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
	[Table("ope_upms")]
	public class OpeUpms
	{
		public const string StrNombreTabla = "Ope_upms";
		public const string StrAliasTabla = "ope_upms";

		public enum Fields
		{
			Idoup
			,Idopy
			,Idcde
			,Codigo
			,Nombre
			,Fecinicio
			,Latitud
			,Longitud
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public OpeUpms()
		{
			OpeMovimientos = new HashSet<OpeMovimientos>();

			//Inicializacion de Variables
			Codigo = null;
			Nombre = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public OpeUpms(OpeUpms obj)
		{
			OpeMovimientos = new HashSet<OpeMovimientos>();

			Idoup = obj.Idoup;
			Idopy = obj.Idopy;
			Idcde = obj.Idcde;
			Codigo = obj.Codigo;
			Nombre = obj.Nombre;
			Fecinicio = obj.Fecinicio;
			Latitud = obj.Latitud;
			Longitud = obj.Longitud;
			Apiestado = obj.Apiestado;
			Apitransaccion = obj.Apitransaccion;
			Usucre = obj.Usucre;
			Feccre = obj.Feccre;
			Usumod = obj.Usumod;
			Fecmod = obj.Fecmod;
		}
		
		#endregion
		
		/// <summary>
		/// 	 Es el identificador unico que representa al registro en la tabla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: Yes
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idoup")]
		[Display(Name = "Idoup", Description = "Es el identificador unico que representa al registro en la tabla")]
		[Required(ErrorMessage = "Idoup es un campo requerido.")]
		[Key]
		public long Idoup { get; set; }

		/// <summary>
		/// 	 Es el identificador unico de la tabla seg_proyecto
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idopy")]
		[Display(Name = "Idopy", Description = "Es el identificador unico de la tabla seg_proyecto")]
		[Required(ErrorMessage = "Idopy es un campo requerido.")]
		public long Idopy { get; set; }

		/// <summary>
		/// 	 Es el identificador unico de la tabla cat_departamento
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idcde")]
		[Display(Name = "Idcde", Description = "Es el identificador unico de la tabla cat_departamento")]
		[Required(ErrorMessage = "Idcde es un campo requerido.")]
		public long Idcde { get; set; }

		/// <summary>
		/// 	 Codigo con el que se representa a la UPM
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("codigo")]
		[Display(Name = "Codigo", Description = "Codigo con el que se representa a la UPM")]
		public string Codigo { get; set; }

		/// <summary>
		/// 	 Nombre con el que se representa a la UPM
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("nombre")]
		[Display(Name = "Nombre", Description = "Nombre con el que se representa a la UPM")]
		public string Nombre { get; set; }

		/// <summary>
		/// 	 Fecha desde la que es valida la UPM
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("fecinicio")]
		[Display(Name = "Fecinicio", Description = "Fecha desde la que es valida la UPM")]
		[Required(ErrorMessage = "Fecinicio es un campo requerido.")]
		public DateTime Fecinicio { get; set; }

		/// <summary>
		/// 	 Latitud del punto CERO de la Capital de Departamento
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("latitud")]
		[Display(Name = "Latitud", Description = "Latitud del punto CERO de la Capital de Departamento")]
		[Required(ErrorMessage = "Latitud es un campo requerido.")]
		public Decimal Latitud { get; set; }

		/// <summary>
		/// 	 Longitud del punto CERO de la Capital de Departamento
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("longitud")]
		[Display(Name = "Longitud", Description = "Longitud del punto CERO de la Capital de Departamento")]
		[Required(ErrorMessage = "Longitud es un campo requerido.")]
		public Decimal Longitud { get; set; }

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

		[ForeignKey("Idopy")]
		[InverseProperty("OpeUpms")]
		public OpeProyectos IdopyNavigation { get; set; }
		[ForeignKey("Idcde")]
		[InverseProperty("OpeUpms")]
		public CatDepartamentos IdcdeNavigation { get; set; }

		[InverseProperty("IdoupNavigation")]
		public ICollection<OpeMovimientos> OpeMovimientos { get; set; }

	}
}

