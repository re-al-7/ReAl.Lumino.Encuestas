#region 
/***********************************************************************************************************
	NOMBRE:       EncInformantes
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_informantes

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
	[Table("enc_informantes")]
	public class EncInformantes
	{
		public const string StrNombreTabla = "Enc_informantes";
		public const string StrAliasTabla = "enc_informantes";

		public enum Fields
		{
			Idein
			,IdeinTab
			,IdeinPadre
			,IdeinTabPadre
			,Idcnv
			,Idomv
			,Idoup
			,Latitud
			,Longitud
			,Codigo
			,Descripcion
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public EncInformantes()
		{
			EncEncuestas = new HashSet<EncEncuestas>();

			//Inicializacion de Variables
			IdeinPadre = null;
			IdeinTabPadre = null;
			Idoup = null;
			Codigo = null;
			Descripcion = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public EncInformantes(EncInformantes obj)
		{
			EncEncuestas = new HashSet<EncEncuestas>();

			Idein = obj.Idein;
			IdeinTab = obj.IdeinTab;
			IdeinPadre = obj.IdeinPadre;
			IdeinTabPadre = obj.IdeinTabPadre;
			Idcnv = obj.Idcnv;
			Idomv = obj.Idomv;
			Idoup = obj.Idoup;
			Latitud = obj.Latitud;
			Longitud = obj.Longitud;
			Codigo = obj.Codigo;
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
		/// 	 Identificador unico que representa al registro en la tabla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: Yes
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idein")]
		[Display(Name = "Idein", Description = "Identificador unico que representa al registro en la tabla")]
		[Required(ErrorMessage = "Idein es un campo requerido.")]
		[Key]
		public long Idein { get; set; }

		/// <summary>
		/// 	 Identificador unico que representa al registro en la tabla en el Dispositivo
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idein_tab")]
		[Display(Name = "IdeinTab", Description = "Identificador unico que representa al registro en la tabla en el Dispositivo")]
		[Required(ErrorMessage = "Idein_tab es un campo requerido.")]
		public long IdeinTab { get; set; }

		/// <summary>
		/// 	 Identificador que representa al registro padre en la misma tabla
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idein_padre")]
		[Display(Name = "IdeinPadre", Description = "Identificador que representa al registro padre en la misma tabla")]
		public long? IdeinPadre { get; set; }

		/// <summary>
		/// 	 Identificador que representa al registro padre en la misma tabla en el Dispositivo
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idein_tab_padre")]
		[Display(Name = "IdeinTabPadre", Description = "Identificador que representa al registro padre en la misma tabla en el Dispositivo")]
		public long? IdeinTabPadre { get; set; }

		/// <summary>
		/// 	 Es el identificador unico de la tabla enc_nivel
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idcnv")]
		[Display(Name = "Idcnv", Description = "Es el identificador unico de la tabla enc_nivel")]
		[Required(ErrorMessage = "Idcnv es un campo requerido.")]
		public long Idcnv { get; set; }

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
		/// 	 Es el identificador unico de la tabla ope_upms en caso de cambio de UPM
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idoup")]
		[Display(Name = "Idoup", Description = "Es el identificador unico de la tabla ope_upms en caso de cambio de UPM")]
		public long? Idoup { get; set; }

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
		/// 	 Codigo del informante
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("codigo")]
		[StringLength(500, MinimumLength=0)]
		[Display(Name = "Codigo", Description = "Codigo del informante")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Codigo es un campo requerido.")]
		public string Codigo { get; set; }

		/// <summary>
		/// 	 Descripcion del informante
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("descripcion")]
		[Display(Name = "Descripcion", Description = "Descripcion del informante")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Descripcion es un campo requerido.")]
		public string Descripcion { get; set; }

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

		[ForeignKey("Idcnv")]
		[InverseProperty("EncInformantes")]
		public CatNiveles IdcnvNavigation { get; set; }
		[ForeignKey("Idomv")]
		[InverseProperty("EncInformantes")]
		public OpeMovimientos IdomvNavigation { get; set; }

		[InverseProperty("IdeinNavigation")]
		public ICollection<EncEncuestas> EncEncuestas { get; set; }

	}
}

