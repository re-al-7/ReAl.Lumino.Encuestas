using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_roles_tabla_transaccion")]
    public partial class SegRolesTablaTransaccion
    {
        [Key]
        [Column("idstt")]
        public long Idstt { get; set; }
        [Column("idsro")]
        public long Idsro { get; set; }
        [Column("idsta")]
        public long Idsta { get; set; }
        [Column("idstr")]
        public long Idstr { get; set; }
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

        [ForeignKey("Idsro")]
        [InverseProperty("SegRolesTablaTransaccion")]
        public SegRoles IdsroNavigation { get; set; }
        public SegTransacciones Idst { get; set; }
    }
}
