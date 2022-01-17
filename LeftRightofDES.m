function [left,right] = LeftRightofDES(input,index,k0)
    %% INITIALIZATION AND CONVERTING INPUT TEXT INTO BINARY FORM
    input = hexToBinaryVector(input,64);
    k0 = hexToBinaryVector(k0,48);
    %% SPLIT 64-BIT INTO TWO HALVES OF 32-BIT
    for i=1:32
        left(1,i) = input(i);
        right(1,i) = input(32+i);
    end
    %% DES ROUND
        f= feistel(right,k0); %%calling feistel function (E-box,S-box and P-box) with specific rounds' key
        right(2,:)=xor(left,f);%% e.g. theory: R1 = XOR of L0 with feistel of R0 and L1 = R0
        left(2,:)=right(1,:) ; 
        left = left (2,:);
        right = right (2,:);
end