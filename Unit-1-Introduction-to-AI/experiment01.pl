% Experiment 1: Student Knowledge Base
% Subject: Artificial Intelligence and Machine Learning

% Student details
student(ram).
student(rahul).
student(amit).
student(priya).

% Course details
course(ai_ml).
course(data_science).
course(computer_science).

% Students enrolled in courses
enrolled(kishan, ai_ml).
enrolled(rahul, data_science).
enrolled(amit, computer_science).
enrolled(priya, ai_ml).

% Rule to check whether a student is enrolled in AI and ML
ai_ml_student(X) :-
student(X),
enrolled(X, ai_ml).

% Rule to find the course of a student
student_course(X, Y) :-
student(X),
enrolled(X, Y).
