﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="HZCGZM_Web.Front.contact" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>

<asp:Content ID="head_contact" ContentPlaceHolderID="head" runat="server">
     <link href="Style/contact.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_contact" ContentPlaceHolderID="content" runat="server">
      <img class="contact" src="Image/1.jpg" />
    <div class="nav_about">
        <img src="Image/home.png" />
        <span><%=Resources.lang.location%>：<%=Resources.lang.contact_us%></span>
    </div>
    <div class="content">
        <div class="left nav_left">
            <div class="top">
                <%=Resources.lang.contact_us%>
            </div>
            <ul>
                <li a class="current"><a  href="contact.aspx"><%=Resources.lang.contact_us%><img src="Image/triangle_right_orange.png" /></a></li>
            </ul>

        </div>
        <div class="right content_right">

            <img src="Image/1.jpg" />

            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;<%=Resources.lang.address%>：<%=Resources.lang.address_info%>
            </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;<%=Resources.lang.phone%>：+86-0571-58605168</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;<%=Resources.lang.fax%>：+86-0571-58605169</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;<%=Resources.lang.post%>：311300</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;<%=Resources.lang.email%>：sunrise@hzcgzm.com</p>

            <a  href="Image/map.jpg"><img class="map"  src="Image/map.jpg" /></a>
        </div>
    </div>
</asp:Content>
