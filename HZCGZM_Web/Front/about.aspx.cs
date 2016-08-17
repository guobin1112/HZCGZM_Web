using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HZCGZM_Web.Front
{
    public partial class about : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["lang"] == null)
            {
                Thread.CurrentThread.CurrentUICulture =CultureInfo.CreateSpecificCulture("");
            }
            else if (Session["lang"].ToString() == "en-us")
            {
                Thread.CurrentThread.CurrentUICulture =CultureInfo.CreateSpecificCulture("en-us"); ;
            }
            else
            {
                Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture("");
            }

            Master.updateNav((int)NavType.NAV_ABOUT);
        }
    }
}