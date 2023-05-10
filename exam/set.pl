notin(TARGET, []).
notin(TARGET, [H|T]) :- TARGET \= H, notin(TARGET, T). 

set([]).
set([H|T]) :- notin(H,T), set(T).