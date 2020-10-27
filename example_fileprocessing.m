
%%
% Cropping the middle 10x10 out of the 20x20
dapi = imread('dapi.tif');
info = imfinfo(dapi); 
info.Width 
info.Height 

start_w = floor(info.Width*0.25);
end_w = ceil(info.Width*0.75);

start_h = floor(info.Height*0.25);
end_h = ceil(info.Height*0.75);


dapi_small = imread('dapi.tif','PixelRegion',...
    {[start_h,end_h],... %rows
    [start_w,end_w]}); %columns

% Use cut tif to cut as 10 by 10.
cutTif(10,10,{'dapi'});

%%

% Read in the image
cy = imread('cy.tif');
dapi = imread('dapi.tif');

figure; %opens new window
imshow(imadjust(dapi)) %quick way to show an image
% imadjust will autocontrast to see things.
% don't use imadjust to make final figures.

% import data
T=readtable('data.csv');

% column names in our table
T.Properties.VariableNames
T.Properties.VariableNames{23}
T.Properties.VariableNames{24}
T.Properties.VariableNames{25}
T.Properties.VariableNames{26}

x = T{:,26}; % x position of each cell
y = T{:,27};  % y position of each cell

% Try plotting the X,Ys on top of the dapi to make sure we segmented the
% cells correctly.
figure; %opens new window
imshow(imadjust(dapi))
hold on; 
plot(x,y,'.')

% Coordinates from cell profiler do not match up.
% We need to figure out how to get global coordinates from this.

