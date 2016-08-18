<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="HZCGZM_Web.Front.news" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>
<asp:Content ID="head_news" ContentPlaceHolderID="head" runat="server">
    <link href="Style/news.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_news" ContentPlaceHolderID="content" runat="server">
    <div class="content">
        <div class="left nav_left">
            <div class="top">
                <%=Resources.lang.news_center%>
            </div>
            <ul id="ul_news">
                <asp:Repeater ID="rptNewCategory" runat="server" DataSourceID="sdcNewsCategory">
                    <ItemTemplate>
                        <li>
                        <asp:LinkButton ID="lkbCategory" runat="server" OnClick="lkbCategory_Click" Text='<%#isEn?Eval("categoryNameEN"):Eval("categoryName") %>'><img src="Image/triangle_right_orange.png" /></asp:LinkButton>
                            <asp:HiddenField ID="hfCategory" runat="server"  Value='<%#Eval("categoryId") %>'/>
                       </li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="sdcNewsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT [categoryId], [categoryName],[categoryNameEN] FROM [tbCategory] WHERE (([categoryState] = @categoryState) AND ([categoryType] = @categoryType))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="categoryState" Type="Int32" />
                        <asp:Parameter DefaultValue="5" Name="categoryType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
               
            </ul>

        </div>
        <div class="right content_right">
            <div class="news_top">
                <span id="newsType" class="left" style="color: #ff7f00" runat="server"></span>
                <span class="right"><%=Resources.lang.location%>：<%=Resources.lang.news_center%></span>
                <img src="Image/home.png" class="right" />
            </div>
            <div class="news_list">
                <asp:UpdatePanel ID="upNews" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <ul>
                            <asp:Repeater ID="rptNews" runat="server" DataSourceID="sdcNews">
                                <ItemTemplate>
                                    <li>
                                        <a href='news_detail.aspx?id=<%#Eval("newsId") %>'><span class="left"><%#isEn?Eval("newsTitleEN"):Eval("newsTitle") %></span></a><span class="right"><%#Convert.ToDateTime(Eval("newsPublishTime")).ToString("yyyy/MM/dd") %></span>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="sdcNews" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT [newsId], [newsTitle],  [newsTitleEN],[newsPublishTime] FROM [tbNews] WHERE (([newsState] = @newsState) AND ([newsType] = @newsType)) ORDER BY [newsPublishTime] DESC">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="newsState" Type="Int32" />
                                    <asp:QueryStringParameter Name="newsType" QueryStringField="type" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </ul>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
