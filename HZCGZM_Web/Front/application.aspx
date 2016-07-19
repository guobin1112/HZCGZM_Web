<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="application.aspx.cs" Inherits="HZCGZM_Web.Front.application" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>

<asp:Content ID="head_application" ContentPlaceHolderID="head" runat="server">
    <link href="Style/application.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_application" ContentPlaceHolderID="content" runat="server">
            <div class="content">
        <div class="left nav_left">
            <div class="top">
                应用领域
            </div>
            <ul>
                <li>应用类型1<img src="Image/triangle_right_orange.png" /></li>
                <li>应用类型2<img src="Image/triangle_right_orange.png" /></li>
                <li>应用类型3<img src="Image/triangle_right_orange.png" /></li>
            </ul>

        </div>
        <div class="right content_right">
            <div class="application_top">
                <asp:Label ID="lblApplicationType" runat="server" Text="产品类型" CssClass="left"></asp:Label>
                <asp:Label ID="lblApplicationContent" runat="server" Text="所在位置：应用领域" CssClass="right"></asp:Label>
                <img src="Image/home.png" class="right" />
            </div>
            <div class="application_list">
                <ul>
                    <li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多  <img src="Image/triangle_right_orange.png" /></a>
                    </li>
                   <li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多  <img src="Image/triangle_right_orange.png" /></a>
                    </li>
                    <li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多  <img src="Image/triangle_right_orange.png" /></a>
                    </li>
                    <li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多  <img src="Image/triangle_right_orange.png" /></a>
                    </li>
                    <li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多  <img src="Image/triangle_right_orange.png" /></a>
                    </li>
                    <li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多  <img src="Image/triangle_right_orange.png" /></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
