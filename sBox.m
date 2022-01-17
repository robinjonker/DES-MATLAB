function Rs = sBox(Rx)
    %% S-BOX SUBSTITUTION TABLES
    S1 = [14 4 13 1 2 15 11 8 3 10 6 12 5 9 0 7
        0 15 7 4 14 2 13 1 10 6 12 11 9 5 3 8
        4 1 14 8 13 6 2 11 15 12 9 7 3 10 5 0
        15 12 8 2 4 9 1 7 5 11 3 14 10 0 6 13];
    S2 = [15 1 8 14 6 11 3 4 9 7 2 13 12 0 5 10
        3 13 4 7 15 2 8 14 12 0 1 10 6 9 11 5
        0 14 7 11 10 4 13 1 5 8 12 6 9 3 2 15
        13 8 10 1 3 15 4 2 11 6 7 12 0 5 14 9];
    S3 = [10 0 9 14 6 3 15 5 1 13 12 7 11 4 2 8
        13 7 0 9 3 4 6 10 2 8 5 14 12 11 15 1
        13 6 4 9 8 15 3 0 11 1 2 12 5 10 14 7
        1 10 13 0 6 9 8 7 4 15 14 3 11 5 2 12];
    S4 = [7 13 14 3 0 6 9 10 1 2 8 5 11 12 4 15
        13 8 11 5 6 15 0 3 4 7 2 12 1 10 14 9
        10 6 9 0 12 11 7 13 15 1 3 14 5 2 8 4
        3 15 0 6 10 1 13 8 9 4 5 11 12 7 2 14];
    S5 = [2 12 4 1 7 10 11 6 8 5 3 15 13 0 14 9
        14 11 2 12 4 7 13 1 5 0 15 10 3 9 8 6
        4 2 1 11 10 13 7 8 15 9 12 5 6 3 0 14
        11 8 12 7 1 14 2 13 6 15 0 9 10 4 5 3];
    S6 = [12 1 10 15 9 2 6 8 0 13 3 4 14 7 5 11
        10 15 4 2 7 12 9 5 6 1 13 14 0 11 3 8
        9 14 15 5 2 8 12 3 7 0 4 10 1 13 11 6
        4 3 2 12 9 5 15 10 11 14 1 7 6 0 8 13];
    S7 = [4 11 2 14 5 0 8 13 3 12 9 7 5 10 6 1
        13 0 11 7 4 9 1 10 14 3 5 12 2 15 8 6
        1 4 11 13 12 3 7 14 10 15 6 8 0 5 9 2
        6 11 13 8 1 4 10 7 9 5 0 15 14 2 3 12];
    S8 = [13 2 8 4 6 15 11 1 10 9 3 14 5 0 12 7
        1 15 13 8 10 3 7 4 12 5 6 11 0 14 9 2
        7 11 4 1 9 12 14 2 0 6 10 13 15 3 5 8
        2 1 14 7 4 10 8 13 15 12 9 0 3 5 6 11];
    %% S1 - 6 BIT TO 4 BIT CONVERSION
    s1 = Rx(1:6);
    s1row = binaryVectorToDecimal(s1([1,6])); %% the first and last bit selects the row
    s1col = binaryVectorToDecimal(s1(2:5)); %% the middle 4 bits selects the column
    s1 = decimalToBinaryVector(S1(s1row+1,s1col+1),4); %% adjust row and col value by adding +1 to it as row/col begins at 1 and not 0, select value from S-box and then convert back to binary form of 4-bit size
    %% S2 - 6 BIT TO 4 BIT CONVERSION
    s2 = Rx(7:12);
    s2row = binaryVectorToDecimal(s2([1,6]));
    s2col = binaryVectorToDecimal(s2(2:5));
    s2 = decimalToBinaryVector(S2(s2row+1,s2col+1),4);
    %% S3 - 6 BIT TO 4 BIT CONVERSION
    s3 = Rx(13:18);
    s3row = binaryVectorToDecimal(s3([1,6]));
    s3col = binaryVectorToDecimal(s3(2:5));
    s3 = decimalToBinaryVector(S3(s3row+1,s3col+1),4);
    %% S4 - 6 BIT TO 4 BIT CONVERSION
    s4 = Rx(19:24);
    s4row = binaryVectorToDecimal(s4([1,6]));
    s4col = binaryVectorToDecimal(s4(2:5));
    s4 = decimalToBinaryVector(S4(s4row+1,s4col+1),4);
    %% S5 - 6 BIT TO 4 BIT CONVERSION
    s5 = Rx(25:30);
    s5row = binaryVectorToDecimal(s5([1,6]));
    s5col = binaryVectorToDecimal(s5(2:5));
    s5 = decimalToBinaryVector(S5(s5row+1,s5col+1),4);
    %% S6 - 6 BIT TO 4 BIT CONVERSION
    s6 = Rx(31:36);
    s6row = binaryVectorToDecimal(s6([1,6]));
    s6col = binaryVectorToDecimal(s6(2:5));
    s6 = decimalToBinaryVector(S6(s6row+1,s6col+1),4);
    %% S7 - 6 BIT TO 4 BIT CONVERSION
    s7 = Rx(37:42);
    s7row = binaryVectorToDecimal(s7([1,6]));
    s7col = binaryVectorToDecimal(s7(2:5));
    s7 = decimalToBinaryVector(S7(s7row+1,s7col+1),4);
    %% S8 - 6 BIT TO 4 BIT CONVERSION
    s8 = Rx(43:48);
    s8row = binaryVectorToDecimal(s8([1,6]));
    s8col = binaryVectorToDecimal(s8(2:5));
    s8 = decimalToBinaryVector(S8(s8row+1,s8col+1),4); %%ideally should have created another function to reduce repetitive code but did not want excessive amount of functions
    
    Rs = [s1,s2,s3,s4,s5,s6,s7,s8] ; %%joining the 8 4-bit values together to 32-bit

end