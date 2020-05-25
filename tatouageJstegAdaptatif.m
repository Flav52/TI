function imageTatoue = tatouageJstegAdaptatif(mess,I,fq)

marquead= '0';
%mise en forme de l'image 
I = double(miseEnFormeImage(I,8));
%init variable de base
%on fait un clear pour "vider" l'index en persistance dans la fonction
clear jstegAdaptatif;
%init matrice quantification
Q = quantification(8,fq);
Q= ones(8,8);
%init focntion DCT pour blockproc
fDct =@(block_struct) double(dct2(block_struct.data));
%init fonction tatouage
fTatou= @(block_struct) double(jstegAdaptatif(block_struct.data,mess,Q));
%permet de parcourir les blocs en zigzag avant la dernière étape de la compression
fZigzag = @(block_struct) zigzag(block_struct.data);
fRle = @(block_struct) zigzag(block_struct.data);

fdeQuant = @(block_struct) double(block_struct.data.*Q);
fDDct =@(block_struct) double(idct2(block_struct.data));

%début traitement JPEG/JSTEG encrypte
%passage au domaine fréquenciel J-> DCT
matriceDCT=blockproc(I,[8 8],fDct);
%quantification paq= matrice DCT quantifié et tatoué pour tt l'image 
paq=blockproc(matriceDCT,[8 8],fTatou);
%appel du zigzag
%zig=blockproc(paq,[8 8],fZigzag);
%rle=blockproc(zig,[8 8],fRle);

%retour au rvb

jDct = blockproc(paq,[8 8],fdeQuant);
imageTatoue =  blockproc(jDct,[8 8],fDDct);
disp("dd");

