using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("ope_upms")]
    public partial class OpeUpms
    {
        public OpeUpms()
        {
            OpeMovimientos = new HashSet<OpeMovimientos>();
        }

        [Key]
        [Column("idoup")]
        public long Idoup { get; set; }
        [Column("idopy")]
        public long Idopy { get; set; }
        [Column("idcde")]
        public long Idcde { get; set; }
        [Column("codigo")]
        public string Codigo { get; set; }
        [Column("nombre")]
        public string Nombre { get; set; }
        [Column("fecinicio")]
        public DateTime Fecinicio { get; set; }
        [Column("latitud", TypeName = "numeric(12, 8)")]
        public decimal Latitud { get; set; }
        [Column("longitud", TypeName = "numeric(12, 8)")]
        public decimal Longitud { get; set; }
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

        [ForeignKey("Idcde")]
        [InverseProperty("OpeUpms")]
        public CatDepartamentos IdcdeNavigation { get; set; }
        [ForeignKey("Idopy")]
        [InverseProperty("OpeUpms")]
        public OpeProyectos IdopyNavigation { get; set; }
        [InverseProperty("IdoupNavigation")]
        public ICollection<OpeMovimientos> OpeMovimientos { get; set; }
    }
}
