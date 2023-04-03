load("uspsDigits.mat"); % Load data

%% Training phase
trainingData = reshape(trainDigits, [256,7291]);    % Reshapes training data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

%% Test phase (OLD)
testData = reshape(testDigits, [256,2007]);         % Reshapes test data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)
n = length(testData);

correctCounter = 0;

for i = 1:n
    x = testData(:,i);                                  % Fetch first digit from testData
    
    [y, y_result_digit] = nearest_neighbor_func(x, trainingData, trainAns);

    if y_result_digit == testAns(i)
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






%% Test phase (NEW)
testData = reshape(testDigits, [256,2007]);         % Reshapes test data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

n = size(testData, 2);
result = zeros(n,3);
result(:,1) = testAns;
    
for i = 1:n
    x = testData(:,i); 
    [y_result, y_result_digit, norm] = nearest_neighbor_func(x, trainingData, trainAns);
   
    result(i,2) = y_result_digit; %what the model thinks the number is (the output)
    
    result(i,3) = norm;
end

sum_results = zeros(10, 3);

for i = 1:10
    sum_results(i,1) = sum(result(:,1) == i-1);
    sum_results(i,2) = sum((result(:,1) == i-1) & (result(:,1) == result(:,2)));
    sum_results(i,3) = (sum_results(i,2) / sum_results(i,1) * 100);
end
