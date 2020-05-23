function res= jstegAdaptatif(essai,message,Q)
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
            if(coef~=0)
                negatif = coef/(res(i,j));
            else
                negatif=1;
            end
            if((coef/Q(i,j))>1 && index<=tailleMes(2))
                d=0;
                while true
                    d=d+1;
                    quantifSup= (round((coef+d))/Q(i,j))
                    quantifInf=(round((coef-d))/Q(i,j))
                    
                    if((quantifSup-floor(quantifSup))==0 && int2str(mod(quantifSup,2))==message(index))
                            coef=coef+d;
                            break; 
                    elseif((quantifInf-floor(quantifInf))==0 && int2str(mod(quantifInf,2))==message(index) && quantifInf>1)
                            coef=coef-d;
                            break;    
                    end
                end
                index =index+1
            end 
            mes=message(index-1);
            res(i,j) = round(coef/Q(i,j))*negatif;
            disp(res(i,j))
        end
    end
return;