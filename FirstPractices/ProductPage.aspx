<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="FirstPractices.ProductPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products</title>
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
    .category-title {
             font-weight: bold;
             font-size: 20px;
             margin-bottom: 10px;
    }
    .checkbox-list {
            text-align: left;
            margin-top: 10px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="page-title">Product Page</h1>
            <div class="grid-container">
                <div class="grid-item">
                    <div class="category-title">Drinks</div>
                    <div class="checkbox-list">
                        <asp:CheckBox ID="chkDrink1" runat="server" Text="Coke" AutoPostBack="true" OnCheckedChanged="chkDrink1_CheckedChanged" data-priceC="25" /><br />
                        <asp:CheckBox ID="chkDrink2" runat="server" Text="Pepsi" AutoPostBack="true" OnCheckedChanged="chkDrink2_CheckedChanged" data-priceP="20.22" /><br />
                        <asp:CheckBox ID="chkDrink3" runat="server" Text="Sprite" AutoPostBack="true" OnCheckedChanged="chkDrink3_CheckedChanged" data-priceS="23.89"/>
                    </div>
                </div>
                <div class="grid-item">
                    <div class="category-title">Meat</div>
                    <div class="checkbox-list">
                        <asp:CheckBox ID="chkMeat1" runat="server" Text="Chicken" AutoPostBack="true" OnCheckedChanged="chkMeat1_CheckedChanged" data-priceCH="89.99" /><br />
                        <asp:CheckBox ID="chkMeat2" runat="server" Text="Beef" AutoPostBack="true" OnCheckedChanged="chkMeat2_CheckedChanged" data-priceB="101.67" /><br />
                        <asp:CheckBox ID="chkMeat3" runat="server" Text="Pork" AutoPostBack="true" OnCheckedChanged="chkMeat3_CheckedChanged" data-pricePork="55" />
                    </div>
                </div>
                <div class="grid-item">
                    <div class="category-title">Spices</div>
                    <div class="checkbox-list">
                        <asp:CheckBox ID="chkSpice1" runat="server" Text="Salt" AutoPostBack="true" OnCheckedChanged="chkSpice1_CheckedChanged" data-priceSalt="18.89"/><br />
                        <asp:CheckBox ID="chkSpice2" runat="server" Text="Pepper" AutoPostBack="true" OnCheckedChanged="chkSpice2_CheckedChanged" data-pricePepper="15.54" /><br />
                        <asp:CheckBox ID="chkSpice3" runat="server" Text="Paprika" AutoPostBack="true" OnCheckedChanged="chkSpice3_CheckedChanged"  data-pricePaprika="22.12"/>
                    </div>
                </div>
                <div class="grid-item">
                    <div class="category-title">Chocolates</div>
                    <div class="checkbox-list">
                        <asp:CheckBox ID="chkChoco1" runat="server" Text="Milk Chocolate" AutoPostBack="true" OnCheckedChanged="chkChoco1_CheckedChanged" data-priceMC="45.99" /><br />
                        <asp:CheckBox ID="chkChoco2" runat="server" Text="Dark Chocolate" AutoPostBack="true" OnCheckedChanged="chkChoco2_CheckedChanged" data-priceDC="39.98"/><br />
                        <asp:CheckBox ID="chkChoco3" runat="server" Text="White Chocolate" AutoPostBack="true" OnCheckedChanged="chkChoco3_CheckedChanged" data-priceWC="120.29" />
                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <asp:Label ID="lblTotalXV" runat="server" Text="Total Excluding VAT: R"></asp:Label>
            <asp:Label ID="lblXVMessage" runat="server" Text="Message" Visible="False"></asp:Label>
            <br />
            <br />
            
            <asp:Label ID="lblTotalWV" runat="server" Text="Total Including VAT: R"></asp:Label>
            <asp:Label ID="lblWVMessage" runat="server" Text="Message" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnCheckOut" runat="server" Text="CheckOut" OnClick="btnCheckOut_Click" /> 
            <br />
            <br />
            <br />
            
        </div>
    </form>
</body>
</html>
