PRINT 'CREATE DATABASE EKT'
CREATE DATABASE EKT
GO

PRINT 'USE EKT'
USE EKT
GO

PRINT 'sys.sp_cdc_enable_db'
EXEC sys.sp_cdc_enable_db
GO

PRINT 'sp_configure ''clr enabled'', 1'
EXEC sp_configure 'clr enabled', 1
GO

PRINT 'RECONFIGURE'
reconfigure
GO

CREATE TABLE ExampleTable
(
    ID    INT PRIMARY KEY,
    Name  VARCHAR(50),
    Age   INT,
    Email VARCHAR(100)
)
GO

DECLARE @counter INT = 1
DECLARE @rowCount INT = 10000

WHILE @counter <= @rowCount
BEGIN
    INSERT INTO ExampleTable (ID, Name, Age, Email)
    VALUES (
            @counter,
            'Name' + CAST(@counter AS VARCHAR),
            20 + @counter % 50,
            'email' + CAST(@counter AS VARCHAR) + '@example.com'
           )

    SET @counter = @counter + 1
END
GO