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
    public class SegPaginasController : BaseController
    {
		public SegPaginasController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: SegPaginas
        public async Task<IActionResult> Index()
        {
            var db_encuestasContext = _context.SegPaginas.Include(s => s.IdsapNavigation);
            return View(await db_encuestasContext.ToListAsync());
        }

        // GET: SegPaginas/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var segPaginas = await _context.SegPaginas
                .Include(s => s.IdsapNavigation)
                .SingleOrDefaultAsync(m => m.Idspg == id);
            if (segPaginas == null)
            {
                return NotFound();
            }

            return View(segPaginas);
        }

        // GET: SegPaginas/Create
        public IActionResult Create()
        {			
        ViewData["Idsap"] = new SelectList(_context.SegAplicaciones, 
            SegAplicaciones.Fields.Idsap.ToString(), 
            SegAplicaciones.Fields.Apiestado.ToString());
            return View();
        }

        // POST: SegPaginas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idspg,Idsap,Paginapadre,Nombremenu,Sigla,Nivel,Icono,Metodo,Accion,Descripcion,Prioridad,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegPaginas segPaginas)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    segPaginas.Usucre = this.GetLogin();
					_context.Add(segPaginas);
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
                    ViewData["Idsap"] = 
                        new SelectList(_context.SegAplicaciones, 
                        SegAplicaciones.Fields.Idsap.ToString(), 
                        SegAplicaciones.Fields.Apiestado.ToString());
                    return View();
                }  
            }
            ViewData["Idsap"] = new SelectList(_context.SegAplicaciones, 
                SegAplicaciones.Fields.Idsap.ToString(), 
                SegAplicaciones.Fields.Apiestado.ToString(), 
                segPaginas.Idsap);
            return View(segPaginas);
        }

        // GET: SegPaginas/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segPaginas = await _context.SegPaginas.SingleOrDefaultAsync(m => m.Idspg == id);
            if (segPaginas == null)
            {
                return NotFound();
            }
            ViewData["Idsap"] = new SelectList(_context.SegAplicaciones, 
                SegAplicaciones.Fields.Idsap.ToString(), 
                SegAplicaciones.Fields.Apiestado.ToString(), 
                segPaginas.Idsap);
            return View(segPaginas);
        }

        // POST: SegPaginas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idspg,Idsap,Paginapadre,Nombremenu,Sigla,Nivel,Icono,Metodo,Accion,Descripcion,Prioridad,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegPaginas segPaginas)
        {
            if (id != segPaginas.Idspg)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    segPaginas.Usumod = this.GetLogin();
                    segPaginas.Apitransaccion = "MODIFICAR";
                    _context.Update(segPaginas);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SegPaginasExists(segPaginas.Idspg))
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
                    ViewData["Idsap"] = 
                        new SelectList(_context.SegAplicaciones, 
                        SegAplicaciones.Fields.Idsap.ToString(), 
                        SegAplicaciones.Fields.Apiestado.ToString());
                    return View(segPaginas);
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idsap"] = new SelectList(_context.SegAplicaciones, 
                SegAplicaciones.Fields.Idsap.ToString(), 
                SegAplicaciones.Fields.Apiestado.ToString(), 
                segPaginas.Idsap);
            return View(segPaginas);
        }

        // GET: SegPaginas/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segPaginas = await _context.SegPaginas
                .Include(s => s.IdsapNavigation)
                .SingleOrDefaultAsync(m => m.Idspg == id);
            if (segPaginas == null)
            {
                return NotFound();
            }

            return View(segPaginas);
        }

        // POST: SegPaginas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var segPaginas = await _context.SegPaginas.SingleOrDefaultAsync(m => m.Idspg == id);
				_context.SegPaginas.Remove(segPaginas);
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
                ViewData["Idsap"] = new SelectList(_context.SegAplicaciones, 
                    SegAplicaciones.Fields.Idsap.ToString(), 
                    SegAplicaciones.Fields.Apiestado.ToString());
                return View();
            }     
        }

        private bool SegPaginasExists(long id)
        {
            return _context.SegPaginas.Any(e => e.Idspg == id);
        }
    }
}
