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

        public IEnumerable<CatDepartamentos> GetDeptoRestriccion()
        {
            //TODO: Filtrar la lista segun restriccion
            return _context.CatDepartamentos.ToList();                   
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

        public SegRoles GetUserRole()
        {
            if (User.Identity.IsAuthenticated)
            {
                var obj = _context.SegRoles.SingleOrDefault(m => m.Idsro.ToString() == User.Identity.GetRole());                
                return obj; 
            }
            else
                return null;
        }
        
        public int GetGroupSid()
        {
            if (User.Identity.IsAuthenticated)
                return int.Parse(User.Identity.GetGroupSid());
            return -1;
        }
        
        protected List<SegAplicaciones> GetAplicaciones()
        {
            var objRol = GetUserRole();
            if (objRol == null)
                return CMenus.GetAplicaciones(_context, -1);
            return CMenus.GetAplicaciones(_context, objRol.Idsro);
        }
                
        protected List<SegPaginas> GetPages()
        {
            var objRol = GetUserRole();
            if (objRol == null)
                return CMenus.GetPages(this.HttpContext, _context,-1);
            return CMenus.GetPages(this.HttpContext, _context,objRol.Idsro);
        }
        
    }
}