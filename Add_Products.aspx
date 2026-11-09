<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Products.aspx.cs" Inherits="CompanyProject.Add_Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Add_Products.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <h1>Add Products</h1>
                <p>

                    <asp:Label ID="lblWelcome" runat="server"></asp:Label>
                </p>
                <p>

                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Show Company</asp:LinkButton>
                </p>

               

                <table border="2">
                    <tr>
                        <td>Product Company:</td>
                        <td>

                            <asp:DropDownList ID="drpcmp" runat="server" AutoPostBack="True">
                                <asp:ListItem>--Select Company--</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>  
                  
                            
                        </td>
                    </tr>

                   

                    <tr>
                        <td>Product Name</td>
                        <td>
                            <asp:TextBox ID="txtpnm" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Product Model</td>
                        <td>
                            <asp:TextBox ID="txtmodel" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Product Description
                        </td>
                        <td>
                            <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Product Weight</td>
                        <td>
                            <asp:TextBox ID="txtweight" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Product Configuration</td>
                        <td>
                            <asp:TextBox ID="txtconfig" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Product Image</td>
                        <td>
                            <asp:FileUpload ID="imgUpload" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Product Price</td>
                        <td>
                            <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnAdd" runat="server"
                                Text="Add Product"
                                OnClick="btnAdd_Click" />
                        </td>
                    </tr>

                </table>
            </center>
        </div>
    </form>
</body>
</html>


