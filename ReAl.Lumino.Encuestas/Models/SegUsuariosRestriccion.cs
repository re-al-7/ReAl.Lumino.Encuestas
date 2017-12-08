using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_usuarios_restriccion")]
    public partial class SegUsuariosRestriccion
    {
        [Key]
        [Column("idsur")]
        public long Idsur { get; set; }
        [Column("idsus")]
        public long Idsus { get; set; }
        [Column("idsro")]
        public long Idsro { get; set; }
        [Column("idopy")]
        public long Idopy { get; set; }
        [Column("rolactivo")]
        public int Rolactivo { get; set; }
        [Column("vigente")]
        public int Vigente { get; set; }
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

        [ForeignKey("Idopy")]
        [InverseProperty("SegUsuariosRestriccion")]
        public OpeProyectos IdopyNavigation { get; set; }
        [ForeignKey("Idsro")]
        [InverseProperty("SegUsuariosRestriccion")]
        public SegRoles IdsroNavigation { get; set; }
        [ForeignKey("Idsus")]
        [InverseProperty("SegUsuariosRestriccion")]
        public SegUsuarios IdsusNavigation { get; set; }
    }
}
