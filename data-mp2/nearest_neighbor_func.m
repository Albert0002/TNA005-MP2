function [y_result, index] = nearest_neighbor_func(x, trainingData, trainAns)

    y = trainingData(:,1);                              % Fetch first digit from trainingData
    y_result = y;
    
    n = length(trainingData);
    norm_results = zeros(n,1);                          % Allocate norm_results
    
    shortest_norm = norm(x-y);                          % Check first digit/vector
    norm_results(1) = shortest_norm;                    % Add result to list
    y_index = 1;
    
    for i = 2:n
        y = trainingData(:,i);
        temp_norm = norm(x-y);
        norm_results(i) = temp_norm;
        if temp_norm < shortest_norm
            shortest_norm = temp_norm;
            y_result = y;
            y_index = i;
        end
    end
    
    index = trainAns(y_index);
end