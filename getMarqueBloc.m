function getMarqueBloc(tatou,tailleMarque)
global marquee;
[m,n] = size(tatou);
persistent index;

if(isempty(index))
        index = 1 ;
end
for i = 1:m
        for j = 1:n
            coef = abs(tatou(i,j));
            if(coef>1 && index<=tailleMarque(2))
                bin= dec2bin(coef,8);
                lsb = bin(1,8)
                marquee(1,index)=lsb;
                index =index+1;
            end
        end
end
