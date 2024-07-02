<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="FirstPractices.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
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
            <h1 class="page-title">Registration Page</h1>
            <asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label>
            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblSurname" runat="server" Text="Surname"></asp:Label>
            <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblCPass" runat="server" Text="Confirm Password"></asp:Label>
            <asp:TextBox ID="txtCPass" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="BtnRegister" runat="server" Text="Register" OnClick="BtnRegister_Click" />
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server" Text="Information"></asp:Label>
        </div>
    </form>
</body>
</html>
