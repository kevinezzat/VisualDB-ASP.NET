CREATE DATABASE Telecom_Team_127
USE Telecom_Team_127
Go
CREATE PROCEDURE createAllTables
AS
BEGIN
    CREATE TABLE Customer_profile (
        nationalID INT PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        email VARCHAR(50),
        address VARCHAR(50),
        date_of_birth DATE
    );

   
    CREATE TABLE Customer_Account (
        mobileNo CHAR(11) PRIMARY KEY,
        pass VARCHAR(50),
        balance DECIMAL(10,1),
        account_type VARCHAR(50),
        start_date DATE,
        status VARCHAR(50),
        point INT,
        nationalID INT,
        FOREIGN KEY (nationalID) REFERENCES Customer_profile(nationalID)
    );

   
    CREATE TABLE Service_Plan (
        planID INT PRIMARY KEY,
        SMS_offered INT,
        minutes_offered INT,
        data_offered INT,
        name VARCHAR(50),
        price INT,
        description VARCHAR(50)
    );

   
    CREATE TABLE Subscription (
        mobileNo CHAR(11),
        planID INT,
        subscription_date DATE,
        status VARCHAR(50),
        PRIMARY KEY (mobileNo, planID),
        FOREIGN KEY (mobileNo) REFERENCES Customer_Account(mobileNo),
        FOREIGN KEY (planID) REFERENCES Service_Plan(planID)
    );

    
    CREATE TABLE Plan_Usage (
        usageID INT PRIMARY KEY,
        start_date DATE,
        end_date DATE,
        data_consumption INT,
        minutes_used INT,
        SMS_sent INT,
        mobileNo CHAR(11),
        planID INT,
        FOREIGN KEY (mobileNo) REFERENCES Customer_Account(mobileNo),
        FOREIGN KEY (planID) REFERENCES Service_Plan(planID)
    );

 
    CREATE TABLE Payment (
        paymentID INT PRIMARY KEY,
        amount DECIMAL(10,1),
        date_of_payment DATE,
        payment_method VARCHAR(50),
        status VARCHAR(50),
        mobileNo CHAR(11),
        FOREIGN KEY (mobileNo) REFERENCES Customer_Account(mobileNo)
    );

    CREATE TABLE Process_Payment (
        paymentID INT,
        planID INT,
        remaining_balance DECIMAL(10,1),
        extra_amount DECIMAL(10,1),
        PRIMARY KEY (paymentID, planID),
        FOREIGN KEY (paymentID) REFERENCES Payment(paymentID),
        FOREIGN KEY (planID) REFERENCES Service_Plan(planID)
    );

 
    CREATE TABLE Wallet (
        walletID INT PRIMARY KEY,
        current_balance DECIMAL(10,2),
        currency VARCHAR(50),
        last_modified_date DATE,
        nationalID INT,
        mobileNo CHAR(11),
        FOREIGN KEY (nationalID) REFERENCES Customer_profile(nationalID)
    );

  
    CREATE TABLE Transfer_money (
        walletID1 INT,
        walletID2 INT,
        transfer_id INT PRIMARY KEY,
        amount DECIMAL(10,2),
        transfer_date DATE,
        FOREIGN KEY (walletID1) REFERENCES Wallet(walletID),
        FOREIGN KEY (walletID2) REFERENCES Wallet(walletID)
    );

  
    CREATE TABLE Benefits (
        benefitID INT PRIMARY KEY,
        description VARCHAR(50),
        validity_date DATE,
        status VARCHAR(50),
        mobileNo CHAR(11),
        FOREIGN KEY (mobileNo) REFERENCES Customer_Account(mobileNo)
    );

  
    CREATE TABLE PointsGroup (
        pointID INT PRIMARY KEY,
        benefitID INT,
        pointsAmount INT,
        PaymentID INT,
        FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID),
        FOREIGN KEY (PaymentID) REFERENCES Payment(paymentID)
    );

  
    CREATE TABLE Exclusive_Offer (
        offerID INT PRIMARY KEY,
        benefitID INT,
        internet_offered INT,
        SMS_offered INT,
        minutes_offered INT,
        FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID)
    );

  
    CREATE TABLE Cashback (
        CashbackID INT PRIMARY KEY,
        benefitID INT,
        walletID INT,
        amount INT,
        credit_date DATE,
        FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID),
        FOREIGN KEY (walletID) REFERENCES Wallet(walletID)
    );

   
    CREATE TABLE Plan_Provides_Benefits (
        benefitID INT,
        planID INT,
        PRIMARY KEY (benefitID, planID),
        FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID),
        FOREIGN KEY (planID) REFERENCES Service_Plan(planID)
    );

    
    CREATE TABLE Shop (
        shopID INT PRIMARY KEY,
        name VARCHAR(50),
        category VARCHAR(50)
    );

    
    CREATE TABLE Physical_Shop (
        shopID INT PRIMARY KEY,
        address VARCHAR(50),
        working_hours VARCHAR(50),
        FOREIGN KEY (shopID) REFERENCES Shop(shopID)
    );

    
    CREATE TABLE E_Shop (
        shopID INT PRIMARY KEY,
        URL VARCHAR(50),
        rating INT,
        FOREIGN KEY (shopID) REFERENCES Shop(shopID)
    );

    CREATE TABLE Voucher (
        voucherID INT PRIMARY KEY,
        value INT,
        expiry_date DATE,
        points INT,
        mobileNo CHAR(11),
        shopID INT,
        redeem_date DATE,
        FOREIGN KEY (mobileNo) REFERENCES Customer_Account(mobileNo),
        FOREIGN KEY (shopID) REFERENCES Shop(shopID)
    );

    CREATE TABLE Technical_Support_Ticket (
        ticketID INT PRIMARY KEY,
        mobileNo CHAR(11),
        Issue_description VARCHAR(50),
        priority_level INT,
        status VARCHAR(50),
        FOREIGN KEY (mobileNo) REFERENCES Customer_Account(mobileNo)
    );
