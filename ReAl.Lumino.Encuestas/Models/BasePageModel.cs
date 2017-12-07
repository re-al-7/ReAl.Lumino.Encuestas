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