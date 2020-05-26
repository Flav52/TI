clear getMarqueLsb
clear tatouLsbRvb

i = imread('NG/lena256.png');
mess = genMess(1000);
tailleMess = size(mess);

itatou = tatouLsbRvb(i,mess);
marque = getMarqueLsb(itatou,tailleMess);

valide = testMarqueValide(mess,marque);