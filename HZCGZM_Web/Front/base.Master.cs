using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HZCGZM_Web.Web
{
    public partial class web : System.Web.UI.MasterPage
    {
        const int NAV_MAIN = 1;
        const int NAV_ABOUT = 2;
        const int NAV_NEWS = 3;
        const int NAV_PRODUCT = 4;
        const int NAV_APPLICATION = 5;
        const int NAV_SUPPORT = 6;
        const int NAV_DOWNLOAD = 7;
        const int NAV_CONTACT = 8;

        protected void Page_Load(object sender, EventArgs e)
        {
            //默认选中首页
            updateNav(NAV_MAIN);
        }

        protected void lkbMain_Click(object sender, EventArgs e)
        {
            updateNav(NAV_MAIN);
        }

        protected void lkbAbout_Click(object sender, EventArgs e)
        {
            updateNav(NAV_ABOUT);
        }

        protected void lkbNews_Click(object sender, EventArgs e)
        {
            updateNav(NAV_NEWS);
        }

        protected void lkbProduct_Click(object sender, EventArgs e)
        {
            updateNav(NAV_PRODUCT);
        }

        protected void lkbApplication_Click(object sender, EventArgs e)
        {
            updateNav(NAV_APPLICATION);
        }

        protected void lkbSupport_Click(object sender, EventArgs e)
        {
            updateNav(NAV_SUPPORT);
        }

        protected void lkbDownload_Click(object sender, EventArgs e)
        {
            updateNav(NAV_DOWNLOAD);
        }

        protected void lkbContact_Click(object sender, EventArgs e)
        {
            updateNav(NAV_CONTACT);
        }

        private void updateNav(int navType)
        {
            lkbMain.ForeColor = Color.FromArgb(51, 51, 51);
            lkbAbout.ForeColor = Color.FromArgb(51, 51, 51);
            lkbNews.ForeColor = Color.FromArgb(51, 51, 51);
            lkbProduct.ForeColor = Color.FromArgb(51, 51, 51);
            lkbApplication.ForeColor = Color.FromArgb(51, 51, 51);
            lkbSupport.ForeColor = Color.FromArgb(51, 51, 51);
            lkbDownload.ForeColor = Color.FromArgb(51, 51, 51);
            lkbContact.ForeColor = Color.FromArgb(51, 51, 51);

            switch (navType)
            {
                case NAV_MAIN:
                    lkbMain.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case NAV_ABOUT:
                    lkbAbout.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case NAV_NEWS:
                    lkbNews.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case NAV_PRODUCT:
                    lkbProduct.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case NAV_APPLICATION:
                    lkbApplication.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case NAV_SUPPORT:
                    lkbSupport.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case NAV_DOWNLOAD:
                    lkbDownload.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case NAV_CONTACT:
                    lkbContact.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
            }
         
        }

        

    }
}