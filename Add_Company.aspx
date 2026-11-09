<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Company.aspx.cs" Inherits="CompanyProject.Add_Company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Add_Company.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
     <h1>Add Company</h1>
     <p>

         <asp:Label ID="lblresult" runat="server"></asp:Label>
     </p>
     <p>
         <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1">Add Products</asp:LinkButton>
     </p>
     <table border="2">
         <tr>
             <td>Company Name</td>
             <td>
                 <asp:TextBox ID="txtnm" runat="server"></asp:TextBox>
             </td>
         </tr>

         <tr>
             <td>Company Owner Name</td>
             <td>
                 <asp:TextBox ID="txtonm" runat="server"></asp:TextBox>
             </td>
         </tr>

         <tr>
             <td>Company Email</td>
             <td>
                 <asp:TextBox ID="txteml" runat="server"></asp:TextBox>
             </td>
         </tr>

         <tr>
             <td>Company Address</td>
             <td>
                 <asp:TextBox ID="txtadd" runat="server"></asp:TextBox>
             </td>
         </tr>

         <tr>
             <td>Company Cover Image</td>
             <td>
                 <asp:FileUpload ID="imgUpload" runat="server" />
             </td>
         </tr>

         <tr>
             <td></td>
             <td>
                 <asp:Button ID="add_comp_btn" runat="server" Text="Add Company" OnClick="add_comp_btn_Click" />
             </td>
         </tr>
     </table>
 </center>
        </div>
    </form>
</body>
</html>
