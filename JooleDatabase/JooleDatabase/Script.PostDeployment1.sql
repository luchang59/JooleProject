﻿/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

MERGE INTO Credential AS Target 
USING (VALUES 
        (1, 'Administrator'),
        (2, 'Normal User')
) 
AS Source (Credential_ID, User_Type) 
ON Target.Credential_ID = Source.Credential_ID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Credential_ID, User_Type)
VALUES (Credential_ID, User_Type);


MERGE INTO [dbo].[User] AS Target
USING (VALUES 
        (1, 'Jvicini', 'Jvicini@joole.com', 'image', '501', 1),
        (2, 'Hapnitz', 'Hapnitz@joole.com', 'image', '502', 2),
        (3, 'Mestornell', 'Mestornell@joole.com', 'image', '503', 2)
) 
AS Source (User_ID, User_Name, User_Email, User_Image, User_Password, Credential_ID) 
ON Target.User_ID = Source.User_ID 
WHEN NOT MATCHED BY TARGET THEN
INSERT (User_Name, User_Email, User_Image, User_Password, Credential_ID) 
VALUES (User_Name, User_Email, User_Image, User_Password, Credential_ID);


MERGE INTO Category AS Target 
USING (VALUES 
        (1, 'Mechanical'),
        (2, 'Stational'),
        (3, 'Furniture')
) 
AS Source (Category_ID, Category_Name) 
ON Target.Category_ID = Source.Category_ID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Category_ID, Category_Name) 
VALUES (Category_ID, Category_Name);


MERGE INTO SubCategory AS Target 
USING (VALUES 
        (1, 1, 'Fans'), 
        (2, 1, 'Vaccums'), 
        (3, 1, 'Toasters'),
        (4, 2, 'Power Supply Cords'),
        (5, 2, 'Motors'),
        (6, 2, 'Locking Connectors'),
        (7, 3, 'Sofas'),
        (8, 3, 'Tables'),
        (9, 3, 'Chairs')
) 
AS Source (SubCategory_ID, Category_ID, SubCategory_Name) 
ON Target.SubCategory_ID = Source.SubCategory_ID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (SubCategory_ID, Category_ID, SubCategory_Name) 
VALUES (SubCategory_ID, Category_ID, SubCategory_Name);


MERGE INTO Product AS Target 
USING (VALUES 
        (1, 1, '60" Monte Carlo Maverick Matte Black Ceiling Fan', 'image', 'Monte Carlo', 'FAUE4W', '2017', '45W13'), 
        (2, 1, '88" Monte Carlo Maverick Super Max Matte Black Ceiling Fan', 'image', 'Monte Carlo', 'PAIE1R', '2017', '22M82'), 
        (3, 1, '99" Monte Carlo Maverick Grand Matte Black Ceiling', 'image', 'Monte Carlo', 'OYUQ7T', '2017', '59W24'),
		(4, 2, 'AirSpeed Compact Upright Bagless Vacuum Cleaner', 'image', 'Eureka', 'HDUE1A', '2018', '1005594938'), 
        (5, 2, 'PowerSpeed Multi-Surface Upright Bagless Vacuum Cleaner', 'image','Eureka', 'NEU180', '2019', '1004604775'), 
        (6, 2, 'PowerSpeed Upright Bagless Vacuum Cleaner', 'image', 'Eureka', 'HDUE2CR', '2020', '1005594939'),
		(7, 3, 'Proctor Silex 2 Slice Toaster', 'image', 'Cuisinart', 'CPT-620', '2017', '62939881'), 
        (8, 3, 'Extra-Wide Two-Slot Toaster', 'image', 'Cuisinart', 'CPT-160', '2018', '63377460'), 
        (9, 3, 'Retractable Cord 2 Slice Toaster', 'image', 'Revolution', '1110101', '2019', '69546186'),
        (10, 4, 'Pig Tail Power Supply Cord 4', '', 'B07QYR9C9K', 'WF4629', '2019', 'B07QYR9C9K'),
        (11, 4, 'Pig Tail Power Supply Cord 8', '', 'B07RQNZJB7', 'WF4631', '2019', 'B07RQNZJB7'),
        (12, 5, 'Marathon® TEFC General Purpose Motors For High Torque Applications 4.4AMP', '', 'B007ZQLG3W', 'MR3320', '2010', 'B007ZQLG3W'),
        (13, 5, 'Marathon® TEFC Electronic Starting Direct Drive Feed Auger Motors', '', 'B007ZQNZ6I', 'MR4005', '2011', 'B007ZQNZ6I'),
        (14, 6, 'Single Phase Locking Connector 15 Amps, 125 Volts', '', 'B0137HKRHS', 'LJ5412', '2015', 'B0137HKRHS'),
        (15, 6, 'Three Phase Locking Connector 20 Amps, 250 Volts', '', 'B00E2Y5VWM', 'LJ5262', '2014', 'B00E2Y5VWM'),
        (16, 7, 'Sectional Sofa', 'img', 'Casa Andrea Milano', 'Sectional', '2019', null),
        (17, 7, 'Recliner Sofa', 'img', 'JUMMICO', 'Recliner', '2018', null),
        (18, 8, 'Console Table', 'img', 'VASAGLE', 'Console', '2016', null),
        (19, 8, 'Dinning Room Table', 'img', 'Christopher Knight Home', 'Dinning Room', '2017', null),
        (20, 9, 'Accent Chair', 'img', 'HomePop', 'Accent', '2019', null),
        (21, 9, 'Armchair', 'img', 'YAHEETECH', 'Arm', '2018', null)
) 
AS Source (Product_ID, SubCategory_ID, Product_Name, Product_Image, Series, Model, Model_Year, Series_Info) 
ON Target.Product_ID = Source.Product_ID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Product_ID, SubCategory_ID, Product_Name, Product_Image, Series, Model, Model_Year, Series_Info) 
VALUES (Product_ID, SubCategory_ID, Product_Name, Product_Image, Series, Model, Model_Year, Series_Info);

