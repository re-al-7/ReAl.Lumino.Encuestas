using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_mensajes")]
    public partial class SegMensajes
    {
        [Key]
        [Column("idsme")]
        public long Idsme { get; set; }
        [Column("idsap")]
        public long Idsap { get; set; }
        [Required]
        [Column("aplicacionerror")]
        public string Aplicacionerror { get; set; }
        [Required]
        [Column("texto")]
        public string Texto { get; set; }
        [Required]
        [Column("origen")]
        public string Origen { get; set; }
        [Required]
        [Column("causa")]
        public string Causa { get; set; }
        [Required]
        [Column("accion")]
        public string Accion { get; set; }
        [Column("comentario")]
        public string Comentario { get; set; }
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
        [InverseProperty("SegMensajes")]
        public SegAplicaciones IdsapNavigation { get; set; }
    }
}
