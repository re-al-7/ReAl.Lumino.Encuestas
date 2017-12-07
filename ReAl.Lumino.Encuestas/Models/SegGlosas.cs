using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_glosas")]
    public partial class SegGlosas
    {
        [Key]
        [Column("idsgl")]
        public long Idsgl { get; set; }
        [Column("iddoc")]
        public long Iddoc { get; set; }
        [Required]
        [Column("nombretabla")]
        public string Nombretabla { get; set; }
        [Required]
        [Column("transaccion")]
        public string Transaccion { get; set; }
        [Required]
        [Column("glosa")]
        public string Glosa { get; set; }
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

        public SegTablas NombretablaNavigation { get; set; }
    }
}
