#region 
/***********************************************************************************************************
	NOMBRE:       SegUsuariosrestriccion
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_usuarios_restriccion

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
	[Table("seg_usuarios_restriccion")]
	public class SegUsuariosRestriccion
	{
		public const string StrNombreTabla = "Seg_usuarios_restriccion";
		public const string StrAliasTabla = "seg_usuarios_restriccion";

		public enum Fields
		{
			Idsur
			,Idsus
			,Idsro
			,Idcde
			,Idopy
			,Rolactivo
			,Vigente
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegUsuariosRestriccion()
		{

			//Inicializacion de Variables
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegUsuariosRestriccion(SegUsuariosRestriccion obj)
		{

			Idsur = obj.Idsur;
			Idsus = obj.Idsus;
			Idsro = obj.Idsro;
			Idcde = obj.Idcde;
			Idopy = obj.Idopy;
			Rolactivo = obj.Rolactivo;
			Vigente = obj.Vigente;
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
		[Column("idsur")]
		[Display(Name = "Idsur", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idsur es un campo requerido.")]
		[Key]
		public long Idsur { get; set; }

		/// <summary>
		/// 	 Identificador primario de usuario al que se le asigna el rol
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsus")]
		[Display(Name = "Idsus", Description = "Identificador primario de usuario al que se le asigna el rol")]
		[Required(ErrorMessage = "Idsus es un campo requerido.")]
		public long Idsus { get; set; }

		/// <summary>
		/// 	 Identificador primario de rol de operación que se asigna al usuario
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsro")]
		[Display(Name = "Idsro", Description = "Identificador primario de rol de operación que se asigna al usuario")]
		[Required(ErrorMessage = "Idsro es un campo requerido.")]
		public long Idsro { get; set; }

		/// <summary>
		/// 	 Identificador primario del departamento
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idcde")]
		[Display(Name = "Idcde", Description = "Identificador primario del departamento")]
		[Required(ErrorMessage = "Idcde es un campo requerido.")]
		public long Idcde { get; set; }

		/// <summary>
		/// 	 Identificador primario del proyecto
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idopy")]
		[Display(Name = "Idopy", Description = "Identificador primario del proyecto")]
		[Required(ErrorMessage = "Idopy es un campo requerido.")]
		public long Idopy { get; set; }

		/// <summary>
		/// 	 Si el usuartio tiene más de un rol, este campo indica si este rol es el rol activo para realizar operaciones en la aplicación
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("rolactivo")]
		[Display(Name = "Rolactivo", Description = "Si el usuartio tiene más de un rol, este campo indica si este rol es el rol activo para realizar operaciones en la aplicación")]
		[Required(ErrorMessage = "Rolactivo es un campo requerido.")]
		public int Rolactivo { get; set; }

		/// <summary>
		/// 	 Indica si el rol de operación está vigente. Este valor tiene mayor eso específico que la fecha de vigencia, si este campo indica 0 (No vigente) no importa si la fecha de vigencia si lo está, el rol no está vigente. 1: Vigente; 0 No vigente
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("vigente")]
		[Display(Name = "Vigente", Description = "Indica si el rol de operación está vigente. Este valor tiene mayor eso específico que la fecha de vigencia, si este campo indica 0 (No vigente) no importa si la fecha de vigencia si lo está, el rol no está vigente. 1: Vigente; 0 No vigente")]
		[Required(ErrorMessage = "Vigente es un campo requerido.")]
		public int Vigente { get; set; }

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

		[ForeignKey("Idsus")]
		[InverseProperty("SegUsuariosRestriccion")]
		public SegUsuarios IdsusNavigation { get; set; }
		[ForeignKey("Idsro")]
		[InverseProperty("SegUsuariosRestriccion")]
		public SegRoles IdsroNavigation { get; set; }
		[ForeignKey("Idcde")]
		[InverseProperty("SegUsuariosRestriccion")]
		public CatDepartamentos IdcdeNavigation { get; set; }
		[ForeignKey("Idopy")]
		[InverseProperty("SegUsuariosRestriccion")]
		public OpeProyectos IdopyNavigation { get; set; }


	}
}

