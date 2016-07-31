using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HZCGZM_Web.Front
{
    public partial class product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.updateNav((int)NavType.NAV_PRODUCT);

            if (!IsPostBack)
            {
                InitData();
            }
        }

        public void InitData()
        {
            DataTable dt = GetProductCategory();
            this.rptProductCategory.DataSource = dt;
            this.rptProductCategory.DataBind();

            ((LinkButton)this.rptProductCategory.Items[0].FindControl("lkbProductCategory")).ForeColor = Color.FromArgb(255, 127, 0);
            updateProductList(new HZCGZM_Model.HZCGZMEntities().tbCategory.Where(m=>m.categoryType==(int)CategoryType.PRODUCT&&m.categoryState==(int)NormalState.AVALIABLE).FirstOrDefault().categoryId);
            

        }

        protected void rptProductCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rep = e.Item.FindControl("rptProductSubcategory") as Repeater;
                DataRowView rowv = (DataRowView)e.Item.DataItem;
                int category = Convert.ToInt32(rowv["categoryId"]);
                rep.DataSource = GetProductSubcategory(category);
                rep.DataBind();
            }
        }

        private DataTable GetProductCategory()
        {

            string cmdTxt = "SELECT [categoryId] ,[categoryName] ,[parentId],[categoryState] ,[categoryType] ,[sortNumber] ,[categoryInfo] FROM [HZCGZM].[dbo].[tbCategory]   WHERE [categoryType] ='1' and [categoryState]='1' ";

            StringBuilder sb = new StringBuilder();
            string connStr = WebConfigurationManager.ConnectionStrings["HZCGZMConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(cmdTxt, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    DataTable dt = new DataTable();

                    dt.Load(dr, LoadOption.OverwriteChanges);

                    return dt;
                }
            }

            return null;
        }

        private DataTable GetProductSubcategory(int category)
        {
            string cmdTxt = String.Format("SELECT [categoryId],[categoryName],[parentId],[categoryState],[categoryType],[sortNumber],[categoryInfo] FROM [HZCGZM].[dbo].[tbCategory] WHERE [categoryType] ='2' and [categoryState]='1' and [parentId] ='{0}'", category);

            StringBuilder sb = new StringBuilder();
            string connStr = WebConfigurationManager.ConnectionStrings["HZCGZMConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(cmdTxt, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    DataTable dt = new DataTable();

                    dt.Load(dr, LoadOption.OverwriteChanges);

                    return dt;
                }
            }

            return null;
        }

        protected void lkbProductCategory_Click(object sender, EventArgs e)
        {
            RepeaterItem i = ((LinkButton)sender).Parent as RepeaterItem;
            int categoryId = Convert.ToInt32(((HiddenField)i.FindControl("hfCategoryId")).Value);
            foreach (RepeaterItem item in rptProductCategory.Items)
            {
                ((LinkButton)item.FindControl("lkbProductCategory")).ForeColor = Color.FromArgb(102, 102, 102);
            }
            ((LinkButton)i.FindControl("lkbProductCategory")).ForeColor = Color.FromArgb(255, 127, 0);

            updateProductList(categoryId);
        }

        protected void lkbProductSubcategory_Click(object sender, EventArgs e)
        {
            RepeaterItem i = ((LinkButton)sender).Parent as RepeaterItem;
            Repeater rpt = i.Parent as Repeater;
            int categoryId = Convert.ToInt32(((HiddenField)rpt.Parent.FindControl("hfCategoryId")).Value);
            int subcategoryId = Convert.ToInt32(((HiddenField)i.FindControl("hfSubategoryId")).Value);
            foreach (RepeaterItem item in rpt.Items)
            {
                ((LinkButton)item.FindControl("lkbProductSubcategory")).ForeColor = Color.FromArgb(102, 102, 102);
            }
            ((LinkButton)i.FindControl("lkbProductSubcategory")).ForeColor = Color.FromArgb(255, 127, 0);

            updateProductList(categoryId,subcategoryId);
        }


        private void updateProductList(int categoryId)
        {
            updateProductList(categoryId, 0);
        }

        private void updateProductList(int categoryId, int subcategoryId)
        {

            string cmdTxt;

            if (subcategoryId > 0)
            {
                cmdTxt = String.Format("SELECT     dbo.tbImage.imageURL,dbo.tbProduct.productId,dbo.tbProduct.productName, dbo.tbProduct.productDetailHtmlString FROM dbo.tbImage INNER JOIN dbo.tbProduct ON dbo.tbImage.bindId = dbo.tbProduct.productId WHERE dbo.tbImage.imageType='6' and dbo.tbImage.imageState='1' and productState='1' and dbo.tbProduct.productCategoryId='{0}' and [productSubcategoryId] = '{1}'  ", categoryId, subcategoryId);
            }
            else
            {
                cmdTxt = String.Format("SELECT     dbo.tbImage.imageURL,dbo.tbProduct.productId,dbo.tbProduct.productName, dbo.tbProduct.productDetailHtmlString FROM dbo.tbImage INNER JOIN dbo.tbProduct ON dbo.tbImage.bindId = dbo.tbProduct.productId WHERE dbo.tbImage.imageType='6' and dbo.tbImage.imageState='1' and productState='1' and dbo.tbProduct.productCategoryId='{0}' ", categoryId);
            }

            StringBuilder sb = new StringBuilder();
            string connStr = WebConfigurationManager.ConnectionStrings["HZCGZMConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(cmdTxt, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                if (dr.HasRows)
                {
                    dt.Load(dr, LoadOption.OverwriteChanges);
                }

                rptProduct.DataSource = dt;
                rptProduct.DataBind();
            }

        }

    }

}