<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="FirstPractices.ProductPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .product-category {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }
        .product-container {
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .product-item {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .total-container {
            margin-top: 20px;
            font-weight: bold;
        }
        .checkout-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .checkout-button:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('input[type="checkbox"]').change(function () {
                if (this.checked) {
                    alert('Product added: ' + $(this).next('label').text());
                } else {
                    alert('Product removed: ' + $(this).next('label').text());
                }

                $('#<%= lblTotalXV.ClientID %>').fadeOut(200).fadeIn(200);
                $('#<%= lblWVMessage.ClientID %>').fadeOut(200).fadeIn(200);
            });

            $('#<%= btnCheckOut.ClientID %>').click(function () {
                $(this).animate({
                    opacity: 0.8,
                    marginLeft: "10px"
                }, 200).animate({
                    opacity: 1,
                    marginLeft: "0px"
                }, 200);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="product-category">
            <h3>Drinks</h3>
            <div class="product-container">
                <div class="product-item">
                    <asp:CheckBox ID="chkDrink1" runat="server" ClientIDMode="Static" data-price="28" OnCheckedChanged="chkDrink1_CheckedChanged" AutoPostBack="true" />
                    <label for="chkDrink1">Coke</label>
                </div>
                <div class="product-item">
                    <asp:CheckBox ID="chkDrink2" runat="server" ClientIDMode="Static" data-price="22" OnCheckedChanged="chkDrink2_CheckedChanged" AutoPostBack="true" />
                    <label for="chkDrink2">Pepsi</label>
                </div>
                <div class="product-item">
                    <asp:CheckBox ID="chkDrink3" runat="server" ClientIDMode="Static" data-price="20.55" OnCheckedChanged="chkDrink3_CheckedChanged" AutoPostBack="true" />
                    <label for="chkDrink3">Sprite</label>
                </div>
            </div>
        </div>

        <div class="product-category">
            <h3>Meat</h3>
            <div class="product-container">
                <div class="product-item">
                    <asp:CheckBox ID="chkMeat1" runat="server" ClientIDMode="Static" data-price="85.55" OnCheckedChanged="chkMeat1_CheckedChanged" AutoPostBack="true" />
                    <label for="chkMeat1">Chicken</label>
                </div>
                <div class="product-item">
                    <asp:CheckBox ID="chkMeat2" runat="server" ClientIDMode="Static" data-price="88.54" OnCheckedChanged="chkMeat2_CheckedChanged" AutoPostBack="true" />
                    <label for="chkMeat2">Beef</label>
                </div>
                <div class="product-item">
                    <asp:CheckBox ID="chkMeat3" runat="server" ClientIDMode="Static" data-price="60.99" OnCheckedChanged="chkMeat3_CheckedChanged" AutoPostBack="true" />
                    <label for="chkMeat3">Pork</label>
                </div>
            </div>
        </div>

        <div class="product-category">
            <h3>Spices</h3>
            <div class="product-container">
                <div class="product-item">
                    <asp:CheckBox ID="chkSpice1" runat="server" ClientIDMode="Static" data-price="18" OnCheckedChanged="chkSpice1_CheckedChanged" AutoPostBack="true" />
                    <label for="chkSpice1">Salt</label>
                </div>
                <div class="product-item">
                    <asp:CheckBox ID="chkSpice2" runat="server" ClientIDMode="Static" data-price="15.94" OnCheckedChanged="chkSpice2_CheckedChanged" AutoPostBack="true" />
                    <label for="chkSpice2">Pepper</label>
                </div>
                <div class="product-item">
                    <asp:CheckBox ID="chkSpice3" runat="server" ClientIDMode="Static" data-price="14.55" OnCheckedChanged="chkSpice3_CheckedChanged" AutoPostBack="true" />
                    <label for="chkSpice3">Paprika</label>
                </div>
            </div>
        </div>

        <div class="product-category">
            <h3>Chocolates</h3>
            <div class="product-container">
                <div class="product-item">
                    <asp:CheckBox ID="chkChoco1" runat="server" ClientIDMode="Static" data-price="89.97" OnCheckedChanged="chkChoco1_CheckedChanged" AutoPostBack="true" />
                    <label for="chkChoco1">Milk Chocolate</label>
                </div>
                <div class="product-item">
                    <asp:CheckBox ID="chkChoco2" runat="server" ClientIDMode="Static" data-price="49.44" OnCheckedChanged="chkChoco2_CheckedChanged" AutoPostBack="true" />
                    <label for="chkChoco2">Dark Chocolate</label>
                </div>
                <div class="product-item">
                    <asp:CheckBox ID="chkChoco3" runat="server" ClientIDMode="Static" data-price="105.65" OnCheckedChanged="chkChoco3_CheckedChanged" AutoPostBack="true" />
                    <label for="chkChoco3">White Chocolate</label>
                </div>
            </div>
        </div>

        <div class="total-container">
            Total Excluding VAT: <asp:Label ID="lblTotalXV" runat="server" Text="0.00"></asp:Label>
            <br />
            Total Including VAT: <asp:Label ID="lblWVMessage" runat="server" Text="0.00"></asp:Label>
        </div>

        <asp:Button ID="btnCheckOut" runat="server" OnClick="btnCheckOut_Click" CssClass="checkout-button" Text="Check Out" />
    </form>
</body>
</html>
