using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_aplicaciones")]
    public partial class SegAplicaciones
    {
        public SegAplicaciones()
        {
            SegMensajes = new HashSet<SegMensajes>();
            SegPaginas = new HashSet<SegPaginas>();
            SegTablas = new HashSet<SegTablas>();
        }

        [Key]
        [Column("idsap")]
        public long Idsap { get; set; }
        [Required]
        [Column("sigla")]
        public string Sigla { get; set; }
        [Column("nombre")]
        public string Nombre { get; set; }
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

        [InverseProperty("IdsapNavigation")]
        public ICollection<SegMensajes> SegMensajes { get; set; }
        [InverseProperty("IdsapNavigation")]
        public ICollection<SegPaginas> SegPaginas { get; set; }
        [InverseProperty("IdsapNavigation")]
        public ICollection<SegTablas> SegTablas { get; set; }
    }
}
