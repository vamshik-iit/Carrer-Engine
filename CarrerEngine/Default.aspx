<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarrerEngine.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<h1>Development is in progress please visit after some time, Sorry</h1>--%>

    <title></title>


    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">


    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/flaticon.css">
    <link rel="stylesheet" href="assets/css/price_rangs.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">

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
    </style>

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
               
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active">
                <div class="single-slider slider-height d-flex align-items-center" data-background="assets/img/hero/h1_hero.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-6 col-lg-9 col-md-10">
                                <div class="hero__caption">
                                    <h1>Find the most exciting job you ❤️</h1>
                                </div>
                                 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!-- Featured_job_start -->
        <section class="featured-job-area feature-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>Recent Job</span>
                            <h2>Featured Jobs</h2>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <%-- Dynamic Panel Design --%>
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
                                        <p><%= my.JobID %></p>
                                        <p><%= my.Description%></p>
                                        <a href="Applyjob.aspx?JobID=<%= my.JobID %>" class="button1">Apply</a>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>

                        <%-- Panel ends --%>
                    </div>
                </div>
            </div>
        </section>
        <!-- Featured_job_end -->

        <%-- Online Resume Starts --%>
        <div class="online-cv cv-bg section-overly pt-90 pb-120" data-background="assets/img/gallery/cv_bg.jpg">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10">
                        <div class="cv-caption text-center">
                            <p class="pera1">FEATURED TOURS Packages</p>
                            <p class="pera2">Make a Difference with Your Online Resume!</p>
                            <a href="ProfileEdit.aspx" class="border-btn2 border-btn4">Upload your CV/Update Profile</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- Online Resume Ends --%>

        <%-- How Our process works module Starts --%>
        <div class="apply-process-area apply-bg pt-150 pb-150" data-background="assets/img/gallery/how-applybg.png">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle white-text text-center">
                            <span>Apply process</span>
                            <h2>How it works</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-search"></span>
                            </div>
                            <div class="process-cap">
                                <h5>1. Search a job</h5>
                                <p>Find or filter the jobs you love and want to work for your dream to become</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-curriculum-vitae"></span>
                            </div>
                            <div class="process-cap">
                                <h5>2. Apply for job</h5>
                                <p>We made it simple for you, No more hectic process. Just one click!! See your profile score and apply for your dream job</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-process text-center mb-30">
                            <div class="process-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="process-cap">
                                <h5>3. Get your job</h5>
                                <p>Make an offer, Communicate with Recruiter</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- How Our process works module Starts --%>

        <%-- Testimonial Starts --%>
        <div class="testimonial-area testimonial-padding">
            <div class="container">
                <h4 style="margin-left: 35%">Product Designers & Developers</h4>
                <br />
                <div class="row d-flex justify-content-center">

                    <div class="col-xl-8 col-lg-8 col-md-10">
                        <div class="h1-testimonial-active dot-style">

                            <div class="single-testimonial text-center">
                                <div class="testimonial-caption ">
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="assets/img/testmonial/testimonial-founder-2.png" alt="">
                                            <span>Sanjay Boga</span>
                                            <p>1241032</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>“sboga@student.govst.edu”</p>
                                    </div>
                                </div>
                            </div>

                            <div class="single-testimonial text-center">
                                <div class="testimonial-caption ">
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="assets/img/testmonial/testimonial-founder-4.png" alt="">
                                            <span>Girish Charupati</span>
                                            <p>1242845</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>“gcharupati@student.govst.edu”</p>
                                    </div>
                                </div>
                            </div>

                            <div class="single-testimonial text-center">
                                <div class="testimonial-caption ">
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="assets/img/testmonial/testimonial-founder-5.png" alt="">
                                            <span>Sai Akhil Gujja</span>
                                            <p>1234167</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>“sgujja2@student.govst.edu”</p>
                                    </div>
                                </div>
                            </div>

                            <div class="single-testimonial text-center">
                                <div class="testimonial-caption ">
                                    <div class="testimonial-founder  ">
                                        <div class="founder-img mb-30">
                                            <img src="assets/img/testmonial/testimonial-founder-3.png" alt="">
                                            <span>Mallavarapu Anoop Vivek Sagar</span>
                                            <p>1249385</p>
                                        </div>
                                    </div>
                                    <div class="testimonial-top-cap">
                                        <p>“amallavarapu@student.govst.edu”</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- Testimonial Starts --%>
    </main>

</asp:Content>
