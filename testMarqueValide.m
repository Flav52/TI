function valide  = testMarqueValide(message,marque)
valide = '';
sizeMess = size(message);
sizeMarque = size(marque);
nbErreur=0;
for i=1:sizeMarque(2)
    if(message(i)~=marque(i))
        nbErreur=nbErreur+1;
    end
end
nbErreur = nbErreur + sizeMess(2)-sizeMarque(2);
pourcentage = strcat(int2str(((sizeMess(2)-nbErreur)/sizeMess(2))*100),'% de correspondance');
valide = strcat(valide,pourcentage); 

