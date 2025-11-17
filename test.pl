:- initialization(main).

main :-
    write('Testing car diagnosis system:'), nl,
    write('Possible solutions:'), nl,
    forall(solution(X), (write('  - '), write(X), nl)),
    halt.
