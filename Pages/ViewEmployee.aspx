<%--<%@ Page Title="View Employee" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ViewEmployee.aspx.cs" Inherits="ViewEmployee" %>--%>
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewEmployee.aspx.cs" Inherits="EmployeeManagementWebForms.Pages.ViewEmployee" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-8">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2>Employee Details</h2>
                <div>
                    <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-warning" OnClick="btnEdit_Click">Edit</asp:LinkButton>
                    <a href="Default.aspx" class="btn btn-secondary">Back to List</a>
                </div>
            </div>
            
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <strong>Employee ID:</strong>
                                <asp:Label ID="lblId" runat="server" CssClass="form-control-plaintext"></asp:Label>
                            </div>
                            
                            <div class="mb-3">
                                <strong>First Name:</strong>
                                <asp:Label ID="lblFirstName" runat="server" CssClass="form-control-plaintext"></asp:Label>
                            </div>
                            
                            <div class="mb-3">
                                <strong>Last Name:</strong>
                                <asp:Label ID="lblLastName" runat="server" CssClass="form-control-plaintext"></asp:Label>
                            </div>
                            
                            <div class="mb-3">
                                <strong>Email:</strong>
                                <asp:Label ID="lblEmail" runat="server" CssClass="form-control-plaintext"></asp:Label>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="mb-3">
                                <strong>Department:</strong>
                                <asp:Label ID="lblDepartment" runat="server" CssClass="form-control-plaintext"></asp:Label>
                            </div>
                            
                            <div class="mb-3">
                                <strong>Hire Date:</strong>
                                <asp:Label ID="lblHireDate" runat="server" CssClass="form-control-plaintext"></asp:Label>
                            </div>
                            
                            <div class="mb-3">
                                <strong>Salary:</strong>
                                <asp:Label ID="lblSalary" runat="server" CssClass="form-control-plaintext"></asp:Label>
                            </div>
                            
                            <div class="mb-3">
                                <strong>Created Date:</strong>
                                <asp:Label ID="lblCreatedDate" runat="server" CssClass="form-control-plaintext"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>