load("uspsDigits.mat"); % Load data

%% Training model?
trainingData = reshape(trainDigits, [256,7291]);    % Reshapes training data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

%% Tests
testData = reshape(testDigits, [256,2007]);         % Reshapes test data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

x = testData(:,1)                                   % Fetch first digit from testData

y = trainingData(:,1)

norm(x-y)
