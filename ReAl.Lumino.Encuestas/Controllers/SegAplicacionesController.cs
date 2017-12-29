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
    public class SegAplicacionesController : BaseController
    {
		public SegAplicacionesController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: SegAplicaciones
        public async Task<IActionResult> Index()
        {
            return View(await _context.SegAplicaciones.ToListAsync());
        }

        // GET: SegAplicaciones/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var segAplicaciones = await _context.SegAplicaciones
                .SingleOrDefaultAsync(m => m.Idsap == id);
            if (segAplicaciones == null)
            {
                return NotFound();
            }

            return View(segAplicaciones);
        }

        // GET: SegAplicaciones/Create
        public IActionResult Create()
        {			
            return View();
        }

        // POST: SegAplicaciones/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idsap,Sigla,Nombre,Descripcion,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegAplicaciones segAplicaciones)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    segAplicaciones.Usucre = this.GetLogin();
					_context.Add(segAplicaciones);
					await _context.SaveChangesAsync();
                	return RedirectToAction(nameof(Index));
				}
				catch (Exception exp)
                {
                    if (exp.InnerException is NpgsqlException)
                        ViewBag.ErrorDb = exp.InnerException.Message;                        
                    else
                        ModelState.AddModelError("", exp.Message);
                    return View();
                }  
            }
            return View(segAplicaciones);
        }

        // GET: SegAplicaciones/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segAplicaciones = await _context.SegAplicaciones.SingleOrDefaultAsync(m => m.Idsap == id);
            if (segAplicaciones == null)
            {
                return NotFound();
            }
            return View(segAplicaciones);
        }

        // POST: SegAplicaciones/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idsap,Sigla,Nombre,Descripcion,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegAplicaciones segAplicaciones)
        {
            if (id != segAplicaciones.Idsap)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    segAplicaciones.Usumod = this.GetLogin();
                    segAplicaciones.Apitransaccion = "MODIFICAR";
                    _context.Update(segAplicaciones);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SegAplicacionesExists(segAplicaciones.Idsap))
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
                    return View(segAplicaciones);
                }
                return RedirectToAction(nameof(Index));
            }
            return View(segAplicaciones);
        }

        // GET: SegAplicaciones/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segAplicaciones = await _context.SegAplicaciones
                .SingleOrDefaultAsync(m => m.Idsap == id);
            if (segAplicaciones == null)
            {
                return NotFound();
            }

            return View(segAplicaciones);
        }

        // POST: SegAplicaciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var segAplicaciones = await _context.SegAplicaciones.SingleOrDefaultAsync(m => m.Idsap == id);
				_context.SegAplicaciones.Remove(segAplicaciones);
				await _context.SaveChangesAsync();
				return RedirectToAction(nameof(Index));
			}
			catch (Exception exp)
            {
                if (exp.InnerException is NpgsqlException)
                    ViewBag.ErrorDb = exp.InnerException.Message;                        
                else
                    ModelState.AddModelError("", exp.Message);
                return View();
            }     
        }

        private bool SegAplicacionesExists(long id)
        {
            return _context.SegAplicaciones.Any(e => e.Idsap == id);
        }
    }
}
