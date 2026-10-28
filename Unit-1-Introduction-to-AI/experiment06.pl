% Experiment 6: Breadth-First Search

% Graph connections
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(e, g).
edge(f, g).

% Check connections in both directions
connected(X, Y) :-
    edge(X, Y).

connected(X, Y) :-
    edge(Y, X).

% Start the BFS search
bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

% Check whether the goal is reached
bfs_queue([[Goal|Rest]|_], Goal, [Goal|Rest]).

% Explore the next nodes
bfs_queue([Path|Queue], Goal, Result) :-
    Path = [Current|_],
    findall([Next|Path],
            (connected(Current, Next),
             \+ member(Next, Path)),
            NewPaths),
    append(Queue, NewPaths, UpdatedQueue),
    bfs_queue(UpdatedQueue, Goal, Result).