function is = is_terminal_state(current_row,current_col,reward,world)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if world==1
    if (reward(current_row,current_col) == -1)
        is = true;
    elseif (reward(current_row,current_col) == 1)
        is = true;
    else
        is=false;
    end
    
elseif world==2||3
    if (reward(current_row,current_col) == -20)
        is = true;
    elseif (reward(current_row,current_col) == 100)
        is = true;
    else
        is=false;
    end
end

end

