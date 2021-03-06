﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HZCGZM_Model;
using System.Threading;
using System.Globalization;

namespace HZCGZM_Web.Front
{

    public partial class application_detail : System.Web.UI.Page
    {
        tbCategory defaultCategory;

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

            rptApplicationCategory.DataBind();
            rptApplicationSubcategory.DataBind();

            if (!IsPostBack)
            {
                int type = Convert.ToInt32(Request.QueryString["type"]);

                if (type > 0)
                {
                    HZCGZMEntities entity = new HZCGZMEntities();
                    defaultCategory = entity.tbCategory.Where(m => m.categoryType == (int)CategoryType.SUBAPPLICATION && m.parentId == type).FirstOrDefault();

                    if (isEn)
                    {
                        updateDetailInfo(defaultCategory.categoryNameEN);
                    }
                    else
                    {
                        updateDetailInfo(defaultCategory.categoryName);
                    }

                }

                
            }

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
               .Where(m => m.categoryName == name||m.categoryNameEN==name)
               .Join(entity.tbImage.Where(m => m.imageState == (int)NormalState.AVALIABLE && m.imageType == (int)ImageType.SUBAPPLICATION), c => c.categoryId, i => i.bindId, (c, i) => new
           {
               c.categoryName,
               c.categoryNameEN,
               c.categoryInfoEN,
               c.categoryInfo,
               i.imageURL
           }).FirstOrDefault();

            imgApplication.ImageUrl = "";
            lblApplication.Text = "";
            lblApplicationName.Text = "";

            if (applicationDetail != null)
            {
                if (isEn)
                {
                    lblApplicationName.Text = applicationDetail.categoryNameEN;
                    lblApplication.Text = applicationDetail.categoryInfoEN;
                }
                else
                {
                    lblApplicationName.Text = applicationDetail.categoryName;
                    lblApplication.Text = applicationDetail.categoryInfo;
                }
                imgApplication.ImageUrl = applicationDetail.imageURL;
              
            }
        }

        protected void rptApplicationSubcategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (defaultCategory != null)
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                   
                        LinkButton lb = ((LinkButton)e.Item.FindControl("lbApplicationCategory"));
                        if (lb.Text == defaultCategory.categoryName)
                        {
                            lb.BackColor = Color.FromArgb(255, 127, 0);

                            if (isEn)
                            {
                                updateDetailInfo(defaultCategory.categoryNameEN);
                            }
                            else
                            {
                                updateDetailInfo(defaultCategory.categoryName);
                            }

                        }
                        else
                        {
                            lb.BackColor = Color.FromArgb(102, 102, 102);
                        }

                }

            }

        }

        protected void rptApplicationSubcategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}