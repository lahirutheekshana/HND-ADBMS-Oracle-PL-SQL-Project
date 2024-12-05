--------------------------------------------------------
                  --TABLE CREATION--
--------------------------------------------------------
CREATE TABLE Users (
    User_Id INT PRIMARY KEY,
    User_FName VARCHAR(50),
    User_LName VARCHAR(50),
    User_Email VARCHAR(100),
    User_Pass VARCHAR(50)
);

CREATE TABLE Plans (
    P_Id INT PRIMARY KEY,
    P_Date DATE,
    P_AccStart NUMBER(10,2),
    P_TypicalRisk NUMBER(10,2),
    P_RiskReward INT,
    P_winLoss INT,
    User_id INT,
    FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

CREATE TABLE Trades (
    T_Id INT PRIMARY KEY ,
    T_Date DATE,
    T_Market VARCHAR(50),
    T_RiskAmount DECIMAL(10,2),
    T_WinLoss VARCHAR(50),
    T_BuySell VARCHAR(50),
    User_id INT,
    FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

CREATE TABLE Incomes (
    I_Id INT PRIMARY KEY,
    I_Balance NUMBER(10,2),
    I_ProfitLoss VARCHAR(50),
    I_NewBalance NUMBER(10,2),
    User_id INT,
    P_Id INT
);

SELECT * FROM Users;
SELECT * FROM Plans;
SELECT * FROM Trades;
SELECT * FROM Incomes;


--------------------------------------------------------
                    --SEQUENCES--
--------------------------------------------------------
CREATE SEQUENCE user_seq 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE plan_seq 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE trade_seq 
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE income_seq 
START WITH 1
INCREMENT BY 1
NOCACHE;

SELECT * FROM user_sequences;

--------------------------------------------------------
                    --INSERT DATA--
--------------------------------------------------------
-- Assume, there are multiple User Accounts (3 Users Here)
INSERT INTO Users (User_Id,User_FName,User_LName,User_Email,User_Pass) VALUES (user_seq.NEXTVAL, 'Asiri', 'Sandaruwan', 'asiri@gmail.com', '1234');
INSERT INTO Users (User_Id,User_FName,User_LName,User_Email,User_Pass) VALUES (user_seq.NEXTVAL, 'Lahiru', 'Theekshana', 'lahiru@gmail.com', '2425');
INSERT INTO Users (User_Id,User_FName,User_LName,User_Email,User_Pass) VALUES (user_seq.NEXTVAL, 'Vinod', 'Randima', 'vinod@gmail.com', '3536');    


   
-- Assume, each User Has created two plans --
--Asiri Plans
INSERT INTO Plans (P_Id, P_Date, P_AccStart, P_TypicalRisk, P_RiskReward,P_winLoss, User_id) VALUES (plan_seq.NEXTVAL, SYSDATE , 100.00 , 5.00 , 2, 50, 1); 
INSERT INTO Plans (P_Id,P_Date,P_AccStart,P_TypicalRisk,P_RiskReward,P_winLoss,User_id) VALUES (plan_seq.NEXTVAL, SYSDATE, 200.00 , 3.00 , 3, 40, 1);   

--Lahiru Plans
INSERT INTO Plans (P_Id,P_Date,P_AccStart,P_TypicalRisk,P_RiskReward,P_winLoss,User_id) VALUES (plan_seq.NEXTVAL, SYSDATE, 500.00 , 3.50 , 2, 35, 2);  
INSERT INTO Plans (P_Id,P_Date,P_AccStart,P_TypicalRisk,P_RiskReward,P_winLoss,User_id) VALUES (plan_seq.NEXTVAL, SYSDATE, 250.00 , 4.00 , 2, 65, 2);  
--Vinod Plans
INSERT INTO Plans (P_Id,P_Date,P_AccStart,P_TypicalRisk,P_RiskReward,P_winLoss,User_id) VALUES (plan_seq.NEXTVAL, SYSDATE, 350.00 , 4.00 , 2, 40, 3);  
INSERT INTO Plans (P_Id,P_Date,P_AccStart,P_TypicalRisk,P_RiskReward,P_winLoss,User_id) VALUES (plan_seq.NEXTVAL, SYSDATE, 450.00 , 2.00 , 3, 60, 3);       
     
     
-- Assume, each User Has Place Trades and Track Them --
--Asiri Placed Trades
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'AUD/JPY', 20.00 , 'LOSS', 'BUY' , 1);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'USD/AUD', 5.43, 'WIN', 'BUY' , 1);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'USD/GOLD', 4.56 , 'WIN', 'SELL' , 1);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'AUD/JPY', 6.78 , 'LOSS', 'BUY' , 1);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'USD/GOLD', 3.5 , 'WIN', 'SELL' , 1);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'USD/GOLD', 7.4 , 'LOSS', 'BUY' , 1);

