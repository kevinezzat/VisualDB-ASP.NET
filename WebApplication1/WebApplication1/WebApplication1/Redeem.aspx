<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Redeem.aspx.cs" Inherits="WebApplication1.Redeem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: center;
        }
        .auto-style1 {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Mobile No:"></asp:Label>
        </div>
        <asp:TextBox ID="Mobile" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Voucher ID:"></asp:Label>
        </p>
        <asp:TextBox ID="Voucher" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Message" runat="server" Text=""></asp:Label>
        </p>
        <asp:Button ID="RedeemVoucher" runat="server" Text="Redeem" OnClick="RedeemVoucher_Click" />
        <p>
            <asp:Button ID="Return" runat="server" Text="Return" CssClass="auto-style1" Height="18px" OnClick="Return_Click" Width="59px" />
        </p>
    </form>
</body>
</html>
