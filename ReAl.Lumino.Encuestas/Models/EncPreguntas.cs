#region 
/***********************************************************************************************************
	NOMBRE:       EncPreguntas
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_preguntas

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
	[Table("enc_preguntas")]
	public class EncPreguntas
	{
		public static readonly  string StrNombreTabla = "Enc_preguntas";
		public static readonly  string StrAliasTabla = "enc_preguntas";

		public enum Fields
		{
			Idepr
			,Idopy
			,Idcnv
			,Idese
			,Idctp
			,Codigo
			,Pregunta
			,Ayuda
			,Minimo
			,Maximo
			,Catalogo
			,Longitud
			,CodigoEspecifique
			,MostrarVentana
			,Variable
			,Formula
			,RpnFormula
			,Regla
			,Rpn
			,Mensaje
			,Revision
			,Instruccion
			,Bucle
			,VariableBucle
			,CodigoEspecial
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public EncPreguntas()
		{
			EncRespuestas = new HashSet<EncRespuestas>();
			EncFlujos = new HashSet<EncFlujos>();
			EncEncuestas = new HashSet<EncEncuestas>();

			//Inicializacion de Variables
			Codigo = null;
			Pregunta = null;
			Ayuda = null;
			Catalogo = null;
			Longitud = null;
			CodigoEspecifique = null;
			Variable = null;
			Formula = null;
			RpnFormula = null;
			Regla = null;
			Rpn = null;
			Mensaje = null;
			Revision = null;
			Instruccion = null;
			VariableBucle = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public EncPreguntas(EncPreguntas obj)
		{
			EncRespuestas = new HashSet<EncRespuestas>();
			EncFlujos = new HashSet<EncFlujos>();
			EncEncuestas = new HashSet<EncEncuestas>();

			Idepr = obj.Idepr;
			Idopy = obj.Idopy;
			Idcnv = obj.Idcnv;
			Idese = obj.Idese;
			Idctp = obj.Idctp;
			Codigo = obj.Codigo;
			Pregunta = obj.Pregunta;
			Ayuda = obj.Ayuda;
			Minimo = obj.Minimo;
			Maximo = obj.Maximo;
			Catalogo = obj.Catalogo;
			Longitud = obj.Longitud;
			CodigoEspecifique = obj.CodigoEspecifique;
			MostrarVentana = obj.MostrarVentana;
			Variable = obj.Variable;
			Formula = obj.Formula;
			RpnFormula = obj.RpnFormula;
			Regla = obj.Regla;
			Rpn = obj.Rpn;
			Mensaje = obj.Mensaje;
			Revision = obj.Revision;
			Instruccion = obj.Instruccion;
			Bucle = obj.Bucle;
			VariableBucle = obj.VariableBucle;
			CodigoEspecial = obj.CodigoEspecial;
			Apiestado = obj.Apiestado;
			Apitransaccion = obj.Apitransaccion;
			Usucre = obj.Usucre;
			Feccre = obj.Feccre;
			Usumod = obj.Usumod;
			Fecmod = obj.Fecmod;
		}
		
		#endregion
		
		/// <summary>
		/// 	 Propiedad publica de tipo long que representa a la columna Idepr de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: Yes
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idepr")]
		[Display(Name = "Idepr", Description = " Propiedad publica de tipo long que representa a la columna Idepr de la Tabla enc_preguntas")]
		[Required(ErrorMessage = "Idepr es un campo requerido.")]
		[Key]
		public long Idepr { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo long que representa a la columna Idopy de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idopy")]
		[Display(Name = "Idopy", Description = " Propiedad publica de tipo long que representa a la columna Idopy de la Tabla enc_preguntas")]
		[Required(ErrorMessage = "Idopy es un campo requerido.")]
		public long Idopy { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo long que representa a la columna Idcnv de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idcnv")]
		[Display(Name = "Idcnv", Description = " Propiedad publica de tipo long que representa a la columna Idcnv de la Tabla enc_preguntas")]
		[Required(ErrorMessage = "Idcnv es un campo requerido.")]
		public long Idcnv { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo long que representa a la columna Idese de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idese")]
		[Display(Name = "Idese", Description = " Propiedad publica de tipo long que representa a la columna Idese de la Tabla enc_preguntas")]
		[Required(ErrorMessage = "Idese es un campo requerido.")]
		public long Idese { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo long que representa a la columna Idctp de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idctp")]
		[Display(Name = "Idctp", Description = " Propiedad publica de tipo long que representa a la columna Idctp de la Tabla enc_preguntas")]
		[Required(ErrorMessage = "Idctp es un campo requerido.")]
		public long Idctp { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Codigo de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("codigo")]
		[StringLength(15, MinimumLength=0)]
		[Display(Name = "Codigo", Description = " Propiedad publica de tipo string que representa a la columna Codigo de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Codigo es un campo requerido.")]
		public string Codigo { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Pregunta de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("pregunta")]
		[Display(Name = "Pregunta", Description = " Propiedad publica de tipo string que representa a la columna Pregunta de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Pregunta es un campo requerido.")]
		public string Pregunta { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Ayuda de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("ayuda")]
		[Display(Name = "Ayuda", Description = " Propiedad publica de tipo string que representa a la columna Ayuda de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Ayuda es un campo requerido.")]
		public string Ayuda { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo int que representa a la columna Minimo de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("minimo")]
		[Display(Name = "Minimo", Description = " Propiedad publica de tipo int que representa a la columna Minimo de la Tabla enc_preguntas")]
		[Required(ErrorMessage = "Minimo es un campo requerido.")]
		public int Minimo { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo int que representa a la columna Maximo de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("maximo")]
		[Display(Name = "Maximo", Description = " Propiedad publica de tipo int que representa a la columna Maximo de la Tabla enc_preguntas")]
		[Required(ErrorMessage = "Maximo es un campo requerido.")]
		public int Maximo { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Catalogo de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("catalogo")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Catalogo", Description = " Propiedad publica de tipo string que representa a la columna Catalogo de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Catalogo es un campo requerido.")]
		public string Catalogo { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo int que representa a la columna Longitud de la Tabla enc_preguntas
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("longitud")]
		[Display(Name = "Longitud", Description = " Propiedad publica de tipo int que representa a la columna Longitud de la Tabla enc_preguntas")]
		public int? Longitud { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Codigo_especifique de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("codigo_especifique")]
		[StringLength(2, MinimumLength=0)]
		[Display(Name = "CodigoEspecifique", Description = " Propiedad publica de tipo string que representa a la columna Codigo_especifique de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Codigo_especifique es un campo requerido.")]
		public string CodigoEspecifique { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo int que representa a la columna Mostrar_ventana de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("mostrar_ventana")]
		[Display(Name = "MostrarVentana", Description = " Propiedad publica de tipo int que representa a la columna Mostrar_ventana de la Tabla enc_preguntas")]
		[Required(ErrorMessage = "Mostrar_ventana es un campo requerido.")]
		public int MostrarVentana { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Variable de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("variable")]
		[Display(Name = "Variable", Description = " Propiedad publica de tipo string que representa a la columna Variable de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Variable es un campo requerido.")]
		public string Variable { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Formula de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("formula")]
		[Display(Name = "Formula", Description = " Propiedad publica de tipo string que representa a la columna Formula de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Formula es un campo requerido.")]
		public string Formula { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Rpn_formula de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("rpn_formula")]
		[Display(Name = "RpnFormula", Description = " Propiedad publica de tipo string que representa a la columna Rpn_formula de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Rpn_formula es un campo requerido.")]
		public string RpnFormula { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Regla de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("regla")]
		[Display(Name = "Regla", Description = " Propiedad publica de tipo string que representa a la columna Regla de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Regla es un campo requerido.")]
		public string Regla { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Rpn de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("rpn")]
		[Display(Name = "Rpn", Description = " Propiedad publica de tipo string que representa a la columna Rpn de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Rpn es un campo requerido.")]
		public string Rpn { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Mensaje de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("mensaje")]
		[Display(Name = "Mensaje", Description = " Propiedad publica de tipo string que representa a la columna Mensaje de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Mensaje es un campo requerido.")]
		public string Mensaje { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Revision de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("revision")]
		[Display(Name = "Revision", Description = " Propiedad publica de tipo string que representa a la columna Revision de la Tabla enc_preguntas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Revision es un campo requerido.")]
		public string Revision { get; set; }

		/// <summary>
		/// 	 En caso de ser necesario una instruccion en PopUp
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("instruccion")]
		[Display(Name = "Instruccion", Description = "En caso de ser necesario una instruccion en PopUp")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Instruccion es un campo requerido.")]
		public string Instruccion { get; set; }

		/// <summary>
		/// 	 Indica si esta pregunta es un FIN DE BUCLE (1) o No (0)
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("bucle")]
		[Display(Name = "Bucle", Description = "Indica si esta pregunta es un FIN DE BUCLE (1) o No (0)")]
		[Required(ErrorMessage = "Bucle es un campo requerido.")]
		public int Bucle { get; set; }

		/// <summary>
		/// 	 Necesario para las preguntas del Tipo BUCLE, en cuyo caso, se usara este campo para indicar las posibles respuestas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("variable_bucle")]
		[StringLength(150, MinimumLength=0)]
		[Display(Name = "VariableBucle", Description = "Necesario para las preguntas del Tipo BUCLE, en cuyo caso, se usara este campo para indicar las posibles respuestas")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Variable_bucle es un campo requerido.")]
		public string VariableBucle { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo int que representa a la columna Codigo_especial de la Tabla enc_preguntas
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("codigo_especial")]
		[Display(Name = "CodigoEspecial", Description = " Propiedad publica de tipo int que representa a la columna Codigo_especial de la Tabla enc_preguntas")]
		[Required(ErrorMessage = "Codigo_especial es un campo requerido.")]
		public int CodigoEspecial { get; set; }

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

		[ForeignKey("Idopy")]
		[InverseProperty("EncPreguntas")]
		public OpeProyectos IdopyNavigation { get; set; }
		[ForeignKey("Idcnv")]
		[InverseProperty("EncPreguntas")]
		public CatNiveles IdcnvNavigation { get; set; }
		[ForeignKey("Idese")]
		[InverseProperty("EncPreguntas")]
		public EncSecciones IdeseNavigation { get; set; }
		[ForeignKey("Idctp")]
		[InverseProperty("EncPreguntas")]
		public CatTiposPregunta IdctpNavigation { get; set; }

		[InverseProperty("IdeprNavigation")]
		public ICollection<EncRespuestas> EncRespuestas { get; set; }
		[InverseProperty("IdeprNavigation")]
		public ICollection<EncFlujos> EncFlujos { get; set; }
		[InverseProperty("IdeprNavigation")]
		public ICollection<EncEncuestas> EncEncuestas { get; set; }

	}
}

