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
    public class EncSeccionesController : BaseController
    {
		public EncSeccionesController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: EncSecciones
        public async Task<IActionResult> Index()
        {
            var db_encuestasContext = _context.EncSecciones
                .Where(sec => sec.Idopy == this.GetProyectoId())
                .Include(e => e.IdcnvNavigation)
                .Include(e => e.IdopyNavigation);
            return View(await db_encuestasContext.ToListAsync());
        }

        // GET: EncSecciones/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var encSecciones = await _context.EncSecciones
                .Include(e => e.IdcnvNavigation)
                .Include(e => e.IdopyNavigation)
                .SingleOrDefaultAsync(m => m.Idese == id);
            if (encSecciones == null)
            {
                return NotFound();
            }

            return View(encSecciones);
        }

        // GET: EncSecciones/Create
        public IActionResult Create()
        {
            ViewData["Idcnv"] = new SelectList(_context.CatNiveles,
                CatNiveles.Fields.Idcnv.ToString(),
                CatNiveles.Fields.Descripcion.ToString());
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == GetProyectoId()),
                OpeProyectos.Fields.Idopy.ToString(),
                OpeProyectos.Fields.Nombre.ToString());
            return View();
        }

        // POST: EncSecciones/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idese,Idopy,Idcnv,Codigo,Seccion,Abierta,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] EncSecciones encSecciones)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    encSecciones.Usucre = this.GetLogin();
					_context.Add(encSecciones);
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
                    ViewData["Idcnv"] = 
                        new SelectList(_context.CatNiveles, 
                        CatNiveles.Fields.Idcnv.ToString(), 
                        CatNiveles.Fields.Descripcion.ToString());
                    ViewData["Idopy"] = 
                        new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == GetProyectoId()), 
                        OpeProyectos.Fields.Idopy.ToString(), 
                        OpeProyectos.Fields.Nombre.ToString());
                    return View();
                }  
            }
            ViewData["Idcnv"] = new SelectList(_context.CatNiveles, 
                CatNiveles.Fields.Idcnv.ToString(), 
                CatNiveles.Fields.Descripcion.ToString(), 
                encSecciones.Idcnv);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos, 
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Nombre.ToString(), 
                encSecciones.Idopy);
            return View(encSecciones);
        }

        // GET: EncSecciones/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var encSecciones = await _context.EncSecciones.SingleOrDefaultAsync(m => m.Idese == id);
            if (encSecciones == null)
            {
                return NotFound();
            }
            ViewData["Idcnv"] = new SelectList(_context.CatNiveles, 
                CatNiveles.Fields.Idcnv.ToString(), 
                CatNiveles.Fields.Descripcion.ToString(), 
                encSecciones.Idcnv);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == GetProyectoId()),
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Nombre.ToString(), 
                encSecciones.Idopy);
            return View(encSecciones);
        }

        // POST: EncSecciones/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idese,Idopy,Idcnv,Codigo,Seccion,Abierta,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] EncSecciones encSecciones)
        {
            if (id != encSecciones.Idese)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    encSecciones.Usumod = this.GetLogin();
                    encSecciones.Apitransaccion = "MODIFICAR";
                    _context.Update(encSecciones);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EncSeccionesExists(encSecciones.Idese))
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
                    ViewData["Idcnv"] = 
                        new SelectList(_context.CatNiveles, 
                        CatNiveles.Fields.Idcnv.ToString(), 
                        CatNiveles.Fields.Descripcion.ToString());
                    ViewData["Idopy"] = 
                        new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == GetProyectoId()),
                        OpeProyectos.Fields.Idopy.ToString(), 
                        OpeProyectos.Fields.Nombre.ToString());
                    return View(encSecciones);
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idcnv"] = new SelectList(_context.CatNiveles, 
                CatNiveles.Fields.Idcnv.ToString(), 
                CatNiveles.Fields.Descripcion.ToString(), 
                encSecciones.Idcnv);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == GetProyectoId()),
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Nombre.ToString(), 
                encSecciones.Idopy);
            return View(encSecciones);
        }

        // GET: EncSecciones/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var encSecciones = await _context.EncSecciones
                .Include(e => e.IdcnvNavigation)
                .Include(e => e.IdopyNavigation)
                .SingleOrDefaultAsync(m => m.Idese == id);
            if (encSecciones == null)
            {
                return NotFound();
            }

            return View(encSecciones);
        }

        // POST: EncSecciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var encSecciones = await _context.EncSecciones.SingleOrDefaultAsync(m => m.Idese == id);
				_context.EncSecciones.Remove(encSecciones);
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
                ViewData["Idcnv"] = new SelectList(_context.CatNiveles, 
                    CatNiveles.Fields.Idcnv.ToString(), 
                    CatNiveles.Fields.Descripcion.ToString());
                ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == GetProyectoId()), 
                    OpeProyectos.Fields.Idopy.ToString(), 
                    OpeProyectos.Fields.Nombre.ToString());
                return View();
            }     
        }

        private bool EncSeccionesExists(long id)
        {
            return _context.EncSecciones.Any(e => e.Idese == id);
        }
    }
}
