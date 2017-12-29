// // <copyright file="ReportesController.cs" company="INTEGRATE - Soluciones Informaticas">
// // Copyright (c) 2016 Todos los derechos reservados
// // </copyright>
// // <author>re-al </author>
// // <date>2017-12-29 9:24</date>

using System.Collections;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using ReAl.Lumino.Encuestas.Dal;
using ReAl.Lumino.Encuestas.Helpers;
using ReAl.Lumino.Encuestas.Models;

namespace ReAl.Lumino.Encuestas.Controllers
{
    public class ReportesController : BaseController
    {
        public ReportesController(db_encuestasContext context, IConfiguration configuration, IOptions<ConnectionStringsSettings> connstring) : base(context, configuration, connstring)
        {
        }
        
        // GET
        public IActionResult Index()
        {
            var rn = new RnVista(_connectionStringsSettings.Value);
            var arrColWhere = new ArrayList {OpeProyectos.Fields.Idopy.ToString()};
            var arrValWhere = new ArrayList {this.GetProyectoId()};
            var dtReporte = rn.ObtenerDatos("vw_enc_flujo", arrColWhere, arrValWhere);
            ViewData["datos"] = dtReporte;
            return View();
        }
    }
}