clear tatouageJsteg;
i = double(imread('NG/cameraman.jpg'));
mess = '100011111111111011111111111111101111111111111101111111111111110000000011111111111111111000001010000000010111011010101';
tailleMarque = size(mess);
itatou = tatouageJstegAdaptatif(mess,i);

marque = getMarque(itatou,tailleMarque);
