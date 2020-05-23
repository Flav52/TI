function res = miseEnFormeImage(I,sizeBloc)
res = I;
%on r�cup�re sa taille et son nombre de canal
[m,n,can] = size(I);

%avec ces m�thodes on tatoue des images en NG donc il faut que l'image soit
%en NG
if(can>1)
    res=rgb2gray(I);
end 

%on proc�de aux tatouage et � la compression via des blocs carr�s il faut
%donc que les cot�s de l'image soient des multiples des cot�s du bloc

%si ce n'est pas le cas
if(mod(m,sizeBloc)~=0)
    ecart = 1;
    while(mod(m+ecart-1,sizeBloc)~=0)
            res(m+ecart,:)=res(m,:);
        ecart=ecart+1;
    end

end

if(mod(n,sizeBloc)~=0)
    ecart =1;
    while(mod(n+ecart-1,sizeBloc)~=0)
            res(:,n+ecart)=res(:,n);
        ecart=ecart+1;
    end
end

res
