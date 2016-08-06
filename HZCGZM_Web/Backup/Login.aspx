<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HZCGZM_Web.Backup.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>杭州陈光照明后台管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.css" />

    <script type="text/javascript" src="js/jquery1.9.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
        body {
            background: #0066A8 url(img/login_bg.png) no-repeat center 0px;
        }

        .tit {
            margin: auto;
            margin-top: 170px;
            text-align: center;
            width: 350px;
            padding-bottom: 20px;
        }

        .login-wrap {
            width: 220px;
            padding: 30px 50px 0 330px;
            height: 220px;
            background: #fff url(img/20150212154319.jpg) no-repeat 30px 40px;
            margin: auto;
            overflow: hidden;
        }

        .login_input {
            display: block;
            width: 210px;
        }

        .login_user {
            background: url(img/input_icon_1.png) no-repeat 200px center;
            font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
        }

        .login_password {
            background: url(img/input_icon_2.png) no-repeat 200px center;
            font-family: "Courier New", Courier, monospace;
        }

        .btn-login {
            background: #40454B;
            box-shadow: none;
            text-shadow: none;
            color: #fff;
            border: none;
            height: 35px;
            line-height: 26px;
            font-size: 14px;
            font-family: "microsoft yahei";
        }

            .btn-login:hover {
                background: #333;
                color: #fff;
            }

        .copyright {
            margin: auto;
            margin-top: 10px;
            text-align: center;
            width: 370px;
            color: #CCC;
        }

        @media (max-height: 700px) {
            .tit {
                margin: auto;
                margin-top: 100px;
            }
        }

        @media (max-height: 500px) {
            .tit {
                margin: auto;
                margin-top: 50px;
            }
        }
        .auto-style1 {
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="tit">
            <img src="img/tit.png" alt="" /></div>
        <div class="login-wrap">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="25" valign="bottom">用户名：</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:TextBox ID="tbUserName" runat="server" CssClass="login_input login_user"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td height="35" valign="bottom">密  码：</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbPassword" runat="server" CssClass="login_input login_password" TextMode="Password"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td height="60" valign="bottom">
                        <asp:Button ID="btnLogin" runat="server" Text="登录" CssClass="btn btn-block btn-login" OnClick="btnLogin_Click" />
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
