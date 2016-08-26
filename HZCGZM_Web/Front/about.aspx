<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="HZCGZM_Web.Front.about" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>
<asp:Content ID="head_about" ContentPlaceHolderID="head" runat="server">
    <link href="Style/about.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_about" ContentPlaceHolderID="content" runat="server">
    <img class="about" src="../upload/about.jpg" style="width:960px" />
    <div class="nav_about">
        <img src="Image/home.png" />
        <span><%=Resources.lang.location%>：<%=Resources.lang.about_us%> - <%=Resources.lang.company_profile%></span>
    </div>
    <div class="content">
        <div class="left nav_left">
            <div class="top">
                <%=Resources.lang.about_us%>
            </div>
            <ul>
                <li a class="current"><a  href="about.aspx"><%=Resources.lang.company_profile%><img src="Image/triangle_right_orange.png" /></a></li>
            </ul>

        </div>
        <div class="right content_right">
           <%-- <p>
                &nbsp;&nbsp;&nbsp;&nbsp;杭州陈光照明科技有限公司是一家专业从事各类照明产品（CFL、LED）设计、研发、销售的科技服务型企业。成立于2006年的陈光照明，以“提供照明系统解决方案，改善人们的生活品质和生存环境”为使命，致力于全球照明市场的开发和服务。公司有着优秀的销售团队，为客户带来专业、诚信、值得信赖的服务理念；以最合理的价格，最完善的服务，提供最优质的产品为服务宗旨，赢得海内外客户的青睐。
            </p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;公司的所属地：杭州临安。作为中国最大的照明基地，距上海和宁波港各250公里，便利的交通、良好的照明发展氛围，为公司拥有优秀的研发和销售团队提供发展的源泉，同时为节能照明事业的发展提供综合、行之有效的管理系统。</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;公司积极开拓市场，提高“辰光”品牌影响力，在广泛的应用中（商业照明、室内照明、户外照明、工程照明等）为客户提供持续的改进方案。</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;我们愿与您共同携手发展未来，感谢您的关注和支持！</p>
            <br />
            <p>&nbsp;&nbsp;&nbsp;&nbsp;企业目标：发展节能环保的照明事业，做专业、诚信、优秀的品牌供应商</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;企业愿景：辰照四大洋，光明五大洲</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;经营理念：专业、诚信、值得信赖</p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;服务宗旨：以最合理的价格，最完善的服务，提供最优质的产品</p>--%>

            <%=Resources.lang.about %>
        </div>
    </div>
</asp:Content>
