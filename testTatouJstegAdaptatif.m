global marquead;
marquead = '0';

clear tatouageJsteg;
i = imread('coul/abricot.jpg');
mess = genMess(2000);
tailleMarque = size(mess);
fq=5;
itatou = tatouageJstegAdaptatif(mess,i,fq);

marque = getMarqueAdap(itatou,tailleMarque,fq);
valideAdapt = testMarqueValide(mess,marque);
disp("j'ai fini tu peux venir m'essuyer maman")