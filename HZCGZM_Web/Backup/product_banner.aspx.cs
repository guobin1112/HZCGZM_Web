using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HZCGZM_Model;

namespace HZCGZM_Web.Backup
{
    public partial class product_banner : System.Web.UI.Page
    {

        private int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["id"]);
            if (id <= 0)
            {
                Response.Write("<script>alert('入参错误')</script>");

                return;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (fuProductBanner.HasFile)
            {
                string fileExrensio = System.IO.Path.GetExtension(fuProductBanner.FileName).ToLower();
                string fileType = fuProductBanner.PostedFile.ContentType;
                string fileName = DateTime.Now.ToString("yyyyMMddHHmmssffff") + fileExrensio;
                string uploadURL = Server.MapPath("~/upload/") + fileName;
                string imageURL = "../upload/" + fileName;
                if (fileType == "image/bmp" || fileType == "image/gif" || fileType == "image/jpeg" || fileType == "image/jpg" || fileType == "image/png")
                {

                    try
                    {
                        fuProductBanner.PostedFile.SaveAs(uploadURL);

                        HZCGZMEntities entity = new HZCGZMEntities();
                        tbImage image = new tbImage();
                        image.bindId = id;
                        image.imageState = (int)NormalState.AVALIABLE;
                        image.imageType = (int)ImageType.PRODUCT_BANNER;
                        image.imageURL = imageURL;

                        entity.tbImage.Add(image);

                        if (entity.SaveChanges() > 0)
                        {
                            Response.Write("<script>alert('上传成功')</script>");
                            rptProductBanner.DataBind();
                        }
                        else
                        {
                              Response.Write("<script>alert('上传失败')</script>");
                              return;
                        }

                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('上传失败')</script>");

                        return;
                    }
                }
                else
                {
                    Response.Write("<script>alert('格式错误')</script>");

                    return;
                }
            }
            else
            {
                Response.Write("<script>alert('请选择图片')</script>");
                return;
            }


        }

        protected void lbDelete_Click(object sender, EventArgs e)
        {
            RepeaterItem i = ((LinkButton)sender).Parent as RepeaterItem;
            int imageId = Convert.ToInt32(((HiddenField)i.FindControl("hfImageId")).Value);

            HZCGZMEntities entity = new HZCGZMEntities();
            entity.tbImage.Where(m => m.imageId == imageId).FirstOrDefault().imageState = (int)NormalState.UNAVALIABLE;
            if (entity.SaveChanges() > 0)
            {
                Response.Write("<script>alert('删除成功')</script>");
                rptProductBanner.DataBind();
            }
            else
            {
                Response.Write("<script>alert('删除失败')</script>");
            }
        }
    }
}