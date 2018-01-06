using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Npgsql;
using ReAl.Lumino.Encuestas.Helpers;
using ReAl.Lumino.Encuestas.Models;

namespace ReAl.Lumino.Encuestas.Controllers
{
    [Authorize]
    public class SegUsuariosRestriccionController : BaseController
    {
		public SegUsuariosRestriccionController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: SegUsuariosRestriccion
        public async Task<IActionResult> Index()
        {
            var db_encuestasContext = _context.SegUsuariosRestriccion
                .Include(s => s.IdcdeNavigation).Include(s => s.IdopyNavigation)
                .Include(s => s.IdsroNavigation).Include(s => s.IdsusNavigation);
            return View(await db_encuestasContext.ToListAsync());
        }
        
        // GET: SegUsuariosRestriccion
        public async Task<IActionResult> CambiarRolActual()
        {
            var db_encuestasContext = _context.SegUsuariosRestriccion
                .Where(sur => sur.Idsus == this.GetUser().Idsus)
                .Where(sur => sur.Vigente == 1)
                .Include(s => s.IdcdeNavigation).Include(s => s.IdopyNavigation)
                .Include(s => s.IdsroNavigation).Include(s => s.IdsusNavigation);
            return View(await db_encuestasContext.ToListAsync());
        }
        
