using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment19
{
    public partial class Ques4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void Func_PopUp(string Message)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Func", "alert('" + Message + "')", true);
        }

        protected void LoadBtnId_Click(object sender, EventArgs e)
        {
            if (!InpFileId.HasFile)
            {
                Func_PopUp("Please select a file");
                return;
            }

            InpFileId.PostedFile.SaveAs(Server.MapPath("TempXML.xml"));
            DataTable dt = new DataTable();
            try
            {
                dt.ReadXml(Server.MapPath("TempXML.xml"));
            }
            catch
            {
                Func_PopUp("File Not Supported");
                return;
            }
            dt.TableName = Path.GetFileNameWithoutExtension(InpFileId.PostedFile.FileName);

            if (File.Exists(Server.MapPath("TempXML.xml")))
            {
                File.Delete(Server.MapPath("TempXML.xml"));
            }

            string conn = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            
            using (var sqlCon = new SqlConnection(conn))
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM sysobjects where name = '" + dt.TableName + "'", sqlCon);
                if (cmd.ExecuteScalar() != null)
                {
                    SqlCommand dropTable = new SqlCommand("drop table [" + dt.TableName+"]", sqlCon);
                    dropTable.ExecuteNonQuery();
                }

                bool exists = false;
                foreach (DataColumn col in dt.Columns)
                {
                    if (!exists)
                    {
                        SqlCommand createtable = new SqlCommand("CREATE TABLE [" + dt.TableName + "] (" + col.ColumnName + " varchar(MAX))", sqlCon);
                        createtable.ExecuteNonQuery();
                        exists = true;
                    }
                    else
                    {
                        SqlCommand addcolumn = new SqlCommand("ALTER TABLE [" + dt.TableName + "] ADD " + col.ColumnName + " varchar(MAX)", sqlCon);
                        addcolumn.ExecuteNonQuery();
                    }
                }

                using (var bulkCopy = new SqlBulkCopy(sqlCon))
                {
                    foreach(DataColumn col in dt.Columns)
                    {
                        bulkCopy.ColumnMappings.Add(col.ColumnName, col.ColumnName);
                    }
                    bulkCopy.DestinationTableName = "["+dt.TableName+"]";
                    bulkCopy.WriteToServer(dt);
                    Func_PopUp("Uploaded Successfully");
                }
            }
        }
    }
}