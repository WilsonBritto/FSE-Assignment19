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
    public partial class Ques2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GetCustByDobId_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            using (var sqlCon = new SqlConnection(conn))
            {
                var sqlCmd = new SqlCommand("spGetAllCustomersByDob", sqlCon);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@InpDate", InpDateId.Value);
                SqlDataAdapter da = new SqlDataAdapter(sqlCmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
    }
}