﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="application_detail.aspx.cs" Inherits="HZCGZM_Web.Front.application_detail" %>

<asp:Content ID="head_application_detail" ContentPlaceHolderID="head" runat="server">
    <link href="Style/application_detail.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_application_detail" ContentPlaceHolderID="content" runat="server">
    <div class="content">
        <div class="left nav_left">
            <div class="top">
                <%=Resources.lang.nav_application%>
            </div>
            <ul id="ul_application">
                <asp:Repeater ID="rptApplicationCategory" runat="server" DataSourceID="sdcApplicationCategory">
                    <ItemTemplate>
                        <li id='<%#Eval("categoryId")%>'>
                            <a href='application_detail.aspx?type=<%#Eval("categoryId") %>'><%#isEn?Eval("categoryNameEN"):Eval("categoryName") %><img src="Image/triangle_right_orange.png" /></a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <asp:SqlDataSource ID="sdcApplicationCategory" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT [categoryId], [categoryName], [categoryNameEN]  FROM [tbCategory] WHERE (([categoryState] = @categoryState) AND ([categoryType] = @categoryType))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="categoryState" Type="Int32" />
                    <asp:Parameter DefaultValue="3" Name="categoryType" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="right content_right">
            <div class="application_top">

                <div class="location">
                    <span id="applicationType" class="left"></span>
                    <span class="right"><%=Resources.lang.location%>：<%=Resources.lang.nav_application%></span>
                </div>

                <ul>
                    <li><%=Resources.lang.nav_application%>>
                    </li>
                    <asp:Repeater ID="rptApplicationSubcategory" runat="server" DataSourceID="sdcApplicationSubcategory" OnItemDataBound="rptApplicationSubcategory_ItemDataBound" OnItemCommand="rptApplicationSubcategory_ItemCommand">
                        <ItemTemplate>
                            <li>
                                <asp:LinkButton ID="lbApplicationCategory" runat="server" OnClick="lbApplicationCategory_Click" Text='<%#isEn?Eval("categoryNameEN"):Eval("categoryName")  %>'></asp:LinkButton>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="sdcApplicationSubcategory" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT [categoryId], [categoryName],[categoryNameEN] FROM [tbCategory] WHERE (([categoryState] = @categoryState) AND ([categoryType] = @categoryType) AND ([parentId] = @parentId))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="categoryState" Type="Int32" />
                            <asp:Parameter DefaultValue="4" Name="categoryType" Type="Int32" />
                            <asp:QueryStringParameter Name="parentId" QueryStringField="type" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ul>
            </div>

            <div class="application_detail">
                <asp:Image ID="imgApplication" runat="server" CssClass="left" />
                <asp:Label ID="lblApplicationName" runat="server" Text="" ForeColor="#ff7f00" Font-Size="16px" Font-Bold="true"></asp:Label>
                <br />
                <br />
                <asp:Label ID="lblApplication" runat="server" Text=""></asp:Label>

            </div>
        </div>
    </div>
    <script>
        $(function () {
            var type = getQueryString("type");
            $("#ul_application li").each(function () {

                if (this.id == type) {
                    $(this).addClass("current").siblings().removeClass("current");
                    $("#applicationType").text($(this).children("a").text());
                }
            })
        })
    </script>
</asp:Content>