END;
GO
EXECUTE createAllTables
GO

CREATE PROCEDURE dropAllTables
AS
BEGIN
    
    DROP TABLE Technical_Support_Ticket;
    DROP TABLE Voucher;
    DROP TABLE E_Shop;
    DROP TABLE Physical_Shop;
    DROP TABLE Shop;
    DROP TABLE Plan_Provides_Benefits;
    DROP TABLE Cashback;
    DROP TABLE Exclusive_Offer;
    DROP TABLE PointsGroup;
    DROP TABLE Benefits;
    DROP TABLE Transfer_money;
    DROP TABLE Wallet;
    DROP TABLE Process_Payment;
    DROP TABLE Payment;
    DROP TABLE Plan_Usage;
    DROP TABLE Subscription;
    DROP TABLE Service_Plan;
    DROP TABLE Customer_Account;
    DROP TABLE Customer_profile;
END;
GO
GO
CREATE PROCEDURE  dropAllProceduresFunctionsViews
AS 
BEGIN
    DROP PROCEDURE createAllTables;
    DROP PROCEDURE dropAllTables;
    DROP PROCEDURE clearAllTables;
    DROP VIEW  allCustomerAccounts;
    DROP VIEW  allServicePlans;
    DROP VIEW  allBenefits;
    DROP VIEW  AccountPayments;
    DROP VIEW  allShops;
    DROP VIEW  allResolvedTickets;
    DROP VIEW  CustomerWallet;
    DROP VIEW  E_shopVouchers;
    DROP VIEW  PhysicalStoreVouchers;
    DROP VIEW  Num_of_cashback;
    DROP PROCEDURE Account_Plan;
    DROP FUNCTION Account_Plan_date;
    DROP FUNCTION Account_Usage_Plan;
    DROP PROCEDURE  Benefits_Account;
    DROP FUNCTION Account_SMS_Offers;
    DROP PROCEDURE Account_Payment_Points;
    DROP FUNCTION  Wallet_Cashback_Amount;
    DROP FUNCTION  Wallet_Transfer_Amount;
    DROP FUNCTION  Wallet_MobileNo;
    DROP PROCEDURE  Total_Points_Account;
    DROP FUNCTION   AccountLoginValidation;
    DROP FUNCTION   Consumption;
    DROP PROCEDURE  Unsubscribed_Plans;
    DROP FUNCTION   Usage_Plan_CurrentMonth;
    DROP FUNCTION   Cashback_Wallet_Customer;
    DROP PROCEDURE  Ticket_Account_Customer;
    DROP PROCEDURE  Account_Highest_Voucher;
    DROP FUNCTION   Remaining_plan_amount;
    DROP FUNCTION   Extra_plan_amount;
    DROP PROCEDURE  Top_Successful_Payments;
    DROP FUNCTION   Subscribed_plans_5_Months;
    DROP PROCEDURE  Initiate_plan_payment;
    DROP PROCEDURE  Initiate_balance_payment;
    DROP PROCEDURE  Redeem_voucher_points;
