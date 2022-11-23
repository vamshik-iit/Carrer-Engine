using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class PostJob : System.Web.UI.Page
    {

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
                     
                    Database dc = new Database();
                    DataSet dt1 = new DataSet();

                    //This Query is used to fetch the jobs poster by logged in admin
                    if (Session["Role"].ToString() == "Admin")
                    {
                        dt1 = dc.ReadData("select JobID,j.Role,Company,ValidTill,Description,CTC,j.PostedBy,u.FirstName from JobPosts j left join Users u on u.UserID=j.PostedBy where (RequestDeleteStatus!='Approve' or RequestDeleteStatus is null)and j.PostedBy = " + Session["USERID"].ToString() + "");

                    }
                    //This Query is used to fetch the jobs poster by logged in Recruiters
                    else if (Session["Role"].ToString() == "Recuiter")
                    {
                        dt1 = dc.ReadData("select JobID,j.Role,Company,ValidTill,Description,CTC,j.PostedBy,u.FirstName from JobPosts j left join Users u on u.UserID=j.PostedBy where (RequestDeleteStatus!='Approve' or RequestDeleteStatus is null) and j.PostedBy = " + Session["USERID"].ToString() + "");
                        
                    }
                    DataTable dt2 = dt1.Tables[0];
                    dt2 = dt1.Tables[0];

                    //Bindind the feteched information to the grid view
                    GridView1.DataSource = dt2;
                    GridView1.DataBind();

                }


            }
            catch (Exception ex)
            {

            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

            }

        }

        //This method is called by user when recuiter wants to delete the job wich is posted by them which are no
        //longer ready to offer a job or validaty of the jobs has been over'
        //Using this method they can request the admin to remove that job from this portal
        protected void RequestDeletion_Click(object sender, EventArgs e)
        {
            try
            {

                Button btn = (Button)sender;
                string JOBID = btn.CommandArgument[0].ToString();
                string REQID = btn.CommandArgument[2].ToString();
                Database dc = new Database();
                DataSet dt1 = new DataSet();


                string query = "Update JobPosts SET RequestDelete=1,RequestDeleteDate=getdate(),RequestDeleteStatus='Pending' WHERE JOBID=" + JOBID + "";

                if (dc.Insert(query))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success, request sent')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please try again')", true);
                }
                
                dt1 = dc.ReadData("select JobID,j.Role,Company,ValidTill,Description,CTC,j.PostedBy,u.FirstName from JobPosts j left join Users u on u.UserID=j.PostedBy where (RequestDelete is null or RequestDelete = 0) and j.PostedBy = " + Session["USERID"].ToString() + "");
                         
                DataTable dt2 = dt1.Tables[0];

                GridView1.DataSource = dt2;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

            }
        }


        //This method is called when recruiter has filled all the important information such as
        //job role, description ,ctc and etc.
        // And this job is ready to apply by job seakers
        protected void AddJob_Click(object sender, EventArgs e)
        {
            try
            {
                string jobrole = role.Text;
                string jobcompany = Company.Text;
                string JobDescription = Description.Text;
                string JobCTC = CTC.Text;
                string JobNOP = NOP.Text;
                string JobValidity = valid.Text;
                string Experience = Exp.Text;
                string Loc = Location.Text;
                string feature = Featured.SelectedValue == "Yes" ? "1" : "0";
                DataSet logvalid;
                string query = "";
                query = "select max(JobID)+1 as JobID from JobPosts";
                Database dc = new Database();

                logvalid = dc.ReadData(query);
                DataTable dt = logvalid.Tables[0];


                query = "insert into JobPosts(JobID,Role,Company,PostedOn,ValidTill,Description,CTC,PostedBy,NoOfPositions,Location,Experience,IsFeatured,RequiredSkills) " +
                        "values(" + dt.Rows[0]["JobID"].ToString() + ",'" + jobrole + "','" + jobcompany + "',getdate()" +
                        ",'" + JobValidity + "','" + JobDescription + "'," + JobCTC + "," + Session["USERID"].ToString() + "," + JobNOP + ",'" + Loc + "'," + Experience + "," + feature + ",'" + RequiredSkills.Text + "')";


                if (dc.Insert(query))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success, Job added')", true);

                    role.Text = "";
                    Company.Text = "";
                    Description.Text = "";
                    CTC.Text = "";
                    NOP.Text = "";
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please try again')", true);
                }


            }
            catch (Exception ex)
            {

            }
        }
    }
}