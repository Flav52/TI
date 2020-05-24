i = imread('NG/lena256.png');
I = miseEnFormeImage(i,8);
fq=1;
mess = genMess(5000);
tailleMarque = size(mess);

itatouadapt = uint8(tatouageJstegAdaptatif(mess,I,fq));
itatounrml = uint8(tatouageJsteg(mess,I,fq));



PSNRnmrl = PSNR(I,itatounrml);
PSNRadap = PSNR(I,itatouadapt);

imshow(I);
figure;
imshow(itatounrml);
figure;
imshow(itatouadapt);

marquenmrl = getMarque(itatounrml,tailleMarque,fq);
marqueadapt = getMarque(itatouadapt,tailleMarque,fq);