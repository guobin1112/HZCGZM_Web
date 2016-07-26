﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="HZCGZM_Web.Front.news" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>
<asp:Content ID="head_news" ContentPlaceHolderID="head" runat="server">
    <link href="Style/news.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_news" ContentPlaceHolderID="content" runat="server">
    <div class="content">
        <div class="left nav_left">
            <div class="top">
                新闻资讯
            </div>
            <ul id="ul_news">
                <asp:Repeater ID="rptNewCategory" runat="server" DataSourceID="sdcNewsCategory">
                    <ItemTemplate>
                        <li  id='<%#Eval("categoryId") %>' >
                            <a href='news.aspx?type=<%#Eval("categoryId") %>'><%#Eval("categoryName") %><img src="Image/triangle_right_orange.png" /></a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="sdcNewsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT [categoryId], [categoryName] FROM [tbCategory] WHERE (([categoryState] = @categoryState) AND ([categoryType] = @categoryType))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="categoryState" Type="Int32" />
                        <asp:Parameter DefaultValue="5" Name="categoryType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
               
            </ul>

        </div>
        <div class="right content_right">
            <div class="news_top">
                <span id="newsType" class="left" style="color: #ff7f00"></span>
                <asp:Label ID="lblNewContent" runat="server" Text="所在位置：新闻资讯" CssClass="right"></asp:Label>
                <img src="Image/home.png" class="right" />
            </div>
            <div class="news_list">
                <asp:UpdatePanel ID="upNews" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <ul>
                            <asp:Repeater ID="rptNews" runat="server" DataSourceID="sdcNews">
                                <ItemTemplate>
                                    <li>
                                        <a href='news_detail.aspx?id=<%#Eval("newsId") %>'><span class="left"><%#Eval("newsTitle") %></span></a><span class="right"><%#Convert.ToDateTime(Eval("newsPublishTime")).ToString("yyyy/MM/dd") %></span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="sdcNews" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT [newsId], [newsTitle], [newsPublishTime] FROM [tbNews] WHERE (([newsState] = @newsState) AND ([newsType] = @newsType)) ORDER BY [newsPublishTime] DESC">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="newsState" Type="Int32" />
                                    <asp:QueryStringParameter Name="newsType" QueryStringField="type" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <%--<li>
                        <span class="left">新闻标题</span><span class="right">[2016/7/20]</span>
                    </li>
                    <li>
                        <span class="left">新闻标题</span><span class="right">[2016/7/20]</span>
                    </li>
                    <li>
                        <span class="left">新闻标题</span><span class="right">[2016/7/20]</span>
                    </li>
                    <li>
                        <span class="left">新闻标题</span><span class="right">[2016/7/20]</span>
                    </li>
                    <li>
                        <span class="left">新闻标题</span><span class="right">[2016/7/20]</span>
                    </li>
                    <li>
                        <span class="left">新闻标题</span><span class="right">[2016/7/20]</span>
                    </li>
                    <li>
                        <span class="left">新闻标题</span><span class="right">[2016/7/20]</span>
                    </li>
                    <li>
                        <span class="left">新闻标题</span><span class="right">[2016/7/20]</span>
                    </li>--%>
                        </ul>
                    </ContentTemplate>
                </asp:UpdatePanel>
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
    <script>
        $(function () {
            var type = getQueryString("type");
            $("#ul_news li").each(function () {

                if(this.id==type){
                    $(this).addClass("current").siblings().removeClass("current");
                    $("#newsType").text($(this).children("a").text());
                }
            })
        })
    </script>
</asp:Content>
