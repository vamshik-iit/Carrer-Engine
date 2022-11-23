<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CarrerEngine.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Online Resume</title>
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
        </style>
    </noscript>
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
    <%-- Form This is a online resume designed exaclty similar to hardcopy resume --%>
    <div>

        <%-- Edit Profile Button to navigate to ProfileEdit.aspx page --%>
        <header class="d-print-none">
            <div class="container text-center text-lg-left">
                <div class="py-3 clearfix">
                    <div class="five">
                        <h1>
                            <asp:Label runat="server" Text="" ID="UserName"></asp:Label>
                            <div class="text-center p-t-136">
                                <a class="badge badge-info" href="ProfileEdit.aspx">Edit profile</a>
                            </div>
                        </h1>
                    </div>
                    <div class="site-nav">
                        <nav role="navigation">
                            <ul class="nav justify-content-center">
                                <li class="nav-item"><a class="nav-link" href="https://twitter.com/templateflip" title="Twitter"><i class="fab fa-twitter"></i><span class="menu-title sr-only">Twitter</span></a>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="https://www.facebook.com/templateflip" title="Facebook"><i class="fab fa-facebook"></i><span class="menu-title sr-only">Facebook</span></a>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="https://www.instagram.com/templateflip" title="Instagram"><i class="fab fa-instagram"></i><span class="menu-title sr-only">Instagram</span></a>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="https://github.com/templateflip" title="Github"><i class="fab fa-github"></i><span class="menu-title sr-only">Github</span></a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <%-- Ends --%>


        <%-- User Input Form DIsplay Starts --%>
        <div class="page-content">
            <div class="container">
                <div class="cover shadow-lg bg-white">
                    <div class="about-section pt-4 px-3 px-lg-4 mt-1">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="five">
                                    <h1>About Me</h1>
                                </div>
                                <div class="pb-1 text-secondary">
                                    <asp:Label runat="server" ID="ABOUT" Text=""></asp:Label>
                                </div>                                
                            </div>
                            <div class="col-md-5 offset-md-1">
                                <div class="row mt-2">

                                    <div class="col-sm-4">
                                        <div class="pb-1">Email</div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="pb-1 text-secondary">
                                            <asp:Label runat="server" ID="email" Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="pb-1">Phone</div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="pb-1 text-secondary">
                                            <asp:Label runat="server" ID="Mobile" Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="pb-1">Address</div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="pb-1 text-secondary">
                                            <asp:Label runat="server" ID="Address" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="d-print-none" />
                    <div class="skills-section px-3 px-lg-4">
                        <div class="five">
                            <h1>Professional Skills</h1>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <span>
                                        <asp:Label runat="server" ID="PS" Text=""></asp:Label></span>

                                </div>
                                <div class="mb-2">
                                    <span>
                                        <asp:Label runat="server" ID="SS" Text=""></asp:Label></span>

                                </div>
                                <div class="mb-2">
                                    <span>
                                        <asp:Label runat="server" ID="OS" Text=""></asp:Label></span>

                                </div>
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div>
                    </div>
                    <hr class="d-print-none" />
                    <div class="work-experience-section px-3 px-lg-4">
                        <div class="five">
                            <h1>Work Experience</h1>
                        </div>
                        <div class="timeline">
                            <div class="timeline-card timeline-card-primary card shadow-sm">
                                <div class="card-body">
                                    <div class="h5 mb-1">
                                        <asp:Label runat="server" ID="WRole" Text=""></asp:Label>
                                        <span class="text-muted h6">
                                            <asp:Label runat="server" ID="WCompany" Text=""></asp:Label></span>
                                    </div>
                                    <div class="text-muted text-small mb-2">
                                        <asp:Label runat="server" ID="WTen" Text=""></asp:Label>
                                    </div>
                                    <div>
                                        <asp:Label runat="server" ID="WDes" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="timeline-card timeline-card-primary card shadow-sm">
                                <div class="card-body">
                                    <div class="h5 mb-1">
                                        <asp:Label runat="server" ID="WRole2" Text=""></asp:Label>
                                        <span class="text-muted h6">
                                            <asp:Label runat="server" ID="WCompany2" Text=""></asp:Label></span>
                                    </div>
                                    <div class="text-muted text-small mb-2">
                                        <asp:Label runat="server" ID="WTen2" Text=""></asp:Label>
                                    </div>
                                    <div>
                                        <asp:Label runat="server" ID="WDes2" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <hr class="d-print-none" />
                    <div class="page-break"></div>
                    <div class="education-section px-3 px-lg-4 pb-4">
                        <div class="five">
                            <h1>Education</h1>
                        </div>
                        <div class="timeline">
                            <div class="timeline-card timeline-card-success card shadow-sm">
                                <div class="card-body">
                                    <div class="h5 mb-1">
                                        <asp:Label runat="server" ID="GradSpec" Text=""></asp:Label>
                                        <span class="text-muted h6">
                                            <asp:Label runat="server" ID="GradUniv" Text=""></asp:Label></span>
                                    </div>
                                    <div class="text-muted text-small mb-2">
                                        <asp:Label runat="server" ID="GradTime" Text=""></asp:Label>
                                    </div>
                                    <div class="text-muted text-small mb-2">
                                        <asp:Label runat="server" ID="GradGPA" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-card timeline-card-success card shadow-sm">
                                <div class="card-body">

                                    <div class="h5 mb-1">
                                        <asp:Label runat="server" ID="UGSpec" Text=""></asp:Label>
                                        <span class="text-muted h6">
                                            <asp:Label runat="server" ID="UGUniv" Text=""></asp:Label></span>
                                    </div>
                                    <div class="text-muted text-small mb-2">
                                        <asp:Label runat="server" ID="UGTime" Text=""></asp:Label>
                                    </div>
                                    <div class="text-muted text-small mb-2">
                                        <asp:Label runat="server" ID="UGGPA" Text=""></asp:Label>
                                    </div>

                                </div>
                            </div>
                            <div class="timeline-card timeline-card-success card shadow-sm">
                                <div class="card-body">

                                    <div class="h5 mb-1">
                                        <asp:Label runat="server" ID="HSSpec" Text=""></asp:Label>
                                        <span class="text-muted h6">
                                            <asp:Label runat="server" ID="HSUniv" Text=""></asp:Label></span>
                                    </div>
                                    <div class="text-muted text-small mb-2">
                                        <asp:Label runat="server" ID="HSTime" Text=""></asp:Label>
                                    </div>
                                    <div class="text-muted text-small mb-2">
                                        <asp:Label runat="server" ID="HSGPA" Text=""></asp:Label>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>





                    <hr class="d-print-none" />
                    <div class="page-break"></div>
                    <div class="education-section px-3 px-lg-4 pb-4">
                        <div class="five">
                            <h1>Certifications</h1>
                        </div>
                        <div class="timeline">
                            <div class="timeline-card timeline-card-success card shadow-sm">
                                <div class="card-body">
                                    <div class="h5 mb-1">
                                        <asp:Label runat="server" ID="CertName" Text=""></asp:Label>
                                        <span class="text-muted h6">
                                            <asp:Label runat="server" ID="CertFrom" Text=""></asp:Label></span>
                                    </div>
                                    <div class="text-muted text-small mb-2">
                                        <asp:Label runat="server" ID="CertDesc" Text=""></asp:Label>
                                    </div>
                                    <div class="text-muted text-small mb-2">
                                        <asp:Label runat="server" ID="CertExp" Text=""></asp:Label>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    <hr class="d-print-none" />
                    <div class="contant-section px-3 px-lg-4 pb-4" id="contact">

                        <div class="row">
                            <div class="col-md-7 d-print-none">
                                <div class="my-2">
                                </div>
                            </div>
                            <div class="col d-none d-print-block">
                                <div class="mt-2">
                                    <div>
                                        <div class="mb-2">
                                            <div class="text-dark">
                                                <i class="fab fa-twitter mr-1"></i><span>https://twitter.com/templateflip</span>
                                            </div>
                                        </div>
                                        <div class="mb-2">
                                            <div class="text-dark">
                                                <i class="fab fa-facebook mr-1"></i><span>https://www.facebook.com/templateflip</span>
                                            </div>
                                        </div>
                                        <div class="mb-2">
                                            <div class="text-dark">
                                                <i class="fab fa-instagram mr-1"></i><span>https://www.instagram.com/templateflip</span>
                                            </div>
                                        </div>
                                        <div class="mb-2">
                                            <div class="text-dark">
                                                <i class="fab fa-github mr-1"></i><span>https://github.com/templateflip</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- Form Ends --%>
        <script src="scripts/bootstrap.bundle.min.js?ver=1.2.0"></script>
        <script src="scripts/aos.js?ver=1.2.0"></script>
        <script src="scripts/main.js?ver=1.2.0"></script>

    </div>
    <%-- Form ENds --%>
</asp:Content>
