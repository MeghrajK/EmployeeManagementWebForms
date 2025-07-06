using EmployeeManagementWebForms;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagementWebForms.Pages
{
    public partial class AddEmployee : Page
    {
        private EmployeeDAL empDAL = new EmployeeDAL();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                txtHireDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    Employee emp = new Employee
                    {
                        FirstName = txtFirstName.Text.Trim(),
                        LastName = txtLastName.Text.Trim(),
                        Email = txtEmail.Text.Trim(),
                        Department = ddlDepartment.SelectedValue,
                        HireDate = Convert.ToDateTime(txtHireDate.Text),
                        Salary = Convert.ToDecimal(txtSalary.Text)
                    };

                    int newId = empDAL.InsertEmployee(emp);
                    if (newId > 0)
                    {
                        Response.Redirect("Default.aspx?msg=added");
                    }
                    else
                    {
                        ShowMessage("Error adding employee. Please try again.");
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage($"Error adding employee: {ex.Message}");
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
