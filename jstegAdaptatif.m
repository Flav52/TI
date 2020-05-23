function res= jstegAdaptatif(essai,message,Q)
%c'est lindex de la lettre � coder dans le message on utilise persistent
%pour le partager entre les diff�rent blocs
persistent index
%on init le resultat avec les valeurs avant traitement
res=essai;

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
            %la variable n�gatif nous permet de savoir si le coef �tait
            %n�gatif
            if(coef~=0)
                negatif = coef/(res(i,j));
            else
                negatif=1;
            end
            %si coef quantif� est supp�rieur � 1 et que l'on a pas encore
            %r�cup�rer tt le message alors on va tatouer ici 
            if((coef/Q(i,j))>1 && index<=tailleMes(2))
                d=0;
                %on cherche la valeur du coef non quantifi� la plus proche
                %qui apr�s quantification m�ne � une valeur enti�re poss�dant un lsb �quivalent au bit secret 
                % on boucle tant que 'on ne 'a pas trouv�
                while true
                    %� chaque boucle on incr�mente 'd' qui est l'ecart par rapport � l'orrondie de coef 
                    d=d+1;
                    %quantifSup/quantifInf est la valeur arrondie de coef+d/coef-d apr�s
                    %quantification 
                    quantifSup= (round((coef+d))/Q(i,j))
                    quantifInf=(round((coef-d))/Q(i,j))
                    
                    %si quantifSup est un nombre entier et qu'il poss�de un
                    %lsb �gal aux bit secret 
                    if((quantifSup-floor(quantifSup))==0 && int2str(mod(quantifSup,2))==message(index)&& quantifSup>1)
                            %on prend coef = coef+d pour la quantification
                            coef=coef+d;
                            %on sort de la boucle while
                            break; 
                            
                    %sinon si quantifInf est un nombre entier et qu'il poss�de un
                    %lsb �gal aux bit secret ET qu'il est supp�rieur � 1        
                    elseif((quantifInf-floor(quantifInf))==0 && int2str(mod(quantifInf,2))==message(index) && quantifInf>1)
                            %on prend coef = coef-d pour la quantification
                            coef=coef-d;
                            %on sort de la boucle while
                            break;    
                    end
                end
                %on avance l'index de 1e pour coder le bit secret suivant 
                index =index+1
            end 
            %on place le coef tatou� ou non dans la matrice
                %on utilise *negatif pour que le coef conserve son signe
                %initial
            res(i,j) = round(coef/Q(i,j))*negatif;
        end
    end
return;