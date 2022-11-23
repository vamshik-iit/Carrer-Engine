using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarrerEngine
{
    public partial class ApplyJob : System.Web.UI.Page
    {
        string JobID = "";
        Database dc = new Database();
        DataSet dt1;
        DataTable dt = new DataTable();
        string query = "";
        string ReqSkills = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                JobID = Request.QueryString["JobID"];
                JobID = JobID.Trim();
                if (!IsPostBack)
                {
                    if (Session["USERID"] == null)
                    {
                        Response.Redirect("Login.aspx", false);
                    }
                    else
                    {
                        LoadInitialData();
                    }
                }
            }
            catch(Exception ex)
            {

            }
        }

        //This method is called every time when page is loaded 
        //This is the method in which are getting data from backend and binding to front end card
        private void LoadInitialData()
        {
            try
            {
                query = "select * from JobPosts where JobID=" + JobID;

                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];

                //List of Data we are showing such as job id, role, etc.
                Job.Text = "JobID : " + dt.Rows[0]["JobID"].ToString();
                Role.Text = "Role : " + dt.Rows[0]["Role"].ToString();
                Company.Text = "Company : " + dt.Rows[0]["Company"].ToString();
                CTC.Text = "CTC : $" + dt.Rows[0]["CTC"].ToString();
                Des.Text = "Description : " + dt.Rows[0]["Description"].ToString();
                RS.Text = "RequiredSkills : " + dt.Rows[0]["RequiredSkills"].ToString();
                ReqSkills = dt.Rows[0]["RequiredSkills"].ToString();


                query = "select * from JobPosts where JobID=" + JobID;

                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];
                ReqSkills = dt.Rows[0]["RequiredSkills"].ToString();

                //string[] skillssplit = ReqSkills.Trim().ToLower().Split();
                string[] skillssplit = ReqSkills.Trim().ToLower().Split(new[] { ',', ' ' },
                                StringSplitOptions.RemoveEmptyEntries);

                //Calculating Profile Scoring using N Gram Algorithm technique

                int reqcount = skillssplit.Count();
               
                query = "SELECT U.PrimarySkill, U.SecondarySkill, U.OtherSkills, C.Name,W.Role, E.Specialization" +
                        " FROM USERSKILLS U JOIN [dbo].[Certifications] C ON C.UserID = U.UserID" +
                        " JOIN [dbo].[WorkExperience] W ON W.UserID = U.UserID" +
                        " JOIN [dbo].[EducationDetails] E ON E.UserID = U.UserID" +
                        " WHERE U.USERID = " + Session["USERID"].ToString();

                DataSet ds2 = dc.ReadData(query);
                DataTable dt2 = ds2.Tables[0];

                //Fetching all the required fields such as skills, experience, education
                //Adding all the distinct string to list of string 
                List<string> skillList = new List<string>();
                for (int i = 0; i < dt2.Rows.Count; i++)
                {                   
                    for(int j = 0; j < dt2.Columns.Count; j++)
                    {
                        string txt = dt2.Rows[i][j].ToString();
                        if (!skillList.Contains(txt.ToLower()))
                        {
                            if(txt.Contains(" "))
                            {
                                string[] spitskill = (txt).Split(' ');
                                foreach(string s in spitskill)
                                {
                                    if (!skillList.Contains(s.ToLower()))
                                    {
                                        skillList.Add(s.ToLower());
                                    }
                                }
                            }
                            else
                            {
                                skillList.Add(txt.ToLower());
                            }
                            
                        }
                            
                    }                    
                }

                List<string> newlist = skillssplit.ToList();

                int matchscore = 0;
                float profilescore = 0;

                //var newData = newlist.Select(i => i.ToString()).Intersect(skillList);


                for (int i = 0; i < newlist.Count; i++)
                {
                    for(int j=0;j< skillList.Count; j++)
                    {
                        if(skillList[j].ToLower().Trim() == skillssplit[i].ToLower().Trim())
                        {
                            matchscore++;
                            break;
                        }
                    }
                }

                profilescore = (matchscore  * 100) / reqcount;

                if (profilescore > 100)
                {
                    profilescore = 100;
                }

                PS.Text = profilescore.ToString() + "%";
                PS.Font.Size = 25;
                if (profilescore < 40)
                {
                    PS.ForeColor = Color.Red;
                }
                else if(profilescore>40 && profilescore < 75)
                {
                    PS.ForeColor = Color.Yellow;
                }
                else
                {
                    PS.ForeColor = Color.Green;
                }
            }
            catch (Exception ex)
            {

            }
        }

        //This is the method when apply button is clicked which will update the backend database and add record to 
        //Applications table
        protected void Apply_Click(object sender, EventArgs e)
        {
            try
            {
                query = "select * from JobPosts where JobID=" + JobID;

                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];
                ReqSkills = dt.Rows[0]["RequiredSkills"].ToString();

                string[] skillssplit = ReqSkills.Trim().ToLower().Split(new[] { ',', ' ' },
                                StringSplitOptions.RemoveEmptyEntries);

                int reqcount = skillssplit.Count();


                //Calculating Profile Scoring using N Gram Algorithm technique

                query = "SELECT U.PrimarySkill, U.SecondarySkill, U.OtherSkills, C.Name,W.Role, E.Specialization" +
                        " FROM USERSKILLS U JOIN [dbo].[Certifications] C ON C.UserID = U.UserID" +
                        " JOIN [dbo].[WorkExperience] W ON W.UserID = U.UserID" +
                        " JOIN [dbo].[EducationDetails] E ON E.UserID = U.UserID" +
                        " WHERE U.USERID = " + Session["USERID"].ToString();

                DataSet ds2 = dc.ReadData(query);
                DataTable dt2 = ds2.Tables[0];

                //Fetching all the required fields such as skills, experience, education
                //Adding all the distinct string to list of string 
                List<string> skillList = new List<string>();
                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    for (int j = 0; j < dt2.Columns.Count; j++)
                    {
                        string txt = dt2.Rows[i][j].ToString();
                        if (!skillList.Contains(txt.ToLower()))
                        {
                            if (txt.Contains(" "))
                            {
                                string[] spitskill = (txt).Split(' ');
                                foreach (string s in spitskill)
                                {
                                    if (!skillList.Contains(s.ToLower()))
                                    {
                                        skillList.Add(s.ToLower());
                                    }
                                }
                            }
                            else
                            {
                                skillList.Add(txt.ToLower());
                            }

                        }

                    }
                }

                List<string> newlist = skillssplit.ToList();

                int matchscore = 0;
                float profilescore = 0;

                //var newData = newlist.Select(i => i.ToString()).Intersect(skillList);


                for (int i = 0; i < newlist.Count; i++)
                {
                    for (int j = 0; j < skillList.Count; j++)
                    {
                        if (skillList[j].ToLower().Trim() == skillssplit[i].ToLower().Trim())
                        {
                            matchscore++;
                            break;
                        }
                    }
                }

                profilescore = (matchscore * 100) / reqcount;

                if (profilescore > 100)
                {
                    profilescore = 100;
                }


                query = "select max(ApplicationID)+1 as ApplicationID from Applications";
               
                dt1 = dc.ReadData(query);
                dt = dt1.Tables[0];


                query = "insert into Applications(JobID, UserID, AppliedOn, Status, UpdatedOn, ApplicationID, ProfileScore) " +
                    "values(" + JobID + "," + Session["USERID"].ToString()  + ", getdate(), 'Applied', getdate()," + dt.Rows[0]["ApplicationID"].ToString() + "," + profilescore + ")";


                if (dc.Insert(query))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success, Application sent to the requiter')", true);

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please try again')", true);

                }

            }
            catch (Exception ex) { 
            
            }
        }
    }
}