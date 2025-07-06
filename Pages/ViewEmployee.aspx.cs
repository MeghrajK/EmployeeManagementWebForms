using EmployeeManagementWebForms;
using System;
using System.Web.UI;

namespace EmployeeManagementWebForms.Pages
{
    public partial class ViewEmployee : Page
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
                    lblId.Text = emp.Id.ToString();
                    lblFirstName.Text = emp.FirstName;
                    lblLastName.Text = emp.LastName;
                    lblEmail.Text = emp.Email;
                    lblDepartment.Text = emp.Department;
                    lblHireDate.Text = emp.HireDate.ToString("MMMM dd, yyyy");
                    lblSalary.Text = emp.Salary.ToString("C");
                    lblCreatedDate.Text = emp.CreatedDate.ToString("MMMM dd, yyyy");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            catch (Exception ex)
            {
                // Log error and redirect
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect($"EditEmployee.aspx?id={empId}");
        }
    }
}