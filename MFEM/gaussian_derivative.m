function [gx,gy] = gaussian_derivative(imd,sigma)
window1 = fspecial('gaussian',2*ceil(3*sigma)+1+2, sigma);
winx = window1(2:end-1,2:end-1)-window1(2:end-1,3:end);winx = winx/sum(abs(winx(:)));
winy = window1(2:end-1,2:end-1)-window1(3:end,2:end-1);winy = winy/sum(abs(winy(:)));
gx = filter2(winx,imd,'same');
gy = filter2(winy,imd,'same');
end