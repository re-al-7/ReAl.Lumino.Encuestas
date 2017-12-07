using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_transiciones")]
    public partial class SegTransiciones
    {
        [Key]
        [Column("idsts")]
        public long Idsts { get; set; }
        [Column("idsta")]
        public long Idsta { get; set; }
        [Column("idsesini")]
        public long Idsesini { get; set; }
        [Column("idstr")]
        public long Idstr { get; set; }
        [Column("idsesfin")]
        public long Idsesfin { get; set; }
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

        public SegTransacciones Idst { get; set; }
    }
}
