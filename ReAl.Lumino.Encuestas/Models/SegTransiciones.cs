#region 
/***********************************************************************************************************
	NOMBRE:       SegTransiciones
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_transiciones

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
	[Table("seg_transiciones")]
	public class SegTransiciones
	{
		public static readonly  string StrNombreTabla = "Seg_transiciones";
		public static readonly  string StrAliasTabla = "seg_transiciones";

		public enum Fields
		{
			Idsts
			,Idsta
			,Idsesini
			,Idstr
			,Idsesfin
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegTransiciones()
		{

			//Inicializacion de Variables
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegTransiciones(SegTransiciones obj)
		{

			Idsts = obj.Idsts;
			Idsta = obj.Idsta;
			Idsesini = obj.Idsesini;
			Idstr = obj.Idstr;
			Idsesfin = obj.Idsesfin;
			Apiestado = obj.Apiestado;
			Apitransaccion = obj.Apitransaccion;
			Usucre = obj.Usucre;
			Feccre = obj.Feccre;
			Usumod = obj.Usumod;
			Fecmod = obj.Fecmod;
		}
		
		#endregion
		
		/// <summary>
		/// 	 Identificador primario de registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: Yes
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idsts")]
		[Display(Name = "Idsts", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idsts es un campo requerido.")]
		[Key]
		public long Idsts { get; set; }

		/// <summary>
		/// 	 Identificador primario de la tabla a la que pertenece el registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsta")]
		[Display(Name = "Idsta", Description = "Identificador primario de la tabla a la que pertenece el registro")]
		[Required(ErrorMessage = "Idsta es un campo requerido.")]
		public long Idsta { get; set; }

		/// <summary>
		/// 	 Identificador primario de estado inicial
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idsesini")]
		[Display(Name = "Idsesini", Description = "Identificador primario de estado inicial")]
		[Required(ErrorMessage = "Idsesini es un campo requerido.")]
		public long Idsesini { get; set; }

		/// <summary>
		/// 	 Identificador primario de transacción
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idstr")]
		[Display(Name = "Idstr", Description = "Identificador primario de transacción")]
		[Required(ErrorMessage = "Idstr es un campo requerido.")]
		public long Idstr { get; set; }

		/// <summary>
		/// 	 Identificador primario de estado final de la transición
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idsesfin")]
		[Display(Name = "Idsesfin", Description = "Identificador primario de estado final de la transición")]
		[Required(ErrorMessage = "Idsesfin es un campo requerido.")]
		public long Idsesfin { get; set; }

		/// <summary>
		/// 	 Estado actual del registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("apiestado")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Apiestado", Description = "Estado actual del registro")]
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
		/// 	 Usuario que realizó la creación del registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("usucre")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Usucre", Description = "Usuario que realizó la creación del registro")]
		public string Usucre { get; set; }

		/// <summary>
		/// 	 Fecha en la que el registro fue creado
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("feccre")]
		[Display(Name = "Feccre", Description = "Fecha en la que el registro fue creado")]
		public DateTime Feccre { get; set; }

		/// <summary>
		/// 	 Usuario que realizó la última modificación del registro
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("usumod")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Usumod", Description = "Usuario que realizó la última modificación del registro")]
		public string Usumod { get; set; }

		/// <summary>
		/// 	 Fecha de última modificación del registro
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("fecmod")]
		[Display(Name = "Fecmod", Description = "Fecha de última modificación del registro")]
		public DateTime? Fecmod { get; set; }

		[ForeignKey("Idsta")]
		[InverseProperty("SegTransiciones")]
		public SegEstados IdstaNavigation { get; set; }
		[ForeignKey("Idstr")]
		[InverseProperty("SegTransiciones")]
		public SegTransacciones IdstrNavigation { get; set; }

		public SegTransacciones Idst { get; set; }
	}
}

