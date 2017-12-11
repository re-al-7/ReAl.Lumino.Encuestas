// // <copyright file="OpeUpmsList.cs" company="INTEGRATE - Soluciones Informaticas">
// // Copyright (c) 2016 Todos los derechos reservados
// // </copyright>
// // <author>re-al </author>
// // <date>2017-12-08 11:49</date>

using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ReAl.Lumino.Encuestas.Models
{
    public class OpeUpmsList
    {
        public CatDepartamentos idCde
        {
            get;
            set;
        }
        
        public List < OpeUpms > listOpeUpms  
        {  
            get;  
            set;  
        }  
        //This property will be used to populate employee dropdownlist  
        public IEnumerable < SelectListItem > OpeUpmsListItems  
        {  
            get  
            {  
                return new SelectList(listOpeUpms, "EmployeeId", "EmpName");  
            }  
        }  
    }
}