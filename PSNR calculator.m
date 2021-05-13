
cd 'c:\Users\oscar\Desktop\oosker';
sigma = 8

gt = 'c:\Users\oscar\Desktop\oosker\ground truth';
gt_grey = 'c:\Users\oscar\Desktop\oosker\ground truth\greyscale' ;
root = 'c:\Users\oscar\Desktop\oosker\' + string(sigma) ;
noisycolour = root + '\colour';
noisygrey = root + '\greyscale';
stateofart = root + '\colour denoised + deconvolved';
stateofartgrey = root + '\greyscale denoised + deconvolved';
oscarML = root + '\oscar ML';
boveyML = root + '\bovey ML';

dirs_grey = [noisygrey, boveyML, stateofartgrey,gt_grey]; 
dirs_colour = [noisycolour,oscarML,stateofart,gt];

cd(gt_grey);
GTgreys = dir('*.png');
cd(gt);
GTcolours = dir('*.png');
nfiles = 7;

for a=1:3
    colourNoisy = dirs_colour(a);
    cd(colourNoisy);
    colourNoisies = dir('*png');
    
    greyNoisy = dirs_grey(a);
    cd(greyNoisy);
    greyNoisies = dir('*png');
   
    PSNRgrey = 0;
    PSNRcolour = 0;
    nfiles = 7;
    
    for imgN = 1:nfiles
        if a == 5
            cd(greyNoisy);
            current = greyNoisies(imgN).name;
            imgGrey = imread(current);
            %cd(gt_grey);
            %currentGT = GTgreys(imgN).name;
            %imgGreyRef = imread(currentGT);
            cd(gt);
            currentGT = GTcolours(imgN).name;
            imgRef = imread(currentGT);
            imgGreyRef = rgb2gray(imgRef);
            PSNRgrey = PSNRgrey + psnr(imgGrey,imgGreyRef);
        else
            %cd(greyNoisy);
            %current = greyNoisies(imgN).name;
            %imgGrey = imread(current);
            cd(colourNoisy);
            current = colourNoisies(imgN).name;
            img = imread(current);
            imgGrey = rgb2gray(img);
            %cd(gt_grey);
            %currentGT = GTgreys(imgN).name;
            %imgGreyRef = imread(currentGT);
            cd(gt);
            currentGT = GTcolours(imgN).name;
            imgRef = imread(currentGT);
            imgGreyRef = rgb2gray(imgRef);
            PSNRgrey = PSNRgrey + psnr(imgGrey,imgGreyRef);
        end
        cd(colourNoisy);
        current = colourNoisies(imgN).name;
        img = imread(current);
        cd(gt);
        currentGT = GTcolours(imgN).name;
        imgRef = imread(currentGT);
        PSNRcolour = PSNRcolour + psnr(img,imgRef);
    end
    greyNoisy
    PSNRgrey = PSNRgrey/nfiles
    colourNoisy
    PSNRcolour = PSNRcolour/nfiles
    
    
    
   % print(greyNoisy);
   % print(PSNRgrey);
    
   % print(colourNoisy);
   % print(PSNRcolour);
    
end
       
%{
for ii=1:nfiles 
    currentfilename = imagefiles(ii).name;
    currentimage = imread(currentfilename);
    image_deblurred = deconvlucy( currentimage , PSF);
    image_deblurred_greyscale = rgb2gray(image_deblurred);
    image_deblurred_greyscale = cast(image_deblurred_greyscale, 'uint8');
    image_deblurred = cast(image_deblurred, 'uint8');
    cd(OUTdirA);
    imwrite(image_deblurred, strrep(currentfilename, 'testimg', 'deconv'));
    cd(OUTdirB);
    imwrite(image_deblurred_greyscale, strrep(currentfilename, 'testimg', 'greyscale_deconv'));
    cd(INdir);
end
%}

