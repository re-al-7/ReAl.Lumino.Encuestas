#region 
/***********************************************************************************************************
	NOMBRE:       EncEncuestas
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_encuestas

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
	[Table("enc_encuestas")]
	public class EncEncuestas
	{
		public static readonly  string StrNombreTabla = "Enc_encuestas";
		public static readonly  string StrAliasTabla = "enc_encuestas";

		public enum Fields
		{
			Idenc
			,IdencTab
			,Idein
			,Idomv
			,Idepr
			,Idere
			,CodigoRespuesta
			,Respuesta
			,Observacion
			,Latitud
			,Longitud
			,IdLast
			,Fila
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public EncEncuestas()
		{

			//Inicializacion de Variables
			CodigoRespuesta = null;
			Respuesta = null;
			Observacion = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public EncEncuestas(EncEncuestas obj)
		{

			Idenc = obj.Idenc;
			IdencTab = obj.IdencTab;
			Idein = obj.Idein;
			Idomv = obj.Idomv;
			Idepr = obj.Idepr;
			Idere = obj.Idere;
			CodigoRespuesta = obj.CodigoRespuesta;
			Respuesta = obj.Respuesta;
			Observacion = obj.Observacion;
			Latitud = obj.Latitud;
			Longitud = obj.Longitud;
			IdLast = obj.IdLast;
			Fila = obj.Fila;
			Apiestado = obj.Apiestado;
			Apitransaccion = obj.Apitransaccion;
			Usucre = obj.Usucre;
			Feccre = obj.Feccre;
			Usumod = obj.Usumod;
			Fecmod = obj.Fecmod;
		}
		
		#endregion
		
		/// <summary>
		/// 	 Identificador unico que representa al registro en la tabla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: Yes
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idenc")]
		[Display(Name = "Idenc", Description = "Identificador unico que representa al registro en la tabla")]
		[Required(ErrorMessage = "Idenc es un campo requerido.")]
		[Key]
		public long Idenc { get; set; }

		/// <summary>
		/// 	 Identificador unico que representa al registro en la tabla en el Dispositivo
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idenc_tab")]
		[Display(Name = "IdencTab", Description = "Identificador unico que representa al registro en la tabla en el Dispositivo")]
		[Required(ErrorMessage = "Idenc_tab es un campo requerido.")]
		public long IdencTab { get; set; }

		/// <summary>
		/// 	 Es el identificador unico de la tabla enc_informante
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idein")]
		[Display(Name = "Idein", Description = "Es el identificador unico de la tabla enc_informante")]
		[Required(ErrorMessage = "Idein es un campo requerido.")]
		public long Idein { get; set; }

		/// <summary>
		/// 	 Es el identificador unico de la tabla enc_movimiento
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idomv")]
		[Display(Name = "Idomv", Description = "Es el identificador unico de la tabla enc_movimiento")]
		[Required(ErrorMessage = "Idomv es un campo requerido.")]
		public long Idomv { get; set; }

		/// <summary>
		/// 	 Es el identificador unico de la tabla enc_pregunta
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idepr")]
		[Display(Name = "Idepr", Description = "Es el identificador unico de la tabla enc_pregunta")]
		[Required(ErrorMessage = "Idepr es un campo requerido.")]
		public long Idepr { get; set; }

		/// <summary>
		/// 	 Es el identificador unico de la tabla enc_respuesta
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idere")]
		[Display(Name = "Idere", Description = "Es el identificador unico de la tabla enc_respuesta")]
		[Required(ErrorMessage = "Idere es un campo requerido.")]
		public long Idere { get; set; }

		/// <summary>
		/// 	 Es el Codigo utilizado por la respuesta, segun la tabla enc_respuesta
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("codigo_respuesta")]
		[Display(Name = "CodigoRespuesta", Description = "Es el Codigo utilizado por la respuesta, segun la tabla enc_respuesta")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Codigo_respuesta es un campo requerido.")]
		public string CodigoRespuesta { get; set; }

		/// <summary>
		/// 	 Es la respuesta TEXTUAL a la pregunta
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("respuesta")]
		[Display(Name = "Respuesta", Description = "Es la respuesta TEXTUAL a la pregunta")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Respuesta es un campo requerido.")]
		public string Respuesta { get; set; }

		/// <summary>
		/// 	 Representa alguna observacion sobre la respuesta o pregunta
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("observacion")]
		[Display(Name = "Observacion", Description = "Representa alguna observacion sobre la respuesta o pregunta")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Observacion es un campo requerido.")]
		public string Observacion { get; set; }

		/// <summary>
		/// 	 Latitud del punto CERO de la Capital de Departamento
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("latitud")]
		[Display(Name = "Latitud", Description = "Latitud del punto CERO de la Capital de Departamento")]
		[Required(ErrorMessage = "Latitud es un campo requerido.")]
		public Decimal Latitud { get; set; }

		/// <summary>
		/// 	 Longitud del punto CERO de la Capital de Departamento
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("longitud")]
		[Display(Name = "Longitud", Description = "Longitud del punto CERO de la Capital de Departamento")]
		[Required(ErrorMessage = "Longitud es un campo requerido.")]
		public Decimal Longitud { get; set; }

		/// <summary>
		/// 	 Es el identificador para control de ediciones
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("id_last")]
		[Display(Name = "IdLast", Description = "Es el identificador para control de ediciones")]
		[Required(ErrorMessage = "Id_last es un campo requerido.")]
		public int IdLast { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo int que representa a la columna Fila de la Tabla enc_encuestas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("fila")]
		[Display(Name = "Fila", Description = " Propiedad publica de tipo int que representa a la columna Fila de la Tabla enc_encuestas")]
		[Required(ErrorMessage = "Fila es un campo requerido.")]
		public int Fila { get; set; }

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

		[ForeignKey("Idein")]
		[InverseProperty("EncEncuestas")]
		public EncInformantes IdeinNavigation { get; set; }
		[ForeignKey("Idomv")]
		[InverseProperty("EncEncuestas")]
		public OpeMovimientos IdomvNavigation { get; set; }
		[ForeignKey("Idepr")]
		[InverseProperty("EncEncuestas")]
		public EncPreguntas IdeprNavigation { get; set; }


	}
}