MERGE INTO Property AS Target 
USING (VALUES 
        (1, 'Airflow', 0, 1), 
        (2, 'Weight', 0, 1), 
        (3, 'Blade Pitch', 0, 1),
		(4, 'Application', 1, 0), 
		(5, 'Product Height', 0, 1),
        (6, 'Product Weight', 0, 1),
		(7, 'Cleaning Path Width', 0, 1), 
        (8, 'Application', 1, 0),
		(9, 'Width in', 0, 1),
        (10, 'Height in', 0, 1),
		(11, 'Depth in', 0, 1), 
        (12, 'Application', 1, 0),
        (13, 'Color', 1, 0),
        (14, 'Weight', 0, 1),
        (15, 'Length', 0, 1),
        (16, 'Height', 0, 1),
        (17, 'Width', 0, 1),
        (18, 'Material', 0, 1),
        (19, 'Location', 1, 0),
        (20, 'Use_type', 1, 0),
        (21, 'Accessories', 1, 0),
        (22, 'Capacity', 0, 1),
        (23, 'Model year', 1, 0),
        (24, 'Commercial', 1, 0),
        (25, 'Size', 0, 1),
        (26, 'Voltage', 0, 1),
        (27, 'Plug Format', 0, 1),
        (28, 'Batteries Required', 1, 0),
        (29, 'Shaft Dia', 0, 1),
        (30, 'Phase', 0, 1),
        (31, 'Mounting', 1, 0),
        (32, 'Orientation', 1, 0),
        (33, 'HP', 0, 1),
        (34, 'Amps', 0, 1),
        (36, 'Pole', 0, 1),
        (37, 'Wire', 0, 1)

) 
AS Source (Property_ID, Property_Name, IsType, IsTechSpec) 
ON Target.Property_ID = Source.Property_ID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Property_ID, Property_Name, IsType, IsTechSpec) 
VALUES (Property_ID, Property_Name, IsType, IsTechSpec) ;

