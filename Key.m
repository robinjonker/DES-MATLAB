function key = Key(k0)
    %% INITIALIZATION AND CONVERTING KEY TO BINARY FORM
    k0 = hexToBinaryVector(k0,64);
    key = zeros(16,48);
    %% KEY PERMUTATION TABLE
    kp = [57 49 41 33 25 17 9 1 58 50 42 34 26 18 10 2 59 51 43 35 27 19 11 3 60 52 44 36 63 55 47 39 31 23 15 7 62 54 46 38 30 22 14 6 61 53 45 37 29 21 13 5 28 20 12 4];
    %% COMPRESSION PERMUTATION TABLE
    kc = [14 17 11 24 1 5 3 28 15 6 21 10 23 19 12 4 26 8 16 7 27 20 13 2 41 52 31 37 47 55 30 40 51 45 33 48 44 49 39 56 34 53 46 42 50 36 29 32];
    %% REMOVE PARITY BITS
        for i=1:56
           k1(i) = k0(kp(i)); %e.g. when i=1: kp(1)=57, therefore k0(57): postion 57 of original key gets assigned to k1(1) {swap complete}
        end
    %% SPLIT 56-BIT KEY INTO TWO HALVES
    for i=1:28
        kL(i) = k1(i);
        kR(i) = k1(28+i);
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
            key(r,i)=k3(i);
        end       
    end  
end