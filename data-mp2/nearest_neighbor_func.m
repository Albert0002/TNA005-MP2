function [y_result_vector, y_result_digit, y_index, shortest_norm] = nearest_neighbor_func(x, data, answer)

    y = data(:,1);                                      % Fetch first digit from trainingData
    y_result_vector = y;                                % Sets a first value
    
    n = size(data, 2);                                  % Number of columns
    norm_results = zeros(n,1);                          % Allocate norm_results
    
    shortest_norm = norm(x-y);                          % Check first digit/vector distance
    norm_results(1) = shortest_norm;                    % Add result to list
    y_index = 1;                                        % Index of first digit
    
    for i = 2:n                                         % Loop through all training data
        y = data(:,i);
        temp_norm = norm(x-y);                          % Calculate norm
        norm_results(i) = temp_norm;
        if temp_norm < shortest_norm                    % If temp < shortest, sets new shortest, sets result
            shortest_norm = temp_norm;
            y_result_vector = y;                        % Nearest digit vector
            y_index = i;                                % Index for nearest digit vector
        end
    end

    y_result_digit = answer(y_index);                   % The nearest digit
end