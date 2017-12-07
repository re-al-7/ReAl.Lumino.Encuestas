using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("ope_movimientos")]
    public partial class OpeMovimientos
    {
        public OpeMovimientos()
        {
            EncEncuestas = new HashSet<EncEncuestas>();
            EncInformantes = new HashSet<EncInformantes>();
        }

        [Key]
        [Column("idomv")]
        public long Idomv { get; set; }
        [Column("idsus")]
        public long Idsus { get; set; }
        [Column("idoup")]
        public long? Idoup { get; set; }
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

        [ForeignKey("Idoup")]
        [InverseProperty("OpeMovimientos")]
        public OpeUpms IdoupNavigation { get; set; }
        [ForeignKey("Idsus")]
        [InverseProperty("OpeMovimientos")]
        public SegUsuarios IdsusNavigation { get; set; }
        [InverseProperty("IdomvNavigation")]
        public ICollection<EncEncuestas> EncEncuestas { get; set; }
        [InverseProperty("IdomvNavigation")]
        public ICollection<EncInformantes> EncInformantes { get; set; }
    }
}
