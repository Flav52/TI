function [PSNR] = PSNR(ImageDeBase,ImageTatou)
[m,n,~] = size(ImageDeBase);
varTemp=0,0;
EQM=0,0;
for i = 1 : m
    for j = 1 : n
       varTemp = double ( power( double(ImageDeBase(i,j) - ImageTatou(i,j)) ,2) ) ;
       EQM = EQM + varTemp;
    end
end
EQM = EQM / double ( m * n );
PSNR = 10 * log10( power(255,2) / EQM); 
end

