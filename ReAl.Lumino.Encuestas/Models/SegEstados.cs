using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_estados")]
    public partial class SegEstados
    {
        [Key]
        [Column("idses")]
        public long Idses { get; set; }
        [Column("idsta")]
        public long Idsta { get; set; }
        [Required]
        [Column("estado")]
        public string Estado { get; set; }
        [Required]
        [Column("descripcion")]
        public string Descripcion { get; set; }
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

        [ForeignKey("Idsta")]
        [InverseProperty("SegEstados")]
        public SegTablas IdstaNavigation { get; set; }
    }
}