--Lahiru Placed Trades 
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'AUD/USD', 5.00 , 'LOSS', 'BUY' , 2);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'AUD/GOLD', 3.43, 'LOSS', 'SELL' , 2);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'USD/GOLD', 1.56 , 'WIN', 'SELL' , 2);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'AUD/GOLD', 3.78 , 'WIN', 'BUY' , 2);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'USD/BITCOIN', 7.53 , 'WIN', 'BUY' , 2);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'USD/BITCOIN', 4.45 , 'LOSS', 'BUY' , 2);

--Vinod Placed Trades    
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'AUD/JPY', 6.00 , 'LOSS', 'BUY' , 3);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'USD/BITCOIN', 5.43, 'WIN', 'BUY' , 3);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'USD/BITCOIN', 4.56 , 'WIN', 'SELL' , 3);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'USD/BITCOIN', 6.78 , 'LOSS', 'BUY' , 3);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'USD/GOLD', 3.5 , 'WIN', 'SELL' , 3);
INSERT INTO Trades (T_Id ,T_Date ,T_Market,T_RiskAmount ,T_WinLoss ,T_BuySell,User_id) VALUES (trade_seq.NEXTVAL, SYSDATE, 'AUD/JPY', 7.4 , 'LOSS', 'BUY' , 3);

-- NOTE : ************* Income Data Will Be Inserted From Pl/Sql Block ************ --
-- ******* Income is a Temporary View For Calculating the Expected Income Randomly ************ --



--------------------------------------------------------------------------------
                --WHERE , ORDER BY, GROUP BY, HAVING--
--------------------------------------------------------------------------------
/* Theses Clauses Are use by the Application to view Different Data to the User 
based on different criterias. The Criteria can Be seen as a explanatory Comments.*/

-- View all tables 
SELECT * FROM Users;   -- INSERTED
SELECT * FROM Plans;   -- INSERTED
SELECT * FROM Trades;  -- INSERTED
SELECT * FROM Incomes; -- INSERT FROM PL/SQL TO VIEW EXPECTED INCOME FROM SPECIFIC PLAN


---------------------------------------- SELECT ---------------------------------------
---------------------------------------------------------------------------------------
-- Verify the User And Get Name When it is Logging By Its Email And Password
-- If These Returning values we can Verify That User Has successfully Logged in.
SELECT User_Id,User_FName,User_LName
FROM Users
WHERE User_Email = 'asiri@gmail.com' AND User_Pass = '1234';
--NOTE :Use Seesion Variable to Save the User Id.

-- View all the Plans Created By Specific Logged User (ex:= above user)
--NOTE : The Plans must be independent For Users Since They are in the same Table
SELECT * FROM Plans 
WHERE User_Id = 1;  

-- View all the Trades Placed By Specific Logged User (ex:= above user)
SELECT * FROM Trades
WHERE User_Id = 1;  

-- View the dates of LOSS by investing More than 10 USD  Of a Specific user
SELECT T_Date
FROM Trades
WHERE T_RiskAmount > 10 AND T_WinLoss = 'LOSS';

-- View the dates of LOSS by investing LESS than 10 USD  Of a Specific user
SELECT T_Date
FROM Trades
WHERE T_RiskAmount < 10 AND T_WinLoss = 'LOSS';

-- View User Names and Market he/she has Placed trades
SELECT userx.User_FName, Trade.T_Market 
FROM Users userx
INNER JOIN Trades trade
ON userx.User_Id = trade.User_Id
WHERE userx.User_Id = 1;

---------------------------------------- ORDER BY -------------------------------------
---------------------------------------------------------------------------------------
-- View all the users in alphebetical Order in users table
SELECT * FROM Users 
ORDER BY User_FName ASC;

