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
    public class OpeUpmsController : BaseController
    {
		public OpeUpmsController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: OpeUpms
        public async Task<IActionResult> Index()
        {
            var lstDepto = this.GetDeptoRestriccion();
            ViewData["Idcde"] = lstDepto;
            var db_encuestasContext = _context.OpeUpms
                .Where(upms => upms.Idopy == GetGroupSid() && upms.Idcde == lstDepto.First().Idcde)
                .Include(o => o.IdcdeNavigation).Include(o => o.IdopyNavigation);            
            return View(await db_encuestasContext.ToListAsync());
        }

        public PartialViewResult GetUpms(long? idcde)  
        {  
            var db_encuestasContext = _context.OpeUpms
                .Where(upms => upms.Idopy == GetGroupSid() && upms.Idcde == idcde)
                .Include(o => o.IdcdeNavigation).Include(o => o.IdopyNavigation);               
            return PartialView("_IndexPartial",db_encuestasContext.ToList());  
        }
        
        // GET: OpeUpms/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var opeUpms = await _context.OpeUpms
                .Include(o => o.IdcdeNavigation)
                .Include(o => o.IdopyNavigation)
                .SingleOrDefaultAsync(m => m.Idoup == id);
            if (opeUpms == null)
            {
                return NotFound();
            }

            return View(opeUpms);
        }

        // GET: OpeUpms/Create
        public IActionResult Create()
        {			
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Nombre.ToString());
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetGroupSid()), 
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Nombre.ToString());
            return View();
        }

        // POST: OpeUpms/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idoup,Idopy,Idcde,Codigo,Nombre,Fecinicio,Latitud,Longitud,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] OpeUpms opeUpms)
        {
			if (ModelState.IsValid)
            {
				try
				{
					_context.Add(opeUpms);
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
                        new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetGroupSid()),
                            OpeProyectos.Fields.Idopy.ToString(), 
                            OpeProyectos.Fields.Nombre.ToString());
                    return View();
                }  
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Nombre.ToString(), opeUpms.Idcde);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetGroupSid()),
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Nombre.ToString(), opeUpms.Idopy);
            return View(opeUpms);
        }

        // GET: OpeUpms/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var opeUpms = await _context.OpeUpms.SingleOrDefaultAsync(m => m.Idoup == id);
            if (opeUpms == null)
            {
                return NotFound();
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Nombre.ToString(), opeUpms.Idcde);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetGroupSid()), 
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Apiestado.ToString(), opeUpms.Idopy);
            return View(opeUpms);
        }

        // POST: OpeUpms/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idoup,Idopy,Idcde,Codigo,Nombre,Fecinicio,Latitud,Longitud,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] OpeUpms opeUpms)
        {
            if (id != opeUpms.Idoup)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    (opeUpms).Usumod = this.GetLogin();
                    (opeUpms).Apitransaccion = "MODIFICAR";
                    _context.Update(opeUpms);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OpeUpmsExists(opeUpms.Idoup))
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
                    ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetGroupSid()),
                        OpeProyectos.Fields.Idopy.ToString(), 
                        OpeProyectos.Fields.Nombre.ToString());
                    
                    return View(opeUpms);
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["Idcde"] = new SelectList(_context.CatDepartamentos, 
                CatDepartamentos.Fields.Idcde.ToString(), 
                CatDepartamentos.Fields.Nombre.ToString(), opeUpms.Idcde);
            ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetGroupSid()), 
                OpeProyectos.Fields.Idopy.ToString(), 
                OpeProyectos.Fields.Nombre.ToString(), opeUpms.Idopy);
            return View(opeUpms);
        }

        // GET: OpeUpms/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var opeUpms = await _context.OpeUpms
                .Include(o => o.IdcdeNavigation)
                .Include(o => o.IdopyNavigation)
                .SingleOrDefaultAsync(m => m.Idoup == id);
            if (opeUpms == null)
            {
                return NotFound();
            }

            return View(opeUpms);
        }

        // POST: OpeUpms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var opeUpms = await _context.OpeUpms.SingleOrDefaultAsync(m => m.Idoup == id);
				_context.OpeUpms.Remove(opeUpms);
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
                ViewData["Idopy"] = new SelectList(_context.OpeProyectos.Where(proy => proy.Idopy == this.GetGroupSid()), 
                    OpeProyectos.Fields.Idopy.ToString(), 
                    OpeProyectos.Fields.Nombre.ToString());
                return View();
            }     
        }

        private bool OpeUpmsExists(long id)
        {
            return _context.OpeUpms.Any(e => e.Idoup == id);
        }
    }
}
