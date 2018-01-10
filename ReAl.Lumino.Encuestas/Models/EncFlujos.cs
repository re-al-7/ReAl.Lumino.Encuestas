#region 
/***********************************************************************************************************
	NOMBRE:       EncFlujos
	DESCRIPCION:
		Clase que define un objeto para la Tabla enc_flujos

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
	[Table("enc_flujos")]
	public class EncFlujos
	{
		public static readonly  string StrNombreTabla = "Enc_flujos";
		public static readonly  string StrAliasTabla = "enc_flujos";

		public enum Fields
		{
			Idefl
			,Idopy
			,Idepr
			,IdeprDestino
			,Orden
			,Regla
			,Rpn
			,Apiestado
			,Apitransaccion
			,Usucre
			,Feccre
			,Usumod
			,Fecmod
		}

		#region Constructoress
		
		public EncFlujos()
		{

			//Inicializacion de Variables
			Idopy = null;
			Regla = null;
			Rpn = null;
			Apiestado = null;
			Apitransaccion = null;
			Usucre = null;
			Usumod = null;
			Fecmod = null;
		}
		
		public EncFlujos(EncFlujos obj)
		{

			Idefl = obj.Idefl;
			Idopy = obj.Idopy;
			Idepr = obj.Idepr;
			IdeprDestino = obj.IdeprDestino;
			Orden = obj.Orden;
			Regla = obj.Regla;
			Rpn = obj.Rpn;
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
		[Column("idefl")]
		[Display(Name = "Idefl", Description = "Identificador unico que representa al registro en la tabla")]
		[Required(ErrorMessage = "Idefl es un campo requerido.")]
		[Key]
		public long Idefl { get; set; }

		/// <summary>
		/// 	 Identificador del proyecto al que pertenece el registro
		/// 	 Permite Null: Yes
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idopy")]
		[Display(Name = "Idopy", Description = "Identificador del proyecto al que pertenece el registro")]
		public long? Idopy { get; set; }

		/// <summary>
		/// 	 Almacena el Id de pregunta origen
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: Yes
		/// </summary>
		[Column("idepr")]
		[Display(Name = "Idepr", Description = "Almacena el Id de pregunta origen")]
		[Required(ErrorMessage = "Idepr es un campo requerido.")]
		public long Idepr { get; set; }

		/// <summary>
		/// 	 Almacena el Id de pregunta destino. -1 representa FIN DE NIVEL. -2 representa FIN DE ENTREVISTA
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("idepr_destino")]
		[Display(Name = "IdeprDestino", Description = "Almacena el Id de pregunta destino. -1 representa FIN DE NIVEL. -2 representa FIN DE ENTREVISTA")]
		[Required(ErrorMessage = "Idepr_destino es un campo requerido.")]
		public long IdeprDestino { get; set; }

		/// <summary>
		/// 	 Es el orden de PRIORIDAD en el que va ha evuarse el flujo
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("orden")]
		[Display(Name = "Orden", Description = "Es el orden de PRIORIDAD en el que va ha evuarse el flujo")]
		[Required(ErrorMessage = "Orden es un campo requerido.")]
		public int Orden { get; set; }

		/// <summary>
		/// 	 Es la regla de evaluación para consistencia aplicado a la pregunta
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("regla")]
		[Display(Name = "Regla", Description = "Es la regla de evaluación para consistencia aplicado a la pregunta")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Regla es un campo requerido.")]
		public string Regla { get; set; }

		/// <summary>
		/// 	 Por sus siglas en ingles (Reverse Polish Notation), es la notacion polaca inversa que se genera automaticamente a partir del campo regla
		/// 	 Permite Null: No
		/// 	 Es Calculada: No
		/// 	 Es RowGui: No
		/// 	 Es PrimaryKey: No
		/// 	 Es ForeignKey: No
		/// </summary>
		[Column("rpn")]
		[Display(Name = "Rpn", Description = "Por sus siglas en ingles (Reverse Polish Notation), es la notacion polaca inversa que se genera automaticamente a partir del campo regla")]
		[Required(AllowEmptyStrings = true, ErrorMessage = "Rpn es un campo requerido.")]
		public string Rpn { get; set; }

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
		[InverseProperty("EncFlujos")]
		public OpeProyectos IdopyNavigation { get; set; }
		[ForeignKey("Idepr")]
		[InverseProperty("EncFlujos")]
		public EncPreguntas IdeprNavigation { get; set; }


	}
}

