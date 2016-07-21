<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HZCGZM_Web.Front.index" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>

<asp:Content ID="head_index" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Style/index.css" />
    <link rel="stylesheet" href="Style/slide.css" />
    <script src="Script/jquery-1.8.3.min.js"></script>
    <script src="Script/index.js"></script>
</asp:Content>
<asp:Content ID="content_index" ContentPlaceHolderID="content" runat="server">
    <div class="banner">
        <div class="ck-slide">
            <ul class="ck-slide-wrapper">
                <asp:Repeater ID="rptBanner" runat="server" DataSourceID="sdcBanner">
                    <ItemTemplate>
                        <li>
                            <a href='<%#Eval("bannerActionURL") %>'>
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
                <%--                <li>
                    <a href="javascript:">
                        <img src="Image/1.jpg" alt="" /></a>
                </li>
                <li style="display: none">
                    <a href="javascript:">
                        <img src="Image/2.jpg" alt="" /></a>
                </li>
                <li style="display: none">
                    <a href="javascript:">
                        <img src="Image/3.jpg" alt="" /></a>
                </li>
                <li style="display: none">
                    <a href="javascript:">
                        <img src="Image/4.jpg" alt="" /></a>
                </li>
                <li style="display: none">
                    <a href="javascript:">
                        <img src="Image/5.jpg" alt="" /></a>
                </li>--%>
            </ul>
            <a href="javascript:;" class="ctrl-slide ck-prev">上一张</a> <a href="javascript:;" class="ctrl-slide ck-next">下一张</a>
            <div class="ck-slidebox">
                <div class="slideWrap">
                    <ul class="dot-wrap">
                        <asp:Repeater ID="rptDot" runat="server" DataSourceID="sdcBanner"> 
                            <ItemTemplate>
                                <li><em><%#Eval("rowId") %></em></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    <%--    <li class="current"><em>1</em></li>
                        <li><em>2</em></li>
                        <li><em>3</em></li>
                        <li><em>4</em></li>
                        <li><em>5</em></li>--%>
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
                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/sinaminiblog.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/kaixin001.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/renren.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/baiducang.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/qq.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/qqshuqian.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/qqzone.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/sinavivi.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/sohubai.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/douban.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/zhuaxia.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/gmail.gif" />
                        </div>
                    </div>

                    <div class="product_array">
                        <div class="product_img">
                            <img src="Image/delicious.gif" />
                        </div>
                    </div>

                </div>
            </div>
            <div class="img_r">
                <img src="Image/arrow_right_orange.png" />
            </div>
        </div>
    </div>
    <div class="more">
        <div class="contact">
            <p>联系我们</p>
            <img src="Image/1.jpg" />
            <div>
                <a href="contact.aspx"><img src="Image/triangle_right_orange.png" /></a>
                <a href="contact.aspx">more</a>
            </div>
        </div>
        <div class="product">
            <p>产品册</p>
            <img src="Image/1.jpg" />
            <div>
                <a href="product.aspx"><img src="Image/triangle_right_orange.png" /></a>
                <a href="product.aspx">more</a>
            </div>

        </div>
        <div class="news">
            <p>新闻资讯</p>
            <img src="Image/1.jpg" />
            <div>
                <a href="news.aspx"><img src="Image/triangle_right_orange.png" /></a>
                <a href="news.aspx">more</a>
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
