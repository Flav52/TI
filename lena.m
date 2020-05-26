i = imread('NG/lena256.png');
I = miseEnFormeImage(i,8);
fq=1;
mess = genMess(2000);
tailleMarque = size(mess);

itatouadapt = tatouageJstegAdaptatif(mess,I,fq);
imwrite(uint8(itatouadapt),'image.bmp')