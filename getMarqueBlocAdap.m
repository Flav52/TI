function getMarqueBlocAdap(tatou,tailleMarque)
ordre = tatou.location;

tatou = tatou.data;
%on utilise la marque global
global marquee;
%on r�cup�re la taille du bloc, le syst�me est donc evolutif si on veut
%travailler avec des blos de 16/16 par exemple
[m,n] = size(tatou);
%on recup�re l'index actuel gr�ce � persistent 
persistent index;
%si on appel la fonction pour la permi�re fois il est vide on l'initialise
%donc � 1
if(isempty(index))
        index = 1 ;
end
%pour tout les pixel du bloc
for i = 1:m
        for j = 1:n
            %coef est la valeur absolu du coef pr�sent dans la matrice
            coef = abs(tatou(i,j));
            %si coef est supp�rieur � 1 et que l'on a pas encore
            %r�cup�rer tt le message 
            if(index<=tailleMarque(2))
            if(coef>=uint8(2) || coef>=double(2.0))
                %on r�cup�re le bit de poid faible du coef 
                coef = round(coef);
                lsb = int2str(mod(coef,2));
                %on l'ajoute � la marque
                marquee(index)=lsb;
                %on avance l'index de 1e pour trouver le bit secret suivant 
                index =index+1;
            end
            end
        end
end