        // POST: SegUsuariosRestriccion/CambiarRolActual/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CambiarRolActual(long? id)
        {
            try
            {
                var list = await _context.SegUsuariosRestriccion
                    .Where(sur => sur.Idsur != id)
                    .Where(sur => sur.Idsus == this.GetUser().Idsus)
                    .ToListAsync();
                foreach (SegUsuariosRestriccion sur in list)
                {
                    sur.Apitransaccion = "MODIFICAR";
                    sur.Usumod = this.GetLogin();
                    sur.Rolactivo = 0;
                    _context.SegUsuariosRestriccion.Update(sur);
                }
                
                var segUsuariosRestriccion = await _context.SegUsuariosRestriccion.SingleOrDefaultAsync(m => m.Idsur == id);
                segUsuariosRestriccion.Apitransaccion = "MODIFICAR";
                segUsuariosRestriccion.Usumod = this.GetLogin();
                segUsuariosRestriccion.Rolactivo = 1;
                _context.SegUsuariosRestriccion.Update(segUsuariosRestriccion);                
                await _context.SaveChangesAsync();
                
                var user = User as ClaimsPrincipal;
                var identity = user.Identity as ClaimsIdentity;

                if (identity == null) return RedirectToAction(nameof(CambiarRolActual));
                
                var claim = (from c in user.Claims
                    where c.Type == ClaimTypes.Role
                    select c).Single();
                identity.RemoveClaim(claim);

                var claim2 = (from c in user.Claims
                    where c.Type == ClaimTypes.GroupSid
                    select c).Single();
                identity.RemoveClaim(claim2);

                //Para el Rol                
                var objRol = _context.SegUsuarios
                    .Join(_context.SegUsuariosRestriccion, sus => sus.Idsus, sur => sur.Idsus,
                        (sus, sur) => new {sus, sur})
                    .Join(_context.SegRoles, sussur => sussur.sur.Idsro, sro => sro.Idsro,
                        (sussur, sro) => new {sussur, sro})
                    .Where(@t => @t.sussur.sur.Rolactivo == 1)
                    .Where(@t => string.Equals(@t.sussur.sus.Login, this.GetLogin(),
                        StringComparison.CurrentCultureIgnoreCase))
                    .Select(arg => arg).SingleOrDefault();
                if (objRol == null)
                {
                    identity.AddClaim(new Claim(ClaimTypes.Role, string.Empty));
                    identity.AddClaim(new Claim(ClaimTypes.GroupSid, string.Empty));
                    identity.AddClaim(new Claim(ClaimTypes.PrimarySid, string.Empty));
                }
                else
                {
                    identity.AddClaim(new Claim(ClaimTypes.Role, objRol.sro.Idsro.ToString()));
                    identity.AddClaim(new Claim(ClaimTypes.GroupSid, objRol.sussur.sur.Idopy.ToString()));
                    identity.AddClaim(new Claim(ClaimTypes.PrimarySid, objRol.sussur.sur.Idcde.ToString()));
                }

                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme,
                    new ClaimsPrincipal(identity));

                return RedirectToAction(nameof(CambiarRolActual));
            }
            catch (Exception exp)
            {
                if (exp.InnerException is NpgsqlException) ViewBag.ErrorDb = exp.InnerException.Message;                        
                else ModelState.AddModelError("", exp.Message);
                ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                    CatDepartamentos.Fields.Idcde.ToString(), 
                    CatDepartamentos.Fields.Apiestado.ToString());
                ViewData["Idopy"] = new SelectList(_context.OpeProyectos, 
                    OpeProyectos.Fields.Idopy.ToString(), 
                    OpeProyectos.Fields.Apiestado.ToString());
                ViewData["Idsro"] = new SelectList(_context.SegRoles, 
                    SegRoles.Fields.Idsro.ToString(), 
                    SegRoles.Fields.Apiestado.ToString());
                ViewData["Idsus"] = new SelectList(_context.SegUsuarios, 
                    SegUsuarios.Fields.Idsus.ToString(), 
                    SegUsuarios.Fields.Login.ToString());
                return View();
            }     
        }

        // GET: SegUsuariosRestriccion/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var segUsuariosRestriccion = await _context.SegUsuariosRestriccion
                .Include(s => s.IdcdeNavigation)
                .Include(s => s.IdopyNavigation)
                .Include(s => s.IdsroNavigation)
                .Include(s => s.IdsusNavigation)
                .SingleOrDefaultAsync(m => m.Idsur == id);
            if (segUsuariosRestriccion == null)
            {
                return NotFound();
            }

            return View(segUsuariosRestriccion);
        }

        // GET: SegUsuariosRestriccion/Create
        public IActionResult Create()
        {			
        ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
            CatDepartamentos.Fields.Idcde.ToString(), 
            CatDepartamentos.Fields.Apiestado.ToString());
        ViewData["Idopy"] = new SelectList(_context.OpeProyectos, 
            OpeProyectos.Fields.Idopy.ToString(), 
            OpeProyectos.Fields.Apiestado.ToString());
        ViewData["Idsro"] = new SelectList(_context.SegRoles, 
            SegRoles.Fields.Idsro.ToString(), 
            SegRoles.Fields.Apiestado.ToString());
        ViewData["Idsus"] = new SelectList(_context.SegUsuarios, 
            SegUsuarios.Fields.Idsus.ToString(), 
            SegUsuarios.Fields.Login.ToString());
            return View();
        }

        // POST: SegUsuariosRestriccion/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idsur,Idsus,Idsro,Idcde,Idopy,Rolactivo,Vigente,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegUsuariosRestriccion segUsuariosRestriccion)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    segUsuariosRestriccion.Usucre = this.GetLogin();
					_context.Add(segUsuariosRestriccion);
					await _context.SaveChangesAsync();
                	return RedirectToAction(nameof(Index));
				}
				catch (Exception exp)
                {
                    if (exp.InnerException is NpgsqlException)
                        ViewBag.ErrorDb = exp.InnerException.Message;                        
                    else
                        ModelState.AddModelError("", exp.Message);
                    ViewData["Idcde"] = 
                        new SelectList(_context.CatDepartamentos, 
                        CatDepartamentos.Fields.Idcde.ToString(), 
                        CatDepartamentos.Fields.Apiestado.ToString());
                    ViewData["Idopy"] = 
                        new SelectList(_context.OpeProyectos, 
                        OpeProyectos.Fields.Idopy.ToString(), 
                        OpeProyectos.Fields.Apiestado.ToString());
                    ViewData["Idsro"] = 
                        new SelectList(_context.SegRoles, 
                        SegRoles.Fields.Idsro.ToString(), 
                        SegRoles.Fields.Apiestado.ToString());
                    ViewData["Idsus"] = 
                        new SelectList(_context.SegUsuarios, 
                        SegUsuarios.Fields.Idsus.ToString(), 
                        SegUsuarios.Fields.Login.ToString());
                    return View();
                }  
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Apiestado.ToString(), 
                segUsuariosRestriccion.Idcde);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos, 
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Apiestado.ToString(), 
                segUsuariosRestriccion.Idopy);
            ViewData["Idsro"] = new SelectList(_context.SegRoles, 
                SegRoles.Fields.Idsro.ToString(), 
                SegRoles.Fields.Apiestado.ToString(), 
                segUsuariosRestriccion.Idsro);
            ViewData["Idsus"] = new SelectList(_context.SegUsuarios, 
                SegUsuarios.Fields.Idsus.ToString(), 
                SegUsuarios.Fields.Login.ToString(), 
                segUsuariosRestriccion.Idsus);
            return View(segUsuariosRestriccion);
        }

        // GET: SegUsuariosRestriccion/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segUsuariosRestriccion = await _context.SegUsuariosRestriccion.SingleOrDefaultAsync(m => m.Idsur == id);
            if (segUsuariosRestriccion == null)
            {
                return NotFound();
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Apiestado.ToString(), 
                segUsuariosRestriccion.Idcde);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos, 
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Apiestado.ToString(), 
                segUsuariosRestriccion.Idopy);
            ViewData["Idsro"] = new SelectList(_context.SegRoles, 
                SegRoles.Fields.Idsro.ToString(), 
                SegRoles.Fields.Apiestado.ToString(), 
                segUsuariosRestriccion.Idsro);
            ViewData["Idsus"] = new SelectList(_context.SegUsuarios, 
                SegUsuarios.Fields.Idsus.ToString(), 
                SegUsuarios.Fields.Login.ToString(), 
                segUsuariosRestriccion.Idsus);
            return View(segUsuariosRestriccion);
        }

        // POST: SegUsuariosRestriccion/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idsur,Idsus,Idsro,Idcde,Idopy,Rolactivo,Vigente,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegUsuariosRestriccion segUsuariosRestriccion)
        {
            if (id != segUsuariosRestriccion.Idsur)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    segUsuariosRestriccion.Usumod = this.GetLogin();
                    segUsuariosRestriccion.Apitransaccion = "MODIFICAR";
                    _context.Update(segUsuariosRestriccion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SegUsuariosRestriccionExists(segUsuariosRestriccion.Idsur))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
				catch (Exception exp)
                {
                    if (exp.InnerException is NpgsqlException)
                        ViewBag.ErrorDb = exp.InnerException.Message;                        
                    else
                        ModelState.AddModelError("", exp.Message);
                    ViewData["Idcde"] = 
                        new SelectList(_context.CatDepartamentos, 
                        CatDepartamentos.Fields.Idcde.ToString(), 
                        CatDepartamentos.Fields.Apiestado.ToString());
                    ViewData["Idopy"] = 
                        new SelectList(_context.OpeProyectos, 
                        OpeProyectos.Fields.Idopy.ToString(), 
                        OpeProyectos.Fields.Apiestado.ToString());
                    ViewData["Idsro"] = 
                        new SelectList(_context.SegRoles, 
                        SegRoles.Fields.Idsro.ToString(), 
                        SegRoles.Fields.Apiestado.ToString());
                    ViewData["Idsus"] = 
                        new SelectList(_context.SegUsuarios, 
                        SegUsuarios.Fields.Idsus.ToString(), 
                        SegUsuarios.Fields.Login.ToString());
                    return View(segUsuariosRestriccion);
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Apiestado.ToString(), 
                segUsuariosRestriccion.Idcde);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos, 
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Apiestado.ToString(), 
                segUsuariosRestriccion.Idopy);
            ViewData["Idsro"] = new SelectList(_context.SegRoles, 
                SegRoles.Fields.Idsro.ToString(), 
                SegRoles.Fields.Apiestado.ToString(), 
                segUsuariosRestriccion.Idsro);
            ViewData["Idsus"] = new SelectList(_context.SegUsuarios, 
                SegUsuarios.Fields.Idsus.ToString(), 
                SegUsuarios.Fields.Login.ToString(), 
                segUsuariosRestriccion.Idsus);
            return View(segUsuariosRestriccion);
        }

        // GET: SegUsuariosRestriccion/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segUsuariosRestriccion = await _context.SegUsuariosRestriccion
                .Include(s => s.IdcdeNavigation)
                .Include(s => s.IdopyNavigation)
                .Include(s => s.IdsroNavigation)
                .Include(s => s.IdsusNavigation)
                .SingleOrDefaultAsync(m => m.Idsur == id);
            if (segUsuariosRestriccion == null)
            {
                return NotFound();
            }

            return View(segUsuariosRestriccion);
        }

        // POST: SegUsuariosRestriccion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var segUsuariosRestriccion = await _context.SegUsuariosRestriccion.SingleOrDefaultAsync(m => m.Idsur == id);
				_context.SegUsuariosRestriccion.Remove(segUsuariosRestriccion);
				await _context.SaveChangesAsync();
				return RedirectToAction(nameof(Index));
			}
			catch (Exception exp)
            {
                if (exp.InnerException is NpgsqlException)
                    ViewBag.ErrorDb = exp.InnerException.Message;                        
                else
                    ModelState.AddModelError("", exp.Message);
                ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                    CatDepartamentos.Fields.Idcde.ToString(), 
                    CatDepartamentos.Fields.Apiestado.ToString());
                ViewData["Idopy"] = new SelectList(_context.OpeProyectos, 
                    OpeProyectos.Fields.Idopy.ToString(), 
                    OpeProyectos.Fields.Apiestado.ToString());
                ViewData["Idsro"] = new SelectList(_context.SegRoles, 
                    SegRoles.Fields.Idsro.ToString(), 
                    SegRoles.Fields.Apiestado.ToString());
                ViewData["Idsus"] = new SelectList(_context.SegUsuarios, 
                    SegUsuarios.Fields.Idsus.ToString(), 
                    SegUsuarios.Fields.Login.ToString());
                return View();
            }     
        }

        private bool SegUsuariosRestriccionExists(long id)
        {
            return _context.SegUsuariosRestriccion.Any(e => e.Idsur == id);
        }
    }
}
