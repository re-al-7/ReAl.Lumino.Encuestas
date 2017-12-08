using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("cat_departamentos")]
    public partial class CatDepartamentos
    {
        public CatDepartamentos()
        {
            OpeBrigadas = new HashSet<OpeBrigadas>();
            OpeUpms = new HashSet<OpeUpms>();
            SegUsuarios = new HashSet<SegUsuarios>();
        }

        [Key]
        [Column("idcde")]
        public long Idcde { get; set; }
        [Column("codigo")]
        public string Codigo { get; set; }
        [Column("nombre")]
        public string Nombre { get; set; }
        [Column("latitud", TypeName = "numeric(12, 8)")]
        public decimal? Latitud { get; set; }
        [Column("longitud", TypeName = "numeric(12, 8)")]
        public decimal? Longitud { get; set; }
        [Column("abreviatura")]
        public string Abreviatura { get; set; }
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

        [InverseProperty("IdcdeNavigation")]
        public ICollection<OpeBrigadas> OpeBrigadas { get; set; }
        [InverseProperty("IdcdeNavigation")]
        public ICollection<OpeUpms> OpeUpms { get; set; }
        [InverseProperty("IdcdeNavigation")]
        public ICollection<SegUsuarios> SegUsuarios { get; set; }
    }
}
