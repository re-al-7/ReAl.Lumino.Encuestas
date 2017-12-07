using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_configuracion")]
    public partial class SegConfiguracion
    {
        [Key]
        [Column("idscf")]
        public long Idscf { get; set; }
        [Column("idsta")]
        public long Idsta { get; set; }
        [Required]
        [Column("configuracion")]
        public string Configuracion { get; set; }
        [Required]
        [Column("funcion")]
        public string Funcion { get; set; }
        [Column("parametrosentrada")]
        public string Parametrosentrada { get; set; }
        [Column("parametrossalida")]
        public string Parametrossalida { get; set; }
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

        [ForeignKey("Idsta")]
        [InverseProperty("SegConfiguracion")]
        public SegTablas IdstaNavigation { get; set; }
    }
}
