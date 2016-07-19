<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="HZCGZM_Web.Front.about" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>
<asp:Content ID="head_about" ContentPlaceHolderID="head" runat="server">
    <link href="Style/about.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_about" ContentPlaceHolderID="content" runat="server">
    <img class="about" src="Image/1.jpg" />
    <div class="nav_about">
        <img src="Image/home.png" />
        <asp:Label ID="lblNav" runat="server" Text="所在位置：关于我们 - 公司简介"></asp:Label>
    </div>
    <div class="content">
        <div class="left nav_left">
            <div class="top">
                关于我们
            </div>
            <ul>
                <li>公司简介<img src="Image/triangle_right_orange.png"/></li>
                <li>组织架构<img src="Image/triangle_right_orange.png"/></li>
            </ul>

        </div>
        <div class="right content_right">关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们</div>
    </div>
</asp:Content>
