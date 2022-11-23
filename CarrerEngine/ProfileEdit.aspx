<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileEdit.aspx.cs" Inherits="CarrerEngine.ProfileEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Right Resume</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin" />
    <link rel="preload" as="style" href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&amp;family=Roboto:wght@300;400;500;700&amp;display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&amp;family=Roboto:wght@300;400;500;700&amp;display=swap" media="print" onload="this.media='all'" />
    <noscript>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&amp;family=Roboto:wght@300;400;500;700&amp;display=swap" />
    </noscript>
    <link href="css/font-awesome/css/all.min.css?ver=1.2.0" rel="stylesheet">
    <link href="css/bootstrap.min.css?ver=1.2.0" rel="stylesheet">
    <link href="css/aos.css?ver=1.2.0" rel="stylesheet">
    <link href="css/main.css?ver=1.2.0" rel="stylesheet">
    <noscript>
        <style type="text/css">
            [data-aos] {
                opacity: 1 !important;
                transform: translate(0) scale(1) !important;
            }


            .Txtstyle3[type=text], textarea {
                transition: all 0.30s ease-in-out;
                outline: none;
                border: 1px solid #666666;
            }

                .Txtstyle3[type=text]:focus, textarea:focus {
                    box-shadow: 0px 0px 5px #66FF99;
                    padding: 2px 0px 2px 2px;
                    margin: 2px 1px 3px 1px;
                    border: 1px solid #009900;
                }
        </style>
    </noscript>
    <style>
        .bdr {
            background: #eae9e9;
        }

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
            }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <%-- Online Resume Edit Functionalty Option Starts --%>
    <header class="d-print-none">
        <div class="about-section pt-4 px-3 px-lg-4 mt-1">
            <div class="row">
                <div class="col-md-9">
                </div>
                <div class="col-md-3">
                    <div class="five">
                        <h4>
                            <div class="text-center p-t-136">
                                <a class="badge badge-info" href="UserProfile.aspx?profileid=">Back to Profile</a>
                            </div>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <%-- Online Resume Edit Ends--%>

    <%-- Form to fill by job seakers such as education , certifcation, work exp etc. --%>
    <div>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">

                        <span class="font-weight-bold">
                            <asp:Label runat="server" ID="Name" Text=""></asp:Label>

                        </span>
                        <span class="text-black-50">
                            <asp:Label runat="server" ID="Email" Text=""></asp:Label>

                        </span>
                        <span>
                            <br />
                            About Me
                            <br />
                            <asp:TextBox ID="aboutus" runat="server" TextMode="multiline" CssClass="bdr" MaxLength="1200" lines="10" cols="10" Wrap="true" />
                        </span>
                    </div>

                </div>
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="five">
                                <h1>Profile Settings</h1>
                            </div>
                            <%--   <h4 class="text-right"></h4>--%>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label class="labels">First Name</label>

                                <asp:TextBox runat="server" CssClass="form-control" ID="FName" placeholder="first name"></asp:TextBox>

                            </div>
                            <div class="col-md-6">
                                <label class="labels">Last Name</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="LName" placeholder="last name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12">
                                <label class="labels">Mobile Number</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="Mobile" placeholder="Mobile"></asp:TextBox>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Address Line 1(Street)</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="Street" placeholder="Street"></asp:TextBox>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Address Line 2(City)</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="City" placeholder="City"></asp:TextBox>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="labels">Country</label>

                                    <asp:TextBox runat="server" CssClass="form-control" ID="country" placeholder="country"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">State/Region</label>

                                    <asp:TextBox runat="server" CssClass="form-control" ID="State" placeholder="State"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <label class="labels">Postcode</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="Zipcode" placeholder="Zipcode"></asp:TextBox>


                            </div>
                            <div class="col-md-12">
                                <label class="labels">Primary Skill</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="PS" placeholder="Primary skill"></asp:TextBox>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Secondary Skill</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="SS" placeholder="Secondary Skill"></asp:TextBox>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Other Skills</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="OS" placeholder="Other Skills"></asp:TextBox>
                            </div>
                        </div>


                        <br />
                        <div class="five">
                            <h1>Graduation details</h1>
                        </div>

                        <div class="col-md-12">
                            <label class="labels">University</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="GradUniv" placeholder="University"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">Specialization</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="GradSpec" placeholder="Specialization"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">GPA</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="GradGpa" placeholder="GPA"></asp:TextBox>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <label class="labels">From</label>

                                <asp:TextBox runat="server" CssClass="form-control" ID="GradFrom" placeholder="From"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="labels">To</label>

                                <asp:TextBox runat="server" CssClass="form-control" ID="GradTo" placeholder="To"></asp:TextBox>
                            </div>


                            <br />

                            <br />

                            <div class="five" style="margin-top:20px">
                                <h1>Under Graduation details</h1>
                            </div>

                            <div class="col-md-12">
                                <label class="labels">University</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="UGUniv" placeholder="University"></asp:TextBox>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Specialization</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="UGSpec" placeholder="Specialization"></asp:TextBox>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">GPA</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="UGGPA" placeholder="GPA"></asp:TextBox>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <label class="labels">From</label>

                                    <asp:TextBox runat="server" CssClass="form-control" ID="UGFrom" placeholder="From"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="labels">To</label>

                                    <asp:TextBox runat="server" CssClass="form-control" ID="UGTo" placeholder="To"></asp:TextBox>
                                </div>


                                <br />
                                <div class="five" style="margin-top:20px">
                                    <h1>High School details</h1>
                                </div>

                                <div class="col-md-12">
                                    <label class="labels">School/University</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="HSUniv" placeholder="University"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Specialization</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="HSSpec" placeholder="Specialization"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">GPA</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="HSGPA" placeholder="GPA"></asp:TextBox>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label class="labels">From</label>

                                        <asp:TextBox runat="server" CssClass="form-control" ID="HSFrom" placeholder="From"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="labels">To</label>

                                        <asp:TextBox runat="server" CssClass="form-control" ID="HSTo" placeholder="To"></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                        </div>


                        <div class="mt-5 text-center">

                            <asp:Button runat="server" CssClass="btn btn-primary profile-button" ID="SaveProfile" Text="Save Profile" OnClick="SaveProfile_Click" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center experience">
                            <div class="five">
                                <h1>Work Experience</h1>
                            </div>
                            <%--<span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Experience</span>--%>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <label class="labels">Company</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="Company" placeholder="Company"></asp:TextBox>

                        </div>
                        <br>
                        <div class="col-md-12">
                            <label class="labels">Role</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="Role" placeholder="Role"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">From</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="WFrom" placeholder="YYYY-MM-DD"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">To</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="WTo" placeholder="YYYY-MM-DD"></asp:TextBox>
                        </div>

                    </div>

                    <div class="p-3 py-5">
                        <br>
                        <div class="col-md-12">
                            <label class="labels">Company</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="Company2" placeholder="Company"></asp:TextBox>

                        </div>
                        <br>
                        <div class="col-md-12">
                            <label class="labels">Role</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="Role2" placeholder="Role"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">From</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="WFrom2" placeholder="YYYY-MM-DD"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label class="labels">To</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="WTo2" placeholder="YYYY-MM-DD"></asp:TextBox>
                        </div>

                    </div>



                    <div class="p-3 py-5">
                        <div class="five">
                            <h1>Certifications</h1>
                        </div>
                        <br>
                        <div class="col-md-12">
                            <label class="labels">Name</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="CertName" placeholder="Name"></asp:TextBox>
                            <div class="col-md-12">
                                <label class="labels">IssuedBy</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="IssuedBy" placeholder="IssuedBy"></asp:TextBox>
                            </div>
                            <br>
                            <div class="col-md-12">
                                <label class="labels">Description</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="CertDesc" placeholder="Description"></asp:TextBox>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Issued On</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="CertIssued" placeholder="YYYY-MM-DD"></asp:TextBox>
                            </div>
                            <div class="col-md-12">
                                <label class="labels">Valid Till</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="CertValid" placeholder="YYYY-MM-DD"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- Form Ends --%>

    <style>
        body {
            background: rgb(191, 202, 219)
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #BA68C8
        }

        .profile-button {
            background: rgb(99, 39, 120);
            box-shadow: none;
            border: none
        }

            .profile-button:hover {
                background: #682773
            }

            .profile-button:focus {
                background: #682773;
                box-shadow: none
            }

            .profile-button:active {
                background: #682773;
                box-shadow: none
            }

        .back:hover {
            color: #682773;
            cursor: pointer
        }

        .labels {
            font-size: 11px
        }

        .add-experience:hover {
            background: #BA68C8;
            color: #fff;
            cursor: pointer;
            border: solid 1px #BA68C8
        }
    </style>
</asp:Content>
