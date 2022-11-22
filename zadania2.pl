a(S, N, W):-
    N =:= 1,
    W is S.

a(S, N, W):-
    N > 1,
    a(S, N-1, X),
    W is X + S + (N - 1).


% liczba(0).
% liczba(s(X)) :- liczba(X).

mniejszy(0, s(_)).

mniejszy(X, Y):-
    X = s(X1),
    Y = s(Y1),
    mniejszy(X1, Y1).

mniejszy(X, Y):- mniejszy(s(X), s(Y)).


dodaj(0, Y, Y).
dodaj(s(X), Y, s(Z)) :- dodaj(X, Y, Z).

mnoz(A, s(0), A).
mnoz(s(0), B, B).
mnoz(0, _, 0).
mnoz(_, 0, 0).

mnoz(A, B, C):-
    B = s(B1),
    mnoz(A, B1, C1),
    dodaj(A, C1, C2),
    C = C2.

krawedz(a, b). 

krawedz(b, c). 

krawedz(c, e). 

krawedz(c, f). 

krawedz(d, f). 

krawedz(f, e). 


sciezka_peano(X,Y,N):- 

    krawedz(X, Y), N = s(0). 

  

sciezka_peano(X, Y, N):- 

    krawedz(X, Z),

   	sciezka_peano(Z, Y, N1),
	
	N = s(N1).


concat([], L, L).
concat([H|T], L, [H|W1]):-
    concat(T, L, W1).

concat([], L, L).
concat([H|T], L, [H|W1]):-
    concat(T, L, W1).

len([], 0).
len([_|T], N):- len(T, N1), N is N1 + 1.

ostatni_element([H|[]], H).
ostatni_element([_|T], E):- ostatni_element(T, E).

prefiks([], []).
prefiks([], [_|_]).
prefiks(L, [H|T]):- L = [H1|T1], H1 = H, prefiks(T1, T).


podlista(A, A).
podlista(A, B):- B = [_|T], prefix(A, T).
podlista(A, B):- prefix(A, B).



wstaw(E, [], [E|[]]).
wstaw(E, [E1|[]], A):-
    E < E1,
    A = [E|[E1|[]]].

wstaw(E, [E1|[]], A):-
    E >= E1,
    A = [E1|[E|[]]].

wstaw(E, X, Y):-
    X = [E1|T],
    E1 < E,
    wstaw(E, T, Y1),
    Y = [E1|Y1].

wstaw(E, X, Y):-
    X = [E1|_],
    E1 >= E,
    Y = [E|X].
   
sortuj([], []).
sortuj([H|[]], [H|[]]).

sortuj(A, B):-
    A = [H|T],
    sortuj(T, B1),
    wstaw(H, B1, B).


podlista2(A, B):- podlista(A, B).

podlista2(A, B):-
    A = [H|T],
    B = [H1|T1],
    H = H1,
    podlista2(T, T1).

podlista2(A, B):-
    A = [H|_],
    B = [H1|T1],
    H = H1,
    podlista2(A, T1).

podlista2(A, B):-
    A = [H|_],
    B = [H1|T1],
    H \= H1,
    podlista2(A, T1).


concat([], L, L).
concat([H|T], L, [H|W1]):-
    concat(T, L, W1).

len([], 0).
len([_|T], N):- len(T, N1), N is N1 + 1.

ostatni_element([H|[]], H).
ostatni_element([_|T], E):- ostatni_element(T, E).

prefiks([], []).
prefiks([], [_|_]).
prefiks(L, [H|T]):- L = [H1|T1], H1 = H, prefiks(T1, T).


podlista(A, A).
podlista(A, B):- B = [_|T], prefix(A, T).
podlista(A, B):- prefix(A, B).

wstaw(E, [], [E|[]]).
wstaw(E, [E1|[]], A):-
    E < E1,
    A = [E|[E1|[]]].

wstaw(E, [E1|[]], A):-
    E >= E1,
    A = [E1|[E|[]]].

wstaw(E, X, Y):-
    X = [E1|T],
    E1 < E,
    wstaw(E, T, Y1),
    Y = [E1|Y1].

wstaw(E, X, Y):-
    X = [E1|_],
    E1 >= E,
    Y = [E|X].
   
sortuj([], []).
sortuj([H|[]], [H|[]]).

sortuj(A, B):-
    A = [H|T],
    sortuj(T, B1),
    wstaw(H, B1, B).


podlista2(A, B):- podlista(A, B).

podlista2(A, B):-
    A = [H|T],
    B = [H1|T1],
    H = H1,
    podlista2(T, T1).

podlista2(A, B):-
    A = [H|_],
    B = [H1|T1],
    H = H1,
    podlista2(A, T1).

podlista2(A, B):-
    A = [H|_],
    B = [H1|T1],
    H \= H1,
    podlista2(A, T1).

permutacja(A, A).
permutacja([H|[E]], [E|[H]]).
permutacja(A, B):-
    wybierz(A, E, T),
    B = [E|T].
wybierz([H|T], H, T).
wybierz([A|T], B, [A|T1]):- wybierz(T, B, T1).
perm(L, [A|RP]):-
    wyb(L, A, R), perm(R, RP).

silnia(0, A, A).
silnia(1, A, A).
silnia(N, A, S):-
    N > 1,
    N1 is N - 1,
    A1 is A * N,
    silnia(N1, A1, S).
silnia(N,S):-  silnia(N, 1, S).

sumy(L, X, Y):- sumy(L, 0, 0, X, Y).
sumy([], A1, A2, A1, A2).
sumy([H|T], A1, A2, X, Y):-
    H >= 0,
    A1_1 is H + A1,
    sumy(T, A1_1, A2, X, Y).
sumy([H|T], A1, A2, X, Y):-
    H =< 0,
    A2_1 is H + A2,
    sumy(T, A1, A2_1, X, Y).

fib(0, A1, _, A1).
fib(1, _, A2, A2).
fib(N, A1, A2, F):-
    N > 1,
    N1 is N - 1,
    A2_1 is A2 + A1,
    A1_1 is A2,
    fib(N1, A1_1, A2_1, F).

fib(N,F):- fib(N, 0, 1, F).

nth([H|_], N, N, H).
nth([_|T], N, N1, E):-
    N1 < N,
    N2 is N1 + 1,
    nth(T, N, N2, E).
nth(L, N, E):-nth(L, N, 0, E).

size([], 0).
size([_|T], N):-
    size(T, N1),
    N is N1 + 1.

przekatna([], 0, 0, [], []).
przekatna(_, MatrixSize, MatrixSize, DiagAcc, DiagAcc).
przekatna(Matrix, MatrixSize, N, DiagAcc, D):-
    N < MatrixSize,
    nth(Matrix, N, NthRow),
    nth(NthRow, N, E),
    NewDiagAcc = [E|DiagAcc],
    N1 is N + 1,
    przekatna(Matrix, MatrixSize, N1, NewDiagAcc, D).

przekatna(Matrix, D):-
    size(Matrix, MatrixSize),
    przekatna(Matrix, MatrixSize, 0, [], D).

