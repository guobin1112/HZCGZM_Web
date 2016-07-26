using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HZCGZM_Model;

namespace HZCGZM_Web.Front
{

    public partial class application_detail : System.Web.UI.Page
    {
        public string type;

        protected void Page_Load(object sender, EventArgs e)
        {
            //foreach (RepeaterItem item in rptApplicationSubcategory.Items)
            //{
            //    ((LinkButton)item.FindControl("lbApplicationCategory")).BackColor = Color.FromArgb(102, 102, 102);
            //}

            //string firstChooseName = ((LinkButton)(rptApplicationSubcategory.Items[0].FindControl("lbApplicationCategory"))).Text;

            //updateDetailInfo(firstChooseName);


        }

        protected void lbApplicationCategory_Click(object sender, EventArgs e)
        {
            RepeaterItem i = ((LinkButton)sender).Parent as RepeaterItem;
            string chooseName = ((LinkButton)i.FindControl("lbApplicationCategory")).Text;
            foreach (RepeaterItem item in rptApplicationSubcategory.Items)
            {
                ((LinkButton)item.FindControl("lbApplicationCategory")).BackColor = Color.FromArgb(102, 102, 102);
            }
            ((LinkButton)i.FindControl("lbApplicationCategory")).BackColor = Color.FromArgb(255, 127, 0);

            updateDetailInfo(chooseName);
        }

        private void updateDetailInfo(string name)
        {

            HZCGZMEntities entity = new HZCGZMEntities();

            var applicationDetail = entity.tbCategory
               .Where(m => m.categoryState == (int)NormalState.AVALIABLE && m.categoryType == (int)CategoryType.SUBAPPLICATION)
               .Where(m => m.categoryName == name)
               .Join(entity.tbImage.Where(m => m.imageState == (int)NormalState.AVALIABLE && m.imageType == (int)ImageType.SUBAPPLICATION), c => c.categoryId, i => i.bindId, (c, i) => new
           {
               c.categoryName,
               c.categoryInfo,
               i.imageURL
           }).FirstOrDefault();

            imgApplication.ImageUrl ="";
            lblApplication.Text = "";

            if (applicationDetail != null)
            {
                imgApplication.ImageUrl = applicationDetail.imageURL;
                lblApplication.Text = applicationDetail.categoryInfo;
            }
        }
    }
}