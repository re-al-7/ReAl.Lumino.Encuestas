using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Npgsql;
using ReAl.Lumino.Encuestas.Models;

namespace ReAl.Lumino.Encuestas.Controllers
{
    [Authorize]
    public class SegUsuariosController : BaseController
    {
		public SegUsuariosController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: SegUsuarios
        public async Task<IActionResult> Index()
        {
            var db_encuestasContext = _context.SegUsuarios.Include(s => s.IdcdeNavigation).Include(s => s.IdobrNavigation);
            return View(await db_encuestasContext.ToListAsync());
        }

        // GET: SegUsuarios/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var segUsuarios = await _context.SegUsuarios
                .Include(s => s.IdcdeNavigation)
                .Include(s => s.IdobrNavigation)
                .SingleOrDefaultAsync(m => m.Idsus == id);
            if (segUsuarios == null)
            {
                return NotFound();
            }

            return View(segUsuarios);
        }

        // GET: SegUsuarios/Create
        public IActionResult Create()
        {			
        ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
            CatDepartamentos.Fields.Idcde.ToString(), 
            CatDepartamentos.Fields.Idcde.ToString());
        ViewData["Idobr"] = new SelectList(_context.OpeBrigadas, 
            OpeBrigadas.Fields.Idobr.ToString(), 
            OpeBrigadas.Fields.Codigo.ToString());
            return View();
        }

        // POST: SegUsuarios/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idsus,Login,Password,Nombres,Apellidos,Correo,Vigente,Idcde,Idobr,Tablet,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegUsuarios segUsuarios)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    segUsuarios.Usucre = this.GetLogin();
					_context.Add(segUsuarios);
					await _context.SaveChangesAsync();
                	return RedirectToAction(nameof(Index));
				}
				catch (Exception exp)
                {
                    if (exp.InnerException is NpgsqlException)
                    {
                        ViewBag.ErrorDb = exp.InnerException.Message;
                    }
                    else
                    {
                        ModelState.AddModelError("", exp.Message);
                    }
                    
                    ViewData["Idcde"] = 
                        new SelectList(_context.CatDepartamentos, 
                        CatDepartamentos.Fields.Idcde.ToString(), 
                        CatDepartamentos.Fields.Idcde.ToString());
                    ViewData["Idobr"] = 
                        new SelectList(_context.OpeBrigadas, 
                        OpeBrigadas.Fields.Idobr.ToString(), 
                        OpeBrigadas.Fields.Codigo.ToString());
                    return View();
                }  
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Idcde.ToString(), 
                segUsuarios.Idcde);
            ViewData["Idobr"] = new SelectList(_context.OpeBrigadas, 
                OpeBrigadas.Fields.Idobr.ToString(), 
                OpeBrigadas.Fields.Codigo.ToString(), 
                segUsuarios.Idobr);
            return View(segUsuarios);
        }

        // GET: SegUsuarios/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segUsuarios = await _context.SegUsuarios.SingleOrDefaultAsync(m => m.Idsus == id);
            if (segUsuarios == null)
            {
                return NotFound();
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Idcde.ToString(), 
                segUsuarios.Idcde);
            ViewData["Idobr"] = new SelectList(_context.OpeBrigadas, 
                OpeBrigadas.Fields.Idobr.ToString(), 
                OpeBrigadas.Fields.Codigo.ToString(), 
                segUsuarios.Idobr);
            return View(segUsuarios);
        }

        // POST: SegUsuarios/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idsus,Login,Password,Nombres,Apellidos,Correo,Vigente,Idcde,Idobr,Tablet,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegUsuarios segUsuarios)
        {
            if (id != segUsuarios.Idsus)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    segUsuarios.Usumod = this.GetLogin();
                    segUsuarios.Apitransaccion = "MODIFICAR";
                    _context.Update(segUsuarios);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SegUsuariosExists(segUsuarios.Idsus))
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
                    {
                        ViewBag.ErrorDb = exp.InnerException.Message;
                    }
                    else
                    {
                        ModelState.AddModelError("", exp.Message);
                    }
                    ViewData["Idcde"] = 
                        new SelectList(_context.CatDepartamentos, 
                        CatDepartamentos.Fields.Idcde.ToString(), 
                        CatDepartamentos.Fields.Idcde.ToString());
                    ViewData["Idobr"] = 
                        new SelectList(_context.OpeBrigadas, 
                        OpeBrigadas.Fields.Idobr.ToString(), 
                        OpeBrigadas.Fields.Codigo.ToString());
                    return View(segUsuarios);
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Idcde.ToString(), 
                segUsuarios.Idcde);
            ViewData["Idobr"] = new SelectList(_context.OpeBrigadas, 
                OpeBrigadas.Fields.Idobr.ToString(), 
                OpeBrigadas.Fields.Codigo.ToString(), 
                segUsuarios.Idobr);
            return View(segUsuarios);
        }

        // GET: SegUsuarios/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segUsuarios = await _context.SegUsuarios
                .Include(s => s.IdcdeNavigation)
                .Include(s => s.IdobrNavigation)
                .SingleOrDefaultAsync(m => m.Idsus == id);
            if (segUsuarios == null)
            {
                return NotFound();
            }

            return View(segUsuarios);
        }

        // GET: SegUsuarios/Profile/
        public async Task<IActionResult> Profile()
        {
            var segUsuarios = await _context.SegUsuarios.SingleOrDefaultAsync(m => m.Idsus == this.GetUser().Idsus);
            if (segUsuarios == null)
            {
                return NotFound();
            }
            return View(segUsuarios);
        }

        // POST: SegUsuarios/Profile/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Profile(long id, [Bind("Idsus,Login,Password,Nombres,Apellidos,Correo,Vigente,Idcde,Idobr,Tablet,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegUsuarios segUsuarios)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    (segUsuarios).Usumod = GetLogin();
					(segUsuarios).Apitransaccion = "MODIFICAR";
                    _context.Update(segUsuarios);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SegUsuariosExists(segUsuarios.Idsus))
                    {
                        return NotFound();
                    }
                    throw;
                }
				catch (Exception exp)
                {
                    if (exp.InnerException is NpgsqlException)
                    {
                        ViewBag.ErrorDb = exp.InnerException.Message;
                    }
                    else
                    {
                        ModelState.AddModelError("", exp.Message);
                    }

                    ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                        CatDepartamentos.Fields.Idcde.ToString(), 
                        CatDepartamentos.Fields.Idcde.ToString());
                    ViewData["Idobr"] = new SelectList(_context.OpeBrigadas, 
                        OpeBrigadas.Fields.Idobr.ToString(), 
                        OpeBrigadas.Fields.Codigo.ToString());
                    
                    return View(segUsuarios);
                }
                return RedirectToAction(nameof(DashboardController.Index), "Dashboard");
            }
            return View(segUsuarios);
        }
        
        // POST: SegUsuarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var segUsuarios = await _context.SegUsuarios.SingleOrDefaultAsync(m => m.Idsus == id);
				_context.SegUsuarios.Remove(segUsuarios);
				await _context.SaveChangesAsync();
				return RedirectToAction(nameof(Index));
			}
			catch (Exception exp)
            {
                if (exp.InnerException is NpgsqlException)
                {
                    ViewBag.ErrorDb = exp.InnerException.Message;
                }
                else
                {
                    ModelState.AddModelError("", exp.Message);
                }
                ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                    CatDepartamentos.Fields.Idcde.ToString(), 
                    CatDepartamentos.Fields.Idcde.ToString());
                ViewData["Idobr"] = new SelectList(_context.OpeBrigadas, 
                    OpeBrigadas.Fields.Idobr.ToString(), 
                    OpeBrigadas.Fields.Codigo.ToString());
                return View();
            }     
        }

        private bool SegUsuariosExists(long id)
        {
            return _context.SegUsuarios.Any(e => e.Idsus == id);
        }
    }
}
