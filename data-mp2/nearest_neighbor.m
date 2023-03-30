load("uspsDigits.mat"); % Load data

%% Training phase
trainingData = reshape(trainDigits, [256,7291]);    % Reshapes training data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

%% Test phase
testData = reshape(testDigits, [256,2007]);         % Reshapes test data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)
n = length(testData);

correctCounter = 0;

for i = 1:n
    x = testData(:,i);                                  % Fetch first digit from testData
    
    [y, index] = nearest_neighbor_func(x, trainingData, trainAns);

    if index == testAns(i)
        correctCounter = correctCounter + 1;
    end

end

correctCounter
accuracy = (correctCounter / n) * 100

%%
x = reshape(x, [16,16]);
y = reshape(y, [16,16]);

figure(1)
ima(x)

figure(2)
ima(y)

