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
    public class CatTiposPreguntaController : BaseController
    {
		public CatTiposPreguntaController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: CatTiposPregunta
        public async Task<IActionResult> Index()
        {
            return View(await _context.CatTiposPregunta.ToListAsync());
        }

        // GET: CatTiposPregunta/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var catTiposPregunta = await _context.CatTiposPregunta
                .SingleOrDefaultAsync(m => m.Idctp == id);
            if (catTiposPregunta == null)
            {
                return NotFound();
            }

            return View(catTiposPregunta);
        }

        // GET: CatTiposPregunta/Create
        public IActionResult Create()
        {			
            return View();
        }

        // POST: CatTiposPregunta/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idctp,TipoPregunta,Descripcion,RespuestaValor,ExportarCodigo,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] CatTiposPregunta catTiposPregunta)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    catTiposPregunta.Usucre = this.GetLogin();
					_context.Add(catTiposPregunta);
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
                    return View();
                }  
            }
            return View(catTiposPregunta);
        }

        // GET: CatTiposPregunta/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var catTiposPregunta = await _context.CatTiposPregunta.SingleOrDefaultAsync(m => m.Idctp == id);
            if (catTiposPregunta == null)
            {
                return NotFound();
            }
            return View(catTiposPregunta);
        }

        // POST: CatTiposPregunta/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idctp,TipoPregunta,Descripcion,RespuestaValor,ExportarCodigo,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] CatTiposPregunta catTiposPregunta)
        {
            if (id != catTiposPregunta.Idctp)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    catTiposPregunta.Usumod = this.GetLogin();
                    catTiposPregunta.Apitransaccion = "MODIFICAR";
                    _context.Update(catTiposPregunta);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CatTiposPreguntaExists(catTiposPregunta.Idctp))
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
                    return View(catTiposPregunta);
                }
                return RedirectToAction(nameof(Index));
            }
            return View(catTiposPregunta);
        }

        // GET: CatTiposPregunta/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var catTiposPregunta = await _context.CatTiposPregunta
                .SingleOrDefaultAsync(m => m.Idctp == id);
            if (catTiposPregunta == null)
            {
                return NotFound();
            }

            return View(catTiposPregunta);
        }

        // POST: CatTiposPregunta/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var catTiposPregunta = await _context.CatTiposPregunta.SingleOrDefaultAsync(m => m.Idctp == id);
				_context.CatTiposPregunta.Remove(catTiposPregunta);
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
                return View();
            }     
        }

        private bool CatTiposPreguntaExists(long id)
        {
            return _context.CatTiposPregunta.Any(e => e.Idctp == id);
        }
    }
}
