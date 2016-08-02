<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="HZCGZM_Web.Front.contact" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>

<asp:Content ID="head_contact" ContentPlaceHolderID="head" runat="server">
     <link href="Style/contact.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_contact" ContentPlaceHolderID="content" runat="server">
      <img class="contact" src="Image/1.jpg" />
    <div class="nav_about">
        <img src="Image/home.png" />
        <asp:Label ID="lblNav" runat="server" Text="所在位置：联系我们"></asp:Label>
    </div>
    <div class="content">
        <div class="left nav_left">
            <div class="top">
                联系我们
            </div>
            <ul>
                <li a class="current"><a  href="contact.aspx">联系我们<img src="Image/triangle_right_orange.png" /></a></li>
            </ul>

        </div>
        <div class="right content_right">

            <img src="Image/1.jpg" />

            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;地址：浙江省杭州市临安花桥路68号
            </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;电话：+86-0571-58605168</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;传真：+86-0571-58605169</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;邮编：311300</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;邮箱：</p>

            <a  href="Image/map.jpg"><img class="map"  src="Image/map.jpg" /></a>
        </div>
    </div>
</asp:Content>
