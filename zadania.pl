male(jacek). 

male(michal). 

male(karol). 

male(czarek). 

male(roman). 

male(witold). 

male(franek). 

male(mariusz). 

male(onufry). 

  

female(X) :-  \+ male(X). 

  

child(ola, ala). 

child(magda, ala). 

child(michal, ala). 

  

child(ola, jacek). 

child(magda, jacek). 

child(michal, jacek). 

  

child(roman, wanda). 

child(roman, karol). 

child(czarek, wanda). 

child(czarek, karol). 

  

child(franek, kunegunda). 

child(franek, witold). 

child(zuzanna, witold). 

child(zuzanna, kunegunda). 

  

child(onufry, magda). 

child(onufry, mariusz). 

child(aneta, magda). 

child(aneta, mariusz). 

  

child(ewa, ola). 

child(ewa, onufry). 

child(nina, ola). 

child(nina, onufry). 

  

son(X, Y) :- child(X, Y), male(X). 

  

daughter(X, Y) :- child(X, Y), female(X). 

  

grandchild(X, Y) :- child(X, Z), child(Z, Y). 

  

grandparent(X, Y) :- grandchild(Y, X). 

  

grandson(X, Y) :- grandchild(X, Y), male(X). 

  

grandfather(X, Y) :- grandparent(X, Y), male(X). 

  

grandfather(X) :- grandparent(X, _X). 

  

descendant(X, Y) :- child(X, Y); child(X, Z), descendant(Z, Y). 

 

wektor(1, 2, 3). 

wektor(4, 5, 6). 

  

suma(wektor(X, Y, Z), wektor(A, B, C), W) :-  

    U is X + A, 

    V is Y + B, 

    H is Z + C, 

    wektor(U, V, H) = W. 

  

  

iloczyn(wektor(X, Y, Z), wektor(A, B, C), W) :-  

    U is X * A, 

    V is Y * B, 

    H is Z * C, 

    W is U + V + H. 

  

  

neg(X, Y):- 

    Y is -X. 

  

wiekszy(X, Y, Z) :- 

    Z is Y, 

    X < Y; 

    Z is X, 

    X > Y. 

  

modul(X, Z) :- 

    wiekszy(X, 0, 0), neg(X, Z). 

  

modul(X, Z) :- 

    wiekszy(X, 0, X), Z = X. 

  

suma_ciagu_aryt(X, Y) :- 

    X =:= 0, Y is 0; 

    X > 0, suma_ciagu_aryt(X - 1, Z), Y is Z + X. 

  

  

delta(X, Y, Z, D) :- 

    B is Y ^ 2, 

    C is 4 * ( X * Z ), 

    D is B - C. 

  

pierw(X, Y, Z, R) :- 

    delta(X, Y, Z, D), 

    D >= 0, 

    H is sqrt(D), 

    R is (-Y+H)/(2 * X). 

  

pierw(X, Y, Z, R) :- 

    delta(X, Y, Z, D), 

    D >= 0, 

    H is sqrt(D), 

    R is (-Y-H)/(2 * X). 