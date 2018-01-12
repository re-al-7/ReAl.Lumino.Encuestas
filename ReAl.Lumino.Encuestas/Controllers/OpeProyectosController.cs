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
    public class OpeProyectosController : BaseController
    {
		public OpeProyectosController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: OpeProyectos
        public async Task<IActionResult> Index()
        {
            return View(await _context.OpeProyectos.ToListAsync());
        }

        // GET: OpeProyectos/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var opeProyectos = await _context.OpeProyectos
                .SingleOrDefaultAsync(m => m.Idopy == id);
            if (opeProyectos == null)
            {
                return NotFound();
            }

            return View(opeProyectos);
        }

        // GET: OpeProyectos/Create
        public IActionResult Create()
        {			
            return View();
        }

        // POST: OpeProyectos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idopy,Nombre,Codigo,Descripcion,Fecinicio,Fecfin,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] OpeProyectos opeProyectos)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    opeProyectos.Usucre = this.GetLogin();
					_context.Add(opeProyectos);
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
            return View(opeProyectos);
        }

        // GET: OpeProyectos/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var opeProyectos = await _context.OpeProyectos.SingleOrDefaultAsync(m => m.Idopy == id);
            if (opeProyectos == null)
            {
                return NotFound();
            }
            return View(opeProyectos);
        }

        // POST: OpeProyectos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idopy,Nombre,Codigo,Descripcion,Fecinicio,Fecfin,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] OpeProyectos opeProyectos)
        {
            if (id != opeProyectos.Idopy)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    opeProyectos.Usumod = this.GetLogin();
                    opeProyectos.Apitransaccion = "MODIFICAR";
                    _context.Update(opeProyectos);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OpeProyectosExists(opeProyectos.Idopy))
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
                    return View(opeProyectos);
                }
                return RedirectToAction(nameof(Index));
            }
            return View(opeProyectos);
        }

        // GET: OpeProyectos/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var opeProyectos = await _context.OpeProyectos
                .SingleOrDefaultAsync(m => m.Idopy == id);
            if (opeProyectos == null)
            {
                return NotFound();
            }

            return View(opeProyectos);
        }

        // POST: OpeProyectos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var opeProyectos = await _context.OpeProyectos.SingleOrDefaultAsync(m => m.Idopy == id);
				_context.OpeProyectos.Remove(opeProyectos);
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

        private bool OpeProyectosExists(long id)
        {
            return _context.OpeProyectos.Any(e => e.Idopy == id);
        }
    }
}
