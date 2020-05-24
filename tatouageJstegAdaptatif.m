function imageTatoue = tatouageJstegAdaptatif(mess,I,fq)
%mise en forme de l'image 
I = double(miseEnFormeImage(I,8));
%init variable de base
%on fait un clear pour "vider" l'index en persistance dans la fonction
clear jstegAdaptatif;
%init matrice quantification
Q = quantification(8,fq);
%init focntion DCT pour blockproc
fDct =@(block_struct) dct2(block_struct.data);
%init fonction tatouage
fTatou= @(block_struct) jstegAdaptatif(block_struct.data,mess,Q);

fdeQuant = @(block_struct) block_struct.data.*Q;
fDDct =@(block_struct) round(idct2(block_struct.data));

%début traitement JPEG/JSTEG encrypte
%passage au domaine fréquenciel J-> DCT
matriceDCT=blockproc(I,[8 8],fDct);
%quantification paq= matrice DCT quantifié et tatoué pour tt l'image 
paq=blockproc(matriceDCT,[8 8],fTatou);


%retour au rvb

jDct = blockproc(paq,[8 8],fdeQuant);
imageTatoue =  blockproc(jDct,[8 8],fDDct);