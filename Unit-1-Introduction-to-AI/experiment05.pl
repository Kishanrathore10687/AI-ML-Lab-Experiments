% Experiment 5: Student Performance Classification

% Student marks
student_marks(kishan, 85).
student_marks(rahul, 72).
student_marks(amit, 55).
student_marks(priya, 35).

% Classify student performance based on marks
performance(Marks, excellent) :-
    Marks >= 80.

performance(Marks, good) :-
    Marks >= 60,
    Marks < 80.

performance(Marks, average) :-
    Marks >= 40,
    Marks < 60.

performance(Marks, needs_improvement) :-
    Marks < 40.

% Find the performance of a student
student_performance(Name, Result) :-
    student_marks(Name, Marks),
    performance(Marks, Result).