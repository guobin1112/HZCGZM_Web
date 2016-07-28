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
            <ul id="ul_application">
                <li  class="current">
                    <a href="application.aspx">
                        全部类型
                        <img src="Image/triangle_right_orange.png" />
                    </a>
                </li>
                <asp:Repeater ID="rptApplicationCategory" runat="server" DataSourceID="sdcApplicationCategory">
                    <ItemTemplate>
                        <li id='<%#Eval("categoryId") %>'>
                            <a href='application_detail.aspx?type=<%#Eval("categoryId") %>'><%#Eval("categoryName") %><img src="Image/triangle_right_orange.png" /></a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <asp:SqlDataSource ID="sdcApplicationCategory" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT [categoryId], [categoryName] FROM [tbCategory] WHERE (([categoryState] = @categoryState) AND ([categoryType] = @categoryType))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="categoryState" Type="Int32" />
                    <asp:Parameter DefaultValue="3" Name="categoryType" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="right content_right">
            <div class="application_top">
                <span id="applicationType" class="left" style="color: #ff7f00"></span>
                <asp:Label ID="lblApplicationContent" runat="server" Text="所在位置：应用领域" CssClass="right"></asp:Label>
                <img src="Image/home.png" class="right" />
            </div>
            <div class="application_list">
                <ul>
                    <asp:Repeater ID="rptApplication" runat="server" DataSourceID="sdcApplicationCategoryInfo">
                        <ItemTemplate>
                            <li>
                                <asp:Image ID="image" ImageUrl='<%#Eval("imageURL") %>' runat="server" />
                                <span class="application_title"><%#Eval("categoryName") %></span>
                                <hr />
                                <p><%#Eval("categoryInfo") %></p>
                                <a href='application_detail.aspx?type=<%#Eval("categoryId")%>'>查看更多 
                                    <img src="Image/triangle_right_orange.png" /></a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="sdcApplicationCategoryInfo" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT     dbo.tbCategory.categoryId, dbo.tbCategory.categoryName, dbo.tbCategory.sortNumber, dbo.tbCategory.categoryInfo, 
                      dbo.tbImage.imageURL
FROM         dbo.tbCategory INNER JOIN
                      dbo.tbImage ON dbo.tbCategory.categoryId = dbo.tbImage.bindId
WHERE dbo.tbImage.imageType='2' and dbo.tbImage.imageState='1' and dbo.tbCategory.categoryState='1' and dbo.tbCategory.categoryType='3'
Order by dbo.tbCategory.sortNumber"></asp:SqlDataSource>
                    <%--<li>
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
                    </li>--%>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
