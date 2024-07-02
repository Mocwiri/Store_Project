using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.Remoting.Contexts;
using System.Runtime.Remoting.Messaging;

namespace FirstPractices
{
    public partial class AdminPage : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\AOS-PC\Documents\philly_Project\FirstPractices\FirstPractices\App_Data\Database.mdf;Integrated Security=True");
        SqlCommand comm;
        SqlDataAdapter adapter;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblmessage.Visible = true;
            conn.Open();

            string name = txtName.Text;
            string password = txtPassword.Text;
            string message = lblmessage.Text;

            comm = new SqlCommand("SELECT Name, Password FROM Admin WHERE name = @Name AND password = @Password", conn);

            comm.Parameters.AddWithValue("@Name", name);
            comm.Parameters.AddWithValue("@Password", password);

            reader = comm.ExecuteReader();
            if (reader.Read())
            {
                /*Session["Surname"] = reader["Surname"].ToString();
                Session["Title"] = reader["Title"].ToString();*/

                Response.Redirect("MidAdmin.aspx");
                //message = "Access Granted....";
            }
            else
            {
                message = "Invalid Password or UserName....";
            }


            conn.Close();
            lblmessage.Text = message;
        }
    }
}