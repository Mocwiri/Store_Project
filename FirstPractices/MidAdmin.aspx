<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MidAdmin.aspx.cs" Inherits="FirstPractices.MidAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .center-div {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .center-div > * {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center-div">
            <h1>Manage Orders and Employees</h1>
            <asp:TextBox ID="txtFirstName" runat="server" Placeholder="First Name"></asp:TextBox>
            <asp:TextBox ID="txtLastName" runat="server" Placeholder="Last Name"></asp:TextBox>
            <asp:TextBox ID="txtPosition" runat="server" Placeholder="Position"></asp:TextBox>
            <asp:Button ID="btnEmployees" runat="server" Text="Add Employees" OnClick="btnEmployees_Click" />
            <br />

            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowEditing="gvOrders_RowEditing" OnRowUpdating="gvOrders_RowUpdating" OnRowCancelingEdit="gvOrders_RowCancelingEdit">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Order ID" ReadOnly="True" />
                    <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True"/>
                    <asp:BoundField DataField="Surname" HeaderText="Surname" ReadOnly="True" />
                    <asp:BoundField DataField="Paid" HeaderText="Paid" ReadOnly="True" />
                    <asp:BoundField DataField="Bought" HeaderText="Bought" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlStatus" runat="server">
                                <asp:ListItem Value="Seller">Seller</asp:ListItem>
                                <asp:ListItem Value="Packer">Packer</asp:ListItem>
                                <asp:ListItem Value="Shipped">Shipped</asp:ListItem>
                                <asp:ListItem Value="Delivered">Delivered</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnUOrders" runat="server" Text="Update Orders" OnClick="btnUOrders_Click" />
        </div>
    </form>
</body>
</html>
