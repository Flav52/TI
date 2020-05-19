function res= insertBit(blockStruct)
res=blockStruct.data; % la matrice 8x8 de données
t=blockStruct.location; %t contient la position du premier pixel du bloc
res(1,1)=bitset(floor(res(1,1)),1, 1);
%res(1,1) le premier pixel , bitset(A,1,1) => je met le premier bit a 1
%la fonction va mettre un 1 sur tout  tout les premier pixel de chaque 8x8
return;