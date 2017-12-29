#region 
/***********************************************************************************************************
	NOMBRE:       SegMensajes
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_mensajes

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
	[Table("seg_mensajes")]
	public class SegMensajes
	{
		public const string StrNombreTabla = "Seg_mensajes";
		public const string StrAliasTabla = "seg_mensajes";

		public enum Fields
		{
			Idsme
			,Idsap
			,Aplicacionerror
			,Texto
			,Origen
			,Causa
			,Accion
			,Comentario
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegMensajes()
		{

			//Inicializacion de Variables
			Aplicacionerror = null;
			Texto = null;
			Origen = null;
			Causa = null;
			Accion = null;
			Comentario = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegMensajes(SegMensajes obj)
		{

			Idsme = obj.Idsme;
			Idsap = obj.Idsap;
			Aplicacionerror = obj.Aplicacionerror;
			Texto = obj.Texto;
			Origen = obj.Origen;
			Causa = obj.Causa;
			Accion = obj.Accion;
			Comentario = obj.Comentario;
			Apiestado = obj.Apiestado;
			Apitransaccion = obj.Apitransaccion;
			Usucre = obj.Usucre;
			Feccre = obj.Feccre;
			Usumod = obj.Usumod;
			Fecmod = obj.Fecmod;
		}
		
		#endregion
		
		/// <summary>
		/// 	 Identificador primario del registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: Yes
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idsme")]
		[Display(Name = "Idsme", Description = "Identificador primario del registro")]
		[Required(ErrorMessage = "Idsme es un campo requerido.")]
		[Key]
		public long Idsme { get; set; }

		/// <summary>
		/// 	 Aplicación al que pertenece el mensaje
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsap")]
		[Display(Name = "Idsap", Description = "Aplicación al que pertenece el mensaje")]
		[Required(ErrorMessage = "Idsap es un campo requerido.")]
		public long Idsap { get; set; }

		/// <summary>
		/// 	 Concatenación del número de error, con la aplicación a la que este pertenece
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("aplicacionerror")]
		[StringLength(9, MinimumLength=0)]
		[Display(Name = "Aplicacionerror", Description = "Concatenación del número de error, con la aplicación a la que este pertenece")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Aplicacionerror es un campo requerido.")]
		public string Aplicacionerror { get; set; }

		/// <summary>
		/// 	 Texto descriptivo del mensaje de error
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("texto")]
		[StringLength(180, MinimumLength=0)]
		[Display(Name = "Texto", Description = "Texto descriptivo del mensaje de error")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Texto es un campo requerido.")]
		public string Texto { get; set; }

		/// <summary>
		/// 	 Origen físico donde se ha originado el error
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("origen")]
		[StringLength(100, MinimumLength=0)]
		[Display(Name = "Origen", Description = "Origen físico donde se ha originado el error")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Origen es un campo requerido.")]
		public string Origen { get; set; }

		/// <summary>
		/// 	 Descripción detallada de por que se origina el error
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("causa")]
		[StringLength(700, MinimumLength=0)]
		[Display(Name = "Causa", Description = "Descripción detallada de por que se origina el error")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Causa es un campo requerido.")]
		public string Causa { get; set; }

		/// <summary>
		/// 	 Acción que se debe realizar para subsanar el error
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("accion")]
		[StringLength(700, MinimumLength=0)]
		[Display(Name = "Accion", Description = "Acción que se debe realizar para subsanar el error")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Accion es un campo requerido.")]
		public string Accion { get; set; }

		/// <summary>
		/// 	 Comentario realizado acerca del error, puede ser utilizado por el desarrollador
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("comentario")]
		[StringLength(700, MinimumLength=0)]
		[Display(Name = "Comentario", Description = "Comentario realizado acerca del error, puede ser utilizado por el desarrollador")]
		public string Comentario { get; set; }

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
		[InverseProperty("SegMensajes")]
		public SegAplicaciones IdsapNavigation { get; set; }


	}
}

