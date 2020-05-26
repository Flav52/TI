function itatou = tatouLsbRvb(I,message)
index=1;
itatou = I;
tailleMess = size(message);
[m,n]  = size(itatou);
for i = 1:m
    for j = 1:n
        if(index<=tailleMess(2))
            
            if(mod(i,2)==0 && mod(j,2)==0)
                bin= dec2bin(I(i,j));
                bin(1,length(bin))=message(index);
                itatou(i,j) = bin2dec(bin);
                index = index +1 
            end
            
        end
    end
end

end 