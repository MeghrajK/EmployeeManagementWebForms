<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmployeeManagementWebForms.Pages.Default" %>

<%--<%@ Page Title="Employee List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2>Employee List</h2>
                <a href="AddEmployee.aspx" class="btn btn-primary">Add New Employee</a>
            </div>
            
            <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-info" Visible="false"></asp:Label>
            
            <div class="table-responsive">
                <asp:GridView ID="gvEmployees" runat="server" 
                    CssClass="table table-striped table-hover"
                    AutoGenerateColumns="False"
                    OnRowCommand="gvEmployees_RowCommand"
                    OnRowDataBound="gvEmployees_RowDataBound"
                    DataKeyNames="Id">
                    <Columns>
                        <asp:BoundField DataField="FullName" HeaderText="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Department" HeaderText="Department" />
                        <asp:BoundField DataField="FormattedHireDate" HeaderText="Hire Date" />
                        <asp:BoundField DataField="FormattedSalary" HeaderText="Salary" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnView" runat="server" 
                                    CommandName="ViewEmployee" 
                                    CommandArgument='<%# Eval("Id") %>'
                                    CssClass="btn btn-sm btn-info me-1">View</asp:LinkButton>
                                <asp:LinkButton ID="btnEdit" runat="server" 
                                    CommandName="EditEmployee" 
                                    CommandArgument='<%# Eval("Id") %>'
                                    CssClass="btn btn-sm btn-warning me-1">Edit</asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" 
                                    CommandName="DeleteEmployee" 
                                    CommandArgument='<%# Eval("Id") %>'
                                    CssClass="btn btn-sm btn-danger"
                                    OnClientClick="return confirm('Are you sure you want to delete this employee?');">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="table-dark" />
                    <EmptyDataTemplate>
                        <div class="text-center p-4">
                            <p>No employees found.</p>
                            <a href="AddEmployee.aspx" class="btn btn-primary">Add First Employee</a>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>