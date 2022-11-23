using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class Admin : System.Web.UI.Page
    {
        Database dc = new Database();
        string qry = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    //If Session value is null or empty it will be redirected to login page
                    if (Session["USERID"] == null)
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                }


                DataSet dt1 = new DataSet();  
                
                //Binding data to first grid i.e. amend request role
                dt1 = dc.ReadData("select ReqID,r.userid,FirstName,LastName,Email,Role,RequestedProfile from Requests r left join users u on u.UserID=r.UserID where ReqStatus = 'Pending'");
                DataTable dt2 = dt1.Tables[0];
                GridView1.DataSource = dt2;
                GridView1.DataBind();


                //Binding data to second grid i.e. request job deletion
                dt1 = dc.ReadData("select JobID,j.Role,Company,ValidTill,Description,CTC,j.PostedBy,u.FirstName from JobPosts j left join Users u on u.UserID=j.PostedBy where RequestDelete =1 and RequestDeleteStatus='Pending'");
                dt2 = dt1.Tables[0];
                GridView2.DataSource = dt2;
                GridView2.DataBind();               

            }
            catch (Exception ex)
            {

            }
        }


        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                string a = e.CommandArgument.ToString();
                a = e.CommandName.ToString();
                a = e.CommandArgument.ToString();
                a = e.CommandArgument.ToString();


                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                //Reference the GridView Row.
                GridViewRow row = GridView1.Rows[rowIndex];

                //Fetch value of Name.
                string name = (row.FindControl("txtName") as TextBox).Text;

                //Fetch value of Country
                string country = row.Cells[1].Text;

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Name: " + name + "\\nCountry: " + country + "');", true);
            }
        }



        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Approve")
            {
                try
                {
                    qry = "Update";
                }
                catch (Exception ex)
                {

                }
            }
            else if (e.CommandName == "Reject")
            {
                try
                {

                }
                catch (Exception ex)
                {

                }
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


        protected void RejectBtn_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch(Exception ex)
            {

            }
        }

        protected void ApproveBtn_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {

            }
        }

        // 1st Grid - On Button Click to update role 
        protected void UpdateReqStatus_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                string USERID = btn.CommandArgument[0].ToString();
                string REQID = btn.CommandArgument[2].ToString(); 
                string query = "";

                GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
                DropDownList Status = (DropDownList)gvr.FindControl("Status");
                string selstatus = Status.SelectedItem.Value;

                if(selstatus == "Approve")
                {
                    query = "Update USERS SET ROLE='" + "Recuiter" + "' WHERE USERID=" + USERID;
                }
                else
                {
                    query = "Update USERS SET ROLE='" + "JobSeaker" + "' WHERE USERID=" + USERID;
                }

               

                if (dc.Insert(query))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success, User Role Updated')", true);
                    string updatequery = "UPDATE REQUESTS SET REQSTATUS='" + "Approve" + "' WHERE REQID=" + REQID;
                    dc.Insert(updatequery);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please try again')", true);

                }

                DataSet dt1 = new DataSet();

                dt1 = dc.ReadData("select ReqID,r.userid,FirstName,LastName,Email,Role,RequestedProfile from Requests r left join users u on u.UserID=r.UserID where ReqStatus = 'Pending'");
                DataTable dt2 = dt1.Tables[0];
                
                GridView1.DataSource = dt2;
                GridView1.DataBind();

               
            }
            catch(Exception ex)
            {

            }
        }

        // 2nd Grid - On Button Click to Delete Job - Here Delete means we are updating one column
        // Based on which we are showing the available jobs
        protected void UpdateJobReqStatus_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                string JobID = btn.CommandArgument[0].ToString();
                string REQID = btn.CommandArgument[2].ToString();

                GridViewRow gvr = (GridViewRow)(((Control)sender).NamingContainer);
                DropDownList Status = (DropDownList)gvr.FindControl("Status");
                string selstatus = Status.SelectedItem.Value;


                string query = "Update JobPosts SET RequestDeleteStatus='" + selstatus + "' WHERE JobID=" + JobID;

                if (dc.Insert(query))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success, job status updated!!')", true);
                   
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please try again')", true);

                }

                DataSet dt1 = new DataSet();


                dt1 = dc.ReadData("select JobID,j.Role,Company,ValidTill,Description,CTC,j.PostedBy,u.FirstName from JobPosts j left join Users u on u.UserID=j.PostedBy where RequestDelete =1 and RequestDeleteStatus='Pending'");
                DataTable dt2 = dt1.Tables[0];

                GridView2.DataSource = dt2;
                GridView2.DataBind();

              
            }
            catch (Exception ex)
            {

            }
        }

















    }
}