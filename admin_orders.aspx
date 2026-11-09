<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_orders.aspx.cs" Inherits="CompanyProject.admin_orders" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Order Details</title>
</head>
<body>
    <form id="form1" runat="server">

        <center>
            <h1>Manage Orders</h1>

            <asp:Label ID="lblMessage" runat="server"></asp:Label>

            <br /><br />

            <asp:HyperLink ID="lnkAllOrders" runat="server"
                NavigateUrl="admin_order.aspx"
                Text="Show All Orders">
            </asp:HyperLink>

            <br /><br />

            <asp:GridView ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Order_Id"
                Width="100%"
                CellPadding="10"
                GridLines="Both"
                EmptyDataText="No Orders Found"
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating"
                OnRowCancelingEdit="GridView1_RowCancelingEdit">

                <Columns>

                    <asp:BoundField DataField="Order_Id"
                        HeaderText="Order ID" ReadOnly="True" />

                    <asp:BoundField DataField="Order_No"
                        HeaderText="Order No" ReadOnly="True" />

                    <asp:BoundField DataField="Name"
                        HeaderText="Customer Name" ReadOnly="True" />

                    <asp:BoundField DataField="Prod_Name"
                        HeaderText="Product Name" ReadOnly="True" />

                    <asp:BoundField DataField="Quentity"
                        HeaderText="Quantity" ReadOnly="True" />

                    <asp:BoundField DataField="Amount"
                        HeaderText="Amount"
                        DataFormatString="{0:0.00}"
                        ReadOnly="True" />

                    <asp:BoundField DataField="Order_Date"
                        HeaderText="Order Date"
                        DataFormatString="{0:dd/MM/yyyy}"
                        ReadOnly="True" />

                    <asp:BoundField DataField="Ship_Address"
                        HeaderText="Shipping Address" ReadOnly="True" />

                    <asp:BoundField DataField="Pay_Method"
                        HeaderText="Payment Method" ReadOnly="True" />

                    <asp:BoundField DataField="Pay_Status"
                        HeaderText="Payment Status" ReadOnly="True" />

                    <asp:TemplateField HeaderText="Order Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server"
                                Text='<%# Eval("Order_Status") %>' />
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlStatus" runat="server"
                                SelectedValue='<%# Bind("Order_Status") %>'>

                                <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                <asp:ListItem Value="Processing">Processing</asp:ListItem>
                                <asp:ListItem Value="Shipped">Shipped</asp:ListItem>
                                <asp:ListItem Value="Delivered">Delivered</asp:ListItem>

                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField
                        HeaderText="Action"
                        ShowEditButton="True"
                        EditText="Edit"
                        UpdateText="Update"
                        CancelText="Cancel" />

                </Columns>
            </asp:GridView>
        </center>

    </form>
</body>
</html>

