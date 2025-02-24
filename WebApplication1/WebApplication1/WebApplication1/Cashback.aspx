<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cashback.aspx.cs" Inherits="WebApplication1.Cashback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        #form1 {
            text-align: center;
        }
        .auto-style2 {}
        .auto-style3 {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Mobile No:"></asp:Label>
            <br />
            <br />
        </div>
        <asp:TextBox ID="Mobile" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Payment ID:"></asp:Label>
        </p>
        <asp:TextBox ID="Payment" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Benefit ID:"></asp:Label>
        </p>
        <asp:TextBox ID="Benefit" runat="server"></asp:TextBox>
    <p class="auto-style1">
        <asp:Label ID="Message" runat="server" Text=""></asp:Label>
        </p>
        <asp:Button ID="GetCash" runat="server" CssClass="auto-style2" Text="Get Cashback" Width="115px" OnClick="GetCash_Click" />
        <p>
            <asp:Button ID="Return" runat="server" Text="Return" CssClass="auto-style3" Height="22px" OnClick="Return_Click" Width="61px" />
        </p>
    </form>
    </body>
</html>