END
GO
GO
CREATE PROCEDURE clearAllTables
AS
BEGIN
    
    TRUNCATE TABLE Technical_Support_Ticket;
    TRUNCATE TABLE Voucher;
    TRUNCATE TABLE E_Shop;
    TRUNCATE TABLE Physical_Shop;
    TRUNCATE TABLE Shop;
    TRUNCATE TABLE Plan_Provides_Benefits;
    TRUNCATE TABLE Cashback;
    TRUNCATE TABLE Exclusive_Offer;
    TRUNCATE TABLE PointsGroup;
    TRUNCATE TABLE Benefits;
    TRUNCATE TABLE Transfer_money;
    TRUNCATE TABLE Wallet;
    TRUNCATE TABLE Process_Payment;
    TRUNCATE TABLE Payment;
    TRUNCATE TABLE Plan_Usage;
    TRUNCATE TABLE Subscription;
    TRUNCATE TABLE Service_Plan;
    TRUNCATE TABLE Customer_Account;
    TRUNCATE TABLE Customer_profile;
END;
GO

GO

CREATE VIEW allCustomerAccounts AS
SELECT 
    cp.nationalID,
    cp.first_name,
    cp.last_name,
    cp.email,
    cp.address,
    cp.date_of_birth,
    ca.mobileNo,
    ca.pass,
    ca.balance,
    ca.account_type,
    ca.start_date,
    ca.status AS account_status,
    ca.point
FROM 
    Customer_profile cp
JOIN 
    Customer_Account ca
    ON cp.nationalID = ca.nationalID
WHERE 
    ca.status = 'Active';
GO

GO

CREATE VIEW allServicePlans AS
SELECT 
    planID,
    SMS_offered,
    minutes_offered,
    data_offered,
    name,
    price,
    description
FROM 
    Service_Plan;
GO
GO

CREATE VIEW allBenefits AS
SELECT 
    benefitID,
    description,
    validity_date,
    status,
    mobileNo
FROM 
    Benefits
WHERE 
    status = 'Active';
GO

GO

CREATE VIEW AccountPayments AS
SELECT 
    p.paymentID,
    p.amount,
    p.date_of_payment,
    p.payment_method,
    p.status AS payment_status,
    p.mobileNo,
    ca.balance,
    ca.account_type,
    ca.start_date,
    ca.status AS account_status,
    ca.point
FROM 
    Payment p
JOIN 
    Customer_Account ca
    ON p.mobileNo = ca.mobileNo;
GO

GO

CREATE VIEW allShops AS
SELECT 
    shopID,
    name,
    category
FROM 
    Shop;
GO

GO

CREATE VIEW allResolvedTickets AS
SELECT 
    ticketID,
    mobileNo,
    Issue_description,
    priority_level,
    status
FROM 
    Technical_Support_Ticket
WHERE 
    status = 'Resolved';
GO
GO

CREATE VIEW CustomerWallet AS
SELECT 
    w.walletID,
    w.current_balance,
    w.currency,
    w.last_modified_date,
    cp.first_name,
    cp.last_name
FROM 
    Wallet w
JOIN 
    Customer_profile cp
    ON w.nationalID = cp.nationalID;
GO

GO

CREATE VIEW E_shopVouchers AS
SELECT 
    es.shopID,
    es.URL,
    es.rating,
    v.voucherID,
    v.value AS voucher_value
FROM 
    E_shop es
JOIN 
    Voucher v
    ON es.shopID = v.shopID
WHERE 
    v.redeem_date IS NOT NULL;
GO

GO

