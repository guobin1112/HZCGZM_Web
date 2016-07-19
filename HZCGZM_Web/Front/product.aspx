<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="HZCGZM_Web.Front.product" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>

<asp:Content ID="head_product" ContentPlaceHolderID="head" runat="server">
    <link href="Style/product.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_product" ContentPlaceHolderID="content" runat="server">
        <div class="content">
        <div class="left nav_left">
            <div class="top">
                产品中心
            </div>
            <ul>
                <li>产品类型1<img src="Image/triangle_right_orange.png" /></li>
                <li>产品类型2<img src="Image/triangle_right_orange.png" /></li>
                <li>产品类型3<img src="Image/triangle_right_orange.png" /></li>
            </ul>

        </div>
        <div class="right content_right">
            <div class="product_top">
                <asp:Label ID="lblproductType" runat="server" Text="产品类型" CssClass="left"></asp:Label>
                <asp:Label ID="lblNewContent" runat="server" Text="所在位置：产品中心" CssClass="right"></asp:Label>
                <img src="Image/home.png" class="right" />
            </div>
            <div class="product_list">
                <ul>
                    <li>
                        <span>新闻标题</span><span>[2016/7/20]</span>
                    </li>
                    <li>
                        <span>新闻标题</span><span>[2016/7/20]</span>
                    </li>
                    <li>
                        <span>新闻标题</span><span>[2016/7/20]</span>
                    </li>
                    <li>
                        <span>新闻标题</span><span>[2016/7/20]</span>
                    </li>
                    <li>
                        <span>新闻标题</span><span>[2016/7/20]</span>
                    </li>
                    <li>
                        <span>新闻标题</span><span>[2016/7/20]</span>
                    </li>
                    <li>
                        <span>新闻标题</span><span>[2016/7/20]</span>
                    </li>
                    <li>
                        <span>新闻标题</span><span>[2016/7/20]</span>
                    </li>
                </ul>
            </div>
            <div class="page">
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>6</li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
