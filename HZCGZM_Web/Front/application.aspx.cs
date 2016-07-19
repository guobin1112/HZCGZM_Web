using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HZCGZM_Web.Front
{
    public partial class application : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.updateNav((int)NavType.NAV_APPLICATION);
        }
    }
}