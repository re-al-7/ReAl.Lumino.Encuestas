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
    public class SegRolesPaginaController : BaseController
    {
		public SegRolesPaginaController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: SegRolesPagina
        public async Task<IActionResult> Index()
        {
            var lstRoles = _context.SegRoles;
            ViewData["Idsro"] = lstRoles;
            var db_encuestasContext = _context.SegRolesPagina
                .Where(srp => srp.Idsro == lstRoles.First().Idsro)
                .Include(s => s.IdspgNavigation)
                .Include(s => s.IdsroNavigation);
            return View(await db_encuestasContext.ToListAsync());
        }
        
        //GET
        public PartialViewResult GetPaginas(long? idsro)  
        {  
            var db_encuestasContext = _context.SegRolesPagina
                .Where(srp => srp.Idsro == idsro)
                .Include(s => s.IdspgNavigation)
                .Include(s => s.IdsroNavigation);               
            return PartialView("_IndexPartial",db_encuestasContext.ToList());  
        }
        
        // GET: SegRolesPagina/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var segRolesPagina = await _context.SegRolesPagina
                .Include(s => s.IdspgNavigation)
                .Include(s => s.IdsroNavigation)
                .SingleOrDefaultAsync(m => m.Idsrp == id);
            if (segRolesPagina == null)
            {
                return NotFound();
            }

            return View(segRolesPagina);
        }

        // GET: SegRolesPagina/Create
        public IActionResult Create()
        {			
        ViewData["Idspg"] = new SelectList(_context.SegPaginas, 
            SegPaginas.Fields.Idspg.ToString(), 
            SegPaginas.Fields.Apiestado.ToString());
        ViewData["Idsro"] = new SelectList(_context.SegRoles, 
            SegRoles.Fields.Idsro.ToString(), 
            SegRoles.Fields.Apiestado.ToString());
            return View();
        }

        // POST: SegRolesPagina/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idsrp,Idsro,Idspg,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegRolesPagina segRolesPagina)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    segRolesPagina.Usucre = this.GetLogin();
					_context.Add(segRolesPagina);
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
                    ViewData["Idspg"] = 
                        new SelectList(_context.SegPaginas, 
                        SegPaginas.Fields.Idspg.ToString(), 
                        SegPaginas.Fields.Apiestado.ToString());
                    ViewData["Idsro"] = 
                        new SelectList(_context.SegRoles, 
                        SegRoles.Fields.Idsro.ToString(), 
                        SegRoles.Fields.Apiestado.ToString());
                    return View();
                }  
            }
            ViewData["Idspg"] = new SelectList(_context.SegPaginas, 
                SegPaginas.Fields.Idspg.ToString(), 
                SegPaginas.Fields.Apiestado.ToString(), 
                segRolesPagina.Idspg);
            ViewData["Idsro"] = new SelectList(_context.SegRoles, 
                SegRoles.Fields.Idsro.ToString(), 
                SegRoles.Fields.Apiestado.ToString(), 
                segRolesPagina.Idsro);
            return View(segRolesPagina);
        }

        // GET: SegRolesPagina/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segRolesPagina = await _context.SegRolesPagina.SingleOrDefaultAsync(m => m.Idsrp == id);
            if (segRolesPagina == null)
            {
                return NotFound();
            }
            ViewData["Idspg"] = new SelectList(_context.SegPaginas, 
                SegPaginas.Fields.Idspg.ToString(), 
                SegPaginas.Fields.Apiestado.ToString(), 
                segRolesPagina.Idspg);
            ViewData["Idsro"] = new SelectList(_context.SegRoles, 
                SegRoles.Fields.Idsro.ToString(), 
                SegRoles.Fields.Apiestado.ToString(), 
                segRolesPagina.Idsro);
            return View(segRolesPagina);
        }

        // POST: SegRolesPagina/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idsrp,Idsro,Idspg,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegRolesPagina segRolesPagina)
        {
            if (id != segRolesPagina.Idsrp)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    segRolesPagina.Usumod = this.GetLogin();
                    segRolesPagina.Apitransaccion = "MODIFICAR";
                    _context.Update(segRolesPagina);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SegRolesPaginaExists(segRolesPagina.Idsrp))
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
                    ViewData["Idspg"] = 
                        new SelectList(_context.SegPaginas, 
                        SegPaginas.Fields.Idspg.ToString(), 
                        SegPaginas.Fields.Apiestado.ToString());
                    ViewData["Idsro"] = 
                        new SelectList(_context.SegRoles, 
                        SegRoles.Fields.Idsro.ToString(), 
                        SegRoles.Fields.Apiestado.ToString());
                    return View(segRolesPagina);
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idspg"] = new SelectList(_context.SegPaginas, 
                SegPaginas.Fields.Idspg.ToString(), 
                SegPaginas.Fields.Apiestado.ToString(), 
                segRolesPagina.Idspg);
            ViewData["Idsro"] = new SelectList(_context.SegRoles, 
                SegRoles.Fields.Idsro.ToString(), 
                SegRoles.Fields.Apiestado.ToString(), 
                segRolesPagina.Idsro);
            return View(segRolesPagina);
        }

        // GET: SegRolesPagina/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segRolesPagina = await _context.SegRolesPagina
                .Include(s => s.IdspgNavigation)
                .Include(s => s.IdsroNavigation)
                .SingleOrDefaultAsync(m => m.Idsrp == id);
            if (segRolesPagina == null)
            {
                return NotFound();
            }

            return View(segRolesPagina);
        }

        // POST: SegRolesPagina/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var segRolesPagina = await _context.SegRolesPagina.SingleOrDefaultAsync(m => m.Idsrp == id);
				_context.SegRolesPagina.Remove(segRolesPagina);
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
                ViewData["Idspg"] = new SelectList(_context.SegPaginas, 
                    SegPaginas.Fields.Idspg.ToString(), 
                    SegPaginas.Fields.Apiestado.ToString());
                ViewData["Idsro"] = new SelectList(_context.SegRoles, 
                    SegRoles.Fields.Idsro.ToString(), 
                    SegRoles.Fields.Apiestado.ToString());
                return View();
            }     
        }

        private bool SegRolesPaginaExists(long id)
        {
            return _context.SegRolesPagina.Any(e => e.Idsrp == id);
        }
    }
}