MERGE INTO PropertyValue AS Target 
USING (VALUES 
        (1, 1, '4551'), 
        (1, 2, '14784'), 
        (1, 3, '17400'),
		(2, 1, '10.6'), 
        (2, 2, '20.24'), 
        (2, 3, '20'),
		(3, 1, '12'), 
        (3, 2, '13'), 
        (3, 3, '12'),
		(4, 1, 'Indoor'), 
        (4, 2, 'Indoor'), 
        (4, 3, 'Indoor'),
		(5, 4, '41.34'), 
        (5, 5, '44.5'), 
        (5, 6, '44.45'),
		(6, 4, '7.7'), 
        (6, 5, '10'), 
        (6, 6, '12.3'),
		(7, 4, '10.5'), 
        (7, 5, '12.6'), 
        (7, 6, '12.6'),
		(8, 4, 'Indoor'), 
        (8, 5, 'Indoor'), 
        (8, 6, 'Indoor'),
		(9, 4, '11.1'), 
        (9, 5, '10.75'), 
        (9, 6, '6.13'),
		(10, 7, '7.64'), 
        (10, 8, '7.13'), 
        (10, 9, '8.4'),
		(11, 7, '6.83'), 
        (11, 8, '7.13'), 
        (11, 9, '11.65'),
		(12, 7, 'Indoor'), 
        (12, 8, 'Indoor'), 
        (12, 9, 'Indoor'),
        (13, 16, 'gray'),
        (13, 17, 'gray'),
        (13, 18, 'brown'),
        (13, 19, 'brown'),
        (13, 20, 'white'),
        (13, 21, 'black'),
        (14, 16, '40'),
        (14, 17, '60'),
        (14, 18, '30'),
        (14, 19, '35'),
        (14, 20, '20'),
        (14, 21, '25'),
        (15, 16, '25'),
        (15, 17, '27'),
        (15, 18, '36'),
        (15, 19, '32'),
        (15, 20, '24'),
        (15, 21, '23'),
        (16, 16, '32'),
        (16, 17, '41'),
        (16, 18, '19'),
        (16, 19, '33'),
        (16, 20, '29'),
        (16, 21, '40'),
        (17, 16, '17'),
        (17, 17, '22'),
        (17, 18, '25'),
        (17, 19, '31'),
        (17, 20, '52'),
        (17, 21, '32'),
        (18, 16, 'fabric'),
        (18, 17, 'fabric'),
        (18, 18, 'stained with rustic metal'),
        (18, 19, 'wood'),
        (18, 20, 'textile'),
        (18, 21, 'leather'),
        (8, 16, 'indoor'),
        (8, 17, 'indoor'),
        (8, 18, 'indoor'),
        (8, 19, 'indoor'),
        (8, 20, 'indoor'),
        (8, 21, 'indoor'),
        (19, 16, 'living room'),
        (19, 17, 'living room'),
        (19, 18, 'living room'),
        (19, 19, 'dinning room'),
        (19, 20, 'in house'),
        (19, 21, 'in house'),
        (20, 16, 'family'),
        (20, 17, 'family'),
        (20, 18, 'family'),
        (20, 19, 'family'),
        (20, 20, 'family'),
        (20, 21, 'family'),
        (21, 16, 'with pillow'),
        (21, 17, null),
        (21, 18, 'layer'),
        (21, 19, null),
        (21, 20, null),
        (21, 21, null),
        (22, 16, '5'),
        (22, 17, '1'),
        (22, 18, null),
        (22, 19, null),
        (22, 20, '1'),
        (22, 21, '1'),
        (23, 16, '2019'),
        (23, 17, '2018'),
        (23, 18, '2016'),
        (23, 19, '2017'),
        (23, 20, '2019'),
        (23, 21, '2018'),
        (24, 10, 'Yes'),
        (25, 10, '5.3'),
        (14, 10, '15.2'),
        (15, 10, '4'),
        (26, 10, '110V'),
        (27, 10, '15A'),
        (28, 10, 'NO'),
        (24, 11, 'No'),
        (25, 11, '15.2'),
        (14, 11, '15.2'),
        (15, 11, '8'),
        (26, 11, '220V'),
        (27, 11, '15A'),
        (28, 11, 'NO'),
        (26, 12, '115/208-230'),
        (29, 12, '5/8"'),
        (30, 12, '1'),
        (31, 12, 'Rigid'),
        (32, 12, 'Horizontal'),
        (33, 12, '1/2'), 
        (34, 12, '4.4'),
        (14, 12, '25'),
        (26, 13, '115/230'),
        (29, 13, '1/2"'),
        (34, 13, '3.5'),
        (14, 13, '18.98'),
        (26, 14, '125'),
        (34, 14, '15'),
        (36, 14, '2'),
        (37, 14, '3'),
        (14, 14, '0.2'),
        (26, 15, '480'),
        (34, 15, '25'),
        (36, 15, '3'),
        (37, 15, '4'),
        (14, 15, '0.52')
)  
AS Source (Property_ID , Product_ID, Value) 
ON Target.Property_ID = Source.Property_ID AND Target.Product_ID = Source.Product_ID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Property_ID , Product_ID, Value)  
VALUES (Property_ID , Product_ID, Value);


MERGE INTO TypeFilter AS Target 
USING (VALUES 
        (4, 1, 'Application', 'Indoor;Outdoor')
) 
AS Source (Property_ID, SubCategory_ID, Type_Name, Type_Options) 
ON Target.Property_ID = Source.Property_ID AND Target.SubCategory_ID = Source.SubCategory_ID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Property_ID, SubCategory_ID, Type_Name, Type_Options)  
VALUES (Property_ID, SubCategory_ID, Type_Name, Type_Options);


MERGE INTO TechSpecFilter AS Target 
USING (VALUES 
        (1, 1, 4500, 18000), 
        (2, 1, 10, 25),
        (3, 1, 10, 15),
		(5, 2, 40, 45),
        (6, 2, 5, 15),
		(7, 2, 10, 13), 
		(9, 2, 5, 12),
        (10, 3, 5, 9),
		(11, 3, 5, 12), 
        (14, 4, 30, 70),
        (14, 5, 20, 40),
        (14, 6, 10, 30),
        (15, 4, 0, 100),
        (15, 5, 0, 100),
        (15, 6, 0, 100),
        (16, 4, 0, 100),
        (16, 5, 0, 100),
        (16, 6, 0, 100),
        (17, 4, 0, 100),
        (17, 5, 0, 100),
        (17, 6, 0, 100),
        (22, 4, 0, 5),
        (22, 5, 0, 5),
        (22, 6, 0, 5),
        (25, 7, 0, 20)
) 
AS Source (Property_ID, SubCategory_ID, Min_Value, Max_Value) 
ON Target.Property_ID = Source.Property_ID AND Target.SubCategory_ID = Source.SubCategory_ID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Property_ID, SubCategory_ID, Min_Value, Max_Value)  
VALUES (Property_ID, SubCategory_ID, Min_Value, Max_Value);