%% QUESTION 1
    %Implement a function that will generate the specific subkey Ki when the following parameters
    %are passed as inputs to the function: a 56 bit key and the index i.
    % FUNCTION CREATED IS CALLED subKey
    k0 = "F0CCAAF556678F";
    index = 1;
    key = subKey(k0,index)
%% QUESTION 2
    %Calculate the number of unique subkeys for the following 64-bit keys (ignore the parity bits
    %in your calculations) and classify the keys:
    % FUNCTION CREATED IS CALLED uniqueKey
    k1="1F1F1F1F0E0E0E0E"
    [uniqueSubKeys,classifyKey] = uniqueKey(k1)
    k2="1FFE1FFE0EFE0EFE"
    [uniqueSubKeys,classifyKey] = uniqueKey(k2)
    k3="1FFEFE1F0EFEFE0E"    
    [uniqueSubKeys,classifyKey] = uniqueKey(k3)
%% QUESTION 3
    %Implement a function that will produce two 32-bit output blocks, given a 64-bit input block,
    %the index of the round (i ∈ {1, 2, ..., 16}) and the 48-bit subkey Ki.(The whole round must be implemented.)
    % FUNCTION CREATED IS CALLED LeftRightofDES
    input = "CC00CCFFF0AAF0AA"; %input into feistel 1
    index = 1;
    k0 = "1B02EFFC7072"; %subkey 1 
    [left,right] = LeftRightofDES(input,index,k0)
%% QUESTION 4
    %Using the functions of 1 and 3, implement the Data Encryption Algorithm (DEA).
    % FUNCTION CREATED IS CALLED DES, Key, feistel, sBox
    % As it is encryption: mode = 'encrypt'
    input = "8787878787878787";
    k0 = "0E329232EA6D0D73";
    mode = "encrypt";
    output = DES(input,k0,mode)
%% QUESTION 5
    %Implement the decryption algorithm as well.
    % As it is encryption: mode = 'decrypt'
    input = "0000000000000000";
    k0 = "0E329232EA6D0D73";
    mode = "decrypt";
    output = DES(input,k0,mode)
