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
            sqlCmd.Parameters.AddWithValue("@Dob", DobId.Text);
            sqlCmd.Parameters.AddWithValue("@sal", salId.Text);

            sqlCon.Open();
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Func_PopUp("The record has been created");
        }
    }
}