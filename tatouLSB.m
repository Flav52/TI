%tatouage niveau de gris 
% ici on va montrer a quel point le tatouage sur l'intensité des niveau de
% gris est faible

I=imread('NG/cameraman.jpg');
Z=I;
tatouageSimple = [1 0 0 0 1 ; 1 1 0 1 1 ; 1 0 1 0 1 ; 1 0 0 0 1 ]
[m,n]=size(I);
[j,k]=size(tatouageSimple);
for x = 1:j
    for y = 1:k
        Z(x,y)=bitset(Z(x,y),1,tatouageSimple(x,y));
    end
end
% colormap(gray(256));
% image(I);
% figure
% colormap(gray(256));
% image(Z);

% Recuperation du tatouage a partir de Z
%
recup=zeros(j,k);
for x = 1:j
    for y = 1:k
        recup(x,y)=bitand(Z(x,y),1);
    end
end
recup
% Attaque sur l'image simple 
%Quantification (TD)on passe de NG 256 a NG 127
M=floor(Z/2);
% colormap(gray(127));
% image(M);
recup2=zeros(j,k);
for x = 1:j
    for y = 1:k
        recup2(x,y)=bitand(M(x,y),1);
    end
end
recup2
% On a perdu le tatouage

% Quantification sur toute l'image via bloc 8x8 // Compression JPEG TP5

trans=@(block_struct) dct2(block_struct.data); % transfo cosinus
transi=@(block_struct) idct2(block_struct.data); % transfo cosinus inverse
Q=quantification(8,5); % quantification 8x8 avec Fq=5
quantif=@(block_struct) round(block_struct.data./Q); % quantification
dequantif=@(block_struct) block_struct.data.*Q; % dequantification

J=blockproc(Z,[8 8],trans); %on applique la transformée cosinus
Jq=blockproc(J,[8 8],quantif); % on quantifie avec fq =5

Jr=blockproc(Jq,[8 8],dequantif);% on dequantif
Ir=blockproc(Jr,[8 8],transi);%on applique la transfo inverse
Ir=floor(Ir);
recup3=zeros(j,k);
for x = 1:j
    for y = 1:k
        recup3(x,y)=bitand(Ir(x,y),1);
    end
end
recup3
% Perte du tatouage

% Ajout de bruit sur l'image (TP3)
%bruit gaussien très léger 
P=imnoise(Z,'gaussian',0,0.0001);
recup4=zeros(j,k);
colormap(gray(256));
image(P);
recup4=zeros(j,k);
for x = 1:j
    for y = 1:k
        recup4(x,y)=bitand(P(x,y),1);
    end
end
recup4
% perte du tatouage


