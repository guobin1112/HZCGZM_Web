using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HZCGZM_Web.Front
{
    public partial class support : System.Web.UI.Page
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

            Master.updateNav((int)NavType.NAV_SUPPORT);

            divPackageDesignDetail.Visible = true;
            divProducingProcessDetail.Visible = false;
            divPromotionMaterialDesign.Visible = false;
            lbPackageDesign.ForeColor = Color.FromArgb(255, 127, 0);
        }

        protected void lbPackageDesign_Click(object sender, EventArgs e)
        {
            divPackageDesignDetail.Visible = true;
            divProducingProcessDetail.Visible = false;
            divPromotionMaterialDesign.Visible = false;
            lbPackageDesign.ForeColor = Color.FromArgb(255, 127, 0);
            lbPromotionMaterialDesign.ForeColor=Color.FromArgb(51, 51, 51);
            lbProducingProcess.ForeColor = Color.FromArgb(51, 51, 51);
        }

        protected void lbPromotionMaterialDesign_Click(object sender, EventArgs e)
        {
            divPackageDesignDetail.Visible = false;
            divProducingProcessDetail.Visible = false;
            divPromotionMaterialDesign.Visible = true;
            lbPromotionMaterialDesign.ForeColor = Color.FromArgb(255, 127, 0);
            lbPackageDesign.ForeColor = Color.FromArgb(51, 51, 51);
            lbProducingProcess.ForeColor = Color.FromArgb(51, 51, 51);
        }

        protected void lbProducingProcess_Click(object sender, EventArgs e)
        {
            divPackageDesignDetail.Visible = false;
            divProducingProcessDetail.Visible = true;
            divPromotionMaterialDesign.Visible = false;
            lbProducingProcess.ForeColor = Color.FromArgb(255, 127, 0);
            lbPromotionMaterialDesign.ForeColor = Color.FromArgb(51, 51, 51);
            lbPackageDesign.ForeColor = Color.FromArgb(51, 51, 51);
 
        }
    }
}