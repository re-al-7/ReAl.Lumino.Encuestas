using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_roles_pagina")]
    public partial class SegRolesPagina
    {
        [Key]
        [Column("idsrp")]
        public long Idsrp { get; set; }
        [Column("idsro")]
        public long Idsro { get; set; }
        [Column("idspg")]
        public long Idspg { get; set; }
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

        [ForeignKey("Idspg")]
        [InverseProperty("SegRolesPagina")]
        public SegPaginas IdspgNavigation { get; set; }
        [ForeignKey("Idsro")]
        [InverseProperty("SegRolesPagina")]
        public SegRoles IdsroNavigation { get; set; }
    }
}
