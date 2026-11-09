<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="CompanyProject.ViewDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="ViewDetails.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
    <h1>Product Details</h1>
    <p>
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    </p>
    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" Height="200" Width="200" ImageUrl='<%# Eval("Prod_Img") %>' />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Prod_Price") %>'></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Prod_Config") %>'></asp:Label>
            <br />
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Prod_Desc") %>'></asp:Label>
            <br />
        </ItemTemplate>
    </asp:DataList>
</center>
        </div>
    </form>
</body>
</html>

