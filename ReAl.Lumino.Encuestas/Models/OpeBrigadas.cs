using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("ope_brigadas")]
    public partial class OpeBrigadas
    {
        public OpeBrigadas()
        {
            SegUsuarios = new HashSet<SegUsuarios>();
        }

        [Key]
        [Column("idobr")]
        public long Idobr { get; set; }
        [Column("idcde")]
        public long Idcde { get; set; }
        [Column("idopy")]
        public long Idopy { get; set; }
        [Required]
        [Column("codigo")]
        public string Codigo { get; set; }
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

        [ForeignKey("Idcde")]
        [InverseProperty("OpeBrigadas")]
        public CatDepartamentos IdcdeNavigation { get; set; }
        [ForeignKey("Idopy")]
        [InverseProperty("OpeBrigadas")]
        public OpeProyectos IdopyNavigation { get; set; }
        [InverseProperty("IdobrNavigation")]
        public ICollection<SegUsuarios> SegUsuarios { get; set; }
    }
}
