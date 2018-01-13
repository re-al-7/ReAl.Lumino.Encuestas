// // <copyright file="db_encuestasContextExtend.cs" company="INTEGRATE - Soluciones Informaticas">
// // Copyright (c) 2016 Todos los derechos reservados
// // </copyright>
// // <author>re-al </author>
// // <date>2017-12-08 10:23</date>

using Microsoft.EntityFrameworkCore;

namespace ReAl.Lumino.Encuestas.Models
{
    public partial class db_encuestasContext : DbContext
    {
        protected db_encuestasContext(DbContextOptions<db_encuestasContext> options) :  
            base(options)  
        {  
        }
    }
}