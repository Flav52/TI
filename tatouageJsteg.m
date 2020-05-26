function imageTatoue = tatouageJsteg(mess,I,fq)
%mise en forme de l'image 
I = double(miseEnFormeImage(I,8));
%init variable de base
%on fait un clear pour "vider" l'index en persistance dans la fonction
clear jsteg;
%init matrice quantification
Q = quantification(8,fq);
Q = ones(8,8);
%init focntion DCT pour blockproc
fDct =@(block_struct) double(dct2(block_struct.data));
%init focntion Quantification pour blockproc
fQuantification=@(block_struct) double(round(block_struct.data./Q));
%init fonction tatouage
fTatou= @(block_struct) double(jsteg(block_struct.data,mess));
%init fonctiono zigzag qui parcours les blocs en zigzag


fdeQuant = @(block_struct) double(round(block_struct.data.*Q));
fDDct =@(block_struct) double(idct2(block_struct.data));

%début traitement JPEG/JSTEG encrypte
%passage au domaine fréquenciel J-> DCT
matriceDCT=blockproc(I,[8 8],fDct);
%quantification P= matrice DCT quantifié pour tt l'image
P=blockproc(matriceDCT,[8 8],fQuantification);
%tatouage Jsteg
paq=blockproc(P,[8 8],fTatou);

%retour au rvb

jDct = blockproc(paq,[8 8],fdeQuant);
imageTatoue =  blockproc(jDct,[8 8],fDDct);