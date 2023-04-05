load("uspsDigits.mat"); % Load data

%% Training phase
trainingData = reshape(trainDigits, [256,7291]);    % Reshapes training data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

%% Test phase
testData = reshape(testDigits, [256,2007]);         % Reshapes test data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

n = size(testData, 2);
result = zeros(n,3);
result(:,1) = testAns;
    
for i = 1:n
    x = testData(:,i); 
    [y_result, y_result_digit, y_index, norm] = nearest_neighbor_func(x, trainingData, trainAns);
   
    result(i,2) = y_result_digit; %what the model thinks the number is (the output)
    
    result(i,3) = norm;
    result(i,4) = y_index;
end

sum_results = zeros(10, 3);

for i = 1:10
    sum_results(i,1) = sum(result(:,1) == i-1);
    sum_results(i,2) = sum((result(:,1) == i-1) & (result(:,1) == result(:,2)));
    sum_results(i,3) = (sum_results(i,2) / sum_results(i,1) * 100);
end
