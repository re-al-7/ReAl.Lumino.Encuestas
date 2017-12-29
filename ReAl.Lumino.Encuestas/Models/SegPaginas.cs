#region 
/***********************************************************************************************************
	NOMBRE:       SegPaginas
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_paginas

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
	[Table("seg_paginas")]
	public class SegPaginas
	{
		public const string StrNombreTabla = "Seg_paginas";
		public const string StrAliasTabla = "seg_paginas";

		public enum Fields
		{
			Idspg
			,Idsap
			,Paginapadre
			,Nombremenu
			,Sigla
			,Nivel
			,Icono
			,Metodo
			,Accion
			,Descripcion
			,Prioridad
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegPaginas()
		{
			SegRolesPagina = new HashSet<SegRolesPagina>();

			//Inicializacion de Variables
			Paginapadre = null;
			Nombremenu = null;
			Sigla = null;
			Icono = null;
			Metodo = null;
			Accion = null;
			Descripcion = null;
			Prioridad = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegPaginas(SegPaginas obj)
		{
			SegRolesPagina = new HashSet<SegRolesPagina>();

			Idspg = obj.Idspg;
			Idsap = obj.Idsap;
			Paginapadre = obj.Paginapadre;
			Nombremenu = obj.Nombremenu;
			Sigla = obj.Sigla;
			Nivel = obj.Nivel;
			Icono = obj.Icono;
			Metodo = obj.Metodo;
			Accion = obj.Accion;
			Descripcion = obj.Descripcion;
			Prioridad = obj.Prioridad;
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
		[Column("idspg")]
		[Display(Name = "Idspg", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idspg es un campo requerido.")]
		[Key]
		public long Idspg { get; set; }

		/// <summary>
		/// 	 Identificador primario de aplicación a la que pertenece la página
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsap")]
		[Display(Name = "Idsap", Description = "Identificador primario de aplicación a la que pertenece la página")]
		[Required(ErrorMessage = "Idsap es un campo requerido.")]
		public long Idsap { get; set; }

		/// <summary>
		/// 	 identificador del padre, si es null es padre
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("paginapadre")]
		[Display(Name = "Paginapadre", Description = "identificador del padre, si es null es padre")]
		public Decimal? Paginapadre { get; set; }

		/// <summary>
		/// 	 Nombre del menu en el sistema
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("nombremenu")]
		[StringLength(30, MinimumLength=0)]
		[Display(Name = "Nombremenu", Description = "Nombre del menu en el sistema")]
		public string Nombremenu { get; set; }

		/// <summary>
		/// 	 Sigla de la página, no debe existir repetidos
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("sigla")]
		[StringLength(15, MinimumLength=0)]
		[Display(Name = "Sigla", Description = "Sigla de la página, no debe existir repetidos")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Sigla es un campo requerido.")]
		public string Sigla { get; set; }

		/// <summary>
		/// 	 en que nivel se encuentra la página,
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("nivel")]
		[Display(Name = "Nivel", Description = "en que nivel se encuentra la página,")]
		[Required(ErrorMessage = "Nivel es un campo requerido.")]
		public int Nivel { get; set; }

		/// <summary>
		/// 	 icono de la página obtenidos de font awesome
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("icono")]
		[StringLength(20, MinimumLength=0)]
		[Display(Name = "Icono", Description = "icono de la página obtenidos de font awesome")]
		public string Icono { get; set; }

		/// <summary>
		/// 	 Metodo de la pagina
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("metodo")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Metodo", Description = "Metodo de la pagina")]
		public string Metodo { get; set; }

		/// <summary>
		/// 	 Accion de la pagina
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("accion")]
		[StringLength(60, MinimumLength=0)]
		[Display(Name = "Accion", Description = "Accion de la pagina")]
		public string Accion { get; set; }

		/// <summary>
		/// 	 Descripción de funcionalidad de la página
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("descripcion")]
		[StringLength(100, MinimumLength=0)]
		[Display(Name = "Descripcion", Description = "Descripción de funcionalidad de la página")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Descripcion es un campo requerido.")]
		public string Descripcion { get; set; }

		/// <summary>
		/// 	 En que prioridad se desplegara la pagina
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("prioridad")]
		[Display(Name = "Prioridad", Description = "En que prioridad se desplegara la pagina")]
		public Decimal? Prioridad { get; set; }

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

		[ForeignKey("Idsap")]
		[InverseProperty("SegPaginas")]
		public SegAplicaciones IdsapNavigation { get; set; }

		[InverseProperty("IdspgNavigation")]
		public ICollection<SegRolesPagina> SegRolesPagina { get; set; }
		
	}
}

