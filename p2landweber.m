function im3=p2landweber(imblurd, H, n, alpha)

im3 = imblurd;
HT = H';                        %H transpose

for J = 1:n
Im3 = alpha*HT*(imblurd -H*im3);        %Landweber itteration
im3 = im3 + Im3;                        

% if J/10 == floor(J/10)
% figure(J); p2image(im3,373,539);      %Use this to create every X:th
                                        % picture if J/10 every 10th
                                        % iteration creates a picture.
    
% end
end