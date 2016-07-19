<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="HZCGZM_Web.Front.news" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>
<asp:Content ID="head_news" ContentPlaceHolderID="head" runat="server">
    <link href="Style/news.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_news" ContentPlaceHolderID="content" runat="server">
    <div class="content">
        <div class="left nav_left">
            <div class="top">
                新闻咨询
            </div>
            <ul>
                <li>展会<img src="Image/triangle_right_orange.png" /></li>
                <li>公告<img src="Image/triangle_right_orange.png" /></li>
                <li>行业资讯<img src="Image/triangle_right_orange.png" /></li>
            </ul>

        </div>
        <div class="right content_right">
            <div class="news_top">
                <asp:Label ID="lblNewsType" runat="server" Text="新闻类型" CssClass="left"></asp:Label>
                <asp:Label ID="lblNewContent" runat="server" Text="所在位置：新闻资讯" CssClass="right"></asp:Label>
                <img src="Image/home.png" class="right" />
            </div>
            <div class="news_list">
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
