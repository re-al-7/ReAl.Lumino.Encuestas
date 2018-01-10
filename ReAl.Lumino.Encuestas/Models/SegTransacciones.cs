#region 
/***********************************************************************************************************
	NOMBRE:       SegTransacciones
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_transacciones

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
	[Table("seg_transacciones")]
	public class SegTransacciones
	{
		public static readonly  string StrNombreTabla = "Seg_transacciones";
		public static readonly  string StrAliasTabla = "seg_transacciones";

		public enum Fields
		{
			Idstr
			,Idsta
			,Transaccion
			,Sentencia
			,Descripcion
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegTransacciones()
		{
			SegRolesTablaTransaccion = new HashSet<SegRolesTablaTransaccion>();
			SegTransiciones = new HashSet<SegTransiciones>();
			

			//Inicializacion de Variables
			Transaccion = null;
			Sentencia = null;
			Descripcion = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegTransacciones(SegTransacciones obj)
		{
			SegRolesTablaTransaccion = new HashSet<SegRolesTablaTransaccion>();
			SegTransiciones = new HashSet<SegTransiciones>();
			
			Idstr = obj.Idstr;
			Idsta = obj.Idsta;
			Transaccion = obj.Transaccion;
			Sentencia = obj.Sentencia;
			Descripcion = obj.Descripcion;
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
		[Column("idstr")]
		[Display(Name = "Idstr", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idstr es un campo requerido.")]
		[Key]
		public long Idstr { get; set; }

		/// <summary>
		/// 	 Identificador primario de tabla a la que pertenece el estado
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsta")]
		[Display(Name = "Idsta", Description = "Identificador primario de tabla a la que pertenece el estado")]
		[Required(ErrorMessage = "Idsta es un campo requerido.")]
		public long Idsta { get; set; }

		/// <summary>
		/// 	 Nombre de transacción
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("transaccion")]
		[StringLength(15, MinimumLength=0)]
		[Display(Name = "Transaccion", Description = "Nombre de transacción")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Transaccion es un campo requerido.")]
		public string Transaccion { get; set; }

		/// <summary>
		/// 	 Indica la sentencia en la que se realiza la transacción
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("sentencia")]
		[StringLength(7, MinimumLength=0)]
		[Display(Name = "Sentencia", Description = "Indica la sentencia en la que se realiza la transacción")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Sentencia es un campo requerido.")]
		public string Sentencia { get; set; }

		/// <summary>
		/// 	 Descripción de lo que la transacción realiza
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("descripcion")]
		[StringLength(120, MinimumLength=0)]
		[Display(Name = "Descripcion", Description = "Descripción de lo que la transacción realiza")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Descripcion es un campo requerido.")]
		public string Descripcion { get; set; }

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
		[InverseProperty("SegTransacciones")]
		public SegTablas IdstaNavigation { get; set; }

		public ICollection<SegRolesTablaTransaccion> SegRolesTablaTransaccion { get; set; }
		public ICollection<SegTransiciones> SegTransiciones { get; set; }
		

	}
}

