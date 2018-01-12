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
    public class SegTablasController : BaseController
    {
		public SegTablasController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: SegTablas
        public async Task<IActionResult> Index()
        {
            var db_encuestasContext = _context.SegTablas.Include(s => s.IdsapNavigation);
            return View(await db_encuestasContext.ToListAsync());
        }

        // GET: SegTablas/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var segTablas = await _context.SegTablas
                .Include(s => s.IdsapNavigation)
                .SingleOrDefaultAsync(m => m.Idsta == id);
            if (segTablas == null)
            {
                return NotFound();
            }

            return View(segTablas);
        }

        // GET: SegTablas/Create
        public IActionResult Create()
        {			
        ViewData["Idsap"] = new SelectList(_context.SegAplicaciones, 
            SegAplicaciones.Fields.Idsap.ToString(), 
            SegAplicaciones.Fields.Apiestado.ToString());
            return View();
        }

        // POST: SegTablas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idsta,Idsap,Nombretabla,Alias,Descripcion,Beforestatement,Beforerow,Afterstatement,Afterrow,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegTablas segTablas)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    segTablas.Usucre = this.GetLogin();
					_context.Add(segTablas);
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
                segTablas.Idsap);
            return View(segTablas);
        }

        // GET: SegTablas/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segTablas = await _context.SegTablas.SingleOrDefaultAsync(m => m.Idsta == id);
            if (segTablas == null)
            {
                return NotFound();
            }
            ViewData["Idsap"] = new SelectList(_context.SegAplicaciones, 
                SegAplicaciones.Fields.Idsap.ToString(), 
                SegAplicaciones.Fields.Apiestado.ToString(), 
                segTablas.Idsap);
            return View(segTablas);
        }

        // POST: SegTablas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idsta,Idsap,Nombretabla,Alias,Descripcion,Beforestatement,Beforerow,Afterstatement,Afterrow,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegTablas segTablas)
        {
            if (id != segTablas.Idsta)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    segTablas.Usumod = this.GetLogin();
                    segTablas.Apitransaccion = "MODIFICAR";
                    _context.Update(segTablas);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SegTablasExists(segTablas.Idsta))
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
                    return View(segTablas);
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idsap"] = new SelectList(_context.SegAplicaciones, 
                SegAplicaciones.Fields.Idsap.ToString(), 
                SegAplicaciones.Fields.Apiestado.ToString(), 
                segTablas.Idsap);
            return View(segTablas);
        }

        // GET: SegTablas/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segTablas = await _context.SegTablas
                .Include(s => s.IdsapNavigation)
                .SingleOrDefaultAsync(m => m.Idsta == id);
            if (segTablas == null)
            {
                return NotFound();
            }

            return View(segTablas);
        }

        // POST: SegTablas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var segTablas = await _context.SegTablas.SingleOrDefaultAsync(m => m.Idsta == id);
				_context.SegTablas.Remove(segTablas);
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

        private bool SegTablasExists(long id)
        {
            return _context.SegTablas.Any(e => e.Idsta == id);
        }
    }
}
