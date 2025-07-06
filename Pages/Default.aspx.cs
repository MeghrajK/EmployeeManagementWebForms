using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmployeeManagementWebForms;

namespace EmployeeManagementWebForms.Pages
{
    public partial class Default : Page
    {
        private EmployeeDAL empDAL = new EmployeeDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployees();

                // Check for success message
                if (Request.QueryString["msg"] == "added")
                {
                    ShowMessage("Employee added successfully!", "alert-success");
                }
                else if (Request.QueryString["msg"] == "updated")
                {
                    ShowMessage("Employee updated successfully!", "alert-success");
                }
                else if (Request.QueryString["msg"] == "deleted")
                {
                    ShowMessage("Employee deleted successfully!", "alert-success");
                }
            }
        }

        private void BindEmployees()
        {
            try
            {
                var employees = empDAL.GetAllEmployees();
                gvEmployees.DataSource = employees;
                gvEmployees.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage($"Error loading employees: {ex.Message}", "alert-danger");
            }
        }

        protected void gvEmployees_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int empId = Convert.ToInt32(e.CommandArgument);

            switch (e.CommandName)
            {
                case "ViewEmployee":
                    Response.Redirect($"ViewEmployee.aspx?id={empId}");
                    break;
                case "EditEmployee":
                    Response.Redirect($"EditEmployee.aspx?id={empId}");
                    break;
                case "DeleteEmployee":
                    DeleteEmployee(empId);
                    break;
            }
        }

        protected void gvEmployees_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#f5f5f5'");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=''");
            }
        }

        private void DeleteEmployee(int empId)
        {
            try
            {
                bool success = empDAL.DeleteEmployee(empId);
                if (success)
                {
                    Response.Redirect("Default.aspx?msg=deleted");
                }
                else
                {
                    ShowMessage("Error deleting employee.", "alert-danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error deleting employee: {ex.Message}", "alert-danger");
            }
        }

        private void ShowMessage(string message, string alertType)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = $"alert {alertType}";
            lblMessage.Visible = true;
        }
    }
}