% https://www.cl.cam.ac.uk/teaching/0809/Prolog/Prolog08ML5R2.pdf

concat( A1-B1, B1-C1, A1-C1). 

% Define a predicate rotate(A1-B1, A2-B2)
% which is true if B1-C1 is a rotation of A1-B1.

rotate(A1-B1, A2-B2):-
    A1 = [H|T],
    concat(T-B1, [H|L]-L, A2-B2).

% https://sites.google.com/site/yinfeiyang/prologstudy/queue?pli=1

createQueue(L-L).

addQueue(E, L-[E|R], L-R).

delQueue(E, L-Last, NewL-Last) :- 

    \+(L == Last),

    L = [E|NewQ].

isEmptyQueue(L-M) :- 

    L == M.

% https://ai.ia.agh.edu.pl/pl:prolog:prolog_lab:listy1