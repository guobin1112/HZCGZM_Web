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
    /// <summary>
    /// 首页导航索引
    /// </summary>
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
    /// <summary>
    /// 可用状态
    /// </summary>
    public enum NormalState
    {
        AVALIABLE = 1,
        UNAVALIABLE = 2
    }

    /// <summary>
    /// 类别
    /// </summary>
    public enum CategoryType
    {
        PRODUCT = 1,
        SUBPRODUCT = 2,
        APPLICATION = 3,
        SUBAPPLICATION = 4,
        NEWS = 5,
        SUPPORT = 6
    }

    public enum ImageType
    {
        BANNER = 1,
        APPLICATION = 2,
        SUBAPPLICATION = 3,
        PRODUCT=4,
        DOWNLOAD=5,
        PRODUCT_FACE=6,
        PRODUCT_BANNER=7

    }

    public class ActionType
    {
        public static string ADD = "add";
        public static string EDIT = "edit";
        public static string DELETE = "delete";
    }
}