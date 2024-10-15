function imresults=p2naive(imblurd, H)
imresults=H\imblurd;
%imresults = load('im1_70.txt');     

%H\imblurd             %Used this to createe im1_70.txt
                       %Saved using dlmwrite, in order to skip lengthy
                       %calculations each time.
end
