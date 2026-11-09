<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="show_company.aspx.cs"
    Inherits="CompanyProject.show_company" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>All Companies</title>
    <link href="show_company.css" rel="stylesheet" type="text/css" />
</head>

<body>

    <form id="form1" runat="server">

        <div>

            <h1>All Companies</h1>

            <asp:Label
                ID="Label1"
                runat="server">
            </asp:Label>
            

            
                <asp:HyperLink
                    ID="ShowCart"
                    runat="server"
                    NavigateUrl="Add_To_Cart.aspx">
                     View Cart
                </asp:HyperLink>
            <br /><br />

            <asp:DataList
                ID="DataList1"
                runat="server"
                RepeatDirection="Horizontal"
                OnItemCommand="DataList1_ItemCommand">

                <ItemTemplate>

                    <asp:Image
                        ID="Image1"
                        runat="server"
                        ImageUrl='<%# Eval("Comp_Cover_Img") %>'
                        Height="200px"
                        Width="200px" />

                    <br />

                    <asp:LinkButton
                        ID="LinkButton1"
                        runat="server"
                        Text='<%# Eval("Comp_Name") %>'
                        CommandName="cmd_company"
                        CommandArgument='<%# Eval("Comp_Id") %>'>
                    </asp:LinkButton>

                    <br /><br />

                </ItemTemplate>

            </asp:DataList>

        </div>

    </form>

</body>

</html>
