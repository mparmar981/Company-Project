<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_To_Cart.aspx.cs" Inherits="CompanyProject.Add_To_Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cart Details</title>
    <link href="Add_To_Cart.css" rel="stylesheet" type="text/css" />
    <style>
        body { font-family: Segoe UI, Arial, sans-serif; background: #f3f4f8; margin: 0; padding: 30px; }
        .box { max-width: 900px; margin: auto; background: #fff; padding: 25px 30px; border-radius: 12px; box-shadow: 0 4px 14px rgba(0,0,0,.08); }
        h1 { margin: 0 0 5px 0; color: #333; }
        .top { margin-bottom: 15px; color: #555; }
        .top a { color: #4a5bd4; text-decoration: none; font-weight: 600; margin-left: 15px; }
        .grid { width: 100%; border-collapse: collapse; }
        .grid th { background: #4a5bd4; color: #fff; padding: 10px; text-align: center; }
        .grid td { padding: 10px; border-bottom: 1px solid #e5e5e5; text-align: center; }
        .grid select { width: 60px; padding: 4px; }
        .grid a { color: #4a5bd4; font-weight: 600; text-decoration: none; margin: 0 4px; }
        .total { text-align: right; font-size: 20px; font-weight: bold; margin-top: 20px; color: #222; }
        .msg { color: #c0392b; font-weight: 600; }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="box">

            <h1>Cart Details</h1>

            <div class="top">
                <asp:Label ID="Label5" runat="server"></asp:Label>
                <a href="ShowCompany.aspx">&larr; Continue Shopping</a>
            </div>

            <asp:Label ID="lblEmpty" runat="server" CssClass="msg" Text="Your cart is empty." Visible="false"></asp:Label>

            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Cart_Id"
                CssClass="grid"
                GridLines="None"
                OnRowDataBound="GridView1_RowDataBound"
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating"
                OnRowCancelingEdit="GridView1_RowCancelingEdit">

                <Columns>

                    <asp:BoundField DataField="Prod_Id" HeaderText="Product Id" ReadOnly="true" />

                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Prod_Img") %>' Width="80px" Height="80px" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Prod_Name" HeaderText="Product Name" ReadOnly="true" />

                    <asp:BoundField DataField="Prod_Price" HeaderText="Price" ReadOnly="true" DataFormatString="₹{0:N2}" />

                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quentity") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlQty" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="true" DataFormatString="₹{0:N2}" />

                    <asp:CommandField HeaderText="Action"
                        ShowEditButton="True"
                        EditText="Edit"
                        UpdateText="Update"
                        CancelText="Cancel" />

                </Columns>
            </asp:GridView>

            <div class="total">
                Grand Total:
                <asp:Label ID="lblGrand" runat="server" Text="₹0.00"></asp:Label>
            </div>

            <div style="text-align: right; margin-top: 15px;">
                <asp:HyperLink ID="lnkProceedToBuy" runat="server"
                    NavigateUrl="My_Orders.aspx"
                    Text="Proceed to Buy"
                    Style="display: inline-block; background-color: #4b5bdc; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; font-size: 13px; font-weight: bold;">
                </asp:HyperLink>
            </div>

        </div>
    </form>
</body>
</html>

