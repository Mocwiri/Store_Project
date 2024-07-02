using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace FirstPractices
{
    public partial class CheckOut : System.Web.UI.Page
    {
        SqlConnection _conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\AOS-PC\Documents\philly_Project\FirstPractices\FirstPractices\App_Data\Database.mdf;Integrated Security=True");
        SqlCommand cmd;
        SqlDataAdapter _adapter;
        SqlDataReader _reader;
        float shippingFee = 50;
        float price;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Title"] != null && Session["Surname"] != null)
                {
                    lblTitle.Text = "Title: " + Session["Title"].ToString();
                    lblSurname.Text = "Surname: " + Session["Surname"].ToString();
                }
                else
                {
                    lblTitle.Text = "Title not set";
                    lblSurname.Text = "Surname not set";
                }

                if (Session["SelectedProducts"] != null)
                {
                    var selectedProducts = Session["SelectedProducts"] as List<ProductPage.Product>;
                    rptSelectedProducts.DataSource = selectedProducts;
                    rptSelectedProducts.DataBind();
                }
                else
                {
                    rptSelectedProducts.DataSource = null;
                    rptSelectedProducts.DataBind();
                }

                if (Session["TotalPriceWithTax"] != null)
                {
                    lblShipping.Text = shippingFee.ToString();
                    lblTotalPrice.Text = Session["TotalPriceWithTax"].ToString();
                }
                else
                {
                    lblTotalPrice.Text = "Total price not set";
                }
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {

        }

        public class Product
        {
            public string ProductName { get; set; }
            public double ProductPrice { get; set; }
        }
        protected void btnPay_Click1(object sender, EventArgs e)
        {
            lblmessage.Visible = true;

            try
            {
                _conn.Open();
                string name = "NMpho";
                string password = "NMocwiri";

                // Get session values
                string title = Session["Title"]?.ToString();
                string surname = Session["Surname"]?.ToString();
                List<ProductPage.Product> selectedProducts = Session["SelectedProducts"] as List<ProductPage.Product>;
                string boughtItems = selectedProducts != null ? string.Join(", ", selectedProducts.Select(p => p.ProductName)) : string.Empty;
                float price = float.Parse(Session["TotalPriceWithTax"]?.ToString() ?? "0");
                float shippingFee = 10.0f; // Example shipping fee, adjust as needed
                float totalPaid = price + shippingFee;
                decimal adminProfit = 0.2m * (decimal)totalPaid;
                string message = string.Empty;

                if (!string.IsNullOrEmpty(title) && !string.IsNullOrEmpty(surname) && !string.IsNullOrEmpty(boughtItems))
                {
                    // Insert into Orders
                    cmd = new SqlCommand("INSERT INTO Orders(Title, Surname, Paid, Bought, status) VALUES(@title, @surname, @paid, @bought, @status)", _conn);
                    cmd.Parameters.AddWithValue("@title", title);
                    cmd.Parameters.AddWithValue("@surname", surname);
                    cmd.Parameters.AddWithValue("@paid", totalPaid);
                    cmd.Parameters.AddWithValue("@bought", boughtItems);
                    cmd.Parameters.AddWithValue("@status", "Seller");
                    cmd.ExecuteNonQuery();

                    // Log values before updating Admin profit
                    System.Diagnostics.Debug.WriteLine($"Admin Profit: {adminProfit}");
                    System.Diagnostics.Debug.WriteLine($"Name: {name}, Password: {password}");

                    // Update Admin profit
                    
                    cmd = new SqlCommand("UPDATE Admin SET profit = profit + @adminProfit WHERE Name = @name AND Password = @password", _conn);
                    cmd.Parameters.AddWithValue("@adminProfit", adminProfit);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@password", password);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        message = "Order Received...";
                    }
                    else
                    {
                        message = "Admin profit update failed. Check if the Name and Password are correct.";
                    }
                }
                else
                {
                    message = "Error: Missing order information.";
                }

                lblmessage.Text = message;
            }
            catch (Exception ex)
            {
                lblmessage.Text = "An error occurred: " + ex.Message;
            }
            finally
            {
                _conn.Close();
            }
        }


    }
}