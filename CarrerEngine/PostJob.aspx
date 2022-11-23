<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="CarrerEngine.PostJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title></title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->
    <style>
        /* === HEADING STYLE #5 === */
        .five h1 {
            /*text-align: center;*/
            font-size: 22px;
            font-weight: 700;
            color: #202020;
            text-transform: uppercase;
            word-spacing: 1px;
            letter-spacing: 2px;
        }

            .five h1 span {
                margin-top: 40px;
                text-transform: none;
                font-size: .75em;
                font-weight: normal;
                font-style: italic;
                font-family: "Playfair Display","Bookman",serif;
                color: #999;
                letter-spacing: -0.005em;
                word-spacing: 1px;
                letter-spacing: none;
            }

            .five h1:before {
                position: absolute;
                left: 0;
                bottom: 38px;
                width: 60px;
                height: 4px;
                content: "";
                left: 50%;
                margin-left: -30px;
                /*background-color: #dfdfdf;*/
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row" style="margin-top: 100px">
        <%-- Display Image Starts --%>
        <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
            <img src="assets/img/hero/findjob.png" class="img-fluid animated" alt="">
        </div>
        <%-- Display Image ENds --%>

        <%-- Important Information to be filled by recuiter to post the jobs --%>
        <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">

            <div class="five">
                <h1>Post a new opportunity</h1>
            </div>
            <br />
            <div class="form-group">
                <label for="name">Role/Position Name</label>
                <asp:TextBox ID="role" Width="70%" CssClass="form-control" placeholder="Enter position Name" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="email">Organisation/Company Offering</label>
                <asp:TextBox ID="Company" Width="70%" CssClass="form-control" placeholder="Enter Company Name" runat="server"></asp:TextBox>

            </div>
            <div class="form-group">
                <label for="age">Skills Expecting</label>
                <asp:TextBox ID="RequiredSkills" Width="70%" CssClass="form-control" placeholder="Write down expecting skills set" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="age">Share more about position</label>
                <asp:TextBox ID="Description" Width="70%" CssClass="form-control" placeholder="What candidates gonna do" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="age">Company Offering : Cost to Company</label>
                <asp:TextBox ID="CTC" Width="70%" CssClass="form-control" placeholder="$1,00,000" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="age">Number of Position Available</label>
                <asp:TextBox ID="NOP" Width="70%" CssClass="form-control" placeholder="10 (or) 20" runat="server"></asp:TextBox>

            </div>

            <div class="form-group">
                <label for="age">Minimum Experience Required</label>
                <asp:TextBox ID="Exp" Width="70%" CssClass="form-control" placeholder="Minimum Experience Required" runat="server"></asp:TextBox>

            </div>

            <div class="form-group">
                <label for="age">Working Location</label>
                <asp:TextBox ID="Location" Width="70%" CssClass="form-control" placeholder="Chicago (or) New York" runat="server"></asp:TextBox>

            </div>

            <div class="form-group">
                <label for="age">Position valid till apply</label>
                <asp:TextBox runat="server" Width="70%" CssClass="form-control" ID="valid" placeholder="Valid Till" type="date"></asp:TextBox>

            </div>


            <div class="form-group">
                <label for="dropdown">Do you want to featured this job on home screen?</label>
                <br />
                <asp:DropDownList ID="Featured" runat="server" Width="50px">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>

            </div>
            <br />
            <div class="container-login100-form-btn" style="width: 50%">
                <asp:Button CssClass="login100-form-btn" Text="Add job" runat="server" OnClick="AddJob_Click" />
            </div>
        </div>
        <%-- Information pannel ends --%>
    </div>


    <div>
        <br />
        <br />
        <center>
            <% if (Session["Role"].ToString() == "Recuiter" || Session["Role"].ToString() == "Admin")
                {  %>

            <div class="five">
                <h1>Request a delete</h1>
            </div>
            <br />

            <%-- Grid View to show list of job poster by login recuiter --%>
            <asp:GridView ID="GridView1" runat="server" CssClass="leftmargin table table-bordered table-condensed table-responsive table-hover" AutoGenerateColumns="false" AllowPaging="false"
                OnPageIndexChanging="OnPaging" PageSize="10">
                <Columns>
                    <asp:BoundField ItemStyle-Width="150px" DataField="JobID" HeaderText="JobID" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Role" HeaderText="Role" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Company" HeaderText="Company" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="ValidTill" HeaderText="ValidTill" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Description" HeaderText="Description" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="CTC" HeaderText="CTC" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="PostedBy" HeaderText="PostedBy" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="FirstName" HeaderText="FirstName" />


                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Button ID="RequestDeletion" runat="server" CommandArgument='<%#Eval("JobID")+","+ Eval("PostedBy")%>' Text="Request Deletion"
                                CommandName="ThisBtnClick" CssClass="badge-danger" OnClick="RequestDeletion_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <%-- Grid View Ends --%>
            <% } %>
        </center>
    </div>
</asp:Content>
