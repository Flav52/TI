I=imread('NG/cameraman.jpg');
trans=@(block_struct) dct2(block_struct.data);
transi=@(block_struct) idct2(block_struct.data);
Q=quantification(8,5);
quantif=@(block_struct) round(block_struct.data./Q);
dequantif=@(block_struct) block_struct.data.*Q;
insertdata=@insertBit;
J=blockproc(I,[8 8],trans);
Ji=blockproc(J,[8 8],insertdata);
Ir=blockproc(Ji,[8 8],transi);
colormap(gray(256))
image(I)
figure
colormap(gray(256))
image(Ir)