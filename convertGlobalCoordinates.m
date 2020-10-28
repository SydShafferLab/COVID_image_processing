
%%
T=readtable('cellprofiler.csv');
T.Properties.VariableNames

globals=readtable('data.csv');
globals.Properties.VariableNames

%%
globalX = [];
globalY = [];

%
imageNum = 1;
for i=1:100
       index = find(T.ImageNumber == i);
 
           
           globalX = [globalX; T.Location_Center_X(index) + globals.GlobalLocationX(i)];
           globalY = [globalY; T.Location_Center_Y(index) + globals.GlobalLocationY(i)]; 
            
end

%
T.globalX = globalX;
T.globalY = globalY;


figure;
plot(T.globalX,T.globalY, '.')

%%