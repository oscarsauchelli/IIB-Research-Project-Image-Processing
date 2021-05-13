base = "c:\Users\oscar\Google Drive\01 Research_Project_Shared\MATLAB\CROP_SIM"

wide = append(base, '\Widefield.tif' );
raw = append(base, '\unprocessed SIM.tif' );
pre = append(base, '\processed SIM.tif' );

imgA = imread(wide);
imgA = imgA(1024-255:1024,128+1:128+256);
imgB = imread(raw);
imgB = imgB(1024-255:1024,128+1:128+256);
imgC = imread(pre);
imgC = imgC(1024-255:1024,128+1:128+256);

imgAR = zeros(256,256,3);
imgBR = zeros(256,256,3);
imgCR = zeros(256,256,3);
%imgAR = zeros(512,512,3);
%imgBR = zeros(512,512,3);
%imgCR = zeros(512,512,3);

x = 2.1;
imgAR(:,:,1) = x*imgA;
imgAR = cast(imgAR,'uint8');
imgBR(:,:,1) = x*imgB;
imgBR = cast(imgBR,'uint8');
imgCR(:,:,1) = x*imgC;
imgCR = cast(imgCR,'uint8');

imwrite(imgA, strrep(wide,'.tif','_256.png'));
imwrite(imgB, strrep(raw,'.tif','_256.png'));
imwrite(imgC, strrep(pre,'.tif','_256.png'));

imgA = imgAR;
imgB = imgBR;
imgC = imgCR;

imwrite(imgA, strrep(wide,'.tif','_256R.png'));
imwrite(imgB, strrep(raw,'.tif','_256R.png'));
imwrite(imgC, strrep(pre,'.tif','_256R.png'));

imgA = imread(wide);
imgB = imread(raw);
imgC = imread(pre);

combined = cat(2,imgA,imgB);
combined = cat(2,combined,imgC);
imwrite(1.3*combined, base + '\SIMcombined.png');

