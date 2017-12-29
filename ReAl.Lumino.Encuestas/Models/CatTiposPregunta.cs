#region 
/***********************************************************************************************************
	NOMBRE:       CatTiposPregunta
	DESCRIPCION:
		Clase que define un objeto para la Tabla cat_tipos_pregunta

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
	[Table("cat_tipos_pregunta")]
	public class CatTiposPregunta
	{
		public const string StrNombreTabla = "Cat_tipos_pregunta";
		public const string StrAliasTabla = "cat_tipos_pregunta";

		public enum Fields
		{
			Idctp
			,TipoPregunta
			,Descripcion
			,RespuestaValor
			,ExportarCodigo
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public CatTiposPregunta()
		{
			EncPreguntas = new HashSet<EncPreguntas>();

			//Inicializacion de Variables
			TipoPregunta = null;
			Descripcion = null;
			RespuestaValor = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public CatTiposPregunta(CatTiposPregunta obj)
		{
			EncPreguntas = new HashSet<EncPreguntas>();

			Idctp = obj.Idctp;
			TipoPregunta = obj.TipoPregunta;
			Descripcion = obj.Descripcion;
			RespuestaValor = obj.RespuestaValor;
			ExportarCodigo = obj.ExportarCodigo;
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
		[Column("idctp")]
		[Display(Name = "Idctp", Description = "Es el identificador unico que representa al registro en la tabla")]
		[Required(ErrorMessage = "Idctp es un campo requerido.")]
		[Key]
		public long Idctp { get; set; }

		/// <summary>
		/// 	 Es el tipo de pregunta UNICO
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("tipo_pregunta")]
		[Display(Name = "TipoPregunta", Description = "Es el tipo de pregunta UNICO")]
		public string TipoPregunta { get; set; }

		/// <summary>
		/// 	 Es la descripcion del tipo de pregunta
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("descripcion")]
		[Display(Name = "Descripcion", Description = "Es la descripcion del tipo de pregunta")]
		public string Descripcion { get; set; }

		/// <summary>
		/// 	 Es el tipo predominante para la evaluacion del salto en la pregunta. Puede ser RESPUESTA o CODIGO
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("respuesta_valor")]
		[Display(Name = "RespuestaValor", Description = "Es el tipo predominante para la evaluacion del salto en la pregunta. Puede ser RESPUESTA o CODIGO")]
		public string RespuestaValor { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo int que representa a la columna ExportarCodigo de la Tabla cat_tipos_pregunta
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("exportar_codigo")]
		[Display(Name = "ExportarCodigo", Description = " Propiedad publica de tipo int que representa a la columna ExportarCodigo de la Tabla cat_tipos_pregunta")]
		[Required(ErrorMessage = "ExportarCodigo es un campo requerido.")]
		public int ExportarCodigo { get; set; }

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


		[InverseProperty("IdctpNavigation")]
		public ICollection<EncPreguntas> EncPreguntas { get; set; }

	}
}

