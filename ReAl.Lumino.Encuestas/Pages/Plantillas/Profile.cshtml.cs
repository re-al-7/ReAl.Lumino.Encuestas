using System.Collections.Generic;
using ReAl.Lumino.Encuestas.Models;

namespace ReAl.Lumino.Encuestas.Pages.Plantillas
{
    public class ProfileModel: BasePageModel
    {
        public ProfileModel(db_encuestasContext context) : base(context)
        {
        }
        
        public void OnGet()
        {
            ListApp = this.GetAplicaciones();
            ListPages = this.GetPages();
            Usuario = this.GetUserName();
            CurrentApp = GetCurrentApp();
        }
    }
}