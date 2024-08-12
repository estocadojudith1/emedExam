using employeeApp_api.Models;
using Microsoft.EntityFrameworkCore;


namespace employeeApp_api.Data // Ensure this matches your project's namespace
{
    public class EmployeeDbContext : DbContext
    {
        public EmployeeDbContext(DbContextOptions<EmployeeDbContext> options) : base(options)
        {
        }

        public DbSet<Employee> Employees { get; set; }
    }
}
