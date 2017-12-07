using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("enc_secciones")]
    public partial class EncSecciones
    {
        public EncSecciones()
        {
            EncPreguntas = new HashSet<EncPreguntas>();
        }

        [Key]
        [Column("idese")]
        public long Idese { get; set; }
        [Column("idopy")]
        public long Idopy { get; set; }
        [Column("idcnv")]
        public long Idcnv { get; set; }
        [Column("codigo")]
        public string Codigo { get; set; }
        [Column("seccion")]
        public string Seccion { get; set; }
        [Column("abierta")]
        public int Abierta { get; set; }
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
        [InverseProperty("EncSecciones")]
        public CatNiveles IdcnvNavigation { get; set; }
        [ForeignKey("Idopy")]
        [InverseProperty("EncSecciones")]
        public OpeProyectos IdopyNavigation { get; set; }
        [InverseProperty("IdeseNavigation")]
        public ICollection<EncPreguntas> EncPreguntas { get; set; }
    }
}
