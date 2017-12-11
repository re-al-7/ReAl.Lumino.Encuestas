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
    public class CatDepartamentosController : BaseController
    {
		public CatDepartamentosController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: CatDepartamentos
        public async Task<IActionResult> Index()
        {
            return View(await _context.CatDepartamentos.ToListAsync());
        }

        // GET: CatDepartamentos/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var catDepartamentos = await _context.CatDepartamentos
                .SingleOrDefaultAsync(m => m.Idcde == id);
            if (catDepartamentos == null)
            {
                return NotFound();
            }

            return View(catDepartamentos);
        }

        // GET: CatDepartamentos/Create
        public IActionResult Create()
        {			
            return View();
        }

        // POST: CatDepartamentos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idcde,Codigo,Nombre,Latitud,Longitud,Abreviatura,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] CatDepartamentos catDepartamentos)
        {
			if (ModelState.IsValid)
            {
				try
				{
                    catDepartamentos.Usucre = this.GetLogin();
					_context.Add(catDepartamentos);
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
            return View(catDepartamentos);
        }

        // GET: CatDepartamentos/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var catDepartamentos = await _context.CatDepartamentos.SingleOrDefaultAsync(m => m.Idcde == id);
            if (catDepartamentos == null)
            {
                return NotFound();
            }
            return View(catDepartamentos);
        }

        // POST: CatDepartamentos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idcde,Codigo,Nombre,Latitud,Longitud,Abreviatura,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] CatDepartamentos catDepartamentos)
        {
            if (id != catDepartamentos.Idcde)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    catDepartamentos.Usumod = this.GetLogin();
                    catDepartamentos.Apitransaccion = "MODIFICAR";
                    _context.Update(catDepartamentos);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CatDepartamentosExists(catDepartamentos.Idcde))
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
                    return View(catDepartamentos);
                }
                return RedirectToAction(nameof(Index));
            }
            return View(catDepartamentos);
        }

        // GET: CatDepartamentos/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var catDepartamentos = await _context.CatDepartamentos
                .SingleOrDefaultAsync(m => m.Idcde == id);
            if (catDepartamentos == null)
            {
                return NotFound();
            }

            return View(catDepartamentos);
        }

        // POST: CatDepartamentos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var catDepartamentos = await _context.CatDepartamentos.SingleOrDefaultAsync(m => m.Idcde == id);
				_context.CatDepartamentos.Remove(catDepartamentos);
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

        private bool CatDepartamentosExists(long id)
        {
            return _context.CatDepartamentos.Any(e => e.Idcde == id);
        }
    }
}
