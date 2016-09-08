<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="support.aspx.cs" Inherits="HZCGZM_Web.Front.support" %>

<%@ MasterType VirtualPath="~/Front/base.Master" %>

<asp:Content ID="head_support" ContentPlaceHolderID="head" runat="server">
    <link href="Style/support.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="content_support" ContentPlaceHolderID="content" runat="server">
        <div class="content" style="min-height:2200px">
        <div class="left nav_left">
            <div class="top">
               <%=Resources.lang.oem_support%>
            </div>
            <ul>  
                <li><asp:LinkButton ID="lbPackageDesign" runat="server" OnClick="lbPackageDesign_Click"><%=Resources.lang.package_design%></asp:LinkButton><img src="Image/triangle_right_orange.png" /></li>
                <li><asp:LinkButton ID="lbPromotionMaterialDesign" runat="server" OnClick="lbPromotionMaterialDesign_Click"><%=Resources.lang.promotion_material_design%><img src="Image/triangle_right_orange.png" /></asp:LinkButton></li>
                <li><asp:LinkButton ID="lbProducingProcess" runat="server" OnClick="lbProducingProcess_Click"><%=Resources.lang.producing_process%></asp:LinkButton><img src="Image/triangle_right_orange.png" /></li>
            </ul>

        </div>
        <div class="right content_right">
            <div class="support_top">
                <asp:Label ID="lblsupportType" runat="server" Text="" CssClass="left"></asp:Label>
                <span class="right">  <%=Resources.lang.location%>：  <%=Resources.lang.oem_support%></span>
                <img src="Image/home.png" class="right" />
            </div>
          <div id="divPackageDesignDetail" runat="server">
              <%=Resources.lang.package_design_detail%>
          </div>
            <div id="divPromotionMaterialDesign" runat="server">
              <%=Resources.lang.promotion_material_design_detail%>
          </div>
            <div id="divProducingProcessDetail" runat="server">
              <%=Resources.lang.producing_process_detail%>
          </div>
        </div>
    </div>
</asp:Content>