---------------------------------------- GROUP BY -------------------------------------
---------------------------------------------------------------------------------------
/* Get The counts of the Buy Or Sells Accourding to the Market That a Specific Trader has Trade */
SELECT T_Market,T_BuySell, COUNT(T_RiskAmount) AS COUNTS
FROM Trades 
WHERE User_id = 1
GROUP BY T_Market,T_BuySell;

/* Get The counts of the WIN/LOSS Accourding to the Market That a Specific Trader has Trade */
SELECT T_Market,T_WinLoss, COUNT(T_RiskAmount) AS COUNTS
FROM Trades 
WHERE User_id = 1
GROUP BY T_Market,T_WinLoss
HAVING COUNT(T_RiskAmount) > 0;



----------------------------------------- HAVING --------------------------------------
---------------------------------------------------------------------------------------






---------------------------------------------------------------------------------------
                             --SINGLE ROW SUB QUERIES--
---------------------------------------------------------------------------------------
/* View the Risk Amounts of a specific  User Which is greater than Average Risk Amount 
of that particular User */
SELECT T_RiskAmount
FROM Trades
WHERE T_RiskAmount > (SELECT AVG(T_RiskAmount) FROM Trades WHERE User_Id=1) AND User_Id = 1;
-- Conclution : Check How many you Trade with High risk, And what are the risk values 

/* View Number Of Losses and Wins Which have been risked More than the average riskAmount of a 
Particular User Seperately */
SELECT T_WinLoss, COUNT(T_RiskAmount) AS COUNTS
FROM Trades 
WHERE T_RiskAmount > (SELECT AVG(T_RiskAmount) FROM Trades WHERE User_Id=1) AND User_Id = 1 
group by T_WinLoss;


/* View the Risk Amounts of a specific  User Which is Less than Average Risk Amount 
of that particular User */
SELECT T_RiskAmount
FROM Trades
WHERE T_RiskAmount < (SELECT AVG(T_RiskAmount) FROM Trades WHERE User_Id=1) AND User_Id = 1;
-- Conclution : Check How many you Trade with less risk, And what are the risk values 

/* View Number Of Losses and Wins Which have been risked Less than the average riskAmount of a 
Particular User Seperately */
SELECT T_WinLoss, COUNT(T_RiskAmount) AS COUNTS
FROM Trades 
WHERE T_RiskAmount < (SELECT AVG(T_RiskAmount) FROM Trades WHERE User_Id=1) AND User_Id = 1 
group by T_WinLoss;

---------------------------------------------------------------------------------------
                             --MULTIPLE ROW SUB QUERIES--
---------------------------------------------------------------------------------------
/* Display Name , Market and Minimum Risk amounts that invested for a particular Market
by a Specific Trader But Which is More than the Minimum Risk Amount Invested overall by 
that Specific Trader*/ 
SELECT US.User_FName , TR.T_Market , MIN(TR.T_RiskAmount) AS Min_Risk
FROM Users US
INNER JOIN Trades TR
ON US.User_Id = TR.User_Id
WHERE US.User_Id = 1
GROUP BY US.User_FName , TR.T_Market
HAVING MIN(TR.T_RiskAmount) > ANY (SELECT T_RiskAmount FROM Trades WHERE User_Id = 1);

/*Display user name & plan date where Only the minimum of the Account Start is Greater
Than the All the percentage values of the win/loss */
SELECT US.User_FName,PL.P_Date , MIN(PL.P_AccStart) AS MinAccStart
FROM Users US
INNER JOIN Plans PL
ON US.User_Id = PL.User_Id
WHERE US.User_Id = 1
GROUP BY US.User_FName,PL.P_Date
HAVING MIN(PL.P_AccStart) > ALL(SELECT P_WinLoss FROM Plans WHERE User_Id = 1);

---------------------------------------------------------------------------------------
                               --APPLICATION LOGIC--
