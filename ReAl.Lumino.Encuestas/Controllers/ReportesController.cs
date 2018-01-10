// // <copyright file="ReportesController.cs" company="INTEGRATE - Soluciones Informaticas">
// // Copyright (c) 2016 Todos los derechos reservados
// // </copyright>
// // <author>re-al </author>
// // <date>2017-12-29 9:24</date>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Npgsql;
using OfficeOpenXml;
using OfficeOpenXml.Table;
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
        
        /// <summary>
        /// An in-memory report
        /// </summary>
        public IActionResult Download()
        {
            byte[] reportBytes;
            var rn = new RnVista(_connectionStringsSettings.Value);
            var arrColWhere = new ArrayList {OpeProyectos.Fields.Idopy.ToString()};
            var arrValWhere = new ArrayList {this.GetProyectoId()};
            var dtReporte = rn.ObtenerDatos("vw_enc_flujo", arrColWhere, arrValWhere);

            foreach (DataColumn column in dtReporte.Columns)
            {
                column.ColumnName = column.ColumnName.ToPascalCase();
            }
            

            using (var package = new ExcelPackage())
            {
                ExcelWorksheet ws = package.Workbook.Worksheets.Add("Reporte");
                //Titulos
                ws.Cells["A1"].Value = "Reporte";
                ws.Cells["A2"].Value = "Fecha: " + DateTime.Now;
                ws.Cells["A3"].Value = "Elaborado por " + this.GetUser().Nombres + " " + this.GetUser().Apellidos;
                ws.Cells[1, 1, 3, 1].Style.Font.Bold = true;
                
                //Reporte
                ws.Cells["A6"].LoadFromDataTable(dtReporte, true);                
                ws.Cells[6, 1, dtReporte.Rows.Count, dtReporte.Columns.Count].AutoFitColumns();
                
                var tbl = ws.Tables.Add(new ExcelAddressBase(fromRow: 6, fromCol: 1, toRow: dtReporte.Rows.Count, toColumn: dtReporte.Columns.Count), "Data");
                tbl.ShowHeader = true;                
                
                reportBytes = package.GetAsByteArray();                 
            }

            return File(reportBytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "report.xlsx");
        }       
    }
}