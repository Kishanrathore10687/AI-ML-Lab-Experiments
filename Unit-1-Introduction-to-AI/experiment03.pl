% Experiment 3: Prolog List Operations

% Find an element in a list
list_member(X, [X|_]).

list_member(X, [_|T]) :-
    list_member(X, T).


% Append two lists
list_append([], L, L).

list_append([H|T], L, [H|R]) :-
    list_append(T, L, R).


% Find the length of a list
list_length([], 0).

list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.


% Reverse a list
list_reverse(L, R) :-
    reverse_list(L, [], R).

reverse_list([], R, R).

reverse_list([H|T], Acc, R) :-
    reverse_list(T, [H|Acc], R).