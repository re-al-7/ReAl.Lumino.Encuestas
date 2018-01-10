#region 
/***********************************************************************************************************
	NOMBRE:       SegTablas
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_tablas

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
	[Table("seg_tablas")]
	public class SegTablas
	{
		public static readonly  string StrNombreTabla = "Seg_tablas";
		public static readonly  string StrAliasTabla = "seg_tablas";

		public enum Fields
		{
			Idsta
			,Idsap
			,Nombretabla
			,Alias
			,Descripcion
			,Beforestatement
			,Beforerow
			,Afterstatement
			,Afterrow
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegTablas()
		{
			SegEstados = new HashSet<SegEstados>();
			SegTransacciones = new HashSet<SegTransacciones>();
			SegConfiguracion = new HashSet<SegConfiguracion>();
			SegGlosas = new HashSet<SegGlosas>();

			//Inicializacion de Variables
			Nombretabla = null;
			Alias = null;
			Descripcion = null;
			Beforestatement = false;
			Beforerow = false;
			Afterstatement = false;
			Afterrow = false;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegTablas(SegTablas obj)
		{
			SegEstados = new HashSet<SegEstados>();
			SegTransacciones = new HashSet<SegTransacciones>();
			SegConfiguracion = new HashSet<SegConfiguracion>();
			SegGlosas = new HashSet<SegGlosas>();

			Idsta = obj.Idsta;
			Idsap = obj.Idsap;
			Nombretabla = obj.Nombretabla;
			Alias = obj.Alias;
			Descripcion = obj.Descripcion;
			Beforestatement = obj.Beforestatement;
			Beforerow = obj.Beforerow;
			Afterstatement = obj.Afterstatement;
			Afterrow = obj.Afterrow;
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
		[Column("idsta")]
		[Display(Name = "Idsta", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idsta es un campo requerido.")]
		[Key]
		public long Idsta { get; set; }

		/// <summary>
		/// 	 Identificador primario de aplicación a la que pertenece este registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsap")]
		[Display(Name = "Idsap", Description = "Identificador primario de aplicación a la que pertenece este registro")]
		[Required(ErrorMessage = "Idsap es un campo requerido.")]
		public long Idsap { get; set; }

		/// <summary>
		/// 	 Nombre de tabla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("nombretabla")]
		[StringLength(40, MinimumLength=0)]
		[Display(Name = "Nombretabla", Description = "Nombre de tabla")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Nombretabla es un campo requerido.")]
		public string Nombretabla { get; set; }

		/// <summary>
		/// 	 Alias de tabla, identificador único de tabla se utiliza este valor para identificar a los procedimientos de la misma
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("alias")]
		[StringLength(3, MinimumLength=0)]
		[Display(Name = "Alias", Description = "Alias de tabla, identificador único de tabla se utiliza este valor para identificar a los procedimientos de la misma")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Alias es un campo requerido.")]
		public string Alias { get; set; }

		/// <summary>
		/// 	 Descripciòn de objetos que almacena la tabla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("descripcion")]
		[StringLength(520, MinimumLength=0)]
		[Display(Name = "Descripcion", Description = "Descripciòn de objetos que almacena la tabla")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Descripcion es un campo requerido.")]
		public string Descripcion { get; set; }

		/// <summary>
		/// 	 Indica si existirán RdN's en esta opción del disparador
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("beforestatement")]
		[Display(Name = "Beforestatement", Description = "Indica si existirán RdN's en esta opción del disparador")]
		[Required(ErrorMessage = "Beforestatement es un campo requerido.")]
		public bool Beforestatement { get; set; }

		/// <summary>
		/// 	 Indica si existirán RdN's en esta opción del disparador
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("beforerow")]
		[Display(Name = "Beforerow", Description = "Indica si existirán RdN's en esta opción del disparador")]
		[Required(ErrorMessage = "Beforerow es un campo requerido.")]
		public bool Beforerow { get; set; }

		/// <summary>
		/// 	 Indica si existirán RdN's en esta opción del disparador
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("afterstatement")]
		[Display(Name = "Afterstatement", Description = "Indica si existirán RdN's en esta opción del disparador")]
		[Required(ErrorMessage = "Afterstatement es un campo requerido.")]
		public bool Afterstatement { get; set; }

		/// <summary>
		/// 	 Indica si existirán RdN's en esta opción del disparador
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("afterrow")]
		[Display(Name = "Afterrow", Description = "Indica si existirán RdN's en esta opción del disparador")]
		[Required(ErrorMessage = "Afterrow es un campo requerido.")]
		public bool Afterrow { get; set; }

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

		[ForeignKey("Idsap")]
		[InverseProperty("SegTablas")]
		public SegAplicaciones IdsapNavigation { get; set; }

		[InverseProperty("IdstaNavigation")]
		public ICollection<SegEstados> SegEstados { get; set; }
		[InverseProperty("IdstaNavigation")]
		public ICollection<SegTransacciones> SegTransacciones { get; set; }
		[InverseProperty("IdstaNavigation")]
		public ICollection<SegConfiguracion> SegConfiguracion { get; set; }
		[InverseProperty("NombretablaNavigation")]
		public ICollection<SegGlosas> SegGlosas { get; set; }

	}
}

