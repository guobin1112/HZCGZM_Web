using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace HZCGZM_Web
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }
    }

    public enum NavType
    {
        NAV_MAIN = 1,
        NAV_ABOUT = 2,
        NAV_NEWS = 3,
        NAV_PRODUCT = 4,
        NAV_APPLICATION = 5,
        NAV_SUPPORT = 6,
        NAV_DOWNLOAD = 7,
        NAV_CONTACT = 8
    }
}