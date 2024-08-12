Employee List Application

Overview

This application is designed for managing employee information. It allows users to:

-View a list of all employees
-View detailed information of individual employees
-Create new employee records
-Edit existing employee records
-Delete employee records

Technologies Used

-ASP.NET for the Web API
-Vue.js for the frontend framework
-Bootstrap for the UI framework
-Setup Instructions


To run the application locally, follow these steps:

Import the Database

Option 1: Import the .bak file

Open SQL Server Management Studio.
Right-click on the Databases folder and select Restore Database.
Choose Device and select the EmployeeDB.bak file from the database folder.
Click OK to restore the database.

Option 2: Run the SQL script

Open SQL Server Management Studio.
Connect to your SQL Server instance.
Open a new query window and execute the script.sql file located in the database folder.


Run the Web API

Open the EmployeeApp_api.sln file using Visual Studio.
Set the startup project to the Web API project.
Press F5 to build and run the Web API. This should start the API and open a browser window with the API running.
Run the Vue.js Web Application

Open a terminal or command prompt.
Navigate to the employeeapp folder (where your Vue.js project is located).

Install the necessary dependencies by running:
- npm install

Start the Vue.js development server by running:
- npm run serve
