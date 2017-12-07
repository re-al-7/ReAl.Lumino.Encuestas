using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("ope_proyectos")]
    public partial class OpeProyectos
    {
        public OpeProyectos()
        {
            EncFlujos = new HashSet<EncFlujos>();
            EncPreguntas = new HashSet<EncPreguntas>();
            EncSecciones = new HashSet<EncSecciones>();
            OpeBrigadas = new HashSet<OpeBrigadas>();
            OpeUpms = new HashSet<OpeUpms>();
        }

        [Key]
        [Column("idopy")]
        public long Idopy { get; set; }
        [Column("nombre")]
        public string Nombre { get; set; }
        [Column("codigo")]
        public string Codigo { get; set; }
        [Column("descripcion")]
        public string Descripcion { get; set; }
        [Column("fecinicio")]
        public DateTime Fecinicio { get; set; }
        [Column("fecfin")]
        public DateTime Fecfin { get; set; }
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

        [InverseProperty("IdopyNavigation")]
        public ICollection<EncFlujos> EncFlujos { get; set; }
        [InverseProperty("IdopyNavigation")]
        public ICollection<EncPreguntas> EncPreguntas { get; set; }
        [InverseProperty("IdopyNavigation")]
        public ICollection<EncSecciones> EncSecciones { get; set; }
        [InverseProperty("IdopyNavigation")]
        public ICollection<OpeBrigadas> OpeBrigadas { get; set; }
        [InverseProperty("IdopyNavigation")]
        public ICollection<OpeUpms> OpeUpms { get; set; }
    }
}
