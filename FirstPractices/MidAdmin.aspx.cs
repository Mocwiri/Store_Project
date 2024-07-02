using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FirstPractices
{
    public partial class MidAdmin : System.Web.UI.Page
    {
        private readonly string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\AOS-PC\Documents\philly_Project\FirstPractices\FirstPractices\App_Data\Database.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT Id, Title, Surname, Paid, Bought, status FROM Orders", conn))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            adapter.Fill(dt);
                        }
                    }
                }
                gvOrders.DataSource = dt;
                gvOrders.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void gvOrders_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvOrders.Rows[e.RowIndex];
            int orderId = Convert.ToInt32(gvOrders.DataKeys[e.RowIndex].Values[0]);
            DropDownList ddlStatus = (DropDownList)row.FindControl("ddlStatus");

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("UPDATE Orders SET status = @status WHERE Id = @orderId", conn))
                    {
                        cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
                        cmd.Parameters.AddWithValue("@orderId", orderId);
                        cmd.ExecuteNonQuery();
                    }
                }
                gvOrders.EditIndex = -1;
                LoadOrders();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void gvOrders_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvOrders.EditIndex = e.NewEditIndex;
            LoadOrders();
        }

        protected void gvOrders_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvOrders.EditIndex = -1;
            LoadOrders();
        }

        protected void btnEmployees_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Employees (Name, Surname, Title) VALUES(@name, @surname, @title)", conn))
                    {
                        cmd.Parameters.AddWithValue("@name", txtFirstName.Text);
                        cmd.Parameters.AddWithValue("@surname", txtLastName.Text);
                        cmd.Parameters.AddWithValue("@title", txtPosition.Text);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnUOrders_Click(object sender, EventArgs e)
        {
            /*try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    foreach (GridViewRow row in gvOrders.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            DropDownList ddlStatus = (DropDownList)row.FindControl("ddlStatus");
                            int orderId = Convert.ToInt32(gvOrders.DataKeys[row.RowIndex].Values[0]);

                            using (SqlCommand cmd = new SqlCommand("UPDATE Orders SET status = @status WHERE Id = @orderId", conn))
                            {
                                cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
                                cmd.Parameters.AddWithValue("@orderId", orderId);
                                cmd.ExecuteNonQuery();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }*/
            LoadOrders(); // Reload the GridView after updating
        }
    }
}
