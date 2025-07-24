-- Verwijder data (om makkelijk nieuwe/aangepaste testdata toe te voegen)
DELETE FROM address;
DELETE FROM payment;
DELETE FROM consumption;
DELETE FROM giftcard;
DELETE FROM customer;
DELETE FROM theme;

-- Pas de ID increment aan (terug vanaf 1 laten beginnen)
DBCC CHECKIDENT ('giftcard', RESEED, 0);
DBCC CHECKIDENT ('customer', RESEED, 0);
DBCC CHECKIDENT ('address', RESEED, 0);
DBCC CHECKIDENT ('payment', RESEED, 0);
DBCC CHECKIDENT ('consumption', RESEED, 0);
DBCC CHECKIDENT ('theme', RESEED, 0);

BEGIN TRANSACTION;

-- Insert into theme table:
INSERT INTO theme (Name, ColorCode) VALUES ('Birthday', '#7878fa');
INSERT INTO theme (Name, ColorCode) VALUES ('Christmas', '#fc6565');
INSERT INTO theme (Name, ColorCode) VALUES ('Anniversary', '#FFC0CB');

DECLARE @themeBirthday INT = (SELECT Id FROM theme WHERE Name = 'Birthday');
DECLARE @themeChristmas INT = (SELECT Id FROM theme WHERE Name = 'Christmas');
DECLARE @themeAnniversary INT = (SELECT Id FROM theme WHERE Name = 'Anniversary');

DECLARE @idCustomer INT;
DECLARE @idGiftCard INT;


-- Admin data toevoegen (in het echt moeilijker wachtwoord): Inloggegevens: email = admin@example.com, password = Password@108 (admin id 1 laten hebben)
INSERT INTO customer (Firstname, Lastname, Email, Password) VALUES ( 'ADMIN', 'ADMIN', 'admin@example.com', '2f24fae4f309f27f6ead7db0707c19e3c25632dc52dcf4fc232f90c3cbc308d4');


-- Insert customer 1: Inloggegevens: email = john.doe@example.com, password = Password@123
INSERT INTO customer (Firstname, Lastname, Email, Password) VALUES ('John', 'Doe', 'john.doe@example.com', 'ff7bd97b1a7789ddd2775122fd6817f3173672da9f802ceec57f284325bf589f');
SET @idCustomer = SCOPE_IDENTITY();
INSERT INTO address (CustomerId, Street, Number, ZipCode, City) VALUES (@idCustomer, 'Main St', 123, '8500', 'New York');
INSERT INTO giftcard (CustomerId, Checksum, RemainingBalance, PurchaseDate, ExpiryDate, Code, ThemeId, Amount) VALUES (@idCustomer, 41 , 50.00 , '2025-05-11',  '2026-05-11', 1436070223 , @themeBirthday, 50.00);
SET @idGiftCard = SCOPE_IDENTITY();
INSERT INTO payment (GiftCardId, TransactionName, Amount) VALUES ( @idGiftCard, 'TC1002', 50.00 );
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-12', 25.00,  'Boekhandel', @idGiftCard, 'Books');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 25.00 WHERE Id = @idGiftCard;
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-22', 25.00,  'Amazon', @idGiftCard, 'Stationery');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 25.00 WHERE Id = @idGiftCard;
-- Giftcard2 om te kunnen gebruiken (andere is al leeg -> mag niet kunnen worden gebruikt)
INSERT INTO giftcard (CustomerId, Checksum, RemainingBalance, PurchaseDate, ExpiryDate, Code, ThemeId, Amount) VALUES (@idCustomer, 8 , 90.00 , '2025-08-11',  '2026-05-11', 1498730080 , @themeBirthday, 90.00);
SET @idGiftCard = SCOPE_IDENTITY();
INSERT INTO payment (GiftCardId, TransactionName, Amount) VALUES ( @idGiftCard, 'TC1003', 90.00 );
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-09-12', 5.00,  'Boekhandel', @idGiftCard, 'Books');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 5.00 WHERE Id = @idGiftCard;
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-10-22', 15.00,  'Amazon', @idGiftCard, 'Stationery');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 15.00 WHERE Id = @idGiftCard;

