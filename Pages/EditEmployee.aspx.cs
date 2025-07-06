using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagementWebForms.Pages
{
    public partial class EditEmployee : Page
    {
        private EmployeeDAL empDAL = new EmployeeDAL();
        private int empId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["id"], out empId))
            {
                Response.Redirect("Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadEmployee();
            }
        }

        private void LoadEmployee()
        {
            try
            {
                Employee emp = empDAL.GetEmployeeById(empId);
                if (emp != null)
                {
                    txtFirstName.Text = emp.FirstName;
                    txtLastName.Text = emp.LastName;
                    txtEmail.Text = emp.Email;
                    ddlDepartment.SelectedValue = emp.Department;
                    txtHireDate.Text = emp.HireDate.ToString("yyyy-MM-dd");
                    txtSalary.Text = emp.Salary.ToString();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error loading employee: {ex.Message}");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    Employee emp = new Employee
                    {
                        Id = empId,
                        FirstName = txtFirstName.Text.Trim(),
                        LastName = txtLastName.Text.Trim(),
                        Email = txtEmail.Text.Trim(),
                        Department = ddlDepartment.SelectedValue,
                        HireDate = Convert.ToDateTime(txtHireDate.Text),
                        Salary = Convert.ToDecimal(txtSalary.Text)
                    };

                    bool success = empDAL.UpdateEmployee(emp);
                    if (success)
                    {
                        Response.Redirect("Default.aspx?msg=updated");
                    }
                    else
                    {
                        ShowMessage("Error updating employee. Please try again.");
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage($"Error updating employee: {ex.Message}");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        private void ShowMessage(string message)
        {
            lblMessage.Text = message;
            lblMessage.Visible = true;
        }
    }
}