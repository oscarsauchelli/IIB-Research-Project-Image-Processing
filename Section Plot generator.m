%{
cd 'c:\Users\oscar\Google Drive\Research_Project_Shared\MATLAB';
original = imread("0002_gt.png");
oscar = imread("0002_degraded.png");
bovey = imread("0002_degraded_out.png");

% these are arrays of size  (columns, rows, channels or whatever you want to call it)

original_grey = mean(gtI,3);
oscar_grey = mean(blurredI, 3);
bovey_grey = mean(deblurredI,3);

original = original_grey;
blurred = blurred_grey;
deblurred = deblurred_grey;
%}

base = "c:\Users\oscar\Google Drive\01 Research_Project_Shared\Oscar Wide-field Pics"

originalA = append(base,'\origiinal');
oscarA = append(base,'\20g10b') ;
boveyA = append(base,'\18g8b') ;

originalB = append(originalA,'\005_512.png');
oscarB = append(oscarA,'\005_out_512.png');
boveyB = append(boveyA,'\004_out_out_512.png');

imgA = imread(originalB);
imgC = imread(oscarB);
imgB = imread(boveyB);

%specify segment start and end-point
x = [285 350];
y = [325 370];

a = improfile(imgA,x,y);
b = improfile(imgB,x,y);
c = improfile(imgC,x,y);

seg = linspace(1,length(a),length(a));

hold off

hold on

%plot intensity segment graph
subplot(2,3,[1,2,3]), plot(seg, a/255,'-', seg, b/255,'--', seg, c/255,'-.' )
hx = xlabel('Segment pixel')
set(hx, 'FontSize', 15)
hy = ylabel('Intensity')
set(hy,'FontSize', 15)
hl = legend('Widefield', 'network B', 'network A')
set(hl, 'FontSize', 13) 
axis([0,length(a),0,1])

%plot images with segment shown
h1 = subtightplot(2,3,4); imshow(imgA)
line(x,y,'Color','yellow','LineWidth',2)
t1 = title('Widefield','fontweight','normal')
set(t1,'FontSize', 15)
h2 = subtightplot(2,3,5); imshow(imgB)
line(x,y,'Color','yellow','LineWidth',2)
t2 = title('network B','fontweight','normal')
set(t2,'FontSize', 15)
h3 = subtightplot(2,3,6); imshow(imgC)
line(x,y,'Color','yellow','LineWidth',2)
t3 = title('network A','fontweight','normal')
set(t3,'FontSize', 15)

%sgtitle('Intensity plot(top) along cross-sections(pictured in red, bottom)','fontweight','bold')

%}