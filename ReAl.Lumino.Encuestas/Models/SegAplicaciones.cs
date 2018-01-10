#region 
/***********************************************************************************************************
	NOMBRE:       SegAplicaciones
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_aplicaciones

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
	[Table("seg_aplicaciones")]
	public class SegAplicaciones
	{
		public static readonly  string StrNombreTabla = "Seg_aplicaciones";
		public static readonly  string StrAliasTabla = "seg_aplicaciones";

		public enum Fields
		{
			Idsap
			,Sigla
			,Nombre
			,Descripcion
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegAplicaciones()
		{
			SegTablas = new HashSet<SegTablas>();
			SegMensajes = new HashSet<SegMensajes>();
			SegPaginas = new HashSet<SegPaginas>();

			//Inicializacion de Variables
			Sigla = null;
			Nombre = null;
			Descripcion = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegAplicaciones(SegAplicaciones obj)
		{
			SegTablas = new HashSet<SegTablas>();
			SegMensajes = new HashSet<SegMensajes>();
			SegPaginas = new HashSet<SegPaginas>();

			Idsap = obj.Idsap;
			Sigla = obj.Sigla;
			Nombre = obj.Nombre;
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
		[Column("idsap")]
		[Display(Name = "Idsap", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idsap es un campo requerido.")]
		[Key]
		public long Idsap { get; set; }

		/// <summary>
		/// 	 Sigla de Aplicación del Sistema
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("sigla")]
		[StringLength(3, MinimumLength=0)]
		[Display(Name = "Sigla", Description = "Sigla de Aplicación del Sistema")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Sigla es un campo requerido.")]
		public string Sigla { get; set; }

		/// <summary>
		/// 	 Nombre de Aplicación del Sistema
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("nombre")]
		[StringLength(150, MinimumLength=0)]
		[Display(Name = "Nombre", Description = "Nombre de Aplicación del Sistema")]
		public string Nombre { get; set; }

		/// <summary>
		/// 	 Descripción de aplicación
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("descripcion")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Descripcion", Description = "Descripción de aplicación")]
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
		/// 	 Usuario que realizó la última modificación en le registro
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("usumod")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Usumod", Description = "Usuario que realizó la última modificación en le registro")]
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


		[InverseProperty("IdsapNavigation")]
		public ICollection<SegTablas> SegTablas { get; set; }
		[InverseProperty("IdsapNavigation")]
		public ICollection<SegMensajes> SegMensajes { get; set; }
		[InverseProperty("IdsapNavigation")]
		public ICollection<SegPaginas> SegPaginas { get; set; }

	}
}

