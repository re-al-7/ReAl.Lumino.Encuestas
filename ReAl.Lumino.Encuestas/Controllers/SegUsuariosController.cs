using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Npgsql;
using ReAl.Lumino.Encuestas.Models;

namespace ReAl.Lumino.Encuestas.Controllers
{
    public class SegUsuariosController : BaseController
    {
		public SegUsuariosController(db_encuestasContext context) : base(context)
        {
        }

        // GET: SegUsuarios
        public async Task<IActionResult> Index()
        {
			/*
			ViewBag.ListApp = GetAplicaciones();
            ViewBag.ListPages = GetPages();
            ViewData["Usuario"] = getUserName();
			*/
            var db_encuestasContext = _context.SegUsuarios.Include(s => s.IdcdeNavigation).Include(s => s.IdobrNavigation);
            return View(await db_encuestasContext.ToListAsync());
        }

        // GET: SegUsuarios/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			/*
			ViewBag.ListApp = GetAplicaciones();
            ViewBag.ListPages = GetPages();
            ViewData["Usuario"] = getUserName();
			*/
			
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
			/*
			ViewBag.ListApp = GetAplicaciones();
            ViewBag.ListPages = GetPages();
            ViewData["Usuario"] = getUserName();
			*/
			
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, "Idcde", "Nombre");
            ViewData["Idobr"] = new SelectList(_context.OpeBrigadas, "Idobr", "Codigo");
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
					_context.Add(segUsuarios);
					await _context.SaveChangesAsync();
                	return RedirectToAction(nameof(Index));
				}
				catch (Exception exp)
                {
                    if (exp.InnerException is NpgsqlException)
                        ViewBag.ErrorDb = exp.InnerException.Message;                        
                    else
                        ModelState.AddModelError("", exp.Message);
               
					/*
                    ViewBag.ListApp = GetAplicaciones();
                    ViewBag.ListPages = GetPages();
                    ViewData["Usuario"] = getUserName();
					*/
                    return View();
                }  
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, "Idcde", "Nombre", segUsuarios.Idcde);
            ViewData["Idobr"] = new SelectList(_context.OpeBrigadas, "Idobr", "Codigo", segUsuarios.Idobr);
            return View(segUsuarios);
        }

        // GET: SegUsuarios/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
			/*
			ViewBag.ListApp = GetAplicaciones();
            ViewBag.ListPages = GetPages();
            ViewData["Usuario"] = getUserName();			
			*/

            if (id == null)
            {
                return NotFound();
            }

            var segUsuarios = await _context.SegUsuarios.SingleOrDefaultAsync(m => m.Idsus == id);
            if (segUsuarios == null)
            {
                return NotFound();
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, "Idcde", "Nombre", segUsuarios.Idcde);
            ViewData["Idobr"] = new SelectList(_context.OpeBrigadas, "Idobr", "Codigo", segUsuarios.Idobr);
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
                    (segUsuarios).Usumod = this.GetLogin();
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
               
					/*
                    ViewBag.ListApp = GetAplicaciones();
                    ViewBag.ListPages = GetPages();
                    ViewData["Usuario"] = getUserName();
					*/
                    return View(segUsuarios);
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, "Idcde", "Nombre", segUsuarios.Idcde);
            ViewData["Idobr"] = new SelectList(_context.OpeBrigadas, "Idobr", "Codigo", segUsuarios.Idobr);
            return View(segUsuarios);
        }

        // GET: SegUsuarios/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
			/*
			ViewBag.ListApp = GetAplicaciones();
            ViewBag.ListPages = GetPages();
            ViewData["Usuario"] = getUserName();
			*/
			
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
                    ViewBag.ErrorDb = exp.InnerException.Message;                        
                else
                    ModelState.AddModelError("", exp.Message);
            
				/*
                ViewBag.ListApp = GetAplicaciones();
                ViewBag.ListPages = GetPages();
                ViewData["Usuario"] = getUserName();
				*/
                return View();
            }     
        }

        private bool SegUsuariosExists(long id)
        {
            return _context.SegUsuarios.Any(e => e.Idsus == id);
        }
    }
}
