// // <copyright file="Charts.cshtml.cs" company="INTEGRATE - Soluciones Informaticas">
// // Copyright (c) 2016 Todos los derechos reservados
// // </copyright>
// // <author>re-al </author>
// // <date>2017-11-17 23:25</date>

using System.Collections.Generic;
using ReAl.Lumino.Encuestas.Models;

namespace ReAl.Lumino.Encuestas.Pages.Plantillas
{
    public class ChartsModel: BasePageModel
    {
        public ChartsModel(db_encuestasContext context) : base(context)
        {
        }
        
        public void OnGet()
        {
            ListApp = this.GetAplicaciones();
            ListPages = this.GetPages();
            Usuario = this.GetUserName();
            CurrentApp = GetCurrentApp();
        }
    }
}