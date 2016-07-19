<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="support.aspx.cs" Inherits="HZCGZM_Web.Front.support" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>

<asp:Content ID="head_support" ContentPlaceHolderID="head" runat="server">
    <link href="Style/support.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_support" ContentPlaceHolderID="content" runat="server">
        <div class="content">
        <div class="left nav_left">
            <div class="top">
                应用支持
            </div>
            <ul>
                <li>包装设计<img src="Image/triangle_right_orange.png" /></li>
                <li>样品设计<img src="Image/triangle_right_orange.png" /></li>
                <li>生产流程<img src="Image/triangle_right_orange.png" /></li>
            </ul>

        </div>
        <div class="right content_right">
            <div class="support_top">
                <asp:Label ID="lblsupportType" runat="server" Text="应用支持类型" CssClass="left"></asp:Label>
                <asp:Label ID="lblNewContent" runat="server" Text="所在位置：应用支持" CssClass="right"></asp:Label>
                <img src="Image/home.png" class="right" />
            </div>
          
        </div>
    </div>
</asp:Content>