CREATE VIEW PhysicalStoreVouchers AS
SELECT 
    ps.shopID,
    ps.address,
    ps.working_hours,
    v.voucherID,
    v.value AS voucher_value
FROM 
    Physical_Shop ps
JOIN 
    Voucher v
    ON ps.shopID = v.shopID
WHERE 
    v.redeem_date IS NOT NULL;
GO

GO

CREATE VIEW Num_of_cashback AS
SELECT 
    w.walletID,
    COUNT(c.CashbackID) AS num_of_cashback_transactions
FROM 
    Wallet w
LEFT JOIN 
    Cashback c
    ON w.walletID = c.walletID
GROUP BY 
    w.walletID;
GO
GO

CREATE PROCEDURE Account_Plan
AS
BEGIN
    SELECT 
        ca.mobileNo,
        ca.account_type,
        ca.balance,
        ca.status AS account_status,
        sp.name AS service_plan_name,
        sp.price AS service_plan_price,
        sp.description AS service_plan_description,
        s.subscription_date,
        s.status AS subscription_status
    FROM 
        Customer_Account ca
    JOIN 
        Subscription s
        ON ca.mobileNo = s.mobileNo
    JOIN 
        Service_Plan sp
        ON s.planID = sp.planID;
END;
GO

GO

CREATE FUNCTION Account_Plan_date
(
    @Subscription_Date DATE,
    @Plan_id INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT ca.mobileNo,sp.planID,sp.name AS service_plan_name
    FROM Customer_Account ca
    INNER JOIN Subscription s ON ca.mobileNo = s.mobileNo
    INNER JOIN Service_Plan sp ON s.planID = sp.planID
    WHERE s.subscription_date = @Subscription_Date
          AND s.planID = @Plan_id
);
GO

GO

CREATE FUNCTION Account_Usage_Plan(
    @MobileNo CHAR(11),
    @from_date date)
RETURNS TABLE
AS
RETURN 
(   SELECT sp.planID,  SUM(pu.data_consumption) AS total_data_consumed,
        SUM(pu.minutes_used) AS total_minutes_used,
        SUM(pu.SMS_sent) AS total_SMS
    FROM Service_Plan sp
    INNER JOIN Plan_Usage pu ON sp.planID = pu.planID
    INNER JOIN Customer_Account ca ON ca.mobileNo = pu.mobileNo
    WHERE pu.start_date >= @from_date
    AND ca.mobileNo = @MobileNo
    GROUP BY sp.planID 

    )
GO
GO
CREATE PROCEDURE Benefits_Account
(
    @MobileNo CHAR(11),
    @PlanID INT
)
AS
BEGIN
    
    DELETE pg
    FROM PointsGroup pg
    INNER JOIN Benefits b ON pg.benefitID = b.benefitID
    INNER JOIN Plan_Provides_Benefits ppb ON b.benefitID = ppb.benefitID
    WHERE b.mobileNo = @MobileNo
      AND ppb.planID = @PlanID;

   
    DELETE b
    FROM Benefits b
    INNER JOIN Plan_Provides_Benefits ppb ON b.benefitID = ppb.benefitID
    WHERE b.mobileNo = @MobileNo
      AND ppb.planID = @PlanID;
END
GO

GO

CREATE FUNCTION Account_SMS_Offers
(
    @MobileNo CHAR(11)
)
RETURNS TABLE
AS
RETURN
(
    SELECT eo.offerID , eo.benefitID, eo.SMS_offered
    FROM Exclusive_Offer eo
    INNER JOIN Benefits b ON eo.benefitID = b.benefitID
    INNER JOIN Customer_Account ca ON ca.mobileNo = b.mobileNo
    WHERE ca.mobileNo = @MobileNo
    AND eo.SMS_offered > 0 
)
GO
GO

CREATE PROCEDURE Account_Payment_Points
(
    @MobileNo CHAR(11)
)
AS
BEGIN
     SELECT COUNT(paymentID) AS Total_Transactions , SUM(pg.pointsAmount) AS Total_Points
     FROM Payment p
     INNER JOIN PointsGroup pg ON p.paymentID = pg.PaymentID
     WHERE p.mobileNo = @MobileNo
     AND p.status = 'successful'
     AND pg.pointsAmount IS NOT NULL 
     AND YEAR(p.date_of_payment) = YEAR(CURRENT_TIMESTAMP) - 1;

    
