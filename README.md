# DataManagerInterview
This is a test sql query that answers the interview questions.

Use the following schema:
 
users
—-----
*userID integer
Initials text unique
Fullname text
 
User_answers
—----------------
userID integer
*answerID integer
Attempt integer
isCorrect boolean
 
This database represents the scoring system for a short quiz.  A correct answer counts as 1 point.  An incorrect answer counts as 0 points.  A question that has not been answered does not count towards the score.  Users may attempt the quiz multiple times.  The total score for an attempt will be a percentage of correct answers to total answers.
 
Write a SQL query that gets the attempt for each user that has the highest score amongst all of that user’s attempts.
Write a SQL query that fetches all attempts and total scores for each attempt for a given user, defined by that user’s initials.  You may assume that each user has unique initials.
Write a SQL query that will update the user’s initials based on their fullname. 
Restructure the schema (if necessary) to optimize the above queries (make the queries simpler, run faster, etc)