-- Insert customer 2: Inloggegevens: email = jane.smith@example.com, password = Password@456
INSERT INTO customer (Firstname, Lastname, Email, Password) VALUES ('Jane', 'Smith', 'jane.smith@example.com', 'cee3dc4d010c77d0041bd1e49a39630918559340cc7539d35d318b7f1de8cf02');
SET @idCustomer = SCOPE_IDENTITY();
INSERT INTO address (CustomerId, Street, Number, ZipCode, City) VALUES (@idCustomer, 'Second St', 456, '7700', 'Los Angeles');
INSERT INTO giftcard (CustomerId, Checksum, RemainingBalance, PurchaseDate, ExpiryDate, Code, ThemeId, Amount) VALUES (@idCustomer, 76 , 75.00 , '2025-05-12',  '2026-05-12', 1701784248 , @themeChristmas, 75.00 );
SET @idGiftCard = SCOPE_IDENTITY();
INSERT INTO payment (GiftCardId, TransactionName, Amount) VALUES (@idGiftCard, 'TC1004', 75.00 );
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-13', 35.00,  'Zalando',    @idGiftCard, 'Clothes');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 35.00 WHERE Id = @idGiftCard;
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-23', 20.00,  'Amazon', @idGiftCard, 'Gifts');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 20.00 WHERE Id = @idGiftCard;

-- Insert customer 3: Inloggegevens: email = alice.johnson@example.com, password = Password@789
INSERT INTO customer (Firstname, Lastname, Email, Password) VALUES ('Alice', 'Johnson', 'alice.johnson@example.com', 'f07e131b4df79b3635af0829c6c8d3f2c447237f86f5572d13d4dbf4244253bc');
SET @idCustomer = SCOPE_IDENTITY();
INSERT INTO address (CustomerId, Street, Number, ZipCode, City) VALUES (@idCustomer, 'Third St', 789, '1300', 'Chicago');
INSERT INTO giftcard (CustomerId, Checksum, RemainingBalance, PurchaseDate, ExpiryDate, Code, ThemeId, Amount) VALUES (@idCustomer, 37 , 100.00 , '2025-05-13',  '2026-05-13', 1619874541 , @themeBirthday, 100.00);
SET @idGiftCard = SCOPE_IDENTITY();
INSERT INTO payment (GiftCardId, TransactionName, Amount) VALUES ( @idGiftCard, 'TC1005', 100.00);
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-14', 50.00,  'Coolblue',   @idGiftCard, 'Electronics');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 50.00 WHERE Id = @idGiftCard;
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-24', 25.00,  'Amazon', @idGiftCard, 'Groceries');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 25.00 WHERE Id = @idGiftCard;

-- Insert customer 4: Inloggegevens: email = bob.brown@example.com, password = Password@101
INSERT INTO customer (Firstname, Lastname, Email, Password) VALUES ('Bob', 'Brown', 'bob.brown@example.com', 'f5cfea6d5bac2a556cfc09a458f53badbc2f7dc5b847fb0ba6be5c2f2461d254');
SET @idCustomer = SCOPE_IDENTITY();
INSERT INTO address (CustomerId, Street, Number, ZipCode, City) VALUES (@idCustomer, 'Fourth St', 101, '9900', 'Houston');
INSERT INTO giftcard (CustomerId, Checksum, RemainingBalance, PurchaseDate, ExpiryDate, Code, ThemeId, Amount) VALUES (@idCustomer, 59 , 95.00   , '2025-05-14',  '2026-05-14',  1307711990 , @themeAnniversary, 95.00);
SET @idGiftCard = SCOPE_IDENTITY();
INSERT INTO payment (GiftCardId, TransactionName, Amount) VALUES ( @idGiftCard, 'TC1006', 95.00);
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-15', 40.00,  'Ikea', @idGiftCard, 'Furniture');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 40.00 WHERE Id = @idGiftCard;
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-25', 50.00,  'Amazon', @idGiftCard, 'Pet Supplies');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 50.00 WHERE Id = @idGiftCard;

