function res= jsteg(essai,message)
%c'est lindex de la lettre à coder dans le message on utilise persistent
%pour le partager entre les différent blocs
persistent index
%on init le resultat avec les valeurs avant traitement
res=essai;

[m,n] = size(res);
tailleMes = size(message);

%si on appel la fonction pour la permière fois il est vide on l'initialise
%donc à 1
if(isempty(index))
        index = 1 ;
end
%on parcours le bloc
    for i = 1:m
        for j = 1:n
            %coef est la valeur absolu du coef présent dans la matrice
            coef = abs(essai(i,j));
            %la variable négatif nous permet de savoir si le coef était
            %négatif
            if(coef~=0)
                negatif = coef/(res(i,j));
            else
                negatif=1;
            end
            %si coef est suppérieur à 1 et que l'on a pas encore
            %réupérer tt le message alors on va tatouer ic
            if(round(coef)>1 && index<=tailleMes(2))
                %on passge le lsb à la valeur du bit secret 
                bin= dec2bin(round(coef));
                bin(1,length(bin))=message(index);
                %on place le coef tatoué dans la matrice
                %on utilise *negatif pour que le coef conserve son signe
                %initial
                res(i,j)=bin2dec(bin)*negatif;
                %on avance l'index de 1e pour coder le bit secret suivant 
                index =index+1;
            end 
        end
    end
return;