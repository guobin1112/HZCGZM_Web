using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HZCGZM_Model;
using System.Drawing;
using System.Threading;
using System.Globalization;

namespace HZCGZM_Web.Front
{
    public partial class news : System.Web.UI.Page
    {
        private int page;
        private int pageSize = 16;
        private int totalCount;
        private int categoryId;

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

            rptNewCategory.DataBind();
            rptNews.DataBind();

            if (!IsPostBack)
            {
                HZCGZMEntities entity = new HZCGZMEntities();
                Master.updateNav((int)NavType.NAV_NEWS);
                tbCategory defaultCategory = entity.tbCategory.Where(m => m.categoryType == (int)CategoryType.NEWS).FirstOrDefault();

                if (isEn)
                {
                    newsType.InnerText = defaultCategory.categoryNameEN;
                }
                else
                {
                    newsType.InnerText = defaultCategory.categoryName;
                }

                
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

            var category= entity.tbCategory.Where(m => m.categoryId == categoryId).FirstOrDefault();

            if (isEn)
            {
                newsType.InnerText = category.categoryNameEN;
            }
            else
            {
                newsType.InnerText = category.categoryName;
            }
           
            sdcNews.SelectParameters[1].DefaultValue = categoryId.ToString();
        }
    }
}