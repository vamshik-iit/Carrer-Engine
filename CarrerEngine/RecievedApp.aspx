<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RecievedApp.aspx.cs" Inherits="CarrerEngine.RecievedApp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="about-section pt-4 px-3 px-lg-4 mt-1">

        <div>
            <%-- Grid View to bind Job which got applied by job seaker this is only visible to admin and recuriter --%>
            <asp:GridView ID="GridView1" runat="server" CssClass="leftmargin table table-bordered table-condensed table-responsive table-hover" AutoGenerateColumns="false" AllowPaging="false"
                OnPageIndexChanging="OnPaging" PageSize="10">
                <Columns>
                    <asp:BoundField ItemStyle-Width="150px" DataField="JobID" HeaderText="JobID" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="ApplicationID" HeaderText="ApplicationID" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="AppliedOn" HeaderText="AppliedOn" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="UpdatedOn" HeaderText="UpdatedOn" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Role" HeaderText="Role" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Company" HeaderText="Company" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Status" HeaderText="CurrentStatus" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="ProfileScore" HeaderText="ProfileScore" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="UserID" HeaderText="UserID" />

                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <div style="padding-left: 5%">
                                <a class="badge badge-info" href="UserProfile.aspx?profileid=<%#Eval("UserID")%>" style="color: black">View profile</a>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <div style="padding-left: 5%">
                                <asp:DropDownList ID="Status" runat="server" placeholder="Featured" Width="100%" CssClass="input100" OnSelectedIndexChanged="Status_SelectedIndexChanged">
                                    <asp:ListItem Value="Offer a position">Offer a position</asp:ListItem>
                                    <asp:ListItem Value="Pending with Technical team">Pending with Technical team</asp:ListItem>
                                    <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>



                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Button ID="UpdateStatus" runat="server" CssClass="badge-success"  CommandArgument='<%#Eval("ApplicationID")%>' Text="Update"
                                OnClick="UpdateStatus_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Button ID="Chat" runat="server" CssClass="badge-primary" CommandArgument='<%#Eval("ApplicationID")%>' Text="View/Start Message"
                                OnClick="StartChat_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>



                </Columns>
            </asp:GridView>
            <%-- Grid VIew Ends --%>
            <br />
            <br />

        </div>
    </div>



</asp:Content>
