% Experiment 12: N-Queens Problem

:- use_module(library(lists)).

% Find a solution for N queens
queens(N, Rows) :-
    integer(N),
    N > 0,
    numlist(1, N, Columns),
    permutation(Columns, Rows),
    safe(Rows).

% Check whether all queens are safe
safe([]).

safe([Row|Rows]) :-
    no_diagonal(Row, Rows, 1),
    safe(Rows).

% Check diagonal positions
no_diagonal(_, [], _).

no_diagonal(Row, [Next|Rows], Distance) :-
    Row =\= Next + Distance,
    Row =\= Next - Distance,
    NextDistance is Distance + 1,
    no_diagonal(Row, Rows, NextDistance).