using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("cat_niveles")]
    public partial class CatNiveles
    {
        public CatNiveles()
        {
            EncInformantes = new HashSet<EncInformantes>();
            EncPreguntas = new HashSet<EncPreguntas>();
            EncSecciones = new HashSet<EncSecciones>();
        }

        [Key]
        [Column("idcnv")]
        public long Idcnv { get; set; }
        [Column("nivel")]
        public int? Nivel { get; set; }
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

        [InverseProperty("IdcnvNavigation")]
        public ICollection<EncInformantes> EncInformantes { get; set; }
        [InverseProperty("IdcnvNavigation")]
        public ICollection<EncPreguntas> EncPreguntas { get; set; }
        [InverseProperty("IdcnvNavigation")]
        public ICollection<EncSecciones> EncSecciones { get; set; }
    }
}
