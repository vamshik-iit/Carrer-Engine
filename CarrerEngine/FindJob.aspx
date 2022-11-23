<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FindJob.aspx.cs" Inherits="CarrerEngine.FindJob" %>

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
        .card {
            height: 450px;
        }

            .card:hover {
                box-shadow: -1px 9px 40px -12px #808080;
            }

        .button1 {
            display: block;
            width: 115px;
            height: 50px;
            background: #4E9CAF;
            padding: 10px;
            text-align: center;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            line-height: 25px;
        }
    </style>

    <style>
        .button {
            display: inline-block;
            border-radius: 4px;
            background-color: #f4511e;
            border: none;
            color: #FFFFFF;
            text-align: center;
            font-size: 18px;
            width: 100%;
            transition: all 0.5s;
            cursor: pointer;
            margin: 5px;
        }

            .button span {
                cursor: pointer;
                display: inline-block;
                position: relative;
                transition: 0.5s;
            }

                .button span:after {
                    content: '\00bb';
                    position: absolute;
                    opacity: 0;
                    top: 0;
                    right: -20px;
                    transition: 0.5s;
                }

            .button:hover span {
                padding-right: 25px;
            }

                .button:hover span:after {
                    opacity: 1;
                    right: 0;
                }


        /* === HEADING STYLE #5 === */
        .five h1 {
            text-align: center;
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


    <div class="about-section pt-4 px-3 px-lg-4 mt-1">

        <%-- If login user role is job seaker then only this option to become recuiter will be shown --%>
        <% if (Session["Role"].ToString() == "JobSeaker")
            {  %>
                <div class="row header-btn d-none f-left d-lg-block" style="padding-left: 1055px">
                    <asp:Button runat="server" CssClass="button" ID="Reqstbtn" Text="👨‍🎓 Become Recruiter" OnClick="Req_Click" Visible="false" />
                </div>
        <% } %>

        <br />
        <br />
        <center>
            <div class="five">
                <h1>Available Jobs on Portal</h1>
            </div>
            <br />
            <br />
            <h6>Filter</h6>
            <div>
                <%-- Filter Option Starts --%>
                <table>
                    <tr>
                        <th>
                            <asp:TextBox runat="server" CssClass="input-form" ID="JobTitle" placeholder="Job title"></asp:TextBox>
                        </th>
                        <th>
                            <div style="padding-left: 10px">
                                <asp:TextBox runat="server" CssClass="input-form" ID="JobCompany" placeholder="Company"></asp:TextBox>
                            </div>
                        </th>
                        <th>
                            <asp:DropDownList ID="FilterLocations" runat="server" placeholder="Featured">
                                <asp:ListItem Value="">Please Select Location</asp:ListItem>
                            </asp:DropDownList>
                        </th>
                        <th>
                            <div style="padding-left: 10px">
                                <asp:DropDownList ID="CTCDD" runat="server" placeholder="Salary">
                                    <asp:ListItem Value="--select--">Please Select salary range</asp:ListItem>
                                    <asp:ListItem Value="<100000"><100000</asp:ListItem>
                                    <asp:ListItem Value="<150000"><150000</asp:ListItem>
                                    <asp:ListItem Value="<200000"><200000</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </th>
                        <th>
                            <div style="padding-left: 10px">
                                <asp:DropDownList ID="Experience" runat="server" placeholder="Experience">
                                    <asp:ListItem Value="--select--">select</asp:ListItem>
                                    <asp:ListItem Value="EarlyCareer">Early career</asp:ListItem>
                                    <asp:ListItem Value="Experienced">Experienced</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </th>
                        <th>
                            <div style="padding-left: 10px">
                                <asp:Button runat="server" CssClass="btn btn-primary mt-2" Text="Find" ID="Filter" OnClick="Filter_Click" />
                            </div>
                        </th>
                    </tr>
                    <tr>
                    </tr>
                </table>
                <%-- Filter Option Ends --%>
            </div>
            <br />
            <br />
            <br />


            <%-- Dynamic Panel Design Starts--%>
            <%-- Get data from backend and bind data using class object --%>
            <div class="row" style="margin-left: 10px; margin-right: 20px">
                <% foreach (var my in findjobs)
                    { %>

                <div class="card" style="width: 18em; margin: 10px">
                    <div class="card-body">
                        <div class="card-title">

                            <div class="five">
                                <h1><%= my.Role%></h1>
                            </div>                            
                        </div>
                        <div class="card-text">

                            <p>Company: <%= my.Company %></p>
                            <p>Cost to company: <%= my.CTC %></p>
                            <p>Location: <%= my.Location %></p>

                            <p><%= my.Skills %></p>
                            <p><%= my.Description%></p>

                            <h2>
                                <a href="Applyjob.aspx?JobID=<%= my.JobID %>" class="button1">Apply</a>
                            </h2>

                        </div>




                    </div>
                </div>

                <% } %>
            </div>

            <%-- Dynamic Panel Design End--%>

            <br />
            <br />

        </center>

        <br />

    </div>
    <div class="row justify-content-center">
        <img src="assets/img/hero/11000.jpg" style="width: 700px" />
    </div>


</asp:Content>
