using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class FindJob : System.Web.UI.Page
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

                    if (Session["Role"].ToString() == "JobSeaker" )
                    {
                        Reqstbtn.Visible = true;
                    }

                    FilterLocations.Items.Insert(0, "Preferred city");
                    dt1 = dc.ReadData("select distinct Location from JobPosts");

                    FilterLocations.DataTextField = dt1.Tables[0].Columns["Location"].ToString();
                    // FilterLocations.DataValueField = dt1.Tables[0].Columns["JobID"].ToString();

                    FilterLocations.DataSource = dt1.Tables[0];
                    FilterLocations.DataBind();

                    FilterLocations.Items.Insert(0, "Preferred city");


                }

                //Fetching list of job available to apply and binding it to front end dynamic card
                dt1 = dc.ReadData("select JobID,Role,Company,PostedOn,ValidTill,Description,CTC,NoOfPositions,Location,RequiredSkills from JobPosts where ValidTill>=getdate() and (RequestDeleteStatus!='Approve' or RequestDeleteStatus is null)");
                DataTable dt2 = dt1.Tables[0];

                //adding data to list to bind dynamic cards
                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    JobMainClass md = new JobMainClass();
                    md.JobID = dt2.Rows[i]["JobID"].ToString();                                    
                    
                    md.Role = dt2.Rows[i]["Role"].ToString();
                    md.Company = dt2.Rows[i]["Company"].ToString();
                    md.Skills = dt2.Rows[i]["RequiredSkills"].ToString();
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


       // This is method which is used to change the role of job seaker to recuiter based on the requst
        protected void Req_Click(object sender, EventArgs e)
        {
            try
            {
                string qry = "";
                qry = "insert into Requests(userid,requestedprofile,ReqestedOn,reqstatus) " +
                    "values(" + Session["USERID"].ToString() + ",'Recuiter',getdate(),'Pending')";

                Database dc = new Database();
                if (dc.Insert(qry))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Request sent to admin')", true);

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please try again')", true);

                }


            }
            catch(Exception ex)
            {

            }
        }

        //This method is called when user select few filtering option and click on filter button
        protected void Filter_Click(object sender, EventArgs e)
        {
            try
            {
                string qry = "";
                string title = JobTitle.Text;
                string condition = "";
                int condcnt = 0;
              
                qry = "select JobID,Role,Company,PostedOn,ValidTill,Description,CTC,NoOfPositions,Location from JobPosts " +
                      "where ValidTill>=getdate() and (RequestDeleteStatus!='Approved' or RequestDeleteStatus is null) ";
                if (!string.IsNullOrEmpty(title))
                {
                    condition = condition + " and  (Description like '%" + title + "%' or Role like '%" + title + "%') ";
                }

                if (FilterLocations.SelectedValue.ToString() != "Preferred city")
                {
                    condition = condition + " and Location ='" + FilterLocations.SelectedValue.ToString() + "' ";
                }


                if (CTCDD.SelectedValue.ToString() != "--select--")
                {
                    condition = condition + " and CTC " + CTCDD.SelectedValue.ToString() + " ";
                }

                if (!string.IsNullOrEmpty(JobCompany.Text))
                {
                    condition = condition + " and Company like '%" + JobCompany.Text + "%' ";
                }

                if (Experience.SelectedValue.ToString() == "EarlyCareer")
                {
                    condition = condition + " and (Experience <= 1 or Experience is null) ";
                }
                else if (Experience.SelectedValue.ToString() == "Experienced")
                {
                    condition = condition + " and (Experience > 1 or Experience is null) ";

                }

                qry = qry + condition;

                DataSet dt1 = new DataSet();


                dt1 = dc.ReadData(qry);
                DataTable dt2 = dt1.Tables[0];

               
                findjobs.Clear();
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