-- Insert customer 5: Inloggegevens: email = charlie.davis@example.com, password = Password@102
INSERT INTO customer (Firstname, Lastname, Email, Password) VALUES ('Charlie', 'Davis', 'charlie.davis@example.com', '44bbbb8fe8b63525c8b57575ecced714f7035d019fc52a3da378496094df8d47');
SET @idCustomer = SCOPE_IDENTITY();
INSERT INTO address (CustomerId, Street, Number, ZipCode, City) VALUES (@idCustomer, 'Fifth St', 202, '1100', 'Phoenix');
INSERT INTO giftcard (CustomerId, Checksum, RemainingBalance, PurchaseDate, ExpiryDate, Code, ThemeId, Amount) VALUES (@idCustomer, 24 , 85.00   , '2025-05-15',  '2026-05-15', 1134871560 , @themeChristmas, 85.00);
SET @idGiftCard = SCOPE_IDENTITY();
INSERT INTO payment (GiftCardId, TransactionName, Amount) VALUES ( @idGiftCard, 'TC1007', 85.00);
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-16', 25.00,  'Dreamland',  @idGiftCard, 'Toys');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 25.00 WHERE Id = @idGiftCard;
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-26', 50.00,  'Amazon', @idGiftCard, 'Home Decor');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 50.00 WHERE Id = @idGiftCard;

-- Insert customer 6: Inloggegevens: email = diana.evans@example.com, password = Password@103
INSERT INTO customer (Firstname, Lastname, Email, Password) VALUES ('Diana', 'Evans', 'diana.evans@example.com', 'b8723a9fe9c41923359bb4c3f451340d18702709dfaf8d011b0df7d4ebfe11ea');
SET @idCustomer = SCOPE_IDENTITY();
INSERT INTO address (CustomerId, Street, Number, ZipCode, City) VALUES (@idCustomer, 'Sixth St', 303, '4500', 'Philadelphia');
INSERT INTO giftcard (CustomerId, Checksum, RemainingBalance, PurchaseDate, ExpiryDate, Code, ThemeId, Amount) VALUES (@idCustomer, 63 , 65.00   , '2025-05-16',  '2026-05-16', 1527176574 , @themeAnniversary, 65.00);
SET @idGiftCard = SCOPE_IDENTITY();
INSERT INTO payment (GiftCardId, TransactionName, Amount) VALUES ( @idGiftCard, 'TC1008', 65.00);
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-17', 25.00,  'Decathlon',  @idGiftCard, 'Sports');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 25.00 WHERE Id = @idGiftCard;
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-27', 30.00,  'Bol',    @idGiftCard, 'Beauty Products');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 30.00 WHERE Id = @idGiftCard;

-- Insert customer 7: Inloggegevens: email = eve.foster@example.com, password = Password@104
INSERT INTO customer (Firstname, Lastname, Email, Password) VALUES ('Eve', 'Foster', 'eve.foster@example.com', '45fb3295d9b0d4c97296e88e603c2cc4df3a4398706b69d605353cfda85d3c17');
SET @idCustomer = SCOPE_IDENTITY();
INSERT INTO address (CustomerId, Street, Number, ZipCode, City) VALUES (@idCustomer, 'Seventh St', 404, '6300', 'San Antonio');
INSERT INTO giftcard (CustomerId, Checksum, RemainingBalance, PurchaseDate, ExpiryDate, Code, ThemeId, Amount) VALUES (@idCustomer, 69 , 30.00   , '2025-05-17',  '2026-05-17', 1816696929 , @themeBirthday, 30.00);
SET @idGiftCard = SCOPE_IDENTITY();
INSERT INTO payment (GiftCardId, TransactionName, Amount) VALUES ( @idGiftCard, 'TC1009', 30.00);
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-18', 5.00,  'Spotify', @idGiftCard, 'Music');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 5.00 WHERE Id = @idGiftCard;
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-28', 20.00,  'Bol', @idGiftCard, 'Garden Supplies');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 20.00 WHERE Id = @idGiftCard;

