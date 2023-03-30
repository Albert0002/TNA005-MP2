function modelForDigit = create_model(x, trainingData, trainAns)
n = length(testData);

%finding a model for 0
foundDigits = [];
for i = 1:n
    if trainAns(i) == x
        foundDigits(:, end+1) = trainingData(:, i);
    end
end


modelForDigit = mean(foundDigits');
end

