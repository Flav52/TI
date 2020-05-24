i = imread('NG/lena256.png');
I = miseEnFormeImage(i,8);
fq=5;
mess = genMess(5000);
tailleMarque = size(mess);

itatouadapt = uint8(tatouageJstegAdaptatif(mess,I,fq));
itatounrml = uint8(tatouageJsteg(mess,I,fq));

PSNRnrml = PSNR(I,itatounrml);
PSNRadap = PSNR(I,itatouadapt);
Gain=((PSNRadap/PSNRnrml)-1)*100;
disp('PSNR Jpeg/Jsteg classique'); disp(PSNRnrml);
disp('PSNR Jpeg/Jsteg adaptatif'); disp(PSNRadap);
disp('Gain'); disp(Gain);

subplot(1,3,1); imshow(I); title('Image de base');

strPSNRnrml = strcat('PSVR classique :  ',int2str(PSNRnrml), ' dB')
strPSNRadap = strcat('PSVR adaptatif :  ',int2str(PSNRadap), ' dB')
strGain = strcat('Gain :  ',int2str(Gain), ' %')
subplot(1,3,1); imshow(I); title('Image de base');
subplot(1,3,2); imshow(itatounrml); title('Image Jpeg/Jsteg classique');
text(0,300,strPSNRnrml); axis off
text(0,350,strPSNRadap); axis off
text(0,400,strGain); axis off
subplot(1,3,3); imshow(itatouadapt); title('Image Jpeg/Jsteg adaptatif');



marquenmrl = getMarque(itatounrml,tailleMarque,fq);
marqueadapt = getMarque(itatouadapt,tailleMarque,fq);