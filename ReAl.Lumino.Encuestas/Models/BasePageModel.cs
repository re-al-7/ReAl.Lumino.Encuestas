using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ReAl.Lumino.Encuestas.Helpers;

namespace ReAl.Lumino.Encuestas.Models
{
    public class BasePageModel : PageModel
    {
        protected readonly db_encuestasContext _context;
        protected List<SegAplicaciones> ListApp { get; set; }
        protected List<SegPaginas> ListPages { get; set; }
        protected string Usuario { get; set; }
        protected string CurrentApp { get; set; }        
        protected string ErrorDb { get; set; }

        public BasePageModel(db_encuestasContext context)
        {
            _context = context;
        }
        
        public string GetCurrentApp()
        {
            return HttpContext.Session.Keys.Contains("currentApp") ? HttpContext.Session.GetString("currentApp") : null;
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
                return User.Identity.GetGivenName().Length > 30 ? User.Identity.GetGivenName().Split(' ')[0] : User.Identity.GetGivenName();
            }                
            return ((obj.Nombres + " " + obj.Apellidos).Length > 30)  ? obj.Nombres: obj.Nombres + " " + obj.Apellidos;
        }

        public SegUsuarios GetUser()
        {
            if (!User.Identity.IsAuthenticated)
            {
                return null;
            }
            var obj = _context.SegUsuarios.SingleOrDefault(m => m.Login == User.Identity.GetGivenName());
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
        
        protected List<SegAplicaciones> GetAplicaciones()
        {
            var objRol = GetUserRole();
            return objRol == null ? CMenus.GetAplicaciones(_context, -1) : CMenus.GetAplicaciones(_context, objRol.Idsro);
        }
                
        protected List<SegPaginas> GetPages()
        {
            var objRol = GetUserRole();
            return objRol == null ? CMenus.GetPages(HttpContext, _context,-1) : CMenus.GetPages(HttpContext, _context,objRol.Idsro);
        }
        
    }
}