using HZCGZM_Model;
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
        private int page;
        private int pageSize = 16;
        private int totalCount;
        private int categoryId;
        private int subcategoryId;
        private string search;

        protected void Page_Load(object sender, EventArgs e)
        {
            Master.updateNav((int)NavType.NAV_PRODUCT);

            this.categoryId = 0;
            this.subcategoryId = 0;
            this.search = "";

            if (!IsPostBack)
            {
                InitData();
            }
        }

        public void InitData()
        {
            categoryId = Convert.ToInt32(Request.QueryString["type"]);
            subcategoryId = Convert.ToInt32(Request.QueryString["subtype"]);
            search = Request.QueryString["search"];
            page = Convert.ToInt32(Request.QueryString["page"]) < 1 ? 1 : Convert.ToInt32(Request.QueryString["page"]);
            HZCGZMEntities entity = new HZCGZMEntities();

            DataTable dt = GetProductCategory();
            this.rptProductCategory.DataSource = dt;
            this.rptProductCategory.DataBind();

            if (categoryId > 0)
            {
                lblproductType.Text = new HZCGZMEntities().tbCategory.Where(m => m.categoryId == categoryId).FirstOrDefault().categoryName;
                updateProductList();
            }
            else if (!String.IsNullOrEmpty(search))
            {
                lblproductType.Text = String.Format("{0}的搜索结果", search);
                searchProductList();
            }
            else
            {
                tbCategory defaultCategory = new HZCGZMEntities().tbCategory.Where(m => m.categoryType == (int)CategoryType.PRODUCT && m.categoryState == (int)NormalState.AVALIABLE).FirstOrDefault();
                lblproductType.Text = defaultCategory.categoryName;
                categoryId = defaultCategory.categoryId;
                updateProductList();
            }



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
            page = 1;

            RepeaterItem i = ((LinkButton)sender).Parent as RepeaterItem;
            categoryId = Convert.ToInt32(((HiddenField)i.FindControl("hfCategoryId")).Value);
            //foreach (RepeaterItem item in rptProductCategory.Items)
            //{
            //    ((LinkButton)item.FindControl("lkbProductCategory")).ForeColor = Color.FromArgb(102, 102, 102);
            //}
            //((LinkButton)i.FindControl("lkbProductCategory")).ForeColor = Color.FromArgb(255, 127, 0);
            lblproductType.Text = ((LinkButton)sender).Text;

            updateProductList();
        }

        protected void lkbProductSubcategory_Click(object sender, EventArgs e)
        {
            page = 1;

            RepeaterItem i = ((LinkButton)sender).Parent as RepeaterItem;
            Repeater rpt = i.Parent as Repeater;
            categoryId = Convert.ToInt32(((HiddenField)rpt.Parent.FindControl("hfCategoryId")).Value);
            subcategoryId = Convert.ToInt32(((HiddenField)i.FindControl("hfSubategoryId")).Value);
            //foreach (RepeaterItem item in rpt.Items)
            //{
            //    ((LinkButton)item.FindControl("lkbProductSubcategory")).ForeColor = Color.FromArgb(102, 102, 102);
            //}
            //((LinkButton)i.FindControl("lkbProductSubcategory")).ForeColor = Color.FromArgb(255, 127, 0);
            string category = new HZCGZM_Model.HZCGZMEntities().tbCategory.Where(m => m.categoryId == categoryId).FirstOrDefault().categoryName;

            lblproductType.Text = (category + " - " + ((LinkButton)sender).Text);
            updateProductList();
        }

        private void searchProductList()
        {
            string cmdTxt;
            string cmdCountTxt;
            string queryString;

            if (!String.IsNullOrEmpty(search))
            {

                cmdTxt = String.Format("SELECT * FROM (select ROW_NUMBER() over(order by B.productId) as 'sequence',A.imageURL,B.productId,B.productName, B.productDetailHtmlString from dbo.tbImage as A INNER JOIN dbo.tbProduct as B ON A.bindId = B.productId WHERE A.imageType='6' and A.imageState='1' and B.productState='1' and B.productName like '%{0}%' ) as t where t.sequence between {1} and {2}", search, (this.page - 1) * this.pageSize + 1, this.page * this.pageSize);

                cmdCountTxt = String.Format("SELECT count(dbo.tbProduct.productId) FROM dbo.tbImage INNER JOIN dbo.tbProduct ON dbo.tbImage.bindId = dbo.tbProduct.productId WHERE dbo.tbImage.imageType='6' and dbo.tbImage.imageState='1' and productState='1' and productName like '%{0}%' ", search);

                queryString = String.Format("search={0}", search);

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

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    this.totalCount = 0;

                    conn.Open();

                    SqlCommand cmdCount = new SqlCommand(cmdCountTxt, conn);
                    this.totalCount = Convert.ToInt32(cmdCount.ExecuteScalar());

                    generatePage(queryString);

                }
            }

        }

        private void updateProductList()
        {

            string cmdTxt;
            string cmdCountTxt;
            string queryString;

            if (subcategoryId > 0)
            {
                cmdTxt = String.Format("SELECT * FROM (select ROW_NUMBER() over(order by B.productId) as 'sequence',A.imageURL,B.productId,B.productName, B.productDetailHtmlString from dbo.tbImage as A INNER JOIN dbo.tbProduct as B ON A.bindId = B.productId WHERE A.imageType='6' and A.imageState='1' and B.productState='1' and B.productCategoryId='{0}' and B.productSubcategoryId = '{1}' ) as t where t.sequence between {2} and {3}", categoryId, subcategoryId, (this.page - 1) * this.pageSize + 1, this.page * this.pageSize);
                queryString = String.Format("type={0}&subtype={1}", categoryId, subcategoryId);

                cmdCountTxt = String.Format("SELECT count(dbo.tbProduct.productId) FROM dbo.tbImage INNER JOIN dbo.tbProduct ON dbo.tbImage.bindId = dbo.tbProduct.productId WHERE dbo.tbImage.imageType='6' and dbo.tbImage.imageState='1' and productState='1' and dbo.tbProduct.productCategoryId='{0}' and [productSubcategoryId] = '{1}' ", categoryId, subcategoryId);
            }
            else
            {
                cmdTxt = String.Format("SELECT * FROM (select ROW_NUMBER() over(order by B.productId) as 'sequence',A.imageURL,B.productId,B.productName, B.productDetailHtmlString from dbo.tbImage as A INNER JOIN dbo.tbProduct as B ON A.bindId = B.productId WHERE A.imageType='6' and A.imageState='1' and B.productState='1' and B.productCategoryId='{0}' ) as t where t.sequence between {1} and {2} ", categoryId, (this.page - 1) * this.pageSize + 1, this.page * this.pageSize);
                queryString = String.Format("type={0}", categoryId);

                cmdCountTxt = String.Format("SELECT count(dbo.tbProduct.productId) FROM dbo.tbImage INNER JOIN dbo.tbProduct ON dbo.tbImage.bindId = dbo.tbProduct.productId WHERE dbo.tbImage.imageType='6' and dbo.tbImage.imageState='1' and productState='1' and dbo.tbProduct.productCategoryId='{0}' ", categoryId);
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

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                this.totalCount = 0;

                conn.Open();

                SqlCommand cmdCount = new SqlCommand(cmdCountTxt, conn);
                this.totalCount = Convert.ToInt32(cmdCount.ExecuteScalar());

                generatePage(queryString);

            }

        }

        private void generatePage(string queryStr)
        {
            string pageUrl = String.Format("product.aspx?{0}&page=",queryStr);
            divPageBox.InnerHtml = Utility.GetPageList(this.pageSize, this.page, this.totalCount, pageUrl, 5);
        }

    }

}