using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("enc_flujos")]
    public partial class EncFlujos
    {
        [Key]
        [Column("idefl")]
        public long Idefl { get; set; }
        [Column("idopy")]
        public long? Idopy { get; set; }
        [Column("idepr")]
        public long Idepr { get; set; }
        [Column("idepr_destino")]
        public long IdeprDestino { get; set; }
        [Column("orden")]
        public int Orden { get; set; }
        [Required]
        [Column("regla")]
        public string Regla { get; set; }
        [Required]
        [Column("rpn")]
        public string Rpn { get; set; }
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

        [ForeignKey("Idepr")]
        [InverseProperty("EncFlujos")]
        public EncPreguntas IdeprNavigation { get; set; }
        [ForeignKey("Idopy")]
        [InverseProperty("EncFlujos")]
        public OpeProyectos IdopyNavigation { get; set; }
    }
}
