function imresults=p2tikhonov(imblurd, H, beta)
n = length(H)

d = sparse(n,n);            %Create an nxn all 0 matrix, sparse
for i = (1:n)               %Set every diagonal element to 1
d(i,i) = 1;
end

A = [H;d.*beta];            %combine H, the diagonal times beta
b = [imblurd;zeros(n,3)];

for j=1:3
    imresults(:,j) = lsqr(A,b(:,j),10^-4,1000);     %forloop solves the eq system for each colour in the picture.
end                                                 %using the new matrixes
end
