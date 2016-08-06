using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HZCGZM_Model;

namespace HZCGZM_Web.Backup
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (new HZCGZMEntities().tbAdmin.Where(m => m.adminName == tbUserName.Text && m.password == tbPassword.Text).Count() > 0)
            {
                Response.Redirect("开票界面.html");
            }
            else
            {
                Response.Write("<script>alert('请输入正确的用户名和密码！')</script>");
            }
        }
    }
}