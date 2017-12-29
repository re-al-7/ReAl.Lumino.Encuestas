#region 
/***********************************************************************************************************
	NOMBRE:       OpeProyectos
	DESCRIPCION:
		Clase que define un objeto para la Tabla ope_proyectos

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
	[Table("ope_proyectos")]
	public class OpeProyectos
	{
		public const string StrNombreTabla = "Ope_proyectos";
		public const string StrAliasTabla = "ope_proyectos";

		public enum Fields
		{
			Idopy
			,Nombre
			,Codigo
			,Descripcion
			,Fecinicio
			,Fecfin
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public OpeProyectos()
		{
			OpeUpms = new HashSet<OpeUpms>();
			EncSecciones = new HashSet<EncSecciones>();
			EncPreguntas = new HashSet<EncPreguntas>();
			EncFlujos = new HashSet<EncFlujos>();
			OpeBrigadas = new HashSet<OpeBrigadas>();
			SegUsuariosRestriccion = new HashSet<SegUsuariosRestriccion>();

			//Inicializacion de Variables
			Nombre = null;
			Codigo = null;
			Descripcion = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public OpeProyectos(OpeProyectos obj)
		{
			OpeUpms = new HashSet<OpeUpms>();
			EncSecciones = new HashSet<EncSecciones>();
			EncPreguntas = new HashSet<EncPreguntas>();
			EncFlujos = new HashSet<EncFlujos>();
			OpeBrigadas = new HashSet<OpeBrigadas>();
			SegUsuariosRestriccion = new HashSet<SegUsuariosRestriccion>();

			Idopy = obj.Idopy;
			Nombre = obj.Nombre;
			Codigo = obj.Codigo;
			Descripcion = obj.Descripcion;
			Fecinicio = obj.Fecinicio;
			Fecfin = obj.Fecfin;
			Apiestado = obj.Apiestado;
			Apitransaccion = obj.Apitransaccion;
			Usucre = obj.Usucre;
			Feccre = obj.Feccre;
			Usumod = obj.Usumod;
			Fecmod = obj.Fecmod;
		}
		
		#endregion
		
		/// <summary>
		/// 	 Llave primaria del identificador de la tabla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: Yes
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idopy")]
		[Display(Name = "Idopy", Description = "Llave primaria del identificador de la tabla")]
		[Required(ErrorMessage = "Idopy es un campo requerido.")]
		[Key]
		public long Idopy { get; set; }

		/// <summary>
		/// 	 Nombre del Proyecto
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("nombre")]
		[Display(Name = "Nombre", Description = "Nombre del Proyecto")]
		public string Nombre { get; set; }

		/// <summary>
		/// 	 Codigo Unico de 4 CARACTERES con el que se identifica al Proyecto
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("codigo")]
		[StringLength(4, MinimumLength=0)]
		[Display(Name = "Codigo", Description = "Codigo Unico de 4 CARACTERES con el que se identifica al Proyecto")]
		public string Codigo { get; set; }

		/// <summary>
		/// 	 Descripcion del proyecto
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("descripcion")]
		[Display(Name = "Descripcion", Description = "Descripcion del proyecto")]
		public string Descripcion { get; set; }

		/// <summary>
		/// 	 Fecha en la que INICIA el proyecto 
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("fecinicio")]
		[Display(Name = "Fecinicio", Description = "Fecha en la que INICIA el proyecto ")]
		[Required(ErrorMessage = "Fecinicio es un campo requerido.")]
		public DateTime Fecinicio { get; set; }

		/// <summary>
		/// 	 Fecha en la que FINALIZA el proyecto 
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("fecfin")]
		[Display(Name = "Fecfin", Description = "Fecha en la que FINALIZA el proyecto ")]
		[Required(ErrorMessage = "Fecfin es un campo requerido.")]
		public DateTime Fecfin { get; set; }

		/// <summary>
		/// 	 Estado en el que se encuentra el registro: debe ser ACTIVO o INACTIVO
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("apiestado")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Apiestado", Description = "Estado en el que se encuentra el registro: debe ser ACTIVO o INACTIVO")]
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


		[InverseProperty("IdopyNavigation")]
		public ICollection<OpeUpms> OpeUpms { get; set; }
		[InverseProperty("IdopyNavigation")]
		public ICollection<EncSecciones> EncSecciones { get; set; }
		[InverseProperty("IdopyNavigation")]
		public ICollection<EncPreguntas> EncPreguntas { get; set; }
		[InverseProperty("IdopyNavigation")]
		public ICollection<EncFlujos> EncFlujos { get; set; }
		[InverseProperty("IdopyNavigation")]
		public ICollection<OpeBrigadas> OpeBrigadas { get; set; }
		[InverseProperty("IdopyNavigation")]
		public ICollection<SegUsuariosRestriccion> SegUsuariosRestriccion { get; set; }
		
	}
}

