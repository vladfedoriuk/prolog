krawedz(a, b). 

krawedz(b, c). 

krawedz(c, e). 

%krawedz(c, a). 

krawedz(c, f). 

krawedz(d, f). 

krawedz(f, e). 

  

%sciezka(X,d) 

%sciezka(a, X), sciezka(X, d), sciezka(d, f). 

%krawedz(X, Y), krawedz(Y, Z), krawedz(Z, f) 

%sziezka(X, X). 

  

sciezka(X,Y):- 

    krawedz(X, Y); krawedz(X, Z), sciezka(Z, Y). 

  

sciezka_dl(X,Y,N):- 

    %Czy istnieje sciekza o dlugosci N pomiedzy X a Y 

    N=1, krawedz(X,Y). 

  

sciezka_dl(X,Y,N) :- N>1, N1 is N - 1, krawedz(X,Z), sciezka_dl(Z,Y,N1). 

  

  

%sciezka_dl(a, e, 3). 

  

%Znajdź wszystkie ścieżki o długości 4 kończące się w f 

%	sciezka_dl(X, f, 4). 

  

%Znajdź wszystkie ścieżki o długości 3 zaczynające się w a 

%	sciezka_dl(a, X, 4). 

  

%Znajdź wszystkie ścieżki o długości 3 

%	sciezka_dl(X, Y, 3). 

  

%Dlaczego nie można przy pomocy tego predykatu znaleźć długości ścieżki od a do e ? 

%	Arguments are not sufficiently instantiated 

  

dl_sciezki(X,Y,N):- 

    krawedz(X, Y), N is 1. 

  

dl_sciezki(X,Y,N):- 

    krawedz(X, Z), 

   	sciezka(Z, Y), 

    dl_sciezki(Z, Y, N1), 

    N is N1 + 1. 

  

collatz(N):- 

    write(N), 

    N mod 2 =:= 0, 

    N_next is N // 2, 

    nl, 

    collatz(N_next). 

  

  

collatz(N):- 

    N =:= 1; 

    N mod 2 =:= 1, 

    N =\= 1, 

    N_next is 3 * N + 1, 

    nl, 

    collatz(N_next). 

 

 

collatz(N):- 

    write(N), 

    N mod 2 =:= 0, 

    N_next is N // 2, 

    nl, 

    collatz(N_next). 

  

  

collatz(N):- 

    N =:= 1; 

    N mod 2 =:= 1, 

    N =\= 1, 

    N_next is 3 * N + 1, 

    nl, 

    collatz(N_next). 

  

collatz(A, N):- 

    A =:= 1, 

    N is 1; 

    A mod 2 =:= 1, 

    A =\= 1, 

    A_next is 3 * A + 1, 

    collatz(A_next, N1), 

    N is N1 + 1. 

  

collatz(A, N):- 

    A mod 2 =:= 0, 

    A_next is A // 2, 

    collatz(A_next, N1), 

    N is N1 + 1. 

binom(K, L, X):-
    K > 0,
    L =:= 0,
    X is 1;
    K > 0,
    L =:= K,
    X is 1.

binom(K, L, X):-
    L >= 1,
    K >= 1,
    L =\= K,
    L =\= 0,
    binom(K - 1, L - 1, Y),
    binom(K - 1, L, Z),
    X is Z + Y.


a(S, N, W):-
    N =:= 1,
    W is S.

a(S, N, W):-
    N > 1,
    a(S, N-1, X),
    W is X + S + (N - 1).