using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_transacciones")]
    public partial class SegTransacciones
    {
        public SegTransacciones()
        {
            SegRolesTablaTransaccion = new HashSet<SegRolesTablaTransaccion>();
            SegTransiciones = new HashSet<SegTransiciones>();
        }

        [Key]
        [Column("idstr")]
        public long Idstr { get; set; }
        [Column("idsta")]
        public long Idsta { get; set; }
        [Required]
        [Column("transaccion")]
        public string Transaccion { get; set; }
        [Required]
        [Column("sentencia")]
        public string Sentencia { get; set; }
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

        [ForeignKey("Idsta")]
        [InverseProperty("SegTransacciones")]
        public SegTablas IdstaNavigation { get; set; }
        public ICollection<SegRolesTablaTransaccion> SegRolesTablaTransaccion { get; set; }
        public ICollection<SegTransiciones> SegTransiciones { get; set; }
    }
}
