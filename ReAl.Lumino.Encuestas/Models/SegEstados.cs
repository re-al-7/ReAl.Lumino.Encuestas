#region 
/***********************************************************************************************************
	NOMBRE:       SegEstados
	DESCRIPCION:
		Clase que define un objeto para la Tabla seg_estados

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
	[Table("seg_estados")]
	public class SegEstados
	{
		public const string StrNombreTabla = "Seg_estados";
		public const string StrAliasTabla = "seg_estados";

		public enum Fields
		{
			Idses
			,Idsta
			,Estado
			,Descripcion
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public SegEstados()
		{
			SegTransiciones = new HashSet<SegTransiciones>();

			//Inicializacion de Variables
			Estado = null;
			Descripcion = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public SegEstados(SegEstados obj)
		{
			SegTransiciones = new HashSet<SegTransiciones>();

			Idses = obj.Idses;
			Idsta = obj.Idsta;
			Estado = obj.Estado;
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
		[Column("idses")]
		[Display(Name = "Idses", Description = "Identificador primario de registro")]
		[Required(ErrorMessage = "Idses es un campo requerido.")]
		[Key]
		public long Idses { get; set; }

		/// <summary>
		/// 	 ID de la tabla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idsta")]
		[Display(Name = "Idsta", Description = "ID de la tabla")]
		[Required(ErrorMessage = "Idsta es un campo requerido.")]
		public long Idsta { get; set; }

		/// <summary>
		/// 	 Estado de transición
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("estado")]
		[StringLength(15, MinimumLength=0)]
		[Display(Name = "Estado", Description = "Estado de transición")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Estado es un campo requerido.")]
		public string Estado { get; set; }

		/// <summary>
		/// 	 Describe el el significado del Estado de esta tabla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("descripcion")]
		[StringLength(120, MinimumLength=0)]
		[Display(Name = "Descripcion", Description = "Describe el el significado del Estado de esta tabla")]
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
		/// 	 Fecha en la que el registro fue creado
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("feccre")]
		[Display(Name = "Feccre", Description = "Fecha en la que el registro fue creado")]
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
		/// 	 Fecha de última modificación del registro
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("fecmod")]
		[Display(Name = "Fecmod", Description = "Fecha de última modificación del registro")]
		public DateTime? Fecmod { get; set; }

		[ForeignKey("Idsta")]
		[InverseProperty("SegEstados")]
		public SegTablas IdstaNavigation { get; set; }

		[InverseProperty("IdstaNavigation")]
		public ICollection<SegTransiciones> SegTransiciones { get; set; }

	}
}

