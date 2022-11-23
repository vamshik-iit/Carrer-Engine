using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class RecievedApp : System.Web.UI.Page
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
         
                        //On page load this query is trigger to fecth the job which is applied by this login recuiter
                        query = "select j.JobID,ApplicationID,AppliedOn,UpdatedOn,Role,Company,Status,ProfileScore,a.UserID from Applications a join JobPosts j on j.JobID = a.JobID " +
                            "where j.PostedBy = " + Session["USERID"].ToString() + " order by AppliedOn desc";

                        dt1 = dc.ReadData(query);

                        dt = dt1.Tables[0];

                        GridView1.DataSource = dt;
                        GridView1.DataBind();


                    }
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

        protected void Status_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
            DropDownList Status = (DropDownList)gvr.FindControl("Status");
            selstatus = Status.SelectedItem.Value;


        }

        //This method is used to update the job status of the particular application
        protected void UpdateStatus_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                string AppID = btn.CommandArgument.ToString();

                GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
                DropDownList Status = (DropDownList)gvr.FindControl("Status");
                selstatus = Status.SelectedItem.Value;


                query = "update Applications set Status='" + selstatus + "' where ApplicationID=" + AppID + "";

                if (dc.Insert(query))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success')", true);

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

        //This the button method call which help to build the commuication channel from recruiter to job seaker
        protected void StartChat_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                string AppID = btn.CommandArgument.ToString();
                query = "select a.JobID,jp.PostedBy,a.UserID from Applications a left join JobPosts jp on jp.JobID=a.JobID where a.ApplicationID=" + AppID;

                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                Response.Redirect("Chat.aspx?fromid=" + (dt.Rows[0]["PostedBy"].ToString()).Trim() + "&toid=" + (dt.Rows[0]["UserID"].ToString()).Trim(), false);
                
            }
            catch (Exception ex)
            {

            }
        }
    }
}