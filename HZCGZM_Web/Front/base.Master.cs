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

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void lkbMain_Click(object sender, EventArgs e)
        {

        }

        protected void lkbAbout_Click(object sender, EventArgs e)
        {

        }

        protected void lkbNews_Click(object sender, EventArgs e)
        {

        }

        protected void lkbProduct_Click(object sender, EventArgs e)
        {

        }

        protected void lkbApplication_Click(object sender, EventArgs e)
        {

        }

        protected void lkbSupport_Click(object sender, EventArgs e)
        {

        }

        protected void lkbDownload_Click(object sender, EventArgs e)
        {

        }

        protected void lkbContact_Click(object sender, EventArgs e)
        {

        }

        public void updateNav(int navType)
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
                case (int)NavType.NAV_MAIN:
                    lkbMain.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case (int)NavType.NAV_ABOUT:
                    lkbAbout.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case (int)NavType.NAV_NEWS:
                    lkbNews.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case (int)NavType.NAV_PRODUCT:
                    lkbProduct.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case (int)NavType.NAV_APPLICATION:
                    lkbApplication.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case (int)NavType.NAV_SUPPORT:
                    lkbSupport.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case (int)NavType.NAV_DOWNLOAD:
                    lkbDownload.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
                case (int)NavType.NAV_CONTACT:
                    lkbContact.ForeColor = Color.FromArgb(255, 127, 0);
                    break;
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(tbxSearch.Text))
            {
                Response.Write("<script>alert('请输入搜索内容')</script>");
            }
            else
            {
                Response.Redirect("product.aspx?search=" + tbxSearch.Text);
            }
        }



    }
}