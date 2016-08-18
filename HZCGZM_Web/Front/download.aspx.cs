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
    public partial class download : System.Web.UI.Page
    {

        public bool isEn = false;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["lang"] == null)
            {
                Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture("");
                isEn = false;
            }
            else if (Session["lang"].ToString() == "en-us")
            {
                Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture("en-us");
                isEn = true;
            }
            else
            {
                Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture("");
                isEn = false;
            }

            rptDownload.DataBind();

            Master.updateNav((int)NavType.NAV_DOWNLOAD);
        }

    }
}