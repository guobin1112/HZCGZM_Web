using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HZCGZM_Model;
using System.Drawing;

namespace HZCGZM_Web.Front
{
    public partial class news : System.Web.UI.Page
    {
        private int page;
        private int pageSize = 16;
        private int totalCount;
        private int categoryId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HZCGZMEntities entity = new HZCGZMEntities();
                Master.updateNav((int)NavType.NAV_NEWS);
                tbCategory defaultCategory = entity.tbCategory.Where(m => m.categoryType == (int)CategoryType.NEWS).FirstOrDefault();
                newsType.InnerText = defaultCategory.categoryName;
                sdcNews.SelectParameters[1].DefaultValue = defaultCategory.categoryId.ToString();
            }

        }

        protected void lkbCategory_Click(object sender, EventArgs e)
        {
            RepeaterItem i = ((LinkButton)sender).Parent as RepeaterItem;
            categoryId = Convert.ToInt32(((HiddenField)i.FindControl("hfCategory")).Value);
            foreach (RepeaterItem item in rptNewCategory.Items)
            {
                ((LinkButton)item.FindControl("lkbCategory")).ForeColor = Color.FromArgb(102, 102, 102);
            }
            ((LinkButton)i.FindControl("lkbCategory")).ForeColor = Color.FromArgb(255, 127, 0);

            HZCGZMEntities entity = new HZCGZMEntities();
            newsType.InnerText = entity.tbCategory.Where(m => m.categoryId == categoryId).FirstOrDefault().categoryName;
            sdcNews.SelectParameters[1].DefaultValue = categoryId.ToString();
        }
    }
}