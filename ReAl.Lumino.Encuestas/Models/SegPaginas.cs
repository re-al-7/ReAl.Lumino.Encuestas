using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReAl.Lumino.Encuestas.Models
{
    [Table("seg_paginas")]
    public partial class SegPaginas
    {
        public SegPaginas()
        {
            SegRolesPagina = new HashSet<SegRolesPagina>();
        }

        [Key]
        [Column("idspg")]
        public long Idspg { get; set; }
        [Column("idsap")]
        public long Idsap { get; set; }
        [Column("paginapadre", TypeName = "numeric(3, 0)")]
        public decimal? Paginapadre { get; set; }
        [Column("nombremenu")]
        public string Nombremenu { get; set; }
        [Required]
        [Column("sigla")]
        public string Sigla { get; set; }
        [Column("nivel")]
        public int Nivel { get; set; }
        [Column("icono")]
        public string Icono { get; set; }
        [Column("metodo")]
        public string Metodo { get; set; }
        [Column("accion")]
        public string Accion { get; set; }
        [Required]
        [Column("descripcion")]
        public string Descripcion { get; set; }
        [Column("prioridad", TypeName = "numeric(22, 0)")]
        public decimal? Prioridad { get; set; }
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
        [InverseProperty("SegPaginas")]
        public SegAplicaciones IdsapNavigation { get; set; }
        [InverseProperty("IdspgNavigation")]
        public ICollection<SegRolesPagina> SegRolesPagina { get; set; }
    }
}
