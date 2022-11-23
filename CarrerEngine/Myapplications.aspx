<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Myapplications.aspx.cs" Inherits="CarrerEngine.Myapplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="about-section pt-4 px-3 px-lg-4 mt-1">
        <div>
            <%-- Grid View to display list of jobs applied by login user --%>
            <asp:GridView ID="GridView1" runat="server" CssClass="leftmargin table table-bordered table-condensed table-responsive table-hover" AutoGenerateColumns="false" AllowPaging="false"
                OnPageIndexChanging="OnPaging" PageSize="10">
                <Columns>
                    <asp:BoundField ItemStyle-Width="150px" DataField="JobID" HeaderText="JobID" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="ApplicationID" HeaderText="ApplicationID" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="AppliedOn" HeaderText="AppliedOn" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="UpdatedOn" HeaderText="UpdatedOn" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Role" HeaderText="Role" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Company" HeaderText="Company" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="Status" HeaderText="Status" />

                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Button ID="UpdateStatus" runat="server" CommandArgument='<%#Eval("ApplicationID")%>' Text="Chat with requiter"
                                OnClick="StartChat_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <%-- Grid Ends --%>
            <br />
            <br />

        </div>
    </div>
</asp:Content>
