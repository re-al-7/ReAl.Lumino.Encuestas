using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("enc_encuestas")]
    public partial class EncEncuestas
    {
        [Key]
        [Column("idenc")]
        public long Idenc { get; set; }
        [Column("idenc_tab")]
        public long IdencTab { get; set; }
        [Column("idein")]
        public long Idein { get; set; }
        [Column("idomv")]
        public long Idomv { get; set; }
        [Column("idepr")]
        public long Idepr { get; set; }
        [Column("idere")]
        public long Idere { get; set; }
        [Required]
        [Column("codigo_respuesta")]
        public string CodigoRespuesta { get; set; }
        [Required]
        [Column("respuesta")]
        public string Respuesta { get; set; }
        [Required]
        [Column("observacion")]
        public string Observacion { get; set; }
        [Column("latitud", TypeName = "numeric(12, 8)")]
        public decimal Latitud { get; set; }
        [Column("longitud", TypeName = "numeric(12, 8)")]
        public decimal Longitud { get; set; }
        [Column("id_last")]
        public int IdLast { get; set; }
        [Column("fila")]
        public int Fila { get; set; }
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

        [ForeignKey("Idein")]
        [InverseProperty("EncEncuestas")]
        public EncInformantes IdeinNavigation { get; set; }
        [ForeignKey("Idepr")]
        [InverseProperty("EncEncuestas")]
        public EncPreguntas IdeprNavigation { get; set; }
        [ForeignKey("Idomv")]
        [InverseProperty("EncEncuestas")]
        public OpeMovimientos IdomvNavigation { get; set; }
    }
}
