function Q = quantification(N,Fq)
Q=zeros(N,N);
for i = 1:N
    for j = 1:N
        Q(i,j)=1+(1+i+j)*Fq;
    end
end
