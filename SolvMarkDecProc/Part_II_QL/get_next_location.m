function [new_row_index,new_col_index] = get_next_location(current_row,current_col,action_index,action,MAX_Y,MAX_X,world)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

new_row_index = current_row;
new_col_index = current_col;
if world ==1
    sink_row = 2;
    sink_col = 2;
else world==2||3;
    sink_row = 1;
    sink_col = 3;
end


if ((action(action_index) == '^') && (current_row < MAX_Y  ) && ~((current_row == sink_row-1)&&(current_col == sink_col)))
    new_row_index = new_row_index + 1;
elseif ((action(action_index) == '>') && (current_col < MAX_X ) && ~((current_row == sink_row)&&(current_col == sink_col-1)))
    new_col_index = new_col_index + 1;
elseif ((action(action_index) == 'v') && (current_row > 1 ) && ~((current_row == sink_row+1)&&(current_col == sink_col)))
    new_row_index = new_row_index - 1;
elseif ((action(action_index) == '<') && (current_col > 1) && ~((current_row == sink_row)&&(current_col == sink_col+1)))
    new_col_index = new_col_index - 1 ;
end

end

