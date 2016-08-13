<%@ Page Title="" Language="C#" MasterPageFile="~/Backup/base.Master" AutoEventWireup="true" CodeBehind="product_banner.aspx.cs" Inherits="HZCGZM_Web.Backup.product_banner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="sdcProductBanner" runat="server" ConnectionString="<%$ ConnectionStrings:HZCGZMConnectionString %>" SelectCommand="SELECT [imageId], [imageURL] FROM [tbImage] WHERE (([bindId] = @bindId) AND ([imageState] = @imageState) AND ([imageType] = @imageType))">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="bindId" QueryStringField="id" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="imageState" Type="Int32" />
            <asp:Parameter DefaultValue="7" Name="imageType" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <div>编辑产品展示图&nbsp;&nbsp;&nbsp;&nbsp;<a href='product_detail.aspx?id=<%=Request.QueryString["id"] %>'>返回详情</a></div>
    <br />
    <table class="table table-bordered table-hover table-striped">
        <tbody>
            <tr>
                <td>产品图：</td>
                <td>
                    <asp:FileUpload ID="fuProductBanner" runat="server" />
                    <asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="btnAdd_Click" />
                    注：建议尺寸 宽580px 高387px;
                    <br />
                    <br />
                    <br />
                    <ul>
                        <asp:Repeater ID="rptProductBanner" runat="server" DataSourceID="sdcProductBanner">

                            <ItemTemplate>
                                <li>
                                    <asp:Image ID="imgProductBanner" Width="580" Height="387" runat="server" ImageUrl='<%#Eval("imageURL") %>' />
                                    <asp:LinkButton ID="lbDelete" runat="server" OnClick="lbDelete_Click">删除</asp:LinkButton>
                                    <asp:HiddenField ID="hfImageId" runat="server" Value='<%#Eval("imageId") %>' />
                                    <br />
                                </li>
                            </ItemTemplate>

                        </asp:Repeater>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
