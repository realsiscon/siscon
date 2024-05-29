using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace LogicaSiscon.Utilitarios
{
    public static class Combos
    {

        public static void FillCombo<TSource>( ref DropDownList ddl, TSource dataSource, string textField, string valueField) //, bool addSelect)
        {

            ddl.DataValueField = valueField;
            ddl.DataTextField = textField;
            ddl.DataSource = dataSource;
            ddl.DataBind();

            //if (addSelect) AddSelectCombo(ddl, "Select", -1);
            ddl.Items.Insert(0, new ListItem("Seleccionar", "0"));

        }

    }
}
