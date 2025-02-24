<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="5mon.aspx.cs" Inherits="WebApplication1._5mon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {}
        .auto-style4 {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Label ID="Label1" runat="server" Text="Please Enter Mobile No"></asp:Label>
        </div>
        <div class="auto-style1">
        <asp:TextBox ID="MobileNoText" runat="server" CssClass="auto-style3" Width="144px"></asp:TextBox>
        </div>
        <div class="auto-style1">
            <div>
                <asp:Label ID="Message" runat="server" Text=""></asp:Label>
                <asp:GridView ID="PlansView" runat="server">
                </asp:GridView>
            </div>
        </div>
        <p class="auto-style2">
        <asp:Button ID="ShowPlansButton" runat="server" Text="Show Plans" Width="140px" OnClick="ShowPlansButton_Click" style="text-align: center; color: #000000; background-color: #CCCCCC;" />
        </p>
        <p class="auto-style2">
            <asp:Button ID="Return" runat="server" Text="Return" CssClass="auto-style4" Height="17px" OnClick="Return_Click" Width="52px" />
        </p>
    </form>
</body>
</html>
