<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApplyJob.aspx.cs" Inherits="CarrerEngine.ApplyJob" %>

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

        .body {
            background: #4E9CAF
        }

        .tooltip {
            position: relative;
            display: inline-block;
            border-bottom: 1px dotted black;
        }

            .tooltip .tooltiptext {
                visibility: hidden;
                width: 120px;
                background-color: black;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 5px 0;
                /* Position the tooltip */
                position: absolute;
                z-index: 1;
            }

            .tooltip:hover .tooltiptext {
                visibility: visible;
            }

   
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- Card Design Starts --%>
    <div class="container" style="margin-bottom: 100px; margin-top: 40px">
        <div class="row mx-0 justify-content-left">
            <%-- User Profile Score Starts --%>
            <div class="col-md-7 col-lg-5 px-lg-2 col-xl-4 px-xl-0 px-xxl-3">
                <div class="w-100 rounded-1 p-4 border bg-white">
                    <asp:Label runat="server" Text="" CssClass="badge badge-pill badge-primary" ID="Job"> </asp:Label>
                    <br />
                    <br />
                    <asp:Label runat="server" Text="" ID="Role"> </asp:Label><br />
                    <br />
                    <asp:Label runat="server" Text="" ID="Company"> </asp:Label><br />
                    <br />
                    <asp:Label runat="server" Text="" ID="CTC"> </asp:Label><br />
                    <br />
                    <asp:Label runat="server" Text="" ID="Des"> </asp:Label><br />
                    <br />
                    <asp:Label runat="server" Text="" ID="RS"> </asp:Label><br />
                    <br />
                    <div class="border p-2 rounded d-flex flex-row align-items-center">

                        <div class="p-1 px-4 d-flex flex-column align-items-center score rounded">
                            <span class="text-success">
                                <asp:Label runat="server" Text="" ID="PS"> </asp:Label></span>
                        </div>


                        <div class="ml-2 p-3">
                            <h4 class="heading1">Profile Score</h4>
                            <div class="tooltip">
                                🛈                               
                                    <span class="tooltiptext">Tooltip text</span>
                            </div>
                            <span>The average profile score is 75% to stand in crowd</span>
                        </div>
                    </div>
                    <br />
                    <asp:Button runat="server" ID="Button1" OnClick="Apply_Click" Text="Apply" CssClass="btn btn-primary mt-2" />
                    <br />

                </div>
            </div>
            <%-- User Profile Score Ends --%>
            <div class="col-md-1"></div>
            <%-- Display Image Starts --%>
            <div class="col-md-4">
                <img src="assets/img/hero/20943447.jpg" style="width:500px; height:500px" />
            </div>
            <%-- Display Image Ends --%>
        </div>
        
    </div>

    <%-- Card Design Ends --%>

    <link href="https://fonts.googleapis.com/css?family=Poppins:600" rel="stylesheet">

</asp:Content>
