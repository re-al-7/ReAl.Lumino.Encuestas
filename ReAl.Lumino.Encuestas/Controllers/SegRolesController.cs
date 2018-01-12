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
    public class SegRolesController : BaseController
    {
		public SegRolesController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: SegRoles
        public async Task<IActionResult> Index()
        {
            return View(await _context.SegRoles.ToListAsync());
        }

        // GET: SegRoles/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var segRoles = await _context.SegRoles
                .SingleOrDefaultAsync(m => m.Idsro == id);
            if (segRoles == null)
            {
                return NotFound();
            }

            return View(segRoles);
        }

        // GET: SegRoles/Create
        public IActionResult Create()
        {			
            return View();
        }

        // POST: SegRoles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idsro,Sigla,Descripcion,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegRoles segRoles)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    segRoles.Usucre = this.GetLogin();
					_context.Add(segRoles);
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
            return View(segRoles);
        }

        // GET: SegRoles/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segRoles = await _context.SegRoles.SingleOrDefaultAsync(m => m.Idsro == id);
            if (segRoles == null)
            {
                return NotFound();
            }
            return View(segRoles);
        }

        // POST: SegRoles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idsro,Sigla,Descripcion,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] SegRoles segRoles)
        {
            if (id != segRoles.Idsro)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    segRoles.Usumod = this.GetLogin();
                    segRoles.Apitransaccion = "MODIFICAR";
                    _context.Update(segRoles);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SegRolesExists(segRoles.Idsro))
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
                    return View(segRoles);
                }
                return RedirectToAction(nameof(Index));
            }
            return View(segRoles);
        }

        // GET: SegRoles/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var segRoles = await _context.SegRoles
                .SingleOrDefaultAsync(m => m.Idsro == id);
            if (segRoles == null)
            {
                return NotFound();
            }

            return View(segRoles);
        }

        // POST: SegRoles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var segRoles = await _context.SegRoles.SingleOrDefaultAsync(m => m.Idsro == id);
				_context.SegRoles.Remove(segRoles);
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

        private bool SegRolesExists(long id)
        {
            return _context.SegRoles.Any(e => e.Idsro == id);
        }
    }
}
