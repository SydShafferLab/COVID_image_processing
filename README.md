# COVID_image_processing


Example usage of cutTif function: 

numRows = 20;
numColumns = 20;

% This is a list of the filenames to process and cut. 
% The code adds ".tif" to the end of each string.
wavelength = {'dapi', 'alexa', 'cy', 'tmr', 'trans', 'gfp'};

% The current version cuts with no overlap. To be added, overlap!!
B = cutTif(numRows, numColumns, wavelength);
