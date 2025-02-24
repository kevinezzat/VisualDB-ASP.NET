<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Renew.aspx.cs" Inherits="WebApplication1.Renew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FFFFFF;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            font-size: large;
            background-color: #FFFFFF;
        }
        .auto-style5 {
            text-align: center;
        }
        #form1 {
            text-align: center;
        }
        .auto-style6 {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p class="auto-style5" style="background-color: #FFFFFF">
            <span class="auto-style4">Mobile Number:&nbsp;&nbsp; </span>&nbsp;<asp:TextBox ID="Mobile" runat="server" Height="16px"></asp:TextBox>
        </p>
        <p class="auto-style5" style="background-color: #FFFFFF">
            <span class="auto-style1"><span class="auto-style3">Amount:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&nbsp;&nbsp; </span>&nbsp;<asp:TextBox ID="Amnt" runat="server" Height="16px"></asp:TextBox>
        </p>
        <p class="auto-style5" style="background-color: #FFFFFF">
            <span class="auto-style3">Payment Method</span>:<span class="auto-style1"> </span>&nbsp;<span class="auto-style1"><asp:DropDownList ID="Method" runat="server" Height="20px" Width="127px">
                <asp:ListItem>credit</asp:ListItem>
                <asp:ListItem>cash</asp:ListItem>
            </asp:DropDownList>
            </span>
        </p>
        <p class="auto-style5" style="background-color: #FFFFFF">
            <span class="auto-style1"><span class="auto-style3">Plan ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </span>&nbsp;</span>
            <asp:TextBox ID="Plan" runat="server" Height="16px" style="text-align: center"></asp:TextBox>
        </p>
        <p class="auto-style5" style="background-color: #FFFFFF">
        <asp:Button ID="RenewPlan" runat="server" Text="Renew Plan" OnClick="Button1_Click" Width="120px" />
        </p>
        <div class="auto-style5">
        <asp:Label ID="Message" runat="server" Text=""></asp:Label>
        </div>
        <asp:Button ID="Return" runat="server" Text="Return" CssClass="auto-style6" Height="19px" OnClick="Return_Click" Width="65px" />
    </form>
</body>
</html>
