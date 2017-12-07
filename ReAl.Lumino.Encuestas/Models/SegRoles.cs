using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_roles")]
    public partial class SegRoles
    {
        public SegRoles()
        {
            SegRolesPagina = new HashSet<SegRolesPagina>();
            SegRolesTablaTransaccion = new HashSet<SegRolesTablaTransaccion>();
            SegUsuariosRestriccion = new HashSet<SegUsuariosRestriccion>();
        }

        [Key]
        [Column("idsro")]
        public long Idsro { get; set; }
        [Required]
        [Column("sigla")]
        public string Sigla { get; set; }
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

        [InverseProperty("IdsroNavigation")]
        public ICollection<SegRolesPagina> SegRolesPagina { get; set; }
        [InverseProperty("IdsroNavigation")]
        public ICollection<SegRolesTablaTransaccion> SegRolesTablaTransaccion { get; set; }
        [InverseProperty("IdsroNavigation")]
        public ICollection<SegUsuariosRestriccion> SegUsuariosRestriccion { get; set; }
    }
}
