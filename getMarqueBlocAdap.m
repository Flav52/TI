function getMarqueBlocAdap(tatou,tailleMarque)
ordre = tatou.location;

tatou = tatou.data;
%on utilise la marque global
global marquee;
%on récupère la taille du bloc, le système est donc evolutif si on veut
%travailler avec des blos de 16/16 par exemple
[m,n] = size(tatou);
%on recupère l'index actuel grâce à persistent 
persistent index;
%si on appel la fonction pour la permière fois il est vide on l'initialise
%donc à 1
if(isempty(index))
        index = 1 ;
end
%pour tout les pixel du bloc
for i = 1:m
        for j = 1:n
            %coef est la valeur absolu du coef présent dans la matrice
            coef = abs(tatou(i,j));
            %si coef est suppérieur à 1 et que l'on a pas encore
            %récupérer tt le message 
            if(index<=tailleMarque(2))
            if(coef>=uint8(2) || coef>=double(2.0))
                %on récupère le bit de poid faible du coef 
                coef = round(coef);
                lsb = int2str(mod(coef,2));
                %on l'ajoute à la marque
                marquee(index)=lsb;
                %on avance l'index de 1e pour trouver le bit secret suivant 
                index =index+1;
            end
            end
        end
end