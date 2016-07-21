using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HZCGZM_Model;

namespace HZCGZM_Web.Front
{
    public partial class news : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            HZCGZMEntities entity = new HZCGZMEntities();
            Master.updateNav((int)NavType.NAV_NEWS);
            sdcNews.SelectParameters[1].DefaultValue = entity.tbCategory.Where(m => m.categoryType == (int)CategoryType.NEWS).FirstOrDefault().categoryId.ToString() ;
         
        }
    }
}