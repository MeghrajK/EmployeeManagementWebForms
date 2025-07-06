<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="EmployeeManagementWebForms.Pages.AddEmployee" %>--%>
<%@ Page Title="Add Employee" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AddEmployee.aspx.cs" Inherits="EmployeeManagementWebForms.Pages.AddEmployee" %>

<%--<%@ Page Title="Add Employee" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AddEmployee.aspx.cs" Inherits="AddEmployee" %>--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-8">
            <h2>Add New Employee</h2>
            
            <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-danger" Visible="false"></asp:Label>
            
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <asp:Label ID="lblFirstName" runat="server" Text="First Name" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                                    ControlToValidate="txtFirstName" 
                                    ErrorMessage="First name is required" 
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </div>
                            
                            <div class="mb-3">
                                <asp:Label ID="lblLastName" runat="server" Text="Last Name" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                                    ControlToValidate="txtLastName" 
                                    ErrorMessage="Last name is required" 
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </div>
                            
                            <div class="mb-3">
                                <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                    ControlToValidate="txtEmail" 
                                    ErrorMessage="Email is required" 
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                    ControlToValidate="txtEmail" 
                                    ErrorMessage="Please enter a valid email address" 
                                    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                                    CssClass="text-danger"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="mb-3">
                                <asp:Label ID="lblDepartment" runat="server" Text="Department" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Select Department" Value="" />
                                    <asp:ListItem Text="IT" Value="IT" />
                                    <asp:ListItem Text="HR" Value="HR" />
                                    <asp:ListItem Text="Sales" Value="Sales" />
                                    <asp:ListItem Text="Marketing" Value="Marketing" />
                                    <asp:ListItem Text="Finance" Value="Finance" />
                                    <asp:ListItem Text="Operations" Value="Operations" />
                                </asp:DropDownList>
                            </div>
                            
                            <div class="mb-3">
                                <asp:Label ID="lblHireDate" runat="server" Text="Hire Date" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtHireDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvHireDate" runat="server" 
                                    ControlToValidate="txtHireDate" 
                                    ErrorMessage="Hire date is required" 
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </div>
                            
                            <div class="mb-3">
                                <asp:Label ID="lblSalary" runat="server" Text="Salary" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" TextMode="Number" step="0.01"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvSalary" runat="server" 
                                    ControlToValidate="txtSalary" 
                                    ErrorMessage="Salary is required" 
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rvSalary" runat="server" 
                                    ControlToValidate="txtSalary" 
                                    ErrorMessage="Salary must be between 0 and 999999" 
                                    MinimumValue="0" 
                                    MaximumValue="999999" 
                                    Type="Double" 
                                    CssClass="text-danger"></asp:RangeValidator>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <asp:Button ID="btnSave" runat="server" Text="Save Employee" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>