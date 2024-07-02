<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FirstPractices.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
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
            <h1 class="page-title">Login Page</h1>
            <asp:Label ID="lblLogin" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Enter" OnClick="btnLogin_Click" />
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            <br />
            <br />
            <br />
            <asp:Label ID="lblmessage" runat="server" Text="message" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnAdmin" runat="server" Text="Administrator" OnClick="btnAdmin_Click" />
         </div>
    </form>
</body>
</html>
