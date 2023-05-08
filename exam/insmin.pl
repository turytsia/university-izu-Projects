min([H],H).
min([H|T],OUTER) :- min(T, INNER), INNER < H, OUTER is INNER.
min([H|T],OUTER) :- OUTER is H.

insert([], X, [X]).
insert([H|T], X, [H|R]) :- insert(T, X, R).

ismin([],[]).
ismin(L, X) :- min(L,MIN), insert(L,MIN,X). 

eq([],[]).
eq([H|L1],[H|L2]) :- eq(L1,L2).
insmin(L1,L2) :- ismin(L1,L), eq(L, L2).
