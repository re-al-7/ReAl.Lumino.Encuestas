using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_tablas")]
    public partial class SegTablas
    {
        public SegTablas()
        {
            SegConfiguracion = new HashSet<SegConfiguracion>();
            SegEstados = new HashSet<SegEstados>();
            SegGlosas = new HashSet<SegGlosas>();
            SegTransacciones = new HashSet<SegTransacciones>();
        }

        [Key]
        [Column("idsta")]
        public long Idsta { get; set; }
        [Column("idsap")]
        public long Idsap { get; set; }
        [Required]
        [Column("nombretabla")]
        public string Nombretabla { get; set; }
        [Required]
        [Column("alias")]
        public string Alias { get; set; }
        [Required]
        [Column("descripcion")]
        public string Descripcion { get; set; }
        [Column("beforestatement")]
        public bool? Beforestatement { get; set; }
        [Column("beforerow")]
        public bool? Beforerow { get; set; }
        [Column("afterstatement")]
        public bool? Afterstatement { get; set; }
        [Column("afterrow")]
        public bool? Afterrow { get; set; }
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

        [ForeignKey("Idsap")]
        [InverseProperty("SegTablas")]
        public SegAplicaciones IdsapNavigation { get; set; }
        [InverseProperty("IdstaNavigation")]
        public ICollection<SegConfiguracion> SegConfiguracion { get; set; }
        [InverseProperty("IdstaNavigation")]
        public ICollection<SegEstados> SegEstados { get; set; }
        public ICollection<SegGlosas> SegGlosas { get; set; }
        [InverseProperty("IdstaNavigation")]
        public ICollection<SegTransacciones> SegTransacciones { get; set; }
    }
}
