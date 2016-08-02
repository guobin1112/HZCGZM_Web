<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HZCGZM_Web.Backup.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Login ID="loginBox" runat="server" Height="111px" OnAuthenticate="loginBox_Authenticate" Width="244px">
        </asp:Login>
    
    </div>
    </form>
</body>
</html>