---------------------------------------------------------------------------------------
--NOTE :: 
/* Insert Data In to the Table Income Accouding the Plans Which is Selected By a Specific User */
SET SERVEROUTPUT ON;
ACCEPT num_trades NUMBER PROMPT 'Enter the Number Of Trades ?';
ACCEPT planId NUMBER PROMPT 'Enter the Plan Id ?';
DECLARE
  /*Store Plan Details Of a Specific plan Of a user*/
  plan_id Plans.P_Id%TYPE := 0;
  AccStart Plans.P_AccStart%TYPE := 0.0;
  typicalRisk Plans.P_TypicalRisk%TYPE := 0.0;
  RiskReward Plans.P_RiskReward%TYPE := 0;
  win_loss Plans.P_WinLoss%TYPE := 0;
  
  /* Declare Variables For Handling the Logic*/
  planId INT := &planId;
  nu_trades INT := &num_trades;
  balance NUMBER := 0.0;
  profit NUMBER := 0.0;
  new_balance NUMBER := 0.0;

  x INT := (win_loss / 100) * nu_trades;
  y INT := nu_trades - x;
  even_count INT := 0;
  odd_count INT := 0;

  randomNumber INT := 0;
  
BEGIN
/* Clear the Income Table Before Calculating the Expected Income*/ 
  DELETE FROM Incomes;
  
/* Get The Plan Details Accouding to the Plan Id */
  SELECT P_Id,P_AccStart,P_TypicalRisk,P_RiskReward,P_WinLoss
  INTO plan_id ,AccStart ,typicalRisk ,RiskReward ,win_loss 
  FROM Plans
  WHERE P_Id = planId;
  
/* Executing the Logic */
  FOR i IN 1..nu_trades LOOP
    randomNumber := TRUNC(DBMS_RANDOM.VALUE(1, 3));

    IF even_count = x THEN
      randomNumber := randomNumber + 1;
    END IF;

    IF odd_count = y THEN
      randomNumber := randomNumber + 1;
    END IF;

    IF MOD(randomNumber, 2) = 0 THEN
      IF i = 1 THEN
        balance := AccStart;
      ELSE
        balance := new_balance;
      END IF;
      profit := ((balance * typicalRisk) / 100) * RiskReward;
      new_balance := balance + profit;
      even_count := even_count + 1;
    ELSE
      IF i = 1 THEN
        balance := AccStart;
      ELSE
        balance := new_balance;
      END IF;
      profit := ((balance * typicalRisk) / 100);
      new_balance := balance - profit;
      odd_count := odd_count + 1;
    END IF;
    
  /* Insert Data To Income Table View For the User Inside Loop*/ 
  --NOTE:: ACTUALLY USER ID OF CURRENT USER CAN BE OBTAIN BY SESSION VARIABLE--
  INSERT INTO incomes (I_Id , I_Balance ,I_ProfitLoss ,I_NewBalance ,User_id ,P_Id )
  VALUES (income.NEXTVAL, balance, profit, new_balance,1,planId);  
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('EXPECTED INCOME CALCULATED SUCCESSFULLY');
END;
/

---------------------------------------------------------------------------------------
                                      --CURSOR--
---------------------------------------------------------------------------------------
/*Display All the Values in The Income Table using cur_income*/
SET SERVEROUTPUT ON;
DECLARE
  CURSOR cur_income(id NUMBER) IS
    SELECT *
    FROM incomes
    WHERE User_Id = id; --From session Variable
    
  v_id incomes.I_Id%TYPE;
  v_balance incomes.I_Balance%TYPE;
  v_profitLoss incomes.I_ProfitLoss%TYPE;
  v_new_Balance NUMBER(10,2);
  v_userId incomes.User_Id%TYPE;
  v_pId incomes.P_Id%TYPE;
  
BEGIN
  OPEN cur_income(1);
  LOOP
    FETCH cur_income INTO v_id,v_balance ,v_profitLoss ,v_new_Balance ,v_userId,v_pId;
    EXIT WHEN cur_income%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || '  '|| 'BALANCE: ' || v_balance || '  ' || 'PROFIT/LOSS:  ' ||v_profitLoss ||'  ' ||'NEW BALANCE: '|| v_new_Balance );
  END LOOP;
  CLOSE cur_income;
END;
/


---------------------------------------------------------------------------------------
                                      --VIEWS--
