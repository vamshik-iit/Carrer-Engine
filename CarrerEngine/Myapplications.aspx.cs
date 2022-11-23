using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class Myapplications : System.Web.UI.Page
    {
       
        string selstatus = "";
        string query = "";
        Database dc = new Database();
        DataSet dt1;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try{
                if (!IsPostBack)
                {
                    if (Session["USERID"] == null)
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                    else
                    {

                        //During page load fetching all the jobs applied by login user and binding to grid view
                        Database dc = new Database();
                        DataSet dt1;
                        DataTable dt = new DataTable();
                        string query = "select j.JobID,ApplicationID,AppliedOn,UpdatedOn,Role,Company,Status from Applications a join JobPosts j on j.JobID=a.JobID " +
                            "where a.UserID=" + Session["USERID"].ToString() + " order by AppliedOn desc";

                        dt1 = dc.ReadData(query);
                        dt = dt1.Tables[0];
                        GridView1.DataSource = dt;
                        GridView1.DataBind();


                    }
                }
            }
            catch(Exception ex)
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

        //This Method is used to start the communication channel from job seaker to recruiter
        protected void StartChat_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                string AppID = btn.CommandArgument.ToString();
                query = "select a.JobID,jp.PostedBy,a.UserID from Applications a left join JobPosts jp on jp.JobID=a.JobID where a.ApplicationID=" + AppID;

                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                Response.Redirect("Chat.aspx?fromid=" + dt.Rows[0]["UserID"].ToString() + "&toid=" + dt.Rows[0]["PostedBy"].ToString(), false);

            }
            catch (Exception ex)
            {

            }
        }

    }
}