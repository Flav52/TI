function marque= getMarque(I,tailleMarque)
global marquee;
marquee = '0';
clear getMarqueBloc;
fq= 5;
%init matrice quantification
Q = quantification(8,fq);
%init focntion DCT pour blockproc
fDct =@(block_struct) dct2(block_struct.data);
%init focntion Quantification pour blockproc
fQuantification=@(block_struct) round(block_struct.data./Q);
%init fonction getMarqueBloc qui va pour chaque bloc récupérer la marque  
fMarque= @(block_struct) getMarqueBloc(block_struct.data,tailleMarque);

%début traitement JPEG/JSTEG decrypte
%passage au domaine fréquenciel J-> DCT
matriceDCT=blockproc(I,[8 8],fDct);
%quantification P= matrice DCT quantifié pour tt l'image
P=blockproc(matriceDCT,[8 8],fQuantification);
blockproc(P,[8 8],fMarque);

marque=marquee;
%disp(marque);

