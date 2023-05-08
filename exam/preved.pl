eq([],[]).
eq([H|L1], [H|L2]) :- eq(L1,L2).

preved([],X,[]).
preved([H|T],X,[N|L]) :- preved(T,X,L), N is H mod X.

