%%%%%% Project assignement 1 %%%%%%
% By Lucie Della Negra
% lude5925@student.su.se
% Due : September 22nd
% Last modification : September 10th

%%%%%%% Imports
importdata('p2naive.m');
importdata('p2setup.m');
importdata('p2image.m');
importdata('p2runner.m');
importdata('p2landweber.m');
importdata('p2tikhonov.m');


%% %%%%%%% Setup

[imblurd, height, width, H] = p2setup();
p2image(imblurd, height,width)

%% %%%%%%% A naive method 
% Compute the result
imresult_naive = p2naive(imblurd, H);

%% Plot the result of the naive method
figure(1)
p2image(imblurd, height,width)
figure(2)
p2image(imresult_naive, height,width)

%% Compute answer of error bounds
disp("Error bound : " + 201047*3*0.75)

%% Compute the condition number of H
disp("Condition number of H : " + condest(H))

%% %%%%%%% Tikhonov regularization

beta=10^(-2);
tStart = cputime;
imresult_tik=p2tikhonov(imblurd, H,beta);
tEnd = cputime - tStart

%% Plot the result of the Tikhonov regularization
figure(1)
p2image(imblurd, height,width)
figure(2)
p2image(imresult_tik, height,width)

%% %%%%%%% Landweber iteration
n=1000;
alpha=2;
tStart = cputime;
imresult_land = p2landweber(imblurd, H, n, alpha);
tEnd = cputime - tStart

%% Plot the result of the Landweber iteration

figure(1)
p2image(imresult_land, height,width)

%% Get first images

alpha=2;
%imresult_land = p2landweber(imblurd, H, n, alpha);

for i=100:110
   imresult_land = p2landweber(imblurd, H, i, alpha);
   figure(i)
   p2image(imresult_land, height,width)
end
