function f = feistel(right,key)
    %% INITIALIZATION
    Re = zeros(1,48);
    f = zeros(1,32);
    %% E-BOX EXPANSION TABLE 
    E = [32 1 2 3 4 5 4 5 6 7 8 9 8 9 10 11 12 13 12 13 14 15 16 17 16 17 18 19 20 21 20 21 22 23 24 25 24 25 26 27 28 29 28 29 30 31 32 1];
    %% P-BOX PERMUTATION TABLE
    P = [16 7 20 21 29 12 28 17 1 15 23 26 5 18 31 10 2 8 24 14 32 27 3 9 19 13 30 6 22 11 4 25];
    %% E-BOX EXPANSION
    for i=1:48
        Re(i) = right(E(i)); 
    end
    %% XOR CURRENT ROUNDS' KEY AND E-BOX RESULT
    Rx = xor(Re,key);
    %% S-BOX SUBSTITUTION (calling sBox function)
    Rs = sBox(Rx);
    %% P-BOX PERMUTATION
    for i=1:32
        f(i) = Rs(P(i)); 
    end
end