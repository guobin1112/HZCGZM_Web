using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HZCGZM_Model;

namespace HZCGZM_Web.Backup
{
    public partial class download_detail : System.Web.UI.Page
    {

        int id;
        string action;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["id"]);
            action = Request.QueryString["action"];

            HZCGZMEntities entity = new HZCGZMEntities();

            if (id < 0 || String.IsNullOrEmpty(action))
            {
                Response.Write("<script>alert('入参有误')</script>");
                return;
            }



            if (action.Equals(ActionType.DELETE))
            {
                tbPdf tbPdf = entity.tbPdf.Where(m => m.pdfId == id).FirstOrDefault();
                if (tbPdf == null)
                {
                    Response.Write("<script>alert('数据查询失败')</script>");
                }
                else
                {
                    tbPdf.pdfState = (int)NormalState.UNAVALIABLE;

                    if (entity.SaveChanges() > 0)
                    {
                        Response.Write("<script>alert('删除成功')</script>");
                        Response.Redirect("download_list.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('删除失败')</script>");
                    }
                    
                }

            }

            if (action.Equals(ActionType.EDIT))
            {
                if (!IsPostBack)
                {

                    var pdfInfo = entity.tbPdf.Where(m => m.pdfId == id).Join(entity.tbImage.Where(m => m.imageType == (int)ImageType.DOWNLOAD && m.imageState == (int)NormalState.AVALIABLE), p => p.pdfId, i => i.bindId, (p, i) => new { p.pdfId, p.pdfName, p.pdfURL, i.imageURL }).FirstOrDefault();

                    if (pdfInfo == null)
                    {
                        Response.Write("<script>alert('数据查询失败')</script>");

                        return;
                    }

                    tbDownloadName.Text = pdfInfo.pdfName;
                    imgDownload.ImageUrl = pdfInfo.imageURL;
                    hlPdf.NavigateUrl = pdfInfo.pdfURL;
                }
            }

            if (action.Equals(ActionType.ADD))
            {
                imgDownload.Visible = false;
                hlPdf.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (action.Equals(ActionType.ADD))
            {
                if (fuDownloadImage.HasFile)
                {
                    string fileExrensio = System.IO.Path.GetExtension(fuDownloadImage.FileName).ToLower();
                    string fileType = fuDownloadImage.PostedFile.ContentType;
                    string fileName = DateTime.Now.ToString("yyyyMMddHHmmssffff") + fileExrensio;
                    string uploadURL = Server.MapPath("~/upload/") + fileName;
                    string imageURL = "../upload/" + fileName;
                    if (fileType == "image/bmp" || fileType == "image/gif" || fileType == "image/jpeg" || fileType == "image/jpg" || fileType == "image/png")
                    {

                        try
                        {

                            fuDownloadImage.PostedFile.SaveAs(uploadURL);

                            HZCGZMEntities entity = new HZCGZMEntities();


                            if (String.IsNullOrEmpty(tbDownloadName.Text.Trim()))
                            {
                                Response.Write("<script>alert('请输入名称')</script>");
                            }

                            if (fuDownloadPdf.HasFile)
                            {
                                string _fileExrensio = System.IO.Path.GetExtension(fuDownloadPdf.FileName).ToLower();
                                string _fileType = fuDownloadPdf.PostedFile.ContentType;
                                string _fileName = DateTime.Now.ToString("yyyyMMddHHmmssffff") + _fileExrensio;
                                string _uploadURL = Server.MapPath("~/upload/") + _fileName;
                                string pdfURL = "../upload/" + _fileName;
                                if (_fileType == "application/pdf")
                                {

                                    try
                                    {
                                        fuDownloadPdf.PostedFile.SaveAs(_uploadURL);

                                        tbPdf pdf = new tbPdf();
                                        pdf.pdfName = tbDownloadName.Text.Trim();
                                        pdf.pdfState = (int)NormalState.AVALIABLE;
                                        pdf.pdfURL = pdfURL;

                                        entity.tbPdf.Add(pdf);

                                        if (entity.SaveChanges() > 0)
                                        {
                                            tbImage img = new tbImage();
                                            img.imageState = (int)NormalState.AVALIABLE;
                                            img.imageType = (int)ImageType.DOWNLOAD;
                                            img.imageURL = imageURL;
                                            img.bindId = pdf.pdfId;

                                            entity.tbImage.Add(img);
                                            if (entity.SaveChanges() > 0)
                                            {
                                                Response.Write("<script>alert('添加成功')</script>");
                                                Response.Redirect("download_list.aspx");
                                            }
                                            else
                                            {
                                                Response.Write("<script>alert('保存失败')</script>");

                                                return;
                                            }
                                        }
                                        else
                                        {
                                            Response.Write("<script>alert('保存失败')</script>");

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
                                Response.Write("<script>alert('请选择文件')</script>");

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
                    Response.Write("<script>alert('请选择文件')</script>");

                    return;
                }

            }

            if (action.Equals(ActionType.EDIT))
            {
                HZCGZMEntities entity = new HZCGZMEntities();

                tbPdf pdf = entity.tbPdf.Where(m => m.pdfId == id).FirstOrDefault();

                tbImage image = entity.tbImage.Where(m => m.bindId == id&&m.imageType==(int)ImageType.DOWNLOAD&&m.imageState==(int)NormalState.AVALIABLE).FirstOrDefault();

                if (fuDownloadImage.HasFile)
                {
                    string fileExrensio = System.IO.Path.GetExtension(fuDownloadImage.FileName).ToLower();
                    string fileType = fuDownloadImage.PostedFile.ContentType;
                    string fileName = DateTime.Now.ToString("yyyyMMddHHmmssffff") + fileExrensio;
                    string uploadURL = Server.MapPath("~/upload/") + fileName;
                    string imageURL = "../upload/" + fileName;
                    if (fileType == "image/bmp" || fileType == "image/gif" || fileType == "image/jpeg" || fileType == "image/jpg" || fileType == "image/png")
                    {
                        try
                        {

                            fuDownloadImage.PostedFile.SaveAs(uploadURL);

                            image.imageURL = imageURL;
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('保存失败')</script>");

                            return;
                        }


                    }
                    else
                    {
                        Response.Write("<script>alert('格式错误')</script>");
                    }
                }


                if (fuDownloadPdf.HasFile)
                {
                    string fileExrensio = System.IO.Path.GetExtension(fuDownloadPdf.FileName).ToLower();
                    string fileType = fuDownloadPdf.PostedFile.ContentType;
                    string fileName = DateTime.Now.ToString("yyyyMMddHHmmssffff") + fileExrensio;
                    string uploadURL = Server.MapPath("~/upload/") + fileName;
                    string pdfURL = "../upload/" + fileName;
                    if (fileType == "application/pdf")
                    {
                        try
                        {

                            fuDownloadPdf.PostedFile.SaveAs(uploadURL);

                            pdf.pdfURL = pdfURL;
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('保存失败')</script>");

                            return;
                        }


                    }
                    else
                    {
                        Response.Write("<script>alert('格式错误')</script>");
                        return;
                    }
                }

                if (String.IsNullOrEmpty(tbDownloadName.Text.Trim()))
                {
                    Response.Write("<script>alert('请输入名称')</script>");
                    return;
                }

                pdf.pdfName = tbDownloadName.Text.Trim();

                if (entity.SaveChanges() > 0)
                {
                    Response.Write("<script>alert('保存成功')</script>");

                    Response.Redirect("download_list.aspx");
                }
                else
                {
                    Response.Write("<script>alert('保存失败')</script>");
                    return;
                }
            }
        }
    }
}