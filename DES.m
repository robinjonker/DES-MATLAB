function output = DES(input,k0,mode)
    %% INITIALIZATION AND CONVERTING INPUT TEXT INTO BINARY FORM
    input = hexToBinaryVector(input,64);
    key = Key(k0); %%calling key function to generate Ki (i = 1 to 16)
    left = zeros(17,32);
    right = zeros(17,32);
    output = zeros(1,64);
    %% INITIAL PERMUTATION TABLE
    P = [58 50 42 34 26 18 10 2 60 52 44 36 28 20 12 4 62 54 46 38 30 22 14 6 64 56 48 40 32 24 16 8 57 49 41 33 25 17 9 1 59 51 43 35 27 19 11 3 61 53 45 37 29 21 13 5 63 55 47 39 31 23 15 7];
    %% FINAL PERMUTATION TABLE
    F = [40 8 48 16 56 24 64 32 39 7 47 15 55 23 63 31 38 6 46 14 54 22 62 30 37 5 45 13 53 21 61 29 36 4 44 12 52 20 60 28 35 3 43 11 51 19 59 27 34 2 42 10 50 18 58 26 33 1 41 9 49 17 57 25];
    %% INITIAL PERMUTATION
    for i=1:64
        I(i) = input(P(i)); 
    end
    %% SPLIT 64-BIT INTO TWO HALVES OF 32-BIT
    for i=1:32
        left(1,i) = I(i);
        right(1,i) = I(32+i);
    end
    %% DES ROUNDS WITH VARIATION FOR DECRYPT OR ENCRYPT
    if mode=="decrypt" %% if decryption, the key must start at 16 instead of 1 (which is for encryption)
        a=16;
    end
    for r=1:16
        if mode=="encrypt"
            a=r;
        end
        f= feistel(right(r,:),key(a,:)); %%calling feistel function (E-box,S-box and P-box) with specific rounds' key
        right(r+1,:)=xor(left(r,:),f); %% e.g. theory: R1 = XOR of L0 with feistel of R0 and L1 = R0
        left(r+1,:)=right(r,:);        
        if mode=="decrypt"
            a=a-1; %% counting down from 16 to 1
        end
    end
    %% LEFT AND RIGHT HALVE SWAPS AT FINAL ROUND
    temp=right(17,:);
    right(17,:)=left(17,:);
    left(17,:)=temp;
    %% JOINING TWO HALVES TOGETHER AGAIN TO 64-BIT 
    J=left(17,:);
    for i=1:32
        J(32+i)=right(17,i); 
    end
    %% FINAL PERMUTATION AT END OF DES
    for i=1:64
        output(i) = J(F(i)); 
    end
    %% CONVERT CIPHER TEXT INTO HEX FORM
    output = binaryVectorToHex(output);
end