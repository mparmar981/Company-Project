<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="login.aspx.cs"
    Inherits="CompanyProject.login" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Login</title>
    <link href="login.css" rel="stylesheet" type="text/css" />
</head>

<body>

<form id="form1" runat="server">

    <h2>Login</h2>

    <asp:Label ID="Label1" runat="server"
        Text="Username">
    </asp:Label>

    <br />

    <asp:TextBox ID="txtusername" runat="server">
    </asp:TextBox>

    <br /><br />

    <asp:Label ID="Label2" runat="server"
        Text="Email">
    </asp:Label>

    <br />

    <asp:TextBox ID="txtemail" runat="server"
        TextMode="Email">
    </asp:TextBox>

    <br /><br />

    <asp:Button ID="login_btn" runat="server"
        Text="Login"
        OnClick="login_btn_Click" />

</form>

</body>
</html>