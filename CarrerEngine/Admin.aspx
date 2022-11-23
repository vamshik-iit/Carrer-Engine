<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="CarrerEngine.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <title>Admin</title>

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

    <div class="about-section pt-4 px-3 px-lg-4 mt-1">
        <div class="row header-btn d-none f-right d-lg-block"></div>
        <center>
            <div class="five">
                <h1>Pending user role amend Requests</h1>
            </div>
            <div>
            </div>
            <br />
            <%-- Grid to display the list of user who has request to become as recruiter --%>
            <asp:GridView ID="GridView1" runat="server" CssClass="leftmargin table table-bordered table-condensed table-responsive table-hover" AutoGenerateColumns="false" AllowPaging="false"
                OnPageIndexChanging="OnPaging" PageSize="10">
                <Columns>
                    <asp:BoundField ItemStyle-Width="150px" DataField="ReqID" HeaderText="ReqID" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="userid" HeaderText="UserID" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="FirstName" HeaderText="FirstName" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="LastName" HeaderText="LastName" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Email" HeaderText="Email" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Role" HeaderText="Role" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="RequestedProfile" HeaderText="RequestedProfile" />

                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <div style="padding-left: 5%">
                                <asp:DropDownList ID="Status" runat="server" placeholder="Featured" Width="100%" CssClass="input100">
                                    <asp:ListItem Value="Approve">Approve</asp:ListItem>
                                    <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="150px">

                        <ItemTemplate>                          
                            <asp:Button ID="UpdateReqStatus" runat="server" CommandArgument='<%#Eval("userid")+","+ Eval("ReqID")%>' Text="Update" CssClass="badge-info"
                                CommandName="ThisBtnClick" OnClick="UpdateReqStatus_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>


            <%-- Grid to display the list of jobs who has been requested to delete by recuiter 
                which are no longer needed to show in job portal --%>
            <div class="five">
                <h1>Pending job deletion Requests</h1>
            </div>
            <br />
            <asp:GridView ID="GridView2" runat="server" CssClass="leftmargin table table-bordered table-condensed table-responsive table-hover" AutoGenerateColumns="false" AllowPaging="false"
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
                            <div style="padding-left: 5%">
                                <asp:DropDownList ID="Status" runat="server" placeholder="Featured" Width="100%" CssClass="input100">
                                    <asp:ListItem Value="Approve">Approve</asp:ListItem>
                                    <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Button ID="UpdateReqStatus" runat="server" CommandArgument='<%#Eval("JobID")+","+ Eval("PostedBy")%>' CssClass="badge-info" Text="Update"
                                CommandName="ThisBtnClick" OnClick="UpdateJobReqStatus_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </center>
        <br />
    </div>
    <br />
</asp:Content>
