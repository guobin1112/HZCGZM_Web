<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HZCGZM_Web.Front.index" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>

<asp:Content ID="head_index" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Style/index.css" />
    <link rel="stylesheet" href="Style/slide.css" />
    <script src="Script/index.js"></script>
</asp:Content>
<asp:Content ID="content_index" ContentPlaceHolderID="content" runat="server">
    <div class="banner">
        <div class="ck-slide">
            <ul class="ck-slide-wrapper">
                <asp:Repeater ID="rptBanner" runat="server" DataSourceID="sdcBanner">
                    <ItemTemplate>
                        <li>
                            <a href='<%#Eval("bannerActionURL").ToString() %>'>
                                <asp:Image ID="img_banner" runat="server" ImageUrl='<%#Eval("imageURL") %>' />
                            </a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="sdcBanner" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="
                    SELECT     dbo.tbBanner.bannerId, dbo.tbBanner.bannerActionURL, dbo.tbImage.bindId, dbo.tbImage.imageURL,ROW_NUMBER() OVER(ORDER BY bannerId) AS rowId
                    FROM         dbo.tbBanner INNER JOIN
                      dbo.tbImage ON dbo.tbBanner.bannerId = dbo.tbImage.bindId
                    WHERE dbo.tbImage.imageState=@imageState and dbo.tbBanner.bannerState=@bannerState and dbo.tbImage.imageType=@imageType and dbo.tbBanner.bannerType=@bannerType
                    ORDER BY dbo.tbBanner.sortNumber">

                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="imageState" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="bannerState" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="imageType" Type="Int32" />
                        <asp:Parameter DefaultValue="1" Name="bannerType" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ul>
            <a href="javascript:;" class="ctrl-slide ck-prev">上一张</a> <a href="javascript:;" class="ctrl-slide ck-next">下一张</a>
            <div class="ck-slidebox">
                <div class="slideWrap">
                    <ul class="dot-wrap">
                        <asp:Repeater ID="rptDot" runat="server" DataSourceID="sdcBanner">
                            <ItemTemplate>
                                <li class="<%# (Container.ItemIndex)==0?"current":"" %>"><em><%#Eval("rowId") %></em></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="gallery">
        <div class="product">
            <div class="img_l">
                <img src="Image/arrow_left_orange.png" />
            </div>
            <div class="product_nav">
                <div class="product_w">
                    <asp:Repeater ID="rptProductCategory" runat="server" DataSourceID="sdcProductCategory">
                        <ItemTemplate>
                            <div class="product_array">
                                <div class="product_name"><%#isEn?Eval("categoryNameEN"):Eval("categoryName") %></div>
                                <div class="product_img">
                                    <a href='product.aspx?type=<%#Eval("categoryId") %>'>
                                        <asp:Image ID="imgProduct" runat="server" ImageUrl='<%#Eval("imageURL") %>' />
                                    </a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="sdcProductCategory" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT tbCategory.categoryId, tbCategory.categoryName,tbCategory.categoryNameEN,tbImage.imageURL FROM tbCategory INNER JOIN tbImage ON tbCategory.categoryId = tbImage.bindId WHERE (tbCategory.categoryState = '1') AND (tbCategory.categoryType = '1') AND (tbImage.imageState = '1') AND (tbImage.imageType = '4')"></asp:SqlDataSource>
                </div>
            </div>
            <div class="img_r">
                <img src="Image/arrow_right_orange.png" />
            </div>
        </div>
    </div>
    <div class="more">
        <div class="contact">
            <p><%=Resources.lang.contact_us%></p>
            <img src="../upload/contact.jpg" />
            <div>
                <a href="contact.aspx">
                    <img src="Image/triangle_right_orange.png" /></a>
                <a href="contact.aspx"><%=Resources.lang.more%></a>
            </div>
        </div>
        <div class="product">
            <p><%=Resources.lang.catalog%></p>
            <img src="../upload/category.jpg" />
            <div>
                <a href="product.aspx">
                    <img src="Image/triangle_right_orange.png" /></a>
                <a href="download.aspx"><%=Resources.lang.more%></a>
            </div>

        </div>
        <div class="news">
            <p><%=Resources.lang.news_center%></p>
            <img src="../upload/news.jpg" />
            <div>
                <a href="news.aspx">
                    <img src="Image/triangle_right_orange.png" /></a>
                <a href="news.aspx"><%=Resources.lang.more%></a>
            </div>
        </div>
    </div>
    <script src="Script/slide.min.js"></script>
    <script>
        $('.ck-slide').ckSlide({
            autoPlay: true,//默认为不自动播放，需要时请以此设置
            dir: 'x',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
            interval: 3000//默认间隔2000毫秒
        });
    </script>
</asp:Content>
