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
    public class CatNivelesController : BaseController
    {
		public CatNivelesController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: CatNiveles
        public async Task<IActionResult> Index()
        {
            return View(await _context.CatNiveles.ToListAsync());
        }

        // GET: CatNiveles/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var catNiveles = await _context.CatNiveles
                .SingleOrDefaultAsync(m => m.Idcnv == id);
            if (catNiveles == null)
            {
                return NotFound();
            }

            return View(catNiveles);
        }

        // GET: CatNiveles/Create
        public IActionResult Create()
        {			
            return View();
        }

        // POST: CatNiveles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idcnv,Nivel,Descripcion,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] CatNiveles catNiveles)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    catNiveles.Usucre = this.GetLogin();
					_context.Add(catNiveles);
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
            return View(catNiveles);
        }

        // GET: CatNiveles/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var catNiveles = await _context.CatNiveles.SingleOrDefaultAsync(m => m.Idcnv == id);
            if (catNiveles == null)
            {
                return NotFound();
            }
            return View(catNiveles);
        }

        // POST: CatNiveles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idcnv,Nivel,Descripcion,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] CatNiveles catNiveles)
        {
            if (id != catNiveles.Idcnv)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    catNiveles.Usumod = this.GetLogin();
                    catNiveles.Apitransaccion = "MODIFICAR";
                    _context.Update(catNiveles);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CatNivelesExists(catNiveles.Idcnv))
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
                    return View(catNiveles);
                }
                return RedirectToAction(nameof(Index));
            }
            return View(catNiveles);
        }

        // GET: CatNiveles/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var catNiveles = await _context.CatNiveles
                .SingleOrDefaultAsync(m => m.Idcnv == id);
            if (catNiveles == null)
            {
                return NotFound();
            }

            return View(catNiveles);
        }

        // POST: CatNiveles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var catNiveles = await _context.CatNiveles.SingleOrDefaultAsync(m => m.Idcnv == id);
				_context.CatNiveles.Remove(catNiveles);
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

        private bool CatNivelesExists(long id)
        {
            return _context.CatNiveles.Any(e => e.Idcnv == id);
        }
    }
}
