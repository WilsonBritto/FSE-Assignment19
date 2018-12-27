using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Assignment19
{
    public partial class Ques1 : System.Web.UI.Page
    {
        static int CustIdHolder = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void Func_PopUp(string Message)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Func", "alert('"+Message+"')", true);
        }

        protected void CreateTableBtn_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            var sqlCon = new SqlConnection(conn);
            var sqlCmd = new SqlCommand("spCreateCustomer", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCon.Open();
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Func_PopUp("Table has been created");
        }

        protected void InsertRec_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            var sqlCon = new SqlConnection(conn);
            var sqlCmd = new SqlCommand("spInsertRec", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@CusName", CusNameId.Text);
            sqlCmd.Parameters.AddWithValue("@CusAdd", CusAddId.Text);
            sqlCmd.Parameters.AddWithValue("@Dob", DobId.Value);
            sqlCmd.Parameters.AddWithValue("@sal", salId.Text);

            sqlCon.Open();
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Func_PopUp("The record has been created");
            CusNameId.Text = "";
            CusAddId.Text = "";
            DobId.Value = "";
            salId.Text = "";
            bindGrid(CustIdHolder);
        }

        protected void btnDispByCustId_Click(object sender, EventArgs e)
        {
            CustIdHolder = Convert.ToInt32(txtCustId.Text);
            bindGrid(CustIdHolder);
        }

        protected void btnDispAllId_Click(object sender, EventArgs e)
        {
            CustIdHolder = 0;
            bindGrid(CustIdHolder);
        }
        private void bindGrid(int CustId)
        {
            string conn = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            using (var sqlCon = new SqlConnection(conn))
            {
                var sqlCmd = new SqlCommand("spGetAllCustomers", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@CustId", CustId.ToString());
                SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            bindGrid(CustIdHolder);
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            bindGrid(CustIdHolder);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            using (var sqlCon = new SqlConnection(conn))
            {
                var sqlCmd = new SqlCommand("spUpdateCustomer", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@CustId", row.Cells[0].Text);
                sqlCmd.Parameters.AddWithValue("@CusName", ((TextBox)row.Cells[1].Controls[0]).Text);
                sqlCmd.Parameters.AddWithValue("@CusAdd", ((TextBox)row.Cells[2].Controls[0]).Text);
                sqlCmd.Parameters.AddWithValue("@Dob", ((TextBox)row.FindControl("dtDobId")).Text);
                sqlCmd.Parameters.AddWithValue("@sal", ((TextBox)row.Cells[4].Controls[0]).Text);
                sqlCon.Open();
                sqlCmd.ExecuteNonQuery();
            }
            GridView1.EditIndex = -1;
            bindGrid(CustIdHolder);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            using (var sqlCon = new SqlConnection(conn))
            {
                var sqlCmd = new SqlCommand("spDeleteCustomer", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@CustId", row.Cells[0].Text);
                sqlCon.Open();
                sqlCmd.ExecuteNonQuery();
            }
            bindGrid(CustIdHolder);
        }
    }
}