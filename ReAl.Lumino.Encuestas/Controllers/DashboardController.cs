using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReAl.Lumino.Encuestas.Models;

namespace ReAl.Lumino.Encuestas.Controllers
{
    [Authorize]
    public class DashboardController : BaseController
    {
        public DashboardController(db_encuestasContext context) : base(context)
        {
        }
        
        // GET: Dashboard
        public IActionResult Index(string app = "")
        {
            if (app != "")
            {
                HttpContext.Session.SetString("currentApp", app);
            }
            
            return View();
        }
    }
}