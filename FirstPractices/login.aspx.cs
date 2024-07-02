using System;
using System.Web.UI;
using System.Data.SqlClient;

namespace FirstPractices
{
    public partial class login : Page
    {
        SqlConnection connect = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\AOS-PC\Documents\philly_Project\FirstPractices\FirstPractices\App_Data\Database.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization logic here
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtLogin.Text;
            string password = txtPassword.Text;

            connect.Open();

            SqlCommand cmd = new SqlCommand("SELECT Name, Surname, Password, Title FROM people WHERE name = @Name AND password = @Password", connect);
            cmd.Parameters.AddWithValue("@Name", username);
            cmd.Parameters.AddWithValue("@Password", password);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                Session["Surname"] = reader["Surname"].ToString();
                Session["Title"] = reader["Title"].ToString();
                Response.Redirect("ProductPage.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }

            connect.Close();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        }
    }
}
