#region 
/***********************************************************************************************************
	NOMBRE:       SegUsuarios
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_usuarios

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
	[Table("seg_usuarios")]
	public class SegUsuarios
	{
		public static readonly  string StrNombreTabla = "Seg_usuarios";
		public static readonly  string StrAliasTabla = "seg_usuarios";

		public enum Fields
		{
			Idsus
			,Login
			,Password
			,Nombres
			,Apellidos
			,Correo
			,Vigente
			,Idcde
			,Idobr
			,Tablet
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegUsuarios()
		{
			OpeMovimientos = new HashSet<OpeMovimientos>();
			SegUsuariosRestriccion = new HashSet<SegUsuariosRestriccion>();

			//Inicializacion de Variables
			Login = null;
			Password = null;
			Nombres = null;
			Apellidos = null;
			Correo = null;
			Idcde = null;
			Idobr = null;
			Tablet = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegUsuarios(SegUsuarios obj)
		{
			OpeMovimientos = new HashSet<OpeMovimientos>();
			SegUsuariosRestriccion = new HashSet<SegUsuariosRestriccion>();

			Idsus = obj.Idsus;
			Login = obj.Login;
			Password = obj.Password;
			Nombres = obj.Nombres;
			Apellidos = obj.Apellidos;
			Correo = obj.Correo;
			Vigente = obj.Vigente;
			Idcde = obj.Idcde;
			Idobr = obj.Idobr;
			Tablet = obj.Tablet;
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
		[Column("idsus")]
		[Display(Name = "Idsus", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idsus es un campo requerido.")]
		[Key]
		public long Idsus { get; set; }

		/// <summary>
		/// 	 Nombre de usuario en el sistema
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("login")]
		[StringLength(50, MinimumLength=0)]
		[Display(Name = "Login", Description = "Nombre de usuario en el sistema")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Login es un campo requerido.")]
		public string Login { get; set; }

		/// <summary>
		/// 	 contraseña encriptada en hash
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("password")]
		[StringLength(256, MinimumLength=0)]
		[Display(Name = "Password", Description = "contraseña encriptada en hash")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Password es un campo requerido.")]
		public string Password { get; set; }

		/// <summary>
		/// 	 Nombre del usuario
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("nombres")]
		[StringLength(128, MinimumLength=0)]
		[Display(Name = "Nombres", Description = "Nombre del usuario")]
		public string Nombres { get; set; }

		/// <summary>
		/// 	 Apellidos del usuario
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("apellidos")]
		[StringLength(128, MinimumLength=0)]
		[Display(Name = "Apellidos", Description = "Apellidos del usuario")]
		public string Apellidos { get; set; }

		/// <summary>
		/// 	 Correo Electronico del usuario
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("correo")]
		[StringLength(128, MinimumLength=0)]
		[Display(Name = "Correo", Description = "Correo Electronico del usuario")]
		public string Correo { get; set; }

		/// <summary>
		/// 	 Indica si el usuario está vigente en el sistema. 1: Está Vigente; 0 No vigente
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("vigente")]
		[Display(Name = "Vigente", Description = "Indica si el usuario está vigente en el sistema. 1: Está Vigente; 0 No vigente")]
		[Required(ErrorMessage = "Vigente es un campo requerido.")]
		public int Vigente { get; set; }

		/// <summary>
		/// 	 Departamento al que pertenece el usuario
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idcde")]
		[Display(Name = "Idcde", Description = "Departamento al que pertenece el usuario")]
		public long? Idcde { get; set; }

		/// <summary>
		/// 	 Brigada a la que pertenece el usuario
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idobr")]
		[Display(Name = "Idobr", Description = "Brigada a la que pertenece el usuario")]
		public long? Idobr { get; set; }

		/// <summary>
		/// 	 Serie de la Tablet
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("tablet")]
		[StringLength(128, MinimumLength=0)]
		[Display(Name = "Tablet", Description = "Serie de la Tablet")]
		public string Tablet { get; set; }

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

		[ForeignKey("Idcde")]
		[InverseProperty("SegUsuarios")]
		public CatDepartamentos IdcdeNavigation { get; set; }
		[ForeignKey("Idobr")]
		[InverseProperty("SegUsuarios")]
		public OpeBrigadas IdobrNavigation { get; set; }

		[InverseProperty("IdsusNavigation")]
		public ICollection<OpeMovimientos> OpeMovimientos { get; set; }
		[InverseProperty("IdsusNavigation")]
		public ICollection<SegUsuariosRestriccion> SegUsuariosRestriccion { get; set; }

	}
}

