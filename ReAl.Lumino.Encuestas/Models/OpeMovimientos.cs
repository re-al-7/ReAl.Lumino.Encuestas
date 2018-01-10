#region 
/***********************************************************************************************************
	NOMBRE:       OpeMovimientos
	DESCRIPCION:
		Clase que define un objeto para la Tabla ope_movimientos

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
	[Table("ope_movimientos")]
	public class OpeMovimientos
	{
		public static readonly  string StrNombreTabla = "Ope_movimientos";
		public static readonly  string StrAliasTabla = "ope_movimientos";

		public enum Fields
		{
			Idomv
			,Idsus
			,Idoup
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public OpeMovimientos()
		{
			EncEncuestas = new HashSet<EncEncuestas>();
			EncInformantes = new HashSet<EncInformantes>();

			//Inicializacion de Variables
			Idoup = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public OpeMovimientos(OpeMovimientos obj)
		{
			EncEncuestas = new HashSet<EncEncuestas>();
			EncInformantes = new HashSet<EncInformantes>();

			Idomv = obj.Idomv;
			Idsus = obj.Idsus;
			Idoup = obj.Idoup;
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
		[Column("idomv")]
		[Display(Name = "Idomv", Description = "Es el identificador unico que representa al registro en la tabla")]
		[Required(ErrorMessage = "Idomv es un campo requerido.")]
		[Key]
		public long Idomv { get; set; }

		/// <summary>
		/// 	 Es el identificador unico de la tabla ope_asignacion
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsus")]
		[Display(Name = "Idsus", Description = "Es el identificador unico de la tabla ope_asignacion")]
		[Required(ErrorMessage = "Idsus es un campo requerido.")]
		public long Idsus { get; set; }

		/// <summary>
		/// 	 Es el identificador unico de la tabla cat_upm
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idoup")]
		[Display(Name = "Idoup", Description = "Es el identificador unico de la tabla cat_upm")]
		public long? Idoup { get; set; }

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

		[ForeignKey("Idsus")]
		[InverseProperty("OpeMovimientos")]
		public SegUsuarios IdsusNavigation { get; set; }
		[ForeignKey("Idoup")]
		[InverseProperty("OpeMovimientos")]
		public OpeUpms IdoupNavigation { get; set; }

		[InverseProperty("IdomvNavigation")]
		public ICollection<EncEncuestas> EncEncuestas { get; set; }
		[InverseProperty("IdomvNavigation")]
		public ICollection<EncInformantes> EncInformantes { get; set; }

	}
}

