USE [master]
GO

-- Create the EmployeeDB database
CREATE DATABASE [EmployeeDB]
GO

-- Set the compatibility level
ALTER DATABASE [EmployeeDB] SET COMPATIBILITY_LEVEL = 160
GO

-- Use the EmployeeDB database
USE [EmployeeDB]
GO

-- Create the employees table
CREATE TABLE [dbo].[employees](
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(100) NULL,
	[Position] NVARCHAR(100) NULL,
	[Department] NVARCHAR(100) NULL,
	[Address] NVARCHAR(255) NULL,
	[Email] NVARCHAR(255) NULL,
	[Phone] NVARCHAR(20) NULL
)
GO

-- Insert data into the employees table
SET IDENTITY_INSERT [dbo].[employees] ON 
INSERT INTO [dbo].[employees] ([Id], [Name], [Position], [Department], [Address], [Email], [Phone]) VALUES 
(30, N'Monkey D. Luffy', N'Senior Developer', N'IT', N'Kingdom from far far away', N'luffy@email', N'09857367537'),
(31, N'Bongbong Marcos', N'QA Engineer', N'IT', N'Cavite', N'marcos@email', N'09767775437'),
(32, N'Nico Robin', N'Software Developer', N'IT', N'Neverland', N'robin@email', N'09038457283'),
(33, N'Bill Gates', N'Senior Developer', N'IT', N'Calamba, Laguna', N'gatesl@email', N'09034574572'),
(34, N'Bini Gwen', N'QA Engineer', N'IT', N'Legazpi Albay', N'gwen@email', N'09763418769')
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
