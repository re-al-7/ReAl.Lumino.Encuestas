using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using ReAl.Lumino.Encuestas.Helpers;
using ReAl.Lumino.Encuestas.Models;

namespace ReAl.Lumino.Encuestas.Controllers
{
    public class BaseController : Controller
    {
        protected readonly db_encuestasContext _context;
        protected IConfiguration _iconfiguration;  
        
        public BaseController(db_encuestasContext context)
        {
            _context = context;            
        }
        
        public BaseController(db_encuestasContext context, IConfiguration iconfiguration)
        {
            _context = context;
            _iconfiguration = iconfiguration;
        }
        
        public override void OnActionExecuted(ActionExecutedContext context)
        {
            ViewBag.ListApp = GetAplicaciones();
            ViewBag.ListPages = GetPages();
            ViewBag.CurrentApp = GetCurrentApp();            
            ViewBag.Usuario = GetUserName();            
        }

        public string GetCurrentApp()
        {
            if (this.HttpContext.Session.Keys.Contains("currentApp"))
                return this.HttpContext.Session.GetString("currentApp").ToString();
            return null;
        }
        
        public string GetLogin()
        {
            if (User.Identity.IsAuthenticated)
                return User.Identity.Name;
            return null;
        }

        public string GetUserName()
        {
            if (User.Identity.IsAuthenticated)
            {
                var obj = _context.SegUsuarios.SingleOrDefault(m => m.Login == User.Identity.GetGivenName());
                if (obj == null)
                {
                    if (User.Identity.GetGivenName().Length > 30)
                        return User.Identity.GetGivenName().Split(' ')[0];
                    else
                        return User.Identity.GetGivenName();
                }
                else
                {
                    
                    if ((obj.Nombres + " " + obj.Apellidos).ToString().Length > 30)
                        return obj.Nombres;
                    else
                        return obj.Nombres + " " + obj.Apellidos;                    
                }
            }
            return null;
        }

        public SegUsuarios GetUser()
        {
            if (User.Identity.IsAuthenticated)
            {
                var obj = _context.SegUsuarios.SingleOrDefault(m => m.Login == User.Identity.GetGivenName());                
                return obj;
            }
            else
                return null;
        }

        
        protected List<SegAplicaciones> GetAplicaciones()
        {
            return CMenus.GetAplicaciones(_context);
        }
                
        protected List<SegPaginas> GetPages()
        {
            return CMenus.GetPages(this.HttpContext, _context);            
        }
        
    }
}