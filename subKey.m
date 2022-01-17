function key = subKey(k0,index)
    %% INITIALIZATION AND CONVERTING KEY TO BINARY FORM
    k0 = hexToBinaryVector(k0,56);
    keyset = zeros(16,48);
    %% COMPRESSION PERMUTATION TABLE
    kc = [14 17 11 24 1 5 3 28 15 6 21 10 23 19 12 4 26 8 16 7 27 20 13 2 41 52 31 37 47 55 30 40 51 45 33 48 44 49 39 56 34 53 46 42 50 36 29 32];
    %% SPLIT 56-BIT KEY INTO TWO HALVES
    for i=1:28
        kL(i) = k0(i);
        kR(i) = k0(28+i);
    end
    %% FOR EACH ROUND
    for r=1:16
        %% NUM KEY BITS SHIFTS PER ROUND
        if (r==1 || r==2 || r==9 || r==16)
            kL=circshift(kL,-1);
            kR=circshift(kR,-1);
            
        else
            kL=circshift(kL,-2);
            kR=circshift(kR,-2);
        end
        %% TWO HALVES JOINED BACK TOGETHER
        k2=kL;
        for i=1:28
           k2(28+i)=kR(i); 
        end
        %% COMPRESSION PERMUTATION
        for i=1:48
            k3(i) = k2(kc(i));
        end
        %% STORING EACH ROUNDS' KEY (INPUT TO FEISTEL FUNCTION)
        for i=1:48
            keyset(r,i)=k3(i);
        end       
    end
    key= keyset(index,:);
end