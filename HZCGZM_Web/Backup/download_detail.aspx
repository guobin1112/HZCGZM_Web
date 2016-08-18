<%@ Page Title="" Language="C#" MasterPageFile="~/Backup/base.Master" AutoEventWireup="true" CodeBehind="download_detail.aspx.cs" Inherits="HZCGZM_Web.Backup.download_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 51px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div>
        <asp:Label ID="lblIntro" runat="server" Text="产品册编辑"></asp:Label>
    </div>
    <br />
    <table class="table table-bordered table-hover table-striped">
        <tbody>
            <tr>
                <td>产品册名称：</td>
                <td>
                    <asp:TextBox ID="tbDownloadName" CssClass="login_input" runat="server" MaxLength="20"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>产品册名称-English：</td>
                <td>
                    <asp:TextBox ID="tbDownloadNameEN" CssClass="login_input" runat="server" MaxLength="20"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>展示图：</td>
                <td>
                    <asp:FileUpload ID="fuDownloadImage" runat="server" /><span>注：建议尺寸  宽 124px 高 240px</span>
                    <br />
                    <br />
                    <asp:Image ID="imgDownload" Width="124px" Height="240px" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">产品册pdf：</td>
                <td class="auto-style1">
                    <asp:FileUpload ID="fuDownloadPdf" runat="server" />
                    <br />
                    <asp:HyperLink ID="hlPdf" runat="server">查看pdf
                    </asp:HyperLink>
                    <br />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="保   存" CssClass="btn" OnClick="btnSave_Click" />
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
