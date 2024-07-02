<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="FirstPractices.CheckOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout</title>
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
        .grid-item {
            border: 1px solid #ccc;
            padding: 20px;
            text-align: center;
            font-size: 18px;
        }
        .product-list {
            margin-top: 20px;
        }
        .product-item {
            font-size: 16px;
        }
        .total-price {
            font-weight: bold;
            font-size: 20px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="page-title">Checkout Page</h1>
            <div class="form-container">
                <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label><br />
                <asp:Label ID="lblSurname" runat="server" Text="Label"></asp:Label>
                <div class="product-list">
                    <asp:Repeater ID="rptSelectedProducts" runat="server">
                        <ItemTemplate>
                            <div class="product-item">
                                <%# Eval("ProductName") %> - R<%# Eval("ProductPrice", "{0:F2}") %>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="total-price">
                     Shipping Fee: R<asp:Label ID="lblShipping" runat="server" Text=""></asp:Label>
                    <br />
                    Total Price: R<asp:Label ID="lblTotalPrice" runat="server" Text=""></asp:Label>
                </div>
                <br />
                <br />
               <div>

                   <asp:Button ID="btnPay" runat="server" Text="PAY" OnClick="btnPay_Click1" />
                </div>
                <br />
                <br />
                <asp:Label ID="lblmessage" runat="server" Text="message" Visible="False"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
