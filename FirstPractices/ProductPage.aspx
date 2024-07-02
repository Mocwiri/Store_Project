<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="FirstPractices.ProductPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-container {
            margin-bottom: 20px;
            text-align: center;
        }
        .product-container h3 {
            color: #4CAF50;
        }
        .product-container label {
            display: block;
            margin: 5px 0;
        }
        .total-container {
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
        }
        .checkout-button {
            display: block;
            width: 100%;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
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
        <div class="container">
            <div class="product-container">
                <h3>Drinks</h3>
                <asp:CheckBox ID="chkDrink1" runat="server" ClientIDMode="Static" data-price="28.99" OnCheckedChanged="chkDrink1_CheckedChanged" AutoPostBack="true" />
                <label for="chkDrink1">Coke</label><br />
                <asp:CheckBox ID="chkDrink2" runat="server" ClientIDMode="Static" data-price="22.65" OnCheckedChanged="chkDrink2_CheckedChanged" AutoPostBack="true" />
                <label for="chkDrink2">Pepsi</label><br />
                <asp:CheckBox ID="chkDrink3" runat="server" ClientIDMode="Static" data-price="20" OnCheckedChanged="chkDrink3_CheckedChanged" AutoPostBack="true" />
                <label for="chkDrink3">Sprite</label>
            </div>

            <div class="product-container">
                <h3>Meat</h3>
                <asp:CheckBox ID="chkMeat1" runat="server" ClientIDMode="Static" data-price="55" OnCheckedChanged="chkMeat1_CheckedChanged" AutoPostBack="true" />
                <label for="chkMeat1">Chicken</label><br />
                <asp:CheckBox ID="chkMeat2" runat="server" ClientIDMode="Static" data-price="89.97" OnCheckedChanged="chkMeat2_CheckedChanged" AutoPostBack="true" />
                <label for="chkMeat2">Beef</label><br />
                <asp:CheckBox ID="chkMeat3" runat="server" ClientIDMode="Static" data-price="35.65" OnCheckedChanged="chkMeat3_CheckedChanged" AutoPostBack="true" />
                <label for="chkMeat3">Pork</label>
            </div>

            <div class="product-container">
                <h3>Spices</h3>
                <asp:CheckBox ID="chkSpice1" runat="server" ClientIDMode="Static" data-price="018.35" OnCheckedChanged="chkSpice1_CheckedChanged" AutoPostBack="true" />
                <label for="chkSpice1">Salt</label><br />
                <asp:CheckBox ID="chkSpice2" runat="server" ClientIDMode="Static" data-price="11.25" OnCheckedChanged="chkSpice2_CheckedChanged" AutoPostBack="true" />
                <label for="chkSpice2">Pepper</label><br />
                <asp:CheckBox ID="chkSpice3" runat="server" ClientIDMode="Static" data-price="14.98" OnCheckedChanged="chkSpice3_CheckedChanged" AutoPostBack="true" />
                <label for="chkSpice3">Paprika</label>
            </div>

            <div class="product-container">
                <h3>Chocolates</h3>
                <asp:CheckBox ID="chkChoco1" runat="server" ClientIDMode="Static" data-price="35.56" OnCheckedChanged="chkChoco1_CheckedChanged" AutoPostBack="true" />
                <label for="chkChoco1">Milk Chocolate</label><br />
                <asp:CheckBox ID="chkChoco2" runat="server" ClientIDMode="Static" data-price="88.65" OnCheckedChanged="chkChoco2_CheckedChanged" AutoPostBack="true" />
                <label for="chkChoco2">Dark Chocolate</label><br />
                <asp:CheckBox ID="chkChoco3" runat="server" ClientIDMode="Static" data-price="182.25" OnCheckedChanged="chkChoco3_CheckedChanged" AutoPostBack="true" />
                <label for="chkChoco3">White Chocolate</label>
            </div>

            <div class="total-container">
                Total Excluding VAT: <asp:Label ID="lblTotalXV" runat="server" Text="0.00"></asp:Label>
                <br />
                Total Including VAT: <asp:Label ID="lblWVMessage" runat="server" Text="0.00"></asp:Label>
            </div>

            <asp:Button ID="btnCheckOut" runat="server" OnClick="btnCheckOut_Click" CssClass="checkout-button" Text="Check Out" />
        </div>
    </form>
</body>
</html>
