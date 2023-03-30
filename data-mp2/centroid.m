load("uspsDigits.mat"); % Load data

%% Training model?
trainingData = reshape(trainDigits, [256,7291]);    % Reshapes training data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

%% Tests
testData = reshape(testDigits, [256,2007]);         % Reshapes test data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)
n = length(testData);

%finding a model for 0
foundDigits = [];
for i = 1:n
    if trainAns(i) == 0
        foundDigits(:, end+1) = trainingData(:, i);
    end
end

foundDigits = foundDigits';
modelForDigit = mean(foundDigits);
modelForDigit = reshape(modelForDigit, [16, 16]);
ima(modelForDigit);
