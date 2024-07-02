using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace FirstPractices
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\AOS-PC\Documents\philly_Project\FirstPractices\FirstPractices\App_Data\Database.mdf;Integrated Security=True");
        SqlCommand comm;
        SqlDataAdapter adapter;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        { 
            conn.Open();
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string surname = txtSurname.Text;
            string title = txtTitle.Text;
            string CPass = txtCPass.Text;
            string info = lblMessage.Text;

            if(CPass == password)
            {
                comm = new SqlCommand("INSERT INTO people (Name,Surname, Password,Title) VALUES (@Name,@Surname, @Password,@Title)  ",conn);
                
                comm.Parameters.AddWithValue("@Name",email);
                comm.Parameters.AddWithValue("@Surname", surname);
                comm.Parameters.AddWithValue("@Password",password);
                comm.Parameters.AddWithValue("@Title",title);

                comm.ExecuteNonQuery();

                info = "You have registered Successfully......";
            }
            else if(CPass != password)
            {
                info = "Password Don't Match......";
            }

            lblMessage.Text = info;

            conn.Close();
        }
    }
}