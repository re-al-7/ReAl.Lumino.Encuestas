using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("enc_informantes")]
    public partial class EncInformantes
    {
        public EncInformantes()
        {
            EncEncuestas = new HashSet<EncEncuestas>();
        }

        [Key]
        [Column("idein")]
        public long Idein { get; set; }
        [Column("idein_tab")]
        public long IdeinTab { get; set; }
        [Column("idein_padre")]
        public long? IdeinPadre { get; set; }
        [Column("idein_tab_padre")]
        public long? IdeinTabPadre { get; set; }
        [Column("idcnv")]
        public long Idcnv { get; set; }
        [Column("idomv")]
        public long Idomv { get; set; }
        [Column("idoup")]
        public long? Idoup { get; set; }
        [Column("latitud", TypeName = "numeric(12, 8)")]
        public decimal Latitud { get; set; }
        [Column("longitud", TypeName = "numeric(12, 8)")]
        public decimal Longitud { get; set; }
        [Required]
        [Column("codigo")]
        public string Codigo { get; set; }
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

        [ForeignKey("Idcnv")]
        [InverseProperty("EncInformantes")]
        public CatNiveles IdcnvNavigation { get; set; }
        [ForeignKey("Idomv")]
        [InverseProperty("EncInformantes")]
        public OpeMovimientos IdomvNavigation { get; set; }
        [InverseProperty("IdeinNavigation")]
        public ICollection<EncEncuestas> EncEncuestas { get; set; }
    }
}
