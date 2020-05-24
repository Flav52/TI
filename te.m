I = imread('coul\abricot.jpg');
ImageSize = 8*prod(size(I));
Y_d = rgb2ycbcr( I );
% Downsample:
Y_d(:,:,2) = 2*round(Y_d(:,:,2)/2);
Y_d(:,:,3) = 2*round(Y_d(:,:,3)/2);
% DCT compress:
A = zeros(size(Y_d));
B = A;
for channel = 1:3
    for j = 1:8:size(Y_d,1)-7
        for k = 1:8:size(Y_d,2)-7
            II = Y_d(j:j+7,k:k+7,channel);
            freq = chebfun.dct(chebfun.dct(II).').';
            freq = Q.*round(freq./Q);
            A(j:j+7,k:k+7,channel) = freq;
            % do the inverse at the same time:
            B(j:j+7,k:k+7,channel) = chebfun.idct(chebfun.idct(freq).').';
        end
    end
end
b = A(:);
b = b(:);
b(b==0)=[];  %remove zeros.
b = floor(255*(b-min(b))/(max(b)-min(b)));
symbols = unique(b);
prob = histcounts(b,length(symbols))/length(b);
dict = huffmandict(symbols, prob);
enco = huffmanenco(b, dict);
FinalCompressedImage = length(enco);

FinalCompressedImage/ImageSize