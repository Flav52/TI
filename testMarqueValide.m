function valide  = testMarqueValide(message,marque)
valide = '';
sizeMess = size(message);
sizeMarque = size(marque);
mess = message;
if(sizeMess(2)>sizeMarque(2))
    valide  ='Message trop long : ';
    mess = message(1:sizeMarque(2));
end
correspondance = mess == marque;
nbErreur = length(find(correspondance==0));
pourcentage = strcat(int2str(((sizeMarque-nbErreur)/sizeMarque)*100),'% de correspondance');
valide = strcat(valide,pourcentage); 

