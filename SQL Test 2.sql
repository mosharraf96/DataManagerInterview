
CREATE TABLE User_answers (
    UserID int,
    answerID int NOT NULL PRIMARY KEY,
    Attempt int,
    isCorrect int --I used MS SQL so I couldn't find the boolean type (I might be wrong though)
);

CREATE TABLE users (
    userID int NOT NULL PRIMARY KEY,
    Initials varchar(255) NOT NULL UNIQUE,
    Fullname varchar(255)
)

insert into users (userID, Fullname, Initials) values (10, 'Mosharraf Hossain', 'MH');
insert into users (userID, Fullname, Initials) values (20, 'Jane Doe', 'JD');


insert into User_answers (UserID, answerID, isCorrect, Attempt) values (10, 1, 0, 1);
insert into User_answers (UserID, answerID, isCorrect, Attempt) values (10, 2, 0, 1);
insert into User_answers (UserID, answerID, isCorrect, Attempt) values (10, 3, 1, 1);

insert into User_answers (UserID, answerID, isCorrect, Attempt) values (10, 4, 1, 2);
insert into User_answers (UserID, answerID, isCorrect, Attempt) values (10, 5, 0, 2);
insert into User_answers (UserID, answerID, isCorrect, Attempt) values (10, 6, 1, 2);

insert into User_answers (UserID, answerID, isCorrect, Attempt) values (20, 7, 1, 1);
insert into User_answers (UserID, answerID, isCorrect, Attempt) values (20, 8, 0, 1);
insert into User_answers (UserID, answerID, isCorrect, Attempt) values (20, 9, 1, 1);
insert into User_answers (UserID, answerID, isCorrect, Attempt) values (20, 10, 1, 1);

insert into User_answers (UserID, answerID, isCorrect, Attempt) values (20, 11, 1, 2);
insert into User_answers (UserID, answerID, isCorrect, Attempt) values (20, 12, 0, 2);
insert into User_answers (UserID, answerID, isCorrect, Attempt) values (20, 13, 0, 2);
insert into User_answers (UserID, answerID, isCorrect, Attempt) values (20, 14, 1, 2);


WITH CTE1 as

(SELECT 
    ua.UserID, us.Initials , count(ua.isCorrect) 'Total_Answered'
    , sum(ua.isCorrect) 'Total_Score', ua.Attempt 'Attempt_Number'
FROM User_answers ua
    INNER JOIN users us on us.UserID = ua.UserID
GROUP BY ua.UserID, ua.Attempt, us.Initials)

, CTE2 as

(SELECT 
    UserID, Total_Score, Attempt_Number
    , ROW_NUMBER() OVER (PARTITION BY UserID ORDER BY Total_Score DESC) AS row_n
FROM CTE1
)


-- Q1. Write a SQL query that gets the attempt for each user that has the highest score 
-- amongst all of that user’s attempts.

select ua.UserID, users.Fullname, ua.Total_Score, ua.Attempt_Number 
FROM CTE2 ua 
INNER JOIN users on users.userID = ua.UserID
where ua.row_n = 1

-- Q2. Write a SQL query that fetches all attempts and total scores for each attempt 
-- for a given user, defined by that user’s initials.  
-- You may assume that each user has unique initials.

select * from CTE1
order by UserID




/* Q3. Write a SQL query that will update the user’s initials based on their fullname. */


-- I will declare a function that parses through the Full name, seperates each word based on whitespace and gets the first word of each name.
/*
UPDATE a
SET a.column1 = defined_function(b.fullname)
FROM Users a 
INNER JOIN Users b
on a.myID = b.myID
*/

-- Q4. Restructure the schema (if necessary) to optimize the above queries (make the queries simpler, run faster, etc)
-- The schema doesn't need to be structured.
