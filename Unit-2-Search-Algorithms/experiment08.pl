% Experiment 8: A* Search Algorithm

% Connections between nodes and their costs
edge(a, b, 1).
edge(a, c, 2).
edge(b, d, 4).
edge(b, e, 2).
edge(c, f, 2).
edge(d, g, 5).
edge(e, g, 3).
edge(f, g, 2).

% Heuristic values for reaching the goal g
heuristic(a, 5).
heuristic(b, 4).
heuristic(c, 3).
heuristic(d, 5).
heuristic(e, 2).
heuristic(f, 1).
heuristic(g, 0).

% Start the A* search
a_star(Start, Goal, Path) :-
    heuristic(Start, H),
    a_star_search([entry(H, 0, Start, [Start])], [], Goal, RevPath),
    reverse(RevPath, Path).

% Search for the path with the lowest cost
a_star_search(Open, Closed, Goal, Path) :-
    sort(Open, [entry(_, Cost, Current, CurrentPath)|Rest]),
    (   Current == Goal
    ->  Path = CurrentPath
    ;   member(Current, Closed)
    ->  a_star_search(Rest, Closed, Goal, Path)
    ;   findall(entry(F, NewCost, Next, [Next|CurrentPath]),
            (   edge(Current, Next, StepCost),
                \+ member(Next, CurrentPath),
                NewCost is Cost + StepCost,
                heuristic(Next, H),
                F is NewCost + H
            ),
            NewEntries),
        append(Rest, NewEntries, NewOpen),
        a_star_search(NewOpen, [Current|Closed], Goal, Path)
    ).