END
GO

GO

CREATE FUNCTION Wallet_Cashback_Amount
(
    @WalletId INT,
    @PlanId INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    RETURN (
        SELECT SUM(c.amount)
        FROM Cashback c
        INNER JOIN Wallet w ON c.walletID = w.walletID
        INNER JOIN Plan_Provides_Benefits ppb ON c.benefitID = ppb.benefitID
        WHERE w.walletID = @WalletId
          AND ppb.planID = @PlanId
          AND c.amount IS NOT NULL  
    )
END
GO

GO
CREATE FUNCTION Wallet_Transfer_Amount
(
    @WalletId INT,     
    @StartDate DATE,     
    @EndDate DATE        
)
RETURNS DECIMAL(10,2)  
AS
BEGIN
    DECLARE @AverageAmount DECIMAL(10, 2);
    Select @AverageAmount = AVG(tm.amount) 
    from Transfer_money tm
    where tm.walletID1 = @WalletID OR tm.walletID2 = @WalletID
    AND tm.transfer_date >= @StartDate AND tm.transfer_date < @EndDate
   
   Return Transaction_amount_average 
END


GO

GO
CREATE FUNCTION Wallet_MobileNo
(
    @MobileNo CHAR(11) 
)
RETURNS BIT   
AS
BEGIN
    DECLARE @exists BIT;

    IF EXISTS (
        SELECT * 
        FROM Wallet W
        INNER JOIN Customer_Account CA ON W.nationalID = CA.nationalID
        WHERE CA.mobileNo = @MobileNo
    )
    
        SET @exists = 1;
    
    ELSE
    
        SET @exists = 0;
    
    RETURN @exists

END
GO
GO
CREATE PROCEDURE Total_Points_Account(
    @MobileNo CHAR(11),
    @Total_Points INT OUTPUT)
AS
BEGIN
    SELECT  @Total_Points = SUM(pg.pointsAmount)
    FROM PointsGroup pg 
    INNER JOIN Payment p ON pg.PaymentID = p.paymentID
    INNER JOIN Customer_Account ca ON ca.mobileNo = P.mobileNo
    WHERE ca.mobileNo = @MobileNo
    
    UPDATE Customer_Account
    SET point = @Total_Points + point
    WHERE mobileNo = @MobileNo
END
GO
GO
CREATE FUNCTION AccountLoginValidation (
    @MobileNo  char(11), 
    @password varchar(50))
RETURNS BIT 
AS
BEGIN 
    DECLARE @valid BIT;

    IF EXISTS (
        SELECT 1
        FROM Customer_Account
        WHERE mobileNo = @MobileNo
          AND pass = @Password
    )
    
        SET @valid = 1; 
    
    ELSE
    
        SET @valid = 0; 
    
    
    Return @Valid
    
END
GO
GO
CREATE FUNCTION Consumption (
    @Plan_name VARCHAR(50), 
    @start_date DATE,
    @end_date DATE
)
RETURNS TABLE
AS
RETURN (
    SELECT 
        SUM(pu.data_consumption) AS TotalDataConsumption, 
        SUM(pu.minutes_used) AS TotalMinutesUsed, 
        SUM(pu.SMS_sent) AS TotalSMSSent
    FROM Plan_Usage pu
    INNER JOIN Service_Plan sp 
        ON pu.planID = sp.planID
    WHERE sp.name = @Plan_name 
      AND pu.start_date >= @start_date
      AND pu.end_date <= @end_date
    GROUP BY pu.planID
);
GO
     
GO
CREATE PROCEDURE Unsubscribed_Plans
(
    @MobileNo CHAR(11)  
)
AS
BEGIN
    SELECT sp.planID, sp.name, sp.SMS_offered, sp.minutes_offered, sp.data_offered, sp.price, sp.description
    FROM Service_Plan sp
    WHERE sp.planID NOT IN (
        SELECT s.planID
        FROM Subscription s
        WHERE s.mobileNo = @MobileNo
    );
END;
GO
GO
CREATE FUNCTION Usage_Plan_CurrentMonth(
    @MobileNo CHAR(11))
RETURNS TABLE 
AS 
RETURN( 
    SELECT 
        pu.planID,
        SUM(pu.data_consumption) AS TotalDataConsumption,
        SUM(pu.minutes_used) AS TotalMinutesUsed,
        SUM(pu.SMS_sent) AS TotalSMSSent
    FROM Plan_Usage pu
    INNER JOIN Subscription s ON pu.planID = s.planID AND pu.mobileNo = s.mobileNo
    INNER JOIN Customer_Account ca ON s.mobileNo = ca.mobileNo
    WHERE ca.mobileNo = @MobileNo
      AND s.status = 'active'
      AND MONTH(CURRENT_TIMESTAMP) = MONTH(pu.start_date)
      AND YEAR(CURRENT_TIMESTAMP) = YEAR(pu.start_date)
    GROUP BY pu.planID
);
GO
GO
CREATE FUNCTION Cashback_Wallet_Customer(
    @NationalID INT
)
RETURNS TABLE
AS
RETURN (
    SELECT 
        cp.first_name,                
        cp.last_name,                 
        C.CashbackID,                  
        C.benefitID,                  
        C.amount,                     
        C.credit_date,                
        w.walletID,                    
        w.current_balance,             
        w.currency,                    
        w.last_modified_date           
    FROM Cashback C
    INNER JOIN Wallet w ON C.walletID = w.walletID
    INNER JOIN Customer_profile cp ON cp.nationalID = w.nationalID
    WHERE cp.nationalID = @NationalID
);
GO



    GO
CREATE PROCEDURE Ticket_Account_Customer
(
    @NationalID INT 
)
AS
BEGIN
    SELECT ca.mobileNo, COUNT(ts.ticketID) AS UnresolvedTicketsCount
    FROM Customer_Account ca
    JOIN Technical_Support_Ticket ts ON ca.mobileNo = ts.mobileNo
    WHERE ca.nationalID = @NationalID
      AND ts.status <> 'Resolved'
    GROUP BY ca.mobileNo;
END;
GO
GO
CREATE PROCEDURE  Account_Highest_Voucher(
    @mobileno CHAR(11),
    @HighestVoucherID INT OUTPUT
    )
AS
BEGIN
    SELECT TOP 1 @HighestVoucherID = V.VoucherID 
    From Voucher V
    Where @mobileno = V.mobileNO
    ORDER BY value DESC;
END;

GO
GO

CREATE FUNCTION Remaining_plan_amount
(
    @MobileNo CHAR(11),
    @Plan_Name VARCHAR(50)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @Plan_Price DECIMAL(10, 2)
    DECLARE @Total_Payment DECIMAL(10, 2)

 
    SELECT @Plan_Price = sp.price
   FROM Service_Plan sp
    WHERE sp.name = @Plan_Name;

   
    SELECT @Total_Payment = ISNULL(SUM(p.amount), 0)
    FROM Payment p
    INNER JOIN Customer_Account ca ON p.mobileNo = ca.mobileNo
    WHERE ca.mobileNo = @MobileNo;

   
    RETURN @Plan_Price - @Total_Payment;
END;
GO

GO
GO
CREATE FUNCTION Remaining_plan_amount(@paymentID INT, @planID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @remaining_amount DECIMAL(10, 2);
   DECLARE @payment_amount DECIMAL(10, 2);
    DECLARE @plan_price DECIMAL(10, 2);

      SELECT @payment_amount = p.amount
    FROM Payment p
   WHERE p.paymentID = @paymentID;

   
   SELECT @plan_price = sp.price
      FROM Service_Plan sp
  WHERE sp.planID = @planID;

    IF @payment_amount < @plan_price
    
        SET @remaining_amount = @plan_price - @payment_amount;
    
      ELSE
    
        SET @remaining_amount = 0;

    RETURN @remaining_amount;
END;
GO

GO
CREATE FUNCTION Extra_plan_amount
(@paymentID INT, @planID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @extra_amount DECIMAL(10, 2);

    SELECT @extra_amount = 
        CASE 
            WHEN p.amount > sp.price THEN p.amount - sp.price
            ELSE 0
        END
     FROM Payment p
    JOIN Service_Plan sp ON sp.planID = @planID
   WHERE p.paymentID = @paymentID;

    RETURN @extra_amount;
END;
GO
CREATE PROCEDURE  Top_Successful_Payments(
    @mobileno CHAR(11)
    )
AS
BEGIN
    SELECT TOP 10 P.paymentID, P.amount, P.date_of_payment, P.payment_method, P.status
    FROM Payment P 
    WHERE  status = 'successful' AND @mobileno = P.mobileNo
    ORDER BY amount DESC;
END;
GO
GO
CREATE FUNCTION Subscribed_plans_5_Months (@MobileNo CHAR(11))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        sp.planID,
        sp.name AS PlanName,
        sp.description AS PlanDescription,
        sp.price AS PlanPrice,
        sp.SMS_offered,
        sp.minutes_offered,
        sp.data_offered,
        s.subscription_date,
        s.status AS SubscriptionStatus
    FROM 
        Subscription s
    INNER JOIN 
        Service_Plan sp ON s.planID = sp.planID
    WHERE 
        s.mobileNo = @MobileNo
        AND s.subscription_date >= DATEADD(MONTH, -5, CURRENT_TIMESTAMP)
);
GO
GO 
CREATE PROCEDURE Initiate_plan_payment(
    @mobileno CHAR(11),
    @amount decimal(10,1),
    @payment_method varchar(50),
    @plan_id int)
AS
BEGIN
    UPDATE S
    SET S.status = 'Active',
        S.subscription_date = CURRENT_TIMESTAMP
    FROM Subscription S
    INNER JOIN Customer_Account CA ON S.mobileNo = CA.mobileNo
    WHERE CA.mobileNo = @MobileNo
      AND S.planID = @Plan_ID;

    INSERT INTO Payment(amount, date_of_payment, payment_method, status, mobileNo)
    VALUES (@Amount, CURRENT_TIMESTAMP, @Payment_Method, 'Accepted', @MobileNo);
END;
GO 
GO
CREATE PROCEDURE Payment_wallet_cashback
    
    @MobileNo CHAR(11),
    @payment_id INT,
    @Benefit_id INT
AS
    DECLARE @AmountOfCashback DECIMAL(10, 1)
    DECLARE @Payment_amount DECIMAL(10, 1)
BEGIN
     SELECT @Payment_amount = P.amount
     FROM Payment P
     WHERE @payment_id = p.paymentID
     
     SET @AmountOfCashback = @Payment_amount*0.1
    
     Update W
     SET W.current_balance = W.current_balance+@AmountOfCashback
     FROM Wallet W 
     JOIN Customer_profile CP ON W.nationalID = CP.nationalID
     JOIN Customer_Account CA ON CP.nationalID = CA.nationalID
     WHERE CA.mobileNO = @MobileNo

     INSERT INTO Cashback (benefitID, amount, credit_date)
     VALUES (@Benefit_ID, @AmountOfCashback, CURRENT_TIMESTAMP);
END;
GO
GO
CREATE PROCEDURE Initiate_balance_payment(
    @MobileNo char(11),
    @amount decimal(10,1),
    @payment_method varchar(50)
    )
AS
BEGIN
    INSERT INTO Payment (amount,date_of_payment,payment_method,status,mobileNO)
    Values(@amount,CURRENT_TIMESTAMP,@payment_method,'Accepted',@MobileNo)

    UPDATE CA
    SET CA.balance = CA.balance+@amount 
    FROM Customer_Account CA
    WHERE mobileNo = @MobileNo

END;
GO
GO
CREATE PROCEDURE Redeem_voucher_points(
    @MobileNo char(11),
    @voucher_id INT)
AS
    DECLARE @POINTS INT   
BEGIN
    SELECT @POINTS = V.points
    FROM Voucher V
    WHERE @voucher_id = v.voucherID

    UPDATE V 
    SET V.redeem_date = CURRENT_TIMESTAMP
    FROM Voucher V
    WHERE V.voucherID = @voucher_id

    UPDATE CA
    SET CA.pointsAmount = CA.pointsAmount + @POINTS
    FROM Customer_Account CA
    WHERE CA.mobileNo = @MobileNo
END;
GO