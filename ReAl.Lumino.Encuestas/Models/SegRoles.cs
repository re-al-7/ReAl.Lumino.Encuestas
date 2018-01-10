#region 
/***********************************************************************************************************
	NOMBRE:       SegRoles
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_roles

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
	[Table("seg_roles")]
	public class SegRoles
	{
		public static readonly  string StrNombreTabla = "Seg_roles";
		public static readonly  string StrAliasTabla = "seg_roles";

		public enum Fields
		{
			Idsro
			,Sigla
			,Descripcion
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegRoles()
		{
			SegRolesTablaTransaccion = new HashSet<SegRolesTablaTransaccion>();
			SegRolesPagina = new HashSet<SegRolesPagina>();
			SegUsuariosRestriccion = new HashSet<SegUsuariosRestriccion>();

			//Inicializacion de Variables
			Sigla = null;
			Descripcion = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegRoles(SegRoles obj)
		{
			SegRolesTablaTransaccion = new HashSet<SegRolesTablaTransaccion>();
			SegRolesPagina = new HashSet<SegRolesPagina>();
			SegUsuariosRestriccion = new HashSet<SegUsuariosRestriccion>();

			Idsro = obj.Idsro;
			Sigla = obj.Sigla;
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
		/// 	 Identificador primario de registro
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: Yes
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idsro")]
		[Display(Name = "Idsro", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idsro es un campo requerido.")]
		[Key]
		public long Idsro { get; set; }

		/// <summary>
		/// 	 Sigla del rol
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("sigla")]
		[StringLength(30, MinimumLength=0)]
		[Display(Name = "Sigla", Description = "Sigla del rol")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Sigla es un campo requerido.")]
		public string Sigla { get; set; }

		/// <summary>
		/// 	 Descripción detallada del rol y su funcionalidad
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("descripcion")]
		[StringLength(180, MinimumLength=0)]
		[Display(Name = "Descripcion", Description = "Descripción detallada del rol y su funcionalidad")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Descripcion es un campo requerido.")]
		public string Descripcion { get; set; }

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


		[InverseProperty("IdsroNavigation")]
		public ICollection<SegRolesTablaTransaccion> SegRolesTablaTransaccion { get; set; }
		[InverseProperty("IdsroNavigation")]
		public ICollection<SegRolesPagina> SegRolesPagina { get; set; }
		[InverseProperty("IdsroNavigation")]
		public ICollection<SegUsuariosRestriccion> SegUsuariosRestriccion { get; set; }
	}
}

