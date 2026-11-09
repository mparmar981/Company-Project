<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="My_Orders.aspx.cs" Inherits="CompanyProject.My_Orders" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Confirmation</title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <h1>Order Confirmation</h1>

            <a href="Add_To_Cart.aspx">Back to Cart</a>

            <br /><br />

            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

            <br /><br />

            <table border="2" cellpadding="10">
                <tr>
                    <th colspan="4">Order Details</th>
                </tr>
                <tr>
                    <td>Order No</td>
                    <td>
                        <asp:TextBox ID="txtordno" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>Order Date</td>
                    <td>
                        <asp:TextBox ID="txtorddate" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <br />

            <table border="2" cellpadding="10">
                <tr>
                    <th colspan="2">Customer Details</th>
                </tr>
                <tr>
                    <td>Customer Name</td>
                    <td>
                        <asp:TextBox ID="txtcustname" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Mobile</td>
                    <td>
                        <asp:TextBox ID="txtmobile" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <br />

            <table border="2" cellpadding="10">
                <tr>
                    <th colspan="2">Shipping Details</th>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox ID="txtaddress" runat="server"
                            TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <br />

            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                CellPadding="10"
                GridLines="Both"
                EmptyDataText="Your cart is empty">

                <Columns>
                    <asp:TemplateField HeaderText="Product Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server"
                                ImageUrl='<%# Eval("Prod_Img") %>'
                                Width="80px" Height="80px" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Prod_Name"
                        HeaderText="Product Name" />

                    <asp:BoundField DataField="Quentity"
                        HeaderText="Quantity" />

                    <asp:BoundField DataField="Prod_Price"
                        HeaderText="Price"
                        DataFormatString="{0:0.00}" />

                    <asp:BoundField DataField="Total"
                        HeaderText="Total"
                        DataFormatString="{0:0.00}" />
                </Columns>
            </asp:GridView>

            <br />

            <table border="2" cellpadding="10">
                <tr>
                    <td>Sub Total</td>
                    <td>
                        <asp:TextBox ID="txtsubtotal" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Delivery Charge</td>
                    <td>
                        <asp:TextBox ID="txtdelcharge" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Grand Total</td>
                    <td>
                        <asp:TextBox ID="txtgrandtotal" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Payment Method</td>
                    <td>
                        <asp:RadioButtonList ID="rblpay" runat="server"
                            RepeatDirection="Horizontal"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="rblpay_SelectedIndexChanged">
                            <asp:ListItem Value="Cash" Selected="True">Cash</asp:ListItem>
                            <asp:ListItem Value="Banking">Banking</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>Payment Status</td>
                    <td>
                        <asp:TextBox ID="txtpaystatus" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Order Status</td>
                    <td>
                        <asp:TextBox ID="txtorderstatus" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <br />

            <asp:Button ID="btn_place" runat="server"
                Text="Place Order"
                OnClick="btn_place_Click" />
        </center>
    </form>
</body>
</html>

