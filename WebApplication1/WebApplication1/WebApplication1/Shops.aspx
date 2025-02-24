<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shops.aspx.cs" Inherits="WebApplication1.Shops" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .btn-primary {
            text-align: center;
            color: #FFFFFF;
            font-weight: 700;
            background-color: #000000;
        }
        .table-bordered {
            text-align: center;
            margin-left: 0px;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
        }
        #form1 {
            text-align: center;
            height: 192px;
        }
        .auto-style3 {}
        .auto-style4 {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>     
            <asp:Label ID="Message" runat="server" Text=""></asp:Label>
        </div>
        <p>
            <asp:Button ID="ShopsButton" runat="server" CssClass="auto-style3" Text="View Shops" Width="120px" OnClick="ShopsButton_Click1" />
            <asp:GridView ID="ShopsView" runat="server">
            </asp:GridView>
            <asp:Button ID="Return" runat="server" Text="Return" CssClass="auto-style4" Height="18px" OnClick="Return_Click" Width="52px" />
        </p>
    </form>
    </body>
</html>
