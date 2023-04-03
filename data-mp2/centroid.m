load("uspsDigits.mat"); % Load data

%% Test data
testData = reshape(testDigits, [256,2007]);         % Reshapes test data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

%% Training phase
trainingData = reshape(trainDigits, [256,7291]);    % Reshapes training data from 3D-matrix to 2D. Column by column (each 16x16 becomes 256x1)

v = zeros(256, 10);

for i = 1:10
    v(:,i) = create_model(i-1, trainingData, trainAns, testData);
end

%% Test phase

n = size(testData, 2);
result = zeros(n,3);
result(:,1) = testAns;
    
for i = 1:n
    x = testData(:,i); 
    [y_result, y_result_digit, norm] = nearest_neighbor_func(x, v, 0:n-1);
   
    result(i,2) = y_result_digit;
    
    result(i,3) = norm;
end

m = length(result)


% for j = 1:10
%     lookingfor = j-1;
%     for i = 1:m
%         if result(i, 1) == lookingfor && result(i, 2) == lookingfor
%             percents(j, 1) = percents(j, 1) + 1;
%         end
%         percents(j, 2) = percents(j, 1) + 1;
%     end
%     percents(j, 3) = abs(percents(j, 1)/percents(j, 2));
% end


sum_results = zeros(10, 3);

for i = 1:10
    sum_results(i,1) = sum(result(:,1) == i-1);
    sum_results(i,2) = sum((result(:,1) == i-1) & (result(:,1) == result(:,2)));
    sum_results(i,3) = (sum_results(i,2) / sum_results(i,1) * 100)
end
