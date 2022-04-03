function shortest_path = get_shortest_path(start_row_index,start_col_index,Q,MAX_X,MAX_Y,reward,world)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
actions = ['^', '>', 'v', '<'];
if is_terminal_state(1,1,reward,world) %if the first state is illegal
    shortest_path = [];
    
else
    current_row_index = 1;
    current_col_index = 1;
    shortest_path = [];
    shortest_path(1,:) = [current_row_index,current_col_index];
    i=1;
    while ~is_terminal_state(current_row_index,current_col_index,reward,world)
        i=i+1;
        action_index = get_next_action(current_row_index,current_col_index,1,Q);
        [current_row_index,current_col_index] = get_next_location(current_row_index, current_col_index, action_index,actions,MAX_Y,MAX_X,world);
        shortest_path(i,:)=[current_row_index,current_col_index];
    end
end

