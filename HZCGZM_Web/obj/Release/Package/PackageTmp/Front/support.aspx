<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="support.aspx.cs" Inherits="HZCGZM_Web.Front.support" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>

<asp:Content ID="head_support" ContentPlaceHolderID="head" runat="server">
    <link href="Style/support.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_support" ContentPlaceHolderID="content" runat="server">
        <div class="content">
        <div class="left nav_left">
            <div class="top">
               <%=Resources.lang.oem_support%>
            </div>
            <ul>
                <li><%=Resources.lang.package_design%><img src="Image/triangle_right_orange.png" /></li>
                <li>  <%=Resources.lang.promotion_material_design%><img src="Image/triangle_right_orange.png" /></li>
                <li>  <%=Resources.lang.producing_process%><img src="Image/triangle_right_orange.png" /></li>
            </ul>

        </div>
        <div class="right content_right">
            <div class="support_top">
                <asp:Label ID="lblsupportType" runat="server" Text="" CssClass="left"></asp:Label>
                <span class="right">  <%=Resources.lang.location%>：  <%=Resources.lang.oem_support%></span>
                <img src="Image/home.png" class="right" />
            </div>
          
        </div>
    </div>
</asp:Content>
