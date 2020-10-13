function numImages = cutTif(numRows, numColumns, filenames)


% Divide into equal chunks based on the dimensions of the entry in
% filnames.
info = imfinfo(strcat(filenames{1},'.tif')); 
info.Width % 18535
info.Height %in pixels - 18499

% What is the width and height of each individual image going to be?
% rounds the number down
width = floor(info.Width/numRows);
height = floor(info.Height/numColumns); 
numImages = 0

    for w = 1:length(filenames) 
        % loop over each wavelength
        n=1;

        for i = 0:numColumns-1

            for k = 0:numRows-1
                % This pattern will go across the row first then down to the
                % next row. No snake.

                % Only reads the part of the tiff file that you are going to
                % write.
                A = imread(strcat(filenames{w},'.tif'),...
                    'PixelRegion',...
                    {[(width*i)+1,(width*i)+width],... %rows
                    [(height*k)+1,(height*k)+height]}); %columns

                % Write to file.
                imwrite(A, strcat(filenames{w},num2str(n, '%03.f'),'.tif'))

                n=n+1; % counting the total number of images in each wavelength
                numImages = numImages +1; %total images resaved.

            end
        end
        
    end

end

