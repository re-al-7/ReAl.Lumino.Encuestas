#region 
/***********************************************************************************************************
	NOMBRE:       EncRespuestas
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_respuestas

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
	[Table("enc_respuestas")]
	public class EncRespuestas
	{
		public const string StrNombreTabla = "Enc_respuestas";
		public const string StrAliasTabla = "enc_respuestas";

		public enum Fields
		{
			Idere
			,Idepr
			,Codigo
			,Respuesta
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public EncRespuestas()
		{

			//Inicializacion de Variables
			Idepr = null;
			Codigo = null;
			Respuesta = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public EncRespuestas(EncRespuestas obj)
		{

			Idere = obj.Idere;
			Idepr = obj.Idepr;
			Codigo = obj.Codigo;
			Respuesta = obj.Respuesta;
			Apiestado = obj.Apiestado;
			Apitransaccion = obj.Apitransaccion;
			Usucre = obj.Usucre;
			Feccre = obj.Feccre;
			Usumod = obj.Usumod;
			Fecmod = obj.Fecmod;
		}
		
		#endregion
		
		/// <summary>
		/// 	 Representa al identificador unica del registro en la tabla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: Yes
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idere")]
		[Display(Name = "Idere", Description = "Representa al identificador unica del registro en la tabla")]
		[Required(ErrorMessage = "Idere es un campo requerido.")]
		[Key]
		public long Idere { get; set; }

		/// <summary>
		/// 	 Representa al identificador de la tabla enc_pregunta al que esta asociado este registro
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idepr")]
		[Display(Name = "Idepr", Description = "Representa al identificador de la tabla enc_pregunta al que esta asociado este registro")]
		public long? Idepr { get; set; }

		/// <summary>
		/// 	 Codigo de la respuesta
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("codigo")]
		[StringLength(10, MinimumLength=0)]
		[Display(Name = "Codigo", Description = "Codigo de la respuesta")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Codigo es un campo requerido.")]
		public string Codigo { get; set; }

		/// <summary>
		/// 	 Texto de la respuesta
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("respuesta")]
		[Display(Name = "Respuesta", Description = "Texto de la respuesta")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Respuesta es un campo requerido.")]
		public string Respuesta { get; set; }

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
		/// 	 Propiedad publica de tipo string que representa a la columna Apitransaccion de la Tabla enc_respuestas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("apitransaccion")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Apitransaccion", Description = " Propiedad publica de tipo string que representa a la columna Apitransaccion de la Tabla enc_respuestas")]
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

		[ForeignKey("Idepr")]
		[InverseProperty("EncRespuestas")]
		public EncPreguntas IdeprNavigation { get; set; }


	}
}

