using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ReAl.Lumino.Encuestas.Helpers;

namespace ReAl.Lumino.Encuestas.Models
{
    public class BasePageModel : PageModel
    {
        public readonly db_encuestasContext _context;
        public List<SegAplicaciones> ListApp { get; internal set; }
        public List<SegPaginas> ListPages { get; internal set; }
        public string Usuario { get; internal  set; }
        public string CurrentApp { get; internal  set; }        
        public string ErrorDb { get; internal  set; }

        public BasePageModel(db_encuestasContext context)
        {
            _context = context;
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
            if (!User.Identity.IsAuthenticated) return null;
            var obj = _context.SegUsuarios.SingleOrDefault(m => m.Login == User.Identity.GetGivenName());
            if (obj == null) return User.Identity.GetGivenName().Length > 30 ? User.Identity.GetGivenName().Split(' ')[0] : User.Identity.GetGivenName();
                
            if ((obj.Nombres + " " + obj.Apellidos).ToString().Length > 30) return obj.Nombres;
                
            return obj.Nombres + " " + obj.Apellidos;
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