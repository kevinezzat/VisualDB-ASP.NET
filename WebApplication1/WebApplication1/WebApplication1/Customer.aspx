<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="WebApplication1.Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: center;
        }
        .auto-style1 {
            color: #FFFFFF;
            font-weight: 700;
            background-color: #000000;
        }
        .auto-style2 {
            color: #FFFFFF;
            font-weight: 700;
            background-color: #000000;
        }
        .auto-style3 {
            color: #FFFFFF;
            font-weight: 700;
            background-color: #000000;
        }
        .auto-style4 {
            color: #FFFFFF;
            font-weight: 700;
            background-color: #000000;
        }
        .auto-style5 {
            color: #FFFFFF;
            font-weight: 700;
            background-color: #000000;
        }
        .auto-style6 {
            color: #FFFFFF;
            font-weight: 700;
            background-color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>     
            <asp:Button ID="Shops" runat="server" OnClick="Button1_Click" Text="View Shop Details" CssClass="auto-style1" Width="195px" />
        </div>
        
        <p>
            <asp:Button ID="Months" runat="server" Text="Past 5 Months" OnClick="Months_Click" CssClass="auto-style2" Width="195px" />
        </p>
        <asp:Button ID="Renew" runat="server" Text="Renew Subscription" OnClick="Renew_Click" CssClass="auto-style6" Width="195px" />
        <p>
            <asp:Button ID="Cashback" runat="server" Text="Cashback" OnClick="Cashback_Click" CssClass="auto-style3" Width="195px" />
        </p>
        <asp:Button ID="Recharge" runat="server" Text="Recharge" OnClick="Recharge_Click" CssClass="auto-style4" Width="195px" />
        <p>
            <asp:Button ID="Redeem" runat="server" Text="Redeem Voucher" OnClick="Redeem_Click" CssClass="auto-style5" Width="195px" />
        </p>
        
    </form>
</body>
</html>

