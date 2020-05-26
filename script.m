global marquead;
marquead = '0';
i = imread('NG/lena256.png');
I = miseEnFormeImage(i,8);
fq=1;
mess = genMess(6.5536e+03);
tailleMarque = size(mess);

itatouadapt = tatouageJstegAdaptatif(mess,I,fq);
itatounrml = tatouageJsteg(mess,I,fq);

marquenmrl = getMarque(itatounrml,tailleMarque,fq);
marqueadapt = getMarqueAdap(itatouadapt,tailleMarque,fq);

valideAdapt = testMarqueValide(mess,marqueadapt);
validemarquenmrl = testMarqueValide(mess,marquenmrl);

PSNRnrml = psnr(uint8(itatounrml),uint8(I));
PSNRadap = psnr(uint8(itatouadapt),uint8(I));
Gain=((PSNRadap/PSNRnrml)-1)*100;
disp('PSNR Jpeg/Jsteg classique'); disp(PSNRnrml);
disp('PSNR Jpeg/Jsteg adaptatif'); disp(PSNRadap);
disp('Gain'); disp(Gain);

strPSNRnrml = strcat('PSNR classique :  ',num2str(PSNRnrml), ' dB')
strPSNRadap = strcat('PSNR adaptatif :  ',num2str(PSNRadap), ' dB')
strGain = strcat('Gain :  ',num2str(Gain), ' %')
subplot(1,3,1); imshow(I); title('Image de base');
subplot(1,3,2); imshow(itatounrml); title('Image Jpeg/Jsteg classique');
text(0,300,strPSNRnrml); axis off
text(0,350,strPSNRadap); axis off
text(0,400,strGain); axis off
subplot(1,3,3); imshow(itatouadapt); title('Image Jpeg/Jsteg adaptatif');

