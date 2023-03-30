load("uspsDigits.mat"); % Load data

%% Training model?
trainingData = reshape(trainDigits, [256,7291]);    % Reshapes training data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

%% Tests
testData = reshape(testDigits, [256,2007]);         % Reshapes test data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

v = zeros(256, 10);

for i = 1:10
    v(:,i) = create_model(i-1, trainingData, trainAns, testData);
end

x = testData(:,1); 

[y_result, index] = nearest_neighbor_func(x, v, 0:9);
index
