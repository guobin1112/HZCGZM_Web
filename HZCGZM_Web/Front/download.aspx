﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="download.aspx.cs" Inherits="HZCGZM_Web.Front.download" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>

<asp:Content ID="head_download" ContentPlaceHolderID="head" runat="server">
    <link href="Style/download.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_download" ContentPlaceHolderID="content" runat="server">
    <div class="content">
        <div class="left nav_left">
            <div class="top">
                <%=Resources.lang.nav_download%>
            </div>
            <ul>
                <li><span class="left"><%=Resources.lang.catalog%></span><img src="Image/triangle_right_orange.png" /></li>
            </ul>

        </div>
        <div class="right content_right">
            <div class="download_top">
                <span class="left"><%=Resources.lang.catalog%></span>
                <span class="right"><%=Resources.lang.location%>：<%=Resources.lang.nav_download%></span>
                <img src="Image/home.png" class="right" />
            </div>
            <div class="download_list">
                <ul>
                    <asp:Repeater ID="rptDownload" runat="server" DataSourceID="sdcDownload">
                        <ItemTemplate>
                            <li>
                                <asp:Image ID="imgPdf" runat="server" ImageUrl='<%#Eval("imageURL") %>' />
                                <p class="download_title"><%#isEn?Eval("pdfNameEN"):Eval("pdfName") %></p>
                                <a href='<%#Eval("pdfURL")%>'><%=Resources.lang.download%>
                                    <img src="Image/triangle_right_orange.png" /></a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="sdcDownload" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT     dbo.tbPdf.pdfId, dbo.tbImage.imageURL,dbo.tbPdf.pdfName,dbo.tbPdf.pdfNameEN,  dbo.tbPdf.pdfURL
FROM         dbo.tbImage INNER JOIN
                      dbo.tbPdf ON dbo.tbImage.bindId = dbo.tbPdf.pdfId
WHERE   dbo.tbImage.imageState='1' and dbo.tbPdf.pdfState='1' and dbo.tbImage.imageType='5'"></asp:SqlDataSource>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
