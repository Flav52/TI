function res= jstegAdaptatif(essai,message,Q)
%c'est lindex de la lettre � coder dans le message on utilise persistent
%pour le partager entre les diff�rent blocs
persistent index
global marquead;
%on init le resultat avec les valeurs avant traitement
ordre = essai.location;
res=essai.data;

[m,n] = size(res);
tailleMes = size(message);

%si on appel la fonction pour la permi�re fois il est vide on l'initialise
%donc � 1
if(isempty(index))
        index = 1 ;
end
%on parcours le bloc
    for i = 1:m
        for j = 1:n
            %coef est la valeur absolu du coef pr�sent dans la matrice
            coef = abs(res(i,j));
            coefnnQuant = coef;
            
            %la variable n�gatif nous permet de savoir si le coef �tait
            %n�gatif
            if(coef~=0)
                negatif = coef/(res(i,j));
            else
                negatif=1;
            end
            if(index<=tailleMes(2))
            coefQuantnm = coef/Q(i,j);
            %si coef quantif� est supp�rieur � 1 et que l'on a pas encore
            %r�cup�rer tt le message alors on va tatouer ici 
            if(coef/Q(i,j)>=2)
                if(coef/Q(i,j)-floor(coef/Q(i,j))~=0)
                    quantifInf= floor(coef/Q(i,j));
                    quantifSup= ceil(coef/Q(i,j));
                else
                    quantifInf= coef/Q(i,j);
                    quantifSup= coef/Q(i,j)+1;
                end
                LSBQuantifInf= mod(quantifInf,2);
                if(int2str(LSBQuantifInf) == message(index))
                    coef= quantifInf*Q(i,j);
                else
                    coef= quantifSup*Q(i,j);
                end
                marquead(index)= int2str(mod(floor(coef/Q(i,j)),2));    
                index =index+1;
            end
            
            
            %on place le coef tatou� ou non dans la matrice
                %on utilise *negatif pour que le coef conserve son signe
                %initial
            end
            if(coef/Q(i,j)<2 && coef/Q(i,j)>=1.5)
                 res(i,j) = floor(coef/Q(i,j))*negatif;
            else
                 res(i,j) = round(coef/Q(i,j))*negatif;
            end 

            if(coef/Q(i,j)>=2 && marquead(index-1)~=message(index-1))
                disp(marquead(index-1));
                disp(message(index-1));
                disp("erreur");
            end
            
        end
    end
return;