#region 
/***********************************************************************************************************
	NOMBRE:       EncSecciones
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_secciones

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
	[Table("enc_secciones")]
	public class EncSecciones
	{
		public const string StrNombreTabla = "Enc_secciones";
		public const string StrAliasTabla = "enc_secciones";

		public enum Fields
		{
			Idese
			,Idopy
			,Idcnv
			,Codigo
			,Seccion
			,Abierta
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public EncSecciones()
		{
			EncPreguntas = new HashSet<EncPreguntas>();

			//Inicializacion de Variables
			Codigo = null;
			Seccion = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public EncSecciones(EncSecciones obj)
		{
			EncPreguntas = new HashSet<EncPreguntas>();

			Idese = obj.Idese;
			Idopy = obj.Idopy;
			Idcnv = obj.Idcnv;
			Codigo = obj.Codigo;
			Seccion = obj.Seccion;
			Abierta = obj.Abierta;
			Apiestado = obj.Apiestado;
			Apitransaccion = obj.Apitransaccion;
			Usucre = obj.Usucre;
			Feccre = obj.Feccre;
			Usumod = obj.Usumod;
			Fecmod = obj.Fecmod;
		}
		
		#endregion
		
		/// <summary>
		/// 	 Identificador de la seccion al que pertenece el registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: Yes
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idese")]
		[Display(Name = "Idese", Description = "Identificador de la seccion al que pertenece el registro")]
		[Required(ErrorMessage = "Idese es un campo requerido.")]
		[Key]
		public long Idese { get; set; }

		/// <summary>
		/// 	 Identificador del proyecto al que pertenece el registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idopy")]
		[Display(Name = "Idopy", Description = "Identificador del proyecto al que pertenece el registro")]
		[Required(ErrorMessage = "Idopy es un campo requerido.")]
		public long Idopy { get; set; }

		/// <summary>
		/// 	 Identificador del nivel al que pertenece el registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idcnv")]
		[Display(Name = "Idcnv", Description = "Identificador del nivel al que pertenece el registro")]
		[Required(ErrorMessage = "Idcnv es un campo requerido.")]
		public long Idcnv { get; set; }

		/// <summary>
		/// 	 Codigo de seccion
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("codigo")]
		[Display(Name = "Codigo", Description = "Codigo de seccion")]
		public string Codigo { get; set; }

		/// <summary>
		/// 	 Texto o nombre de seccion
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("seccion")]
		[Display(Name = "Seccion", Description = "Texto o nombre de seccion")]
		public string Seccion { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo int que representa a la columna Abierta de la Tabla enc_secciones
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("abierta")]
		[Display(Name = "Abierta", Description = " Propiedad publica de tipo int que representa a la columna Abierta de la Tabla enc_secciones")]
		[Required(ErrorMessage = "Abierta es un campo requerido.")]
		public int Abierta { get; set; }

		/// <summary>
		/// 	 Describe el estado en el que se encuentra un determinado registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("apiestado")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Apiestado", Description = "Describe el estado en el que se encuentra un determinado registro")]
		public string Apiestado { get; set; }

		/// <summary>
		/// 	 Propiedad publica de tipo string que representa a la columna Apitransaccion de la Tabla enc_secciones
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("apitransaccion")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Apitransaccion", Description = " Propiedad publica de tipo string que representa a la columna Apitransaccion de la Tabla enc_secciones")]
		public string Apitransaccion { get; set; }

		/// <summary>
		/// 	 Describe el usuario que creo un determinado un registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("usucre")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Usucre", Description = "Describe el usuario que creo un determinado un registro")]
		public string Usucre { get; set; }

		/// <summary>
		/// 	 Describe la fecha de creación de un determinado registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("feccre")]
		[Display(Name = "Feccre", Description = "Describe la fecha de creación de un determinado registro")]
		public DateTime Feccre { get; set; }

		/// <summary>
		/// 	 Describe el usuario que modifico un determinado registro
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("usumod")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Usumod", Description = "Describe el usuario que modifico un determinado registro")]
		public string Usumod { get; set; }

		/// <summary>
		/// 	 Describe la fecha de modificacción de determinado un registro
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("fecmod")]
		[Display(Name = "Fecmod", Description = "Describe la fecha de modificacción de determinado un registro")]
		public DateTime? Fecmod { get; set; }

		[ForeignKey("Idopy")]
		[InverseProperty("EncSecciones")]
		public OpeProyectos IdopyNavigation { get; set; }
		[ForeignKey("Idcnv")]
		[InverseProperty("EncSecciones")]
		public CatNiveles IdcnvNavigation { get; set; }

		[InverseProperty("IdeseNavigation")]
		public ICollection<EncPreguntas> EncPreguntas { get; set; }

	}
}

