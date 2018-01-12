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
    public class OpeMovimientosController : BaseController
    {
		public OpeMovimientosController(db_encuestasContext context, IConfiguration configuration) : base(context, configuration)
        {
        }

        // GET: OpeMovimientos
        public async Task<IActionResult> Index()
        {
            var lstDepto = this.GetDeptoRestriccion();
            ViewData["Idcde"] = lstDepto;
            var db_encuestasContext = _context.OpeMovimientos
                .Where(aux => aux.IdoupNavigation.Idopy == GetProyectoId() &&
                              aux.IdoupNavigation.Idcde == lstDepto.First().Idcde &&
                              aux.Apiestado.Equals("ELABORADO"))
                .Include(o => o.IdsusNavigation)
                .Include(o => o.IdoupNavigation)
                .Include(o => o.IdsusNavigation.IdobrNavigation);
            return View(await db_encuestasContext.ToListAsync());
        }

        public PartialViewResult GetMovimientos(long? idcde)  
        {  
            var db_encuestasContext = _context.OpeMovimientos
                .Where(aux => aux.IdoupNavigation.Idopy == GetProyectoId() && 
                              aux.IdoupNavigation.Idcde == idcde &&
                              aux.Apiestado.Equals("ELABORADO"))                
                .Include(o => o.IdsusNavigation).Include(o => o.IdoupNavigation)
                .Include(o => o.IdsusNavigation.IdobrNavigation);
            return PartialView("_IndexPartial",db_encuestasContext.ToList());  
        }
        
        // GET: OpeMovimientos/Details/5
        public async Task<IActionResult> Details(long? id)
        {
			
            if (id == null)
            {
                return NotFound();
            }

            var opeMovimientos = await _context.OpeMovimientos
                .Include(o => o.IdoupNavigation)
                .Include(o => o.IdsusNavigation)
                .SingleOrDefaultAsync(m => m.Idomv == id);
            if (opeMovimientos == null)
            {
                return NotFound();
            }

            return View(opeMovimientos);
        }

        // GET: OpeMovimientos/Create
        public IActionResult Create()
        {
            var Upms = 
                _context.OpeUpms
                    .Where(oup => oup.Idcde == GetDepartamentoId() && oup.Idopy == GetProyectoId())                    
                    .Select(s => new 
                    { 
                        IdUpm = s.Idoup,
                        NombreUpm = $"{s.Codigo} - {s.Nombre}" 
                    })
                    .ToList();
            ViewData["Idoup"] = new SelectList(Upms,"IdUpm","NombreUpm");
                   
            ViewData["Idsus"] = new SelectList(_context.SegUsuarios, 
                SegUsuarios.Fields.Idsus.ToString(), 
                SegUsuarios.Fields.Login.ToString());
                return View();
        }

        // POST: OpeMovimientos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Idomv,Idsus,Idoup,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] OpeMovimientos opeMovimientos)
        {
			if (ModelState.IsValid)
            {
				try
				{
				    //Buscamos si el Movimiento existe en estado ELIMINADO
				    var opeMovExistente = await _context.OpeMovimientos
				        .SingleOrDefaultAsync(m => m.Idsus == opeMovimientos.Idsus &&
				                                   m.Idoup == opeMovimientos.Idoup);

				    if (opeMovExistente == null)
				    {
				        opeMovimientos.Usucre = this.GetLogin();
				        _context.Add(opeMovimientos);				        
				    }
				    else
				    {
				        opeMovExistente.Usumod = this.GetLogin();
				        opeMovExistente.Apitransaccion = "HABILITAR";
				        _context.Update(opeMovExistente);
				    }
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
                    var Upms1 = 
                        _context.OpeUpms
                            .Where(oup => oup.Idcde == GetDepartamentoId() && oup.Idopy == GetProyectoId())                    
                            .Select(s => new 
                            { 
                                IdUpm = s.Idoup,
                                NombreUpm = $"{s.Codigo} - {s.Nombre}" 
                            })
                            .ToList();
                    ViewData["Idoup"] = new SelectList(Upms1,"IdUpm","NombreUpm");
                    ViewData["Idsus"] = 
                        new SelectList(_context.SegUsuarios, 
                        SegUsuarios.Fields.Idsus.ToString(), 
                        SegUsuarios.Fields.Login.ToString());
                    return View();
                }  
            }
            var Upms2 = 
                _context.OpeUpms
                    .Where(oup => oup.Idcde == GetDepartamentoId() && oup.Idopy == GetProyectoId())                    
                    .Select(s => new 
                    { 
                        IdUpm = s.Idoup,
                        NombreUpm = $"{s.Codigo} - {s.Nombre}" 
                    })
                    .ToList();
            ViewData["Idoup"] = new SelectList(Upms2,"IdUpm","NombreUpm");
            ViewData["Idsus"] = new SelectList(_context.SegUsuarios, 
                SegUsuarios.Fields.Idsus.ToString(), 
                SegUsuarios.Fields.Login.ToString(), 
                opeMovimientos.Idsus);
            return View(opeMovimientos);
        }

        // GET: OpeMovimientos/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var opeMovimientos = await _context.OpeMovimientos.SingleOrDefaultAsync(m => m.Idomv == id);
            if (opeMovimientos == null)
            {
                return NotFound();
            }
            var Upms = 
                _context.OpeUpms
                    .Where(oup => oup.Idcde == GetDepartamentoId() && oup.Idopy == GetProyectoId())                    
                    .Select(s => new 
                    { 
                        IdUpm = s.Idoup,
                        NombreUpm = $"{s.Codigo} - {s.Nombre}" 
                    })
                    .ToList();
            ViewData["Idoup"] = new SelectList(Upms,"IdUpm","NombreUpm");
            ViewData["Idsus"] = new SelectList(_context.SegUsuarios, 
                SegUsuarios.Fields.Idsus.ToString(), 
                SegUsuarios.Fields.Login.ToString(), 
                opeMovimientos.Idsus);
            return View(opeMovimientos);
        }

        // POST: OpeMovimientos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Idomv,Idsus,Idoup,Apiestado,Apitransaccion,Usucre,Feccre,Usumod,Fecmod")] OpeMovimientos opeMovimientos)
        {
            if (id != opeMovimientos.Idomv)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    opeMovimientos.Usumod = this.GetLogin();
                    opeMovimientos.Apitransaccion = "MODIFICAR";
                    _context.Update(opeMovimientos);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OpeMovimientosExists(opeMovimientos.Idomv))
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
                    var Upms1 = 
                        _context.OpeUpms
                            .Where(oup => oup.Idcde == GetDepartamentoId() && oup.Idopy == GetProyectoId())                    
                            .Select(s => new 
                            { 
                                IdUpm = s.Idoup,
                                NombreUpm = $"{s.Codigo} - {s.Nombre}" 
                            })
                            .ToList();
                    ViewData["Idoup"] = new SelectList(Upms1,"IdUpm","NombreUpm");
                    ViewData["Idsus"] = 
                        new SelectList(_context.SegUsuarios, 
                        SegUsuarios.Fields.Idsus.ToString(), 
                        SegUsuarios.Fields.Login.ToString());
                    return View(opeMovimientos);
                }
                return RedirectToAction(nameof(Index));
            }
            var Upms2 = 
                _context.OpeUpms
                    .Where(oup => oup.Idcde == GetDepartamentoId() && oup.Idopy == GetProyectoId())                    
                    .Select(s => new 
                    { 
                        IdUpm = s.Idoup,
                        NombreUpm = $"{s.Codigo} - {s.Nombre}" 
                    })
                    .ToList();
            ViewData["Idoup"] = new SelectList(Upms2,"IdUpm","NombreUpm");
            ViewData["Idsus"] = new SelectList(_context.SegUsuarios, 
                SegUsuarios.Fields.Idsus.ToString(), 
                SegUsuarios.Fields.Login.ToString(), 
                opeMovimientos.Idsus);
            return View(opeMovimientos);
        }

        // GET: OpeMovimientos/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var opeMovimientos = await _context.OpeMovimientos
                .Include(o => o.IdoupNavigation)
                .Include(o => o.IdsusNavigation)
                .SingleOrDefaultAsync(m => m.Idomv == id);
            if (opeMovimientos == null)
            {
                return NotFound();
            }

            return View(opeMovimientos);
        }

        // POST: OpeMovimientos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
			try
			{
				var opeMovimientos = await _context.OpeMovimientos.SingleOrDefaultAsync(m => m.Idomv == id);
			    opeMovimientos.Usumod = GetLogin();
			    opeMovimientos.Apitransaccion = "ELIMINAR";
				_context.OpeMovimientos.Update(opeMovimientos);
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
                var Upms = 
                    _context.OpeUpms
                        .Where(oup => oup.Idcde == GetDepartamentoId() && oup.Idopy == GetProyectoId())                    
                        .Select(s => new 
                        { 
                            IdUpm = s.Idoup,
                            NombreUpm = $"{s.Codigo} - {s.Nombre}" 
                        })
                        .ToList();
                ViewData["Idoup"] = new SelectList(Upms,"IdUpm","NombreUpm");
                ViewData["Idsus"] = new SelectList(_context.SegUsuarios, 
                    SegUsuarios.Fields.Idsus.ToString(), 
                    SegUsuarios.Fields.Login.ToString());
                return View();
            }     
        }

        private bool OpeMovimientosExists(long id)
        {
            return _context.OpeMovimientos.Any(e => e.Idomv == id);
        }
    }
}
