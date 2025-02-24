<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recharge.aspx.cs" Inherits="WebApplication1.Recharge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: center;
            height: 265px;
        }
        .auto-style1 {}
        .auto-style2 {}
        .auto-style3 {}
        .auto-style4 {}
        .auto-style5 {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Mobile No:"></asp:Label>
        <div>
        </div>
        <asp:TextBox ID="Mobile" runat="server" CssClass="auto-style4" Height="16px" Width="100px"></asp:TextBox>
        <p>
        <asp:Label ID="Label2" runat="server" Text="Amount:"></asp:Label>
        </p>
        <asp:TextBox ID="Amount" runat="server" CssClass="auto-style3" Height="16px" Width="100px"></asp:TextBox>
        <p>
        <asp:Label ID="Label3" runat="server" Text="Payment Method:"></asp:Label>
        </p>
        <asp:DropDownList ID="Method" runat="server" CssClass="auto-style1" Height="16px" Width="108px">
            <asp:ListItem>credit</asp:ListItem>
            <asp:ListItem>cash</asp:ListItem>
        </asp:DropDownList>
        <p>
            <asp:Button ID="RechargeButton" runat="server" Text="Recharge" CssClass="auto-style2" Height="24px" Width="116px" OnClick="RechargeButton_Click" />
        </p>
        <asp:Label ID="Message" runat="server" Text=""></asp:Label>
        <p>
            <asp:Button ID="Return" runat="server" CssClass="auto-style5" Height="19px" Text="Return" Width="55px" OnClick="Return_Click" />
        </p>
    </form>
</body>
</html>
