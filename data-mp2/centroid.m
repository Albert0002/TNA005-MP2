load("uspsDigits.mat"); % Load data

%% Training phase
trainingData = reshape(trainDigits, [256,7291]);    % Reshapes training data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

v = zeros(256, 10);

testData = reshape(testDigits, [256,2007]);         % Reshapes test data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

for i = 1:10
    v(:,i) = create_model(i-1, trainingData, trainAns, testData);
end

%% Test phase

n = size(testData, 2);
result_C = zeros(n,3);
result_C(:,1) = testAns;
    
for i = 1:n
    x = testData(:,i); 
    [y_result, y_result_digit, y_index, norm] = nearest_neighbor_func(x, v, 0:n-1);
   
    result_C(i,2) = y_result_digit; %what the model thinks the number is (the output)
    
    result_C(i,3) = norm;
    result_C(i,4) = y_index;
end

sum_results_C = zeros(10, 3);

for i = 1:10
    sum_results_C(i,1) = sum(result_C(:,1) == i-1);
    sum_results_C(i,2) = sum((result_C(:,1) == i-1) & (result_C(:,1) == result_C(:,2)));
    sum_results_C(i,3) = (sum_results_C(i,2) / sum_results_C(i,1) * 100);
end
