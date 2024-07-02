using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;

namespace FirstPractices
{
    public partial class ProductPage : Page
    {
        SqlConnection connect = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\AOS-PC\Documents\philly_Project\FirstPractices\FirstPractices\App_Data\Database.mdf;Integrated Security=True");

        List<Product> selectedProducts = new List<Product>();
        double totalXV = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblTotalXV.Text = "0.00";
                lblWVMessage.Text = "0.00";
            }
        }

        protected void chkDrink1_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        protected void chkDrink2_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        protected void chkDrink3_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        protected void chkMeat1_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        protected void chkMeat2_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        protected void chkMeat3_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        protected void chkSpice1_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        protected void chkSpice2_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        protected void chkSpice3_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        protected void chkChoco1_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        protected void chkChoco2_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        protected void chkChoco3_CheckedChanged(object sender, EventArgs e)
        {
            priceUpdate();
        }

        public void priceUpdate()
        {
            double totalXV = 0;
            selectedProducts.Clear();
            double price = 0;

            lblWVMessage.Visible = true;

            if (chkDrink1.Checked)
            {
                double.TryParse(chkDrink1.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "Coke", ProductPrice = price });
            }
            if (chkDrink2.Checked)
            {
                double.TryParse(chkDrink2.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "Pepsi", ProductPrice = price });
            }
            if (chkDrink3.Checked)
            {
                double.TryParse(chkDrink3.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "Sprite", ProductPrice = price });
            }
            if (chkMeat1.Checked)
            {
                double.TryParse(chkMeat1.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "Chicken", ProductPrice = price });
            }
            if (chkMeat2.Checked)
            {
                double.TryParse(chkMeat2.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "Beef", ProductPrice = price });
            }
            if (chkMeat3.Checked)
            {
                double.TryParse(chkMeat3.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "Pork", ProductPrice = price });
            }
            if (chkSpice1.Checked)
            {
                double.TryParse(chkSpice1.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "Salt", ProductPrice = price });
            }
            if (chkSpice2.Checked)
            {
                double.TryParse(chkSpice2.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "Pepper", ProductPrice = price });
            }
            if (chkSpice3.Checked)
            {
                double.TryParse(chkSpice3.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "Paprika", ProductPrice = price });
            }
            if (chkChoco1.Checked)
            {
                double.TryParse(chkChoco1.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "Milk Chocolate", ProductPrice = price });
            }
            if (chkChoco2.Checked)
            {
                double.TryParse(chkChoco2.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "Dark Chocolate", ProductPrice = price });
            }
            if (chkChoco3.Checked)
            {
                double.TryParse(chkChoco3.Attributes["data-price"], out price);
                totalXV += price;
                selectedProducts.Add(new Product { ProductName = "White Chocolate", ProductPrice = price });
            }

            lblTotalXV.Text = totalXV.ToString("F2");
            this.totalXV = totalXV;
            Tax();

            Session["SelectedProducts"] = selectedProducts;
        }

        private void Tax()
        {
            double tax = totalXV * 0.15;
            double totalWithTax = totalXV + tax;

            lblWVMessage.Text = totalWithTax.ToString("F2");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            double totalPriceWithTax = double.Parse(lblWVMessage.Text);
            Session["TotalPriceWithTax"] = totalPriceWithTax;

            Response.Redirect("CheckOut.aspx");
        }

        public class Product
        {
            public string ProductName { get; set; }
            public double ProductPrice { get; set; }
        }
    }
}
