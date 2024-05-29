using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FassilNetWeb
{
    public partial class MasterPopUp : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                                       
                    //hClientePOPUP.InnerText = Sesion.Servicio.nombreCliente;
                    //hRepresentante.InnerText = Sesion.Servicio.beneficiario.nombreBeneficiario;               

                }
                catch (Exception)
                {

                }
            }           
        }
    }
}