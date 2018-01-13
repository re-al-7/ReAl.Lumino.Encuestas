// // <copyright file="CMenus.cs" company="INTEGRATE - Soluciones Informaticas">
// // Copyright (c) 2016 Todos los derechos reservados
// // </copyright>
// // <author>re-al </author>
// // <date>2017-11-17 23:18</date>

using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using ReAl.Lumino.Encuestas.Models;

namespace ReAl.Lumino.Encuestas.Helpers
{
    public static class CMenus
    {
        public static bool EsPar(int numero)
        {
            return numero % 2 == 0;
        }
        
        public static List<SegAplicaciones> GetAplicaciones(db_encuestasContext context, long idRol)
        {            
            return context.SegAplicaciones
                .Join(context.SegPaginas, app => app.Idsap, pag => pag.Idsap, (app, pag) => new {app, pag})
                .Join(context.SegRolesPagina, pag => pag.pag.Idspg, rolpag => rolpag.Idspg, (pag, rolpag) => new {pag, rolpag})
                .Where(@t => @t.rolpag.Idsro == idRol)
                .Select(@t => @t.pag.app).Distinct().ToList();
        }
        
        public static List<SegPaginas> GetPages(HttpContext miContexto, db_encuestasContext context, long idRol)
        {
            var currentApp = "--";
            if (miContexto.Session.Keys.Contains("currentApp"))
            {
                currentApp  = miContexto.Session.GetString("currentApp");
            }
            
            //Obtenemos el objeto de Aplicaciones en base a la SIGLA
            var objApp = context.SegAplicaciones.SingleOrDefault(app => app.Sigla == currentApp);

            if (objApp == null)
            {
                return new List<SegPaginas>();
            }
            
            return context.SegPaginas
                .Join(context.SegRolesPagina, pag => pag.Idspg, rolpag => rolpag.Idspg,
                    (pag, rolpag) => new {pag, rolpag})
                .Where(@t => (@t.pag.Idsap == objApp.Idsap))
                .Where(@t => (@t.rolpag.Idsro == idRol))
                .Select(@t => @t.pag)
                .OrderBy(paginas => paginas.Prioridad).ToList();
        }
        
    }
}