---------------------------------------------------------------------------------------
/* Creating a View For User Names and Market That trader has trade & win-loss & also how 
Buy-sell is Gonna be variated to this Trader */
CREATE VIEW user_trade_view AS
SELECT US.User_FName, TR.T_Market,TR.T_Date,TR.T_WinLoss,TR.T_BuySell
FROM Users US
INNER JOIN Trades TR
ON US.User_Id = TR.User_Id
WHERE US.User_Id = 1; --Can be Obtain From Session Variable

SELECT * FROM user_trade_view;

/* Creating a View For Show Sum of the Risk amount Trader has been Risked For the 
Specific Market */
CREATE VIEW sum_risk_view AS
SELECT US.User_FName, TR.T_Market,SUM(TR.T_RiskAmount) As Total_Risk
FROM Users US 
INNER JOIN Trades TR
ON US.User_Id = TR.User_Id
WHERE US.User_Id = 1
GROUP BY US.User_FName, TR.T_Market;

SELECT * FROM sum_risk_view;

---------------------------------------------------------------------------------------
                          --RETREIVE A RECORD FOR A INPUT--
---------------------------------------------------------------------------------------
/* Think That Trader need to check his Trade History On a Particular day */
SET SERVEROUTPUT ON;
ACCEPT v_var NUMBER PROMPT 'Enter Risk Amount ';

DECLARE
  v_riskAmount NUMBER := &v_var;
  v_row Trades%ROWTYPE; 
  
BEGIN  
  -- Query the Trades table to retrieve the rows with the specified date
  SELECT *
  INTO v_row
  FROM Trades
  WHERE T_RiskAmount = v_riskAmount;
  
  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('You Have not Risk Such a Amount For a Trade Before !!');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Record retrieved --->  ' || 'Trade ID: ' || v_row.T_Id || '   DATE: ' || v_row.T_Date || '   MARKET: ' || v_row.T_Market || '    RISK AMOUNT: ' || v_row.T_RiskAmount || '    WIN/LOSS: ' || v_row.T_WinLoss || '    BUY/SELL: ' || v_row.T_BuySell || '    USER ID: ' || v_row.User_id); 
  END IF;
   
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record found for the specified input.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/


     
---------------------------------------------------------------------------------------
                          --UPDATE A RECORD FOR A INPUT--
---------------------------------------------------------------------------------------
/* Think That Trader need Update His Password Email and Password */
SET SERVEROUTPUT ON;
ACCEPT mail CHAR PROMPT 'Enter a new email ?';
ACCEPT pass CHAR PROMPT 'Enter a new Password ?';
DECLARE
  v_email Users.User_Email%TYPE := '&mail';
  v_Password Users.User_Pass%TYPE := '&pass';
BEGIN
  UPDATE Users
  SET User_Email = v_email, User_Pass = v_Password
  WHERE User_Id = 1;  -- SESSION VARIABLE
  
  COMMIT; 
  DBMS_OUTPUT.PUT_LINE('Record updated successfully.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record found for the specified input.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

---------------------------------------------------------------------------------------
                             --DELETE A ROW FOR A INPUT--
---------------------------------------------------------------------------------------
/* Think That Trader need to DELETE His Own Plan */
SET SERVEROUTPUT ON;
ACCEPT id NUMBER PROMPT ' Enter a plan id Which You Want to Delete ? ';
DECLARE
  planId Plans.P_Id%TYPE := &id;
BEGIN
  DELETE FROM Plans
  WHERE P_Id = planId;
  
  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No Plan with id '|| planId || ' !! Check Again ');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Record deleted successfully.');
  END IF;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record found !!');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('There is an error: ' || SQLERRM);
END;
/


---------------------------------------------------------------------------------------
                                    --DELETE COUNT--
---------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
ACCEPT id CHAR PROMPT ' Enter a plan id Which You Want to Delete ? ';
DECLARE
  planId Plans.P_Id%TYPE := &id;
  num_deleted NUMBER;
  
BEGIN
  DELETE FROM Plans
  WHERE P_Id = planId;
  
  num_deleted := SQL%ROWCOUNT; 
  IF num_deleted = 0 THEN
    DBMS_OUTPUT.PUT_LINE('No Plan with id '|| planId || ' !! Check Again ');
  ELSE
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(num_deleted || ' record(s) deleted successfully.');
  END IF;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No record found !!');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('There is an error: ' || SQLERRM);
END;
/






