using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("enc_respuestas")]
    public partial class EncRespuestas
    {
        [Key]
        [Column("idere")]
        public long Idere { get; set; }
        [Column("idepr")]
        public long? Idepr { get; set; }
        [Required]
        [Column("codigo")]
        public string Codigo { get; set; }
        [Required]
        [Column("respuesta")]
        public string Respuesta { get; set; }
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
        [InverseProperty("EncRespuestas")]
        public EncPreguntas IdeprNavigation { get; set; }
    }
}
