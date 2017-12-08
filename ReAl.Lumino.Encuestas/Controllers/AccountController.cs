using System;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ReAl.Lumino.Encuestas.Helpers;
using ReAl.Lumino.Encuestas.Models;

namespace ReAl.Lumino.Encuestas.Controllers
{
    public class AccountController : BaseController
    {
        public AccountController(db_encuestasContext context) : base(context)
        {
        }
        
        // GET: /Account/Login
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Login(string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            return View();
        }
        
        //
        // POST: /Account/Login
        [HttpPost, ActionName("Login")]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(SegUsuarios user, string returnUrl = null)
        {
            ViewData["ReturnUrl"] = returnUrl;
            if (ModelState.IsValid)
            {
                const string badUserNameOrPasswordMessage = "Usuario o contraseña incorrectos.";
                const string badUserCreation = "El Usuario no tiene un Rol activo";
                if (user == null)
                {
                    ModelState.AddModelError("", badUserNameOrPasswordMessage);
                    return View();
                }
                
                const string incompleteInformation = "Debe especificar un usuario y contraseña para continuar.";
                if (user.Login == "" || user.Password == "")
                {
                    ModelState.AddModelError("", incompleteInformation);
                    return View();
                }
                
                var obj = _context.SegUsuarios.SingleOrDefault(m => m.Login == user.Login);
                if (obj == null)
                {
                    ModelState.AddModelError("", badUserNameOrPasswordMessage);
                    return View();
                }
                    
                if (!CFuncionesEncriptacion.generarMD5(user.Password).ToUpper().Equals(obj.Password.ToUpper()))
                {
                    ModelState.AddModelError("", badUserNameOrPasswordMessage);
                    return View();
                }
                
                var identity = new ClaimsIdentity(CookieAuthenticationDefaults.AuthenticationScheme);
                identity.AddClaim(new Claim(ClaimTypes.Name, obj.Login));
                identity.AddClaim(new Claim(ClaimTypes.GivenName, obj.Nombres + " " + obj.Apellidos));
                
                //Para el Rol
                var objRol = _context.SegUsuarios
                    .Join(_context.SegUsuariosRestriccion, sus => sus.Idsus, sur => sur.Idsus, (sus, sur) => new {sus, sur})
                    .Join(_context.SegRoles, sussur => sussur.sur.Idsro, sro => sro.Idsro, (sussur, sro) => new {sussur, sro})
                    .Where(@t => @t.sussur.sur.Rolactivo == 1)
                    .Where(@t => string.Equals(@t.sussur.sus.Login, obj.Login, StringComparison.CurrentCultureIgnoreCase))
                    .Select(arg => arg).SingleOrDefault();
                if (objRol == null)
                {
                    identity.AddClaim(new Claim(ClaimTypes.Role, string.Empty));
                    identity.AddClaim(new Claim(ClaimTypes.GroupSid, string.Empty));
                    HttpContext.Session.SetString("currentApp", string.Empty);
                    
                    ModelState.AddModelError("", badUserCreation);
                    return View();
                }
                else
                {
                    identity.AddClaim(new Claim(ClaimTypes.Role, objRol.sro.Idsro.ToString()));
                    identity.AddClaim(new Claim(ClaimTypes.GroupSid, objRol.sussur.sur.Idopy.ToString()));
                    var objApp = CMenus.GetAplicaciones(_context, objRol.sro.Idsro).OrderBy(x => x.Nombre).First();

                    HttpContext.Session.SetString("currentApp", objApp == null? string.Empty : objApp.Sigla);
                }

                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(identity));
                
                
                if (returnUrl == null)
                {
                    returnUrl = TempData["returnUrl"]?.ToString();
                }
                if (returnUrl != null)
                {
                    return Redirect(returnUrl);
                }
                else
                {
                    return RedirectToAction(nameof(DashboardController.Index), "Dashboard");
                }
            }

            // If we got this far, something failed, redisplay form
            return View();
        }

        [Authorize]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction(nameof(Login));
        }
    }
}
