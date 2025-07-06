using System;

namespace EmployeeManagementWebForms
{
    public class Employee
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Department { get; set; }
        public DateTime HireDate { get; set; }
        public decimal Salary { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public string FullName => $"{FirstName} {LastName}";
        public string FormattedSalary => Salary.ToString("C");
        public string FormattedHireDate => HireDate.ToString("MM/dd/yyyy");
    }
}