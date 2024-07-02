<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="FirstPractices.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
  <style>
     .page-title {
         text-align: center;
         font-weight: bold;
         margin-top: 20px;
         font-size: 24px;
     }
     .form-container {
         text-align: center;
         margin-top: 40px;
     }
 </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="page-title">Admin Page</h1>
            <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="BtnEnter" runat="server" Text="Enter" OnClick="btnLogin_Click" />

            <br />
            <br />
            <br />
            <asp:Label ID="lblmessage" runat="server" Text="message" Visible="False"></asp:Label> 
            
         </div>
    </form>
</body>
</html>
