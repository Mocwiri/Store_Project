using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace FirstPractices
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection connect = new SqlConnection( @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\AOS-PC\Documents\philly_Project\FirstPractices\FirstPractices\App_Data\Database.mdf;Integrated Security=True");
        SqlCommand cmd;
        SqlDataReader reader;
        SqlDataAdapter adapter;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblmessage.Visible = true;
            connect.Open();
            string name = txtLogin.Text;
            string password = txtPassword.Text;
            string message = lblmessage.Text;

            cmd = new SqlCommand("SELECT Name,Surname, Password, Title FROM people WHERE name = @Name AND password = @Password", connect);

            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Password", password);

            reader = cmd.ExecuteReader();
            if ( reader.Read())
            {
                Session["Surname"] = reader["Surname"].ToString();
                Session["Title"] = reader["Title"].ToString();
                
                Response.Redirect("ProductPage.aspx");
            }
            else
            {
                    message = "Invalid Password or UserName....";
            }

            connect.Close();
            lblmessage.Text = message;
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