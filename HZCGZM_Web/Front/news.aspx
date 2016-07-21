<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="HZCGZM_Web.Front.news" %>

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
            <ul>
                <asp:Repeater ID="rptNewCategory" runat="server" DataSourceID="sdcNewsCategory">
                    <ItemTemplate>
                        <li><a href='news.aspx?type=<%#Eval("categoryId") %>'><%#Eval("categoryName") %><img src="Image/triangle_right_orange.png" /></a></li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="sdcNewsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT [categoryId], [categoryName] FROM [tbCategory] WHERE (([categoryState] = @categoryState) AND ([categoryType] = @categoryType))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="categoryState" Type="Int32" />
                        <asp:Parameter DefaultValue="5" Name="categoryType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <%--<li>展会<img src="Image/triangle_right_orange.png" /></li>
                <li>公告<img src="Image/triangle_right_orange.png" /></li>
                <li>行业资讯<img src="Image/triangle_right_orange.png" /></li>--%>
            </ul>

        </div>
        <div class="right content_right">
            <div class="news_top">
                <asp:Label ID="lblNewsType" runat="server" Text="新闻类型" CssClass="left" ForeColor="#ff7f00"></asp:Label>
                <asp:Label ID="lblNewContent" runat="server" Text="所在位置：新闻资讯" CssClass="right"></asp:Label>
                <img src="Image/home.png" class="right" />
            </div>
            <div class="news_list">
                <ul>
                    <asp:Repeater ID="rptNews" runat="server" DataSourceID="sdcNews">
                        <ItemTemplate>
                            <li>
                                <span class="left"><%#Eval("newsTitle") %></span><span class="right"><%#Convert.ToDateTime( Eval("newsPublishTime")).ToString("yyyy/MM/dd") %></span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="sdcNews" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT [newsId], [newsTitle], [newsPublishTime] FROM [tbNews] WHERE (([newsState] = @newsState) AND ([newsType] = @newsType)) ORDER BY [newsPublishTime] DESC">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="newsState" Type="Int32" />
                            <asp:QueryStringParameter DefaultValue="0" Name="newsType" QueryStringField="type" Type="Int32" />
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
