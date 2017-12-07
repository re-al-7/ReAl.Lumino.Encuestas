using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_usuarios")]
    public partial class SegUsuarios
    {
        public SegUsuarios()
        {
            OpeMovimientos = new HashSet<OpeMovimientos>();
            SegUsuariosRestriccion = new HashSet<SegUsuariosRestriccion>();
        }


        
        [Key]
        [Column("idsus")]
        public long Idsus { get; set; }
        [Required]
        [Column("login")]
        public string Login { get; set; }
        [Required]
        [Column("password")]
        public string Password { get; set; }
        [Column("nombres")]
        public string Nombres { get; set; }
        [Column("apellidos")]
        public string Apellidos { get; set; }
        [Column("correo")]
        public string Correo { get; set; }
        [Column("vigente")]
        public int Vigente { get; set; }
        [Column("idcde")]
        public long? Idcde { get; set; }
        [Column("idobr")]
        public long? Idobr { get; set; }
        [Column("tablet")]
        public string Tablet { get; set; }
        [Column("apiestado")]
        public string Apiestado { get; set; }
        [Column("apitransaccion")]
        public string Apitransaccion { get; set; }
        [Column("usucre")]
        public string Usucre { get; set; }
        [Column("feccre")]
        public DateTime Feccre { get; set; }
        [Column("usumod")]
        public string Usumod { get; set; }
        [Column("fecmod")]
        public DateTime? Fecmod { get; set; }

        [ForeignKey("Idcde")]
        [InverseProperty("SegUsuarios")]
        [Display(Name = "Depto")]
        public CatDepartamentos IdcdeNavigation { get; set; }
        [ForeignKey("Idobr")]
        [InverseProperty("SegUsuarios")]
        [Display(Name = "Brigada")]
        public OpeBrigadas IdobrNavigation { get; set; }
        [InverseProperty("IdsusNavigation")]
        public ICollection<OpeMovimientos> OpeMovimientos { get; set; }
        [InverseProperty("IdsusNavigation")]
        public ICollection<SegUsuariosRestriccion> SegUsuariosRestriccion { get; set; }
    }
}
