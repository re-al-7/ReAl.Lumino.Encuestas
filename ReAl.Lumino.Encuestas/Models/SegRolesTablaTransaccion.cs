#region 
/***********************************************************************************************************
	NOMBRE:       SegRolestablatransaccion
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_roles_tabla_transaccion

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
	[Table("seg_roles_tabla_transaccion")]
	public class SegRolesTablaTransaccion
	{
		public const string StrNombreTabla = "Seg_roles_tabla_transaccion";
		public const string StrAliasTabla = "seg_roles_tabla_transaccion";

		public enum Fields
		{
			Idstt
			,Idsro
			,Idsta
			,Idstr
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegRolesTablaTransaccion()
		{

			//Inicializacion de Variables
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegRolesTablaTransaccion(SegRolesTablaTransaccion obj)
		{

			Idstt = obj.Idstt;
			Idsro = obj.Idsro;
			Idsta = obj.Idsta;
			Idstr = obj.Idstr;
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
		[Column("idstt")]
		[Display(Name = "Idstt", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idstt es un campo requerido.")]
		[Key]
		public long Idstt { get; set; }

		/// <summary>
		/// 	 Identificador primario de rol de operación al que se asignan los permisos de ejecución
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsro")]
		[Display(Name = "Idsro", Description = "Identificador primario de rol de operación al que se asignan los permisos de ejecución")]
		[Required(ErrorMessage = "Idsro es un campo requerido.")]
		public long Idsro { get; set; }

		/// <summary>
		/// 	 Identificador primmario de tabla a la que tiene acceso el rol de operación
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsta")]
		[Display(Name = "Idsta", Description = "Identificador primmario de tabla a la que tiene acceso el rol de operación")]
		[Required(ErrorMessage = "Idsta es un campo requerido.")]
		public long Idsta { get; set; }

		/// <summary>
		/// 	 Identificador primario de transacción que el rol de operación puede realizar en la tabla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idstr")]
		[Display(Name = "Idstr", Description = "Identificador primario de transacción que el rol de operación puede realizar en la tabla")]
		[Required(ErrorMessage = "Idstr es un campo requerido.")]
		public long Idstr { get; set; }

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

		[ForeignKey("Idsro")]
		[InverseProperty("SegRolesTablaTransaccion")]
		public SegRoles IdsroNavigation { get; set; }
		public SegTransacciones Idst { get; set; }
		
		
	}
}

