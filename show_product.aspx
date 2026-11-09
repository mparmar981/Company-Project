<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="show_product.aspx.cs"
    Inherits="CompanyProject.show_product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Products</title>
    <link href="show_product.css" rel="stylesheet" type="text/css" />

</head>

<body>

    <form id="form1" runat="server">

        <div>

            <h1>Products</h1>

            <asp:Label
                ID="Label3"
                runat="server">
            </asp:Label>

            &nbsp;&nbsp;

            <a href="show_company.aspx">
                &larr; Back to Companies
            </a>

            &nbsp;&nbsp;|&nbsp;&nbsp;

            <a href="Add_To_Cart.aspx">
                View Cart
            </a>

            <br />
            <br />

            <asp:DataList
                ID="DataList1"
                runat="server"
                RepeatDirection="Horizontal"
                RepeatColumns="4"
                RepeatLayout="Table"
                OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">

                <ItemTemplate>

                    <table
                        border="1"
                        cellpadding="10"
                        cellspacing="0"
                        style="margin:10px; width:220px;">

                        <tr>
                            <td align="center">

                                <asp:Image
                                    ID="Image1"
                                    runat="server"
                                    ImageUrl='<%# Eval("Prod_Img") %>'
                                    Width="180px"
                                    Height="180px" />

                                <br />
                                <br />

                                <asp:Label
                                    ID="Label1"
                                    runat="server"
                                    Font-Bold="true"
                                    Font-Size="Large"
                                    Text='<%# Eval("Prod_Name") %>'>
                                </asp:Label>

                                <br />
                                <br />

                                <asp:Label
                                    ID="Label2"
                                    runat="server"
                                    Text='<%# "Model: " + Eval("Prod_Model") %>'>
                                </asp:Label>

                                <br />
                                <br />

                                <asp:Label
                                    ID="Label4"
                                    runat="server"
                                    ForeColor="Green"
                                    Font-Bold="true"
                                    Text='<%# Eval("Prod_Price") %>'>
                                </asp:Label>

                                <br />
                                <br />

                                <asp:LinkButton
                                    ID="btnView"
                                    runat="server"
                                    Text="View Details"
                                    CommandName="cmd_view"
                                    CommandArgument='<%# Eval("Prod_Id") %>'>
                                </asp:LinkButton>

                                &nbsp;&nbsp;

                                <asp:LinkButton
                                    ID="btnCart"
                                    runat="server"
                                    Text="Add to Cart"
                                    CommandName="cmd_cart"
                                    CommandArgument='<%# Eval("Prod_Id") %>'>
                                </asp:LinkButton>

                            </td>
                        </tr>

                    </table>

                </ItemTemplate>

            </asp:DataList>

            <br />

            <asp:Label
                ID="lblEmpty"
                runat="server"
                Text="No products found for this company."
                Visible="false">
            </asp:Label>

        </div>

    </form>

</body>

</html>
