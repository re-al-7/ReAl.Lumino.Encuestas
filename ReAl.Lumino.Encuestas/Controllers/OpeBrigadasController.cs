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
    public class OpeBrigadasController : BaseController
    {
		public OpeBrigadasController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: OpeBrigadas
        public async Task<IActionResult> Index()
        {
            var lstDepto = this.GetDeptoRestriccion();
            ViewData["Idcde"] = lstDepto;
            var db_encuestasContext = _context.OpeBrigadas
                .Where(bri => bri.Idopy == GetProyectoId() && bri.Idcde == lstDepto.First().Idcde)
                .Include(o => o.IdcdeNavigation).Include(o => o.IdopyNavigation);
            return View(await db_encuestasContext.ToListAsync());
        }
        
        public PartialViewResult GetBrigadas(long? idcde)  
        {  
            var db_encuestasContext = _context.OpeBrigadas
                .Where(bri => bri.Idopy == GetProyectoId() && bri.Idcde == idcde)
                .Include(o => o.IdcdeNavigation).Include(o => o.IdopyNavigation);               
            return PartialView("_IndexPartial",db_encuestasContext.ToList());  
        }

        // GET: OpeBrigadas/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var opeBrigadas = await _context.OpeBrigadas
                .Include(o => o.IdcdeNavigation)
                .Include(o => o.IdopyNavigation)
                .SingleOrDefaultAsync(m => m.Idobr == id);
            if (opeBrigadas == null)
            {
                return NotFound();
            }

            return View(opeBrigadas);
        }

        // GET: OpeBrigadas/Create
        public IActionResult Create()
        {			
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Nombre.ToString());
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetProyectoId()), 
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Nombre.ToString());
            return View();
        }

        // POST: OpeBrigadas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idobr,Idcde,Idopy,Codigo,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] OpeBrigadas opeBrigadas)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    opeBrigadas.Usucre = this.GetLogin();
					_context.Add(opeBrigadas);
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
                        CatDepartamentos.Fields.Nombre.ToString());
                    ViewData["Idopy"] =
                        new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetProyectoId()),
                            OpeProyectos.Fields.Idopy.ToString(), 
                            OpeProyectos.Fields.Nombre.ToString());
                    return View();
                }  
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Nombre.ToString(), opeBrigadas.Idcde);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetProyectoId()),
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Nombre.ToString(), opeBrigadas.Idopy);
            return View(opeBrigadas);
        }

        // GET: OpeBrigadas/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var opeBrigadas = await _context.OpeBrigadas.SingleOrDefaultAsync(m => m.Idobr == id);
            if (opeBrigadas == null)
            {
                return NotFound();
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Nombre.ToString(), opeBrigadas.Idcde);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetProyectoId()), 
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Apiestado.ToString(), opeBrigadas.Idopy);
            return View(opeBrigadas);
        }

        // POST: OpeBrigadas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idobr,Idcde,Idopy,Codigo,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] OpeBrigadas opeBrigadas)
        {
            if (id != opeBrigadas.Idobr)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    opeBrigadas.Usumod = this.GetLogin();
                    opeBrigadas.Apitransaccion = "MODIFICAR";
                    _context.Update(opeBrigadas);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OpeBrigadasExists(opeBrigadas.Idobr))
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
                    ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                        CatDepartamentos.Fields.Idcde.ToString(), 
                        CatDepartamentos.Fields.Nombre.ToString());
                    ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetProyectoId()),
                        OpeProyectos.Fields.Idopy.ToString(), 
                        OpeProyectos.Fields.Nombre.ToString());
                    return View(opeBrigadas);
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Nombre.ToString(), opeBrigadas.Idcde);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetProyectoId()), 
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Nombre.ToString(), opeBrigadas.Idopy);
            return View(opeBrigadas);
        }

        // GET: OpeBrigadas/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var opeBrigadas = await _context.OpeBrigadas
                .Include(o => o.IdcdeNavigation)
                .Include(o => o.IdopyNavigation)
                .SingleOrDefaultAsync(m => m.Idobr == id);
            if (opeBrigadas == null)
            {
                return NotFound();
            }

            return View(opeBrigadas);
        }

        // POST: OpeBrigadas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var opeBrigadas = await _context.OpeBrigadas.SingleOrDefaultAsync(m => m.Idobr == id);
				_context.OpeBrigadas.Remove(opeBrigadas);
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
                ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetProyectoId()), 
                    OpeProyectos.Fields.Idopy.ToString(), 
                    OpeProyectos.Fields.Nombre.ToString());
                return View();
            }     
        }

        private bool OpeBrigadasExists(long id)
        {
            return _context.OpeBrigadas.Any(e => e.Idobr == id);
        }
    }
}
