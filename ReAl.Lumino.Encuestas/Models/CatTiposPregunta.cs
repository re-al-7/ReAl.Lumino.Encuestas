using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("cat_tipos_pregunta")]
    public partial class CatTiposPregunta
    {
        public CatTiposPregunta()
        {
            EncPreguntas = new HashSet<EncPreguntas>();
        }

        [Key]
        [Column("idctp")]
        public long Idctp { get; set; }
        [Column("tipo_pregunta")]
        public string TipoPregunta { get; set; }
        [Column("descripcion")]
        public string Descripcion { get; set; }
        [Column("respuesta_valor")]
        public string RespuestaValor { get; set; }
        [Column("exportar_codigo")]
        public int ExportarCodigo { get; set; }
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

        [InverseProperty("IdctpNavigation")]
        public ICollection<EncPreguntas> EncPreguntas { get; set; }
    }
}
