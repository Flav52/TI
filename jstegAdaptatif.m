function res= jstegAdaptatif(essai,message,Q)
%c'est lindex de la lettre à coder dans le message on utilise persistent
%pour le partager entre les différent blocs
persistent index
global marquead;
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
            coef = abs(res(i,j));
            coefnnQuant = coef;
            
            %la variable négatif nous permet de savoir si le coef était
            %négatif
            if(coef~=0)
                negatif = coef/(res(i,j));
            else
                negatif=1;
            end
            coefQuantnm = coef/Q(i,j);
            %si coef quantifé est suppérieur à 1 et que l'on a pas encore
            %récupérer tt le message alors on va tatouer ici 
            if(floor(coef/Q(i,j))>1 && index<=tailleMes(2))
                quantifInf= floor(coef/Q(i,j));
                quantifSup= ceil(coef/Q(i,j));
                LSBQuantifInf= mod(quantifInf,2);
                if(int2str(LSBQuantifInf) == message(index))
                    coef= quantifInf*Q(i,j);
                else
                    coef= quantifSup*Q(i,j);
                end
                marquead(index)= int2str(mod(floor(coef/Q(i,j)),2));    
                index =index+1;
            end
            
            
            %on place le coef tatoué ou non dans la matrice
                %on utilise *negatif pour que le coef conserve son signe
                %initial
            res(i,j) = floor(coef/Q(i,j))*negatif;
            couille = res(i,j);
            
            disp("couille");

        end
            if (abs(couille)>1 && int2str(mod(couille,2))~=message(index-1) && index<=tailleMes(2))
                disp('couille')
            end
    end
return;