-- Insert customer 8: Inloggegevens: email = frank.green@example.com, password = Password@105
INSERT INTO customer (Firstname, Lastname, Email, Password) VALUES ('Frank', 'Green', 'frank.green@example.com', 'ce7feb59e9c746da9c6d6f2dc752af6220a1b9ab2e3389f8fcf771a0aaafdd69');
SET @idCustomer = SCOPE_IDENTITY();
INSERT INTO address (CustomerId, Street, Number, ZipCode, City) VALUES (@idCustomer, 'Eighth St', 505, '5800', 'San Diego');
INSERT INTO giftcard (CustomerId, Checksum, RemainingBalance, PurchaseDate, ExpiryDate, Code, ThemeId, Amount) VALUES (@idCustomer, 50 , 90.00   , '2025-05-18',  '2026-05-18', 1987705000 , @themeChristmas, 90.00);
SET @idGiftCard = SCOPE_IDENTITY();
INSERT INTO payment (GiftCardId, TransactionName, Amount) VALUES ( @idGiftCard, 'TC1010', 90.00);
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-19', 20.00, 'Dreamland',  @idGiftCard, 'Movies');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 20.00 WHERE Id = @idGiftCard;
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-29', 50.00, 'Bol',    @idGiftCard, 'Office Supplies');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 50.00 WHERE Id = @idGiftCard;

-- Insert customer 9: Inloggegevens: email = grace.harris@example.com, password = Password@106
INSERT INTO customer (Firstname, Lastname, Email, Password) VALUES ('Grace', 'Harris', 'grace.harris@example.com', '9a3fee2803e1d7a40d0d51593062914f9a65aacd20cbc006a88631389780310e');
SET @idCustomer = SCOPE_IDENTITY();
INSERT INTO address (CustomerId, Street, Number, ZipCode, City) VALUES (@idCustomer, 'Ninth St', 606, '6400', 'Dallas');
INSERT INTO giftcard (CustomerId, Checksum, RemainingBalance, PurchaseDate, ExpiryDate, Code, ThemeId, Amount) VALUES (@idCustomer, 60 , 50.00   , '2025-05-19',  '2026-05-19',  1893764325 , @themeAnniversary, 50.00);
SET @idGiftCard = SCOPE_IDENTITY();
INSERT INTO payment (GiftCardId, TransactionName, Amount) VALUES ( @idGiftCard, 'TC1011', 50.00);
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-20', 45.00, 'AH', @idGiftCard, 'Dinner');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 45.00 WHERE Id = @idGiftCard;

-- Insert customer 10: Inloggegevens: email = henry.ivy@example.com, password = Password@107
INSERT INTO customer (Firstname, Lastname, Email, Password) VALUES ( 'Henry', 'Ivy', 'henry.ivy@example.com', 'ffa9543e3c42593d1bca428ae5df4a955a93c075d4eba88111adb461a5e52408');
SET @idCustomer = SCOPE_IDENTITY();
INSERT INTO address (CustomerId, Street, Number, ZipCode, City) VALUES (@idCustomer, 'Tenth St', 707, '3800', 'San Jose');
INSERT INTO giftcard (CustomerId, Checksum, RemainingBalance, PurchaseDate, ExpiryDate, Code, ThemeId, Amount) VALUES (@idCustomer, 36 , 45.00   , '2025-05-20',  '2026-05-20', 1818133848 , @themeBirthday, 45.00);
SET @idGiftCard = SCOPE_IDENTITY();
INSERT INTO payment (GiftCardId, TransactionName, Amount) VALUES ( @idGiftCard, 'TC1012', 45.00);
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-12', 25.00,  'AH', @idGiftCard, 'Lunch');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 25.00 WHERE Id = @idGiftCard;
INSERT INTO consumption (Date, Amount, Location, GiftCardId, Reason) VALUES ( '2025-06-21', 10.00,  'Amazon', @idGiftCard,  'Snacks');
UPDATE GiftCard SET RemainingBalance = RemainingBalance - 10.00 WHERE Id = @idGiftCard;



COMMIT TRANSACTION;
