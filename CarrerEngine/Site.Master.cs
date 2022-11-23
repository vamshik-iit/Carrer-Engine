using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class Site : System.Web.UI.MasterPage
    {
        string selstatus = "";
        string query = "";
        Database dc = new Database();
        DataSet dt1;
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["USERID"] == null)
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                    else
                    {

                        //Fetching total number of recuiter and job seaker enrolled in our platform and showing
                        //in footer
                        query = "Select count(*) as Cnt from users where Role='JobSeaker'";
                        dt1 = dc.ReadData(query);
                        dt = dt1.Tables[0];
                        TH.Text = dt.Rows[0]["Cnt"].ToString();

                        query = "Select count(*) as Cnt from users where Role='Recuiter'";
                        dt1 = dc.ReadData(query);
                        dt = dt1.Tables[0];
                        TdH.Text = dt.Rows[0]["Cnt"].ToString();


                    }
                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}