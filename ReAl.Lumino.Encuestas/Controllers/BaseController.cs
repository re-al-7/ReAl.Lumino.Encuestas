using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using ReAl.Lumino.Encuestas.Helpers;
using ReAl.Lumino.Encuestas.Models;

namespace ReAl.Lumino.Encuestas.Controllers
{
    public class BaseController : Controller
    {
        protected readonly db_encuestasContext _context;
        protected IConfiguration _iconfiguration;  
        protected readonly IOptions<ConnectionStringsSettings> _connectionStringsSettings; 
        
        public BaseController(db_encuestasContext context)
        {
            _context = context;            
        }
        
        public BaseController(db_encuestasContext context, IConfiguration iconfiguration)
        {
            _context = context;
            _iconfiguration = iconfiguration;
        }       
        
        public BaseController(db_encuestasContext context, IConfiguration iconfiguration, IOptions<ConnectionStringsSettings> connstring)
        {
            _context = context;
            _iconfiguration = iconfiguration;
            _connectionStringsSettings = connstring;
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
            return _context.CatDepartamentos
                .Where(cde => cde.Idcde == this.GetDepartamentoId())
                .ToList();                   
        }
        
        public string GetCurrentApp()
        {
            return this.HttpContext.Session.Keys.Contains("currentApp") ? this.HttpContext.Session.GetString("currentApp").ToString() : null;
        }
        
        public string GetLogin()
        {
            return User.Identity.IsAuthenticated ? User.Identity.Name : null;
        }

        public string GetUserName()
        {
            if (!User.Identity.IsAuthenticated)
            {
                return null;
            }
            var obj = _context.SegUsuarios.SingleOrDefault(m => m.Login == User.Identity.GetGivenName());
            if (obj == null)
            {
                return User.Identity.GetGivenName().Length > 20 ? User.Identity.GetGivenName().Split(' ')[0] : User.Identity.GetGivenName();
            }
            return ((obj.Nombres + " " + obj.Apellidos).ToString().Length > 20) ? obj.Nombres : obj.Nombres + " " + obj.Apellidos;  
        }

        public SegUsuarios GetUser()
        {
            if (!User.Identity.IsAuthenticated)
            {
                return null;
            }
            var obj = _context.SegUsuarios.SingleOrDefault(m => m.Login.Equals(User.Identity.Name));                
            return obj;

        }

        public SegRoles GetUserRole()
        {
            if (!User.Identity.IsAuthenticated)
            {
                return null;
            }
            var obj = _context.SegRoles.SingleOrDefault(m => m.Idsro.ToString() == User.Identity.GetRole());                
            return obj;
        }
        
        public int GetProyectoId()
        {
            return (User.Identity.IsAuthenticated) ? int.Parse(User.Identity.GetGroupSid()) : -1;
        }
        
        public int GetDepartamentoId()
        {
            return (User.Identity.IsAuthenticated) ? int.Parse(User.Identity.GetPrimarySid()) : -1;
        }
        
        protected List<SegAplicaciones> GetAplicaciones()
        {
            var objRol = GetUserRole();
            return objRol == null ? CMenus.GetAplicaciones(_context, -1) : CMenus.GetAplicaciones(_context, objRol.Idsro);
        }
                
        protected List<SegPaginas> GetPages()
        {
            var objRol = GetUserRole();
            return objRol == null ? CMenus.GetPages(this.HttpContext, _context,-1) : CMenus.GetPages(this.HttpContext, _context,objRol.Idsro);
        }
        
    }
}