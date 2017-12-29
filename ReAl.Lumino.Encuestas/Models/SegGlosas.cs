#region 
/***********************************************************************************************************
	NOMBRE:       SegGlosas
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_glosas

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
	[Table("seg_glosas")]
	public class SegGlosas
	{
		public const string StrNombreTabla = "Seg_glosas";
		public const string StrAliasTabla = "seg_glosas";

		public enum Fields
		{
			Idsgl
			,Iddoc
			,Nombretabla
			,Transaccion
			,Glosa
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegGlosas()
		{

			//Inicializacion de Variables
			Nombretabla = null;
			Transaccion = null;
			Glosa = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegGlosas(SegGlosas obj)
		{

			Idsgl = obj.Idsgl;
			Iddoc = obj.Iddoc;
			Nombretabla = obj.Nombretabla;
			Transaccion = obj.Transaccion;
			Glosa = obj.Glosa;
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
		[Column("idsgl")]
		[Display(Name = "Idsgl", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idsgl es un campo requerido.")]
		[Key]
		public long Idsgl { get; set; }

		/// <summary>
		/// 	 Identificador primario del documento al que hace referencia
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("iddoc")]
		[Display(Name = "Iddoc", Description = "Identificador primario del documento al que hace referencia")]
		[Required(ErrorMessage = "Iddoc es un campo requerido.")]
		public long Iddoc { get; set; }

		/// <summary>
		/// 	 Nombre de la tabla donde se realiza la transacción
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("nombretabla")]
		[StringLength(40, MinimumLength=0)]
		[Display(Name = "Nombretabla", Description = "Nombre de la tabla donde se realiza la transacción")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Nombretabla es un campo requerido.")]
		public string Nombretabla { get; set; }

		/// <summary>
		/// 	 Transacción que se realiza en la tabla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("transaccion")]
		[StringLength(15, MinimumLength=0)]
		[Display(Name = "Transaccion", Description = "Transacción que se realiza en la tabla")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Transaccion es un campo requerido.")]
		public string Transaccion { get; set; }

		/// <summary>
		/// 	 Glosa que describe la acción realizada sobre el registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("glosa")]
		[StringLength(2400, MinimumLength=0)]
		[Display(Name = "Glosa", Description = "Glosa que describe la acción realizada sobre el registro")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Glosa es un campo requerido.")]
		public string Glosa { get; set; }

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
		/// 	 Fecha en la que se realizó la última modificación del registro
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("fecmod")]
		[Display(Name = "Fecmod", Description = "Fecha en la que se realizó la última modificación del registro")]
		public DateTime? Fecmod { get; set; }

		[ForeignKey("Nombretabla")]
		[InverseProperty("SegGlosas")]
		public SegTablas NombretablaNavigation { get; set; }


	}
}

