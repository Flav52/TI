function marque= getMarqueAdap(I,tailleMarque,fq)

%comme on travail avec blockproc il nous faut un moyen de partager la
%marque déjà recupéré entre chaque, les pointeurs n'existent pas en matlab donc on doit
%passer puor une variable global 
global marquee;
marquee = '0';
global ordre;
%pour les mêmes raison on utilise un persistent pour partager l'index
clear getMarqueBlocAdap;

%init matrice quantification
Q = quantification(8,fq);
Q = ones(8,8);
%init focntion DCT pour blockproc
fDct =@(block_struct) double(dct2(block_struct.data));
%init focntion Quantification pour blockproc
fQuantification=@(block_struct) double(round(block_struct.data./Q));
%init fonction getMarqueBloc qui va pour chaque bloc récupérer la marque  
fMarque= @(block_struct) getMarqueBlocAdap(block_struct,tailleMarque);

%début traitement JPEG/JSTEG decrypte
%passage au domaine fréquenciel J-> DCT
matriceDCT=blockproc(I,[8 8],fDct);
%quantification P= matrice DCT quantifié pour tt l'image
P=blockproc(matriceDCT,[8 8],fQuantification);
%on applique la fonction fMarque qui va appliquer la fonction getMarqueBloc
%sur tt les blocs de 8/8 et récupéré la marque
blockproc(P,[8 8],fMarque);

%on revoie la marque récupérée
marque=marquee;
%disp(marque);

