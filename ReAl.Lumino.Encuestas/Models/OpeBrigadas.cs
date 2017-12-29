#region 
/***********************************************************************************************************
	NOMBRE:       OpeBrigadas
	DESCRIPCION:
		Clase que define un objeto para la Tabla ope_brigadas

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
	[Table("ope_brigadas")]
	public class OpeBrigadas
	{
		public const string StrNombreTabla = "Ope_brigadas";
		public const string StrAliasTabla = "ope_brigadas";

		public enum Fields
		{
			Idobr
			,Idcde
			,Idopy
			,Codigo
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public OpeBrigadas()
		{
			SegUsuarios = new HashSet<SegUsuarios>();

			//Inicializacion de Variables
			Codigo = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public OpeBrigadas(OpeBrigadas obj)
		{
			SegUsuarios = new HashSet<SegUsuarios>();

			Idobr = obj.Idobr;
			Idcde = obj.Idcde;
			Idopy = obj.Idopy;
			Codigo = obj.Codigo;
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
		[Column("idobr")]
		[Display(Name = "Idobr", Description = "Es el identificador unico que representa al registro en la tabla")]
		[Required(ErrorMessage = "Idobr es un campo requerido.")]
		[Key]
		public long Idobr { get; set; }

		/// <summary>
		/// 	 Es el identificador del Departamento al que pertenece la brigada
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idcde")]
		[Display(Name = "Idcde", Description = "Es el identificador del Departamento al que pertenece la brigada")]
		[Required(ErrorMessage = "Idcde es un campo requerido.")]
		public long Idcde { get; set; }

		/// <summary>
		/// 	 Es el identificador del Proyecto al que pertenece la brigada
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idopy")]
		[Display(Name = "Idopy", Description = "Es el identificador del Proyecto al que pertenece la brigada")]
		[Required(ErrorMessage = "Idopy es un campo requerido.")]
		public long Idopy { get; set; }

		/// <summary>
		/// 	 Codigo que representa a la brigada
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("codigo")]
		[StringLength(20, MinimumLength=0)]
		[Display(Name = "Codigo", Description = "Codigo que representa a la brigada")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Codigo es un campo requerido.")]
		public string Codigo { get; set; }

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

		[ForeignKey("Idcde")]
		[InverseProperty("OpeBrigadas")]
		public CatDepartamentos IdcdeNavigation { get; set; }
		[ForeignKey("Idopy")]
		[InverseProperty("OpeBrigadas")]
		public OpeProyectos IdopyNavigation { get; set; }

		[InverseProperty("IdobrNavigation")]
		public ICollection<SegUsuarios> SegUsuarios { get; set; }

	}
}

