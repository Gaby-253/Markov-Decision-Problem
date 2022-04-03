function index_action = get_next_action(current_row,current_col,epsilon,Q)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


if rand < epsilon
    [M,I]=max(Q(current_row,current_col,:));
    index_action = I;
else
    index_action = randi([1 4]);
end


end

