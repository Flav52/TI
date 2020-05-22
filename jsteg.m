function res= jsteg(essai,message)
%c'est lindex de la lettre à coder dans le message
persistent index
res=essai;
[m,n] = size(res);

tailleMes = size(message);

if(isempty(index))
        index = 1 ;
end
%disp(index)
%on parcours le bloc
    for i = 1:m
        for j = 1:n
            coef = abs(res(i,j));
            negatif = coef/res(i,j);
            if(coef>1 && index<=tailleMes(2))
                bin= dec2bin(coef,8);
                bin(1,8)=message(index);
                res(i,j)=bin2dec(bin)*negatif;
                index =index+1;
            end 
        end
    end
return;