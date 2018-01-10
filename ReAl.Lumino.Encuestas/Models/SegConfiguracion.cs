#region 
/***********************************************************************************************************
	NOMBRE:       SegConfiguracion
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_configuracion

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
	[Table("seg_configuracion")]
	public class SegConfiguracion
	{
		public static readonly  string StrNombreTabla = "Seg_configuracion";
		public static readonly  string StrAliasTabla = "seg_configuracion";

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

		#region Constructoress
		
		public SegConfiguracion()
		{

			//Inicializacion de Variables
			Configuracion = null;
			Funcion = null;
			Parametrosentrada = null;
			Parametrossalida = null;
			Descripcion = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegConfiguracion(SegConfiguracion obj)
		{

			Idscf = obj.Idscf;
			Idsta = obj.Idsta;
			Configuracion = obj.Configuracion;
			Funcion = obj.Funcion;
			Parametrosentrada = obj.Parametrosentrada;
			Parametrossalida = obj.Parametrossalida;
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
		[Column("idscf")]
		[Display(Name = "Idscf", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idscf es un campo requerido.")]
		[Key]
		public long Idscf { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo long que representa a la columna Idsta de la Tabla seg_configuracion
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsta")]
		[Display(Name = "Idsta", Description = " Propiedad publica de tipo long que representa a la columna Idsta de la Tabla seg_configuracion")]
		[Required(ErrorMessage = "Idsta es un campo requerido.")]
		public long Idsta { get; set; }

		/// <summary>
		/// 	 Definimos el nombre de la funcion a ejecutar
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("configuracion")]
		[StringLength(70, MinimumLength=0)]
		[Display(Name = "Configuracion", Description = "Definimos el nombre de la funcion a ejecutar")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Configuracion es un campo requerido.")]
		public string Configuracion { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Funcion de la Tabla seg_configuracion
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("funcion")]
		[StringLength(200, MinimumLength=0)]
		[Display(Name = "Funcion", Description = " Propiedad publica de tipo string que representa a la columna Funcion de la Tabla seg_configuracion")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Funcion es un campo requerido.")]
		public string Funcion { get; set; }

		/// <summary>
		/// 	 parametros de entrada de la function, el parametro de entrada se reemplaza por un ? en el campo funcionsco; [*] significa todos los parametros
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("parametrosentrada")]
		[StringLength(100, MinimumLength=0)]
		[Display(Name = "Parametrosentrada", Description = "parametros de entrada de la function, el parametro de entrada se reemplaza por un ? en el campo funcionsco; [*] significa todos los parametros")]
		public string Parametrosentrada { get; set; }

		/// <summary>
		/// 	 define los parametros de salida de la function , ejemplo idusuario,login o simplemente *
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("parametrossalida")]
		[StringLength(100, MinimumLength=0)]
		[Display(Name = "Parametrossalida", Description = "define los parametros de salida de la function , ejemplo idusuario,login o simplemente *")]
		public string Parametrossalida { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Descripcion de la Tabla seg_configuracion
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("descripcion")]
		[StringLength(200, MinimumLength=0)]
		[Display(Name = "Descripcion", Description = " Propiedad publica de tipo string que representa a la columna Descripcion de la Tabla seg_configuracion")]
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
		/// 	 Fecha en la que se realizó la creación del registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("feccre")]
		[Display(Name = "Feccre", Description = "Fecha en la que se realizó la creación del registro")]
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
		/// 	 Propiedad publica de tipo DateTime que representa a la columna Fecmod de la Tabla seg_configuracion
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("fecmod")]
		[Display(Name = "Fecmod", Description = " Propiedad publica de tipo DateTime que representa a la columna Fecmod de la Tabla seg_configuracion")]
		public DateTime? Fecmod { get; set; }

		[ForeignKey("Idsta")]
		[InverseProperty("SegConfiguracion")]
		public SegTablas IdstaNavigation { get; set; }


	}
}

