function mess= genMess(taille)
    mess ='0';
    for i = 1:taille
        j = rand()
        if(j>0.8)
            mess(i)='1';
        else
            mess(i)='0';
        end
    end
end