﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="HZCGZM_Web.Front.product" %>

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
                <asp:Repeater ID="rptProductCategory" runat="server" OnItemDataBound="rptProductCategory_ItemDataBound">
                    <ItemTemplate>

                        <li>
                            <asp:LinkButton ID="lkbProductCategory" runat="server" OnClick="lkbProductCategory_Click" Text='<%#Eval("categoryName") %>'>
                                <img src="Image/triangle_right_orange.png" /></asp:LinkButton>
                            <asp:HiddenField ID="hfCategoryId" runat="server" Value='<%#Eval("categoryId") %>' />
                            <%-- <a href='product.aspx?type=<%#Eval("categoryId") %>'><%#Eval("categoryName") %><img src="Image/triangle_right_orange.png" /></a>--%>
                            <ul>
                                <asp:Repeater ID="rptProductSubcategory" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <asp:LinkButton ID="lkbProductSubcategory" runat="server" OnClick="lkbProductSubcategory_Click" Text='<%#Eval("categoryName") %>'>
                                <img src="Image/triangle_right_orange.png" /></asp:LinkButton>
                                            <asp:HiddenField ID="hfSubategoryId" runat="server" Value='<%#Eval("categoryId") %>' />
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <%--                <li>产品类型1<img src="Image/triangle_right_orange.png" />
                    <ul>
                        <li>
                            子产品
                        </li>
                        <li>
                            子产品
                        </li>
                    </ul>
                </li>
                <li>产品类型2<img src="Image/triangle_right_orange.png" /></li>
                <li>产品类型3<img src="Image/triangle_right_orange.png" /></li>--%>
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
                    <asp:Repeater ID="rptProduct" runat="server">
                        <ItemTemplate>
                            <li>
                                <a href='product_detail.aspx?id=<%#Eval("productId") %>'>
                                    <asp:Image ID="imgProduct" runat="server" ImageUrl='<%#Eval("imageURL") %>' />
                                <span><%#Eval("productName") %></span>
                                </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <%--<li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多 
                            <img src="Image/triangle_right_orange.png" /></a>
                    </li>
                    <li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多 
                            <img src="Image/triangle_right_orange.png" /></a>
                    </li>
                    <li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多 
                            <img src="Image/triangle_right_orange.png" /></a>
                    </li>
                    <li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多 
                            <img src="Image/triangle_right_orange.png" /></a>
                    </li>
                    <li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多 
                            <img src="Image/triangle_right_orange.png" /></a>
                    </li>
                    <li>
                        <img src="Image/1.jpg" />
                        <span class="application_title">标题名称</span>
                        <hr />
                        <p>内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介内容简介</p>
                        <a href="#">查看更多 
                            <img src="Image/triangle_right_orange.png" /></a>
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
