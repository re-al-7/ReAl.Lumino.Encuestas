using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("enc_preguntas")]
    public partial class EncPreguntas
    {
        public EncPreguntas()
        {
            EncEncuestas = new HashSet<EncEncuestas>();
            EncFlujos = new HashSet<EncFlujos>();
            EncRespuestas = new HashSet<EncRespuestas>();
        }

        [Key]
        [Column("idepr")]
        public long Idepr { get; set; }
        [Column("idopy")]
        public long Idopy { get; set; }
        [Column("idcnv")]
        public long Idcnv { get; set; }
        [Column("idese")]
        public long Idese { get; set; }
        [Column("idctp")]
        public long Idctp { get; set; }
        [Required]
        [Column("codigo")]
        public string Codigo { get; set; }
        [Required]
        [Column("pregunta")]
        public string Pregunta { get; set; }
        [Required]
        [Column("ayuda")]
        public string Ayuda { get; set; }
        [Column("minimo")]
        public int Minimo { get; set; }
        [Column("maximo")]
        public int Maximo { get; set; }
        [Required]
        [Column("catalogo")]
        public string Catalogo { get; set; }
        [Column("longitud")]
        public int? Longitud { get; set; }
        [Required]
        [Column("codigo_especifique")]
        public string CodigoEspecifique { get; set; }
        [Column("mostrar_ventana")]
        public int MostrarVentana { get; set; }
        [Required]
        [Column("variable")]
        public string Variable { get; set; }
        [Required]
        [Column("formula")]
        public string Formula { get; set; }
        [Required]
        [Column("rpn_formula")]
        public string RpnFormula { get; set; }
        [Required]
        [Column("regla")]
        public string Regla { get; set; }
        [Required]
        [Column("rpn")]
        public string Rpn { get; set; }
        [Required]
        [Column("mensaje")]
        public string Mensaje { get; set; }
        [Required]
        [Column("revision")]
        public string Revision { get; set; }
        [Required]
        [Column("instruccion")]
        public string Instruccion { get; set; }
        [Column("bucle")]
        public int Bucle { get; set; }
        [Required]
        [Column("variable_bucle")]
        public string VariableBucle { get; set; }
        [Column("codigo_especial")]
        public int CodigoEspecial { get; set; }
        [Required]
        [Column("apiestado")]
        public string Apiestado { get; set; }
        [Required]
        [Column("apitransaccion")]
        public string Apitransaccion { get; set; }
        [Required]
        [Column("usucre")]
        public string Usucre { get; set; }
        [Column("feccre")]
        public DateTime Feccre { get; set; }
        [Column("usumod")]
        public string Usumod { get; set; }
        [Column("fecmod")]
        public DateTime? Fecmod { get; set; }

        [ForeignKey("Idcnv")]
        [InverseProperty("EncPreguntas")]
        public CatNiveles IdcnvNavigation { get; set; }
        [ForeignKey("Idctp")]
        [InverseProperty("EncPreguntas")]
        public CatTiposPregunta IdctpNavigation { get; set; }
        [ForeignKey("Idese")]
        [InverseProperty("EncPreguntas")]
        public EncSecciones IdeseNavigation { get; set; }
        [ForeignKey("Idopy")]
        [InverseProperty("EncPreguntas")]
        public OpeProyectos IdopyNavigation { get; set; }
        [InverseProperty("IdeprNavigation")]
        public ICollection<EncEncuestas> EncEncuestas { get; set; }
        [InverseProperty("IdeprNavigation")]
        public ICollection<EncFlujos> EncFlujos { get; set; }
        [InverseProperty("IdeprNavigation")]
        public ICollection<EncRespuestas> EncRespuestas { get; set; }
    }
}
