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

        protected void CreateTableBtn_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            var sqlCon = new SqlConnection(conn);
            var sqlCmd = new SqlCommand("spCreateCustomer", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;

            sqlCmd.ExecuteNonQuery();

        }
    }
}