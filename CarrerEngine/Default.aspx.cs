using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class Default : System.Web.UI.Page
    {
        public List<JobMainClass> findjobs = new List<JobMainClass>();
        Database dc = new Database();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataSet dt1 = new DataSet();


                if (!IsPostBack)
                {
                    if (Session["USERID"] == null)
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                }

                //When ever the page is loaded we are updating the featured job section

                dt1 = dc.ReadData("select JobID,Role,Company,PostedOn,ValidTill,Description,CTC,NoOfPositions,Location from JobPosts where IsFeatured=1 and ValidTill>=getdate() and (RequestDeleteStatus!='Approve' or RequestDeleteStatus is null)");
                DataTable dt2 = dt1.Tables[0];

                //adding data to list to bind dynamic cards
                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    JobMainClass md = new JobMainClass();
                    md.JobID = dt2.Rows[i]["JobID"].ToString();

                    md.Role = dt2.Rows[i]["Role"].ToString();
                    md.Company = dt2.Rows[i]["Company"].ToString();
                    md.Description = dt2.Rows[i]["Description"].ToString();
                    md.CTC = dt2.Rows[i]["CTC"].ToString();
                    md.Location = dt2.Rows[i]["Location"].ToString();
                    findjobs.Add(md);
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}