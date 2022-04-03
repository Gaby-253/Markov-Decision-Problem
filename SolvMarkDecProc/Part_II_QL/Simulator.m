function Q = Simulator(Q,MAX_X,MAX_Y,reward,action,world)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                                                                   %%%%
%%%%     Simulator World - Q Learning Agent - Gabriel Gattaux          %%%%
%%%%                                                                   %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%this world use the temporal difference for the Q Learning

%define training parameters
global eps; %the percentage of time when we should take the best action (instead of a random action)
discount_factor = 0.99; %discount factor for future rewards
learning_rate = 1 ; %the rate at which the AI agent should learn, is equal to 1/Nsa, and in the formula learning rate is multiplied by NSA, so 1.
xstartind = 1;
ystartind = 1;
global Qplot
global U;

for episode =1:100000
    
    %get the starting location for this episode
    row_index = ystartind;
    col_index = xstartind;
    n=0;
    %continue taking actions (i.e., moving) until we reach a terminal state
    while ~(is_terminal_state(row_index, col_index,reward,world))
        
        %choose which action to take (i.e., where to move next)
        action_index = get_next_action(row_index, col_index, eps,Q);
        
        %perform the chosen action, and transition to the next state (i.e., move to the next location)
        old_row_index = row_index;
        old_column_index = col_index; %store the old row and column indexes
        [row_index, col_index] = get_next_location(row_index, col_index, action_index,action,MAX_Y,MAX_X,world);
        
        %receive the reward for moving to the new state, and calculate the temporal difference
        rewards = reward(row_index, col_index);
        old_q_value = Q(old_row_index, old_column_index, action_index);
        temporal_difference = rewards + (discount_factor * max(Q(row_index, col_index,:))) - old_q_value;
        
        %update the Q-value for the previous state and action pair
        new_q_value = old_q_value + (learning_rate * temporal_difference);
        Q(old_row_index, old_column_index, action_index)= new_q_value;
        
        U(old_row_index, old_column_index) = max([Q(old_row_index, old_column_index,1),Q(old_row_index, old_column_index,2),Q(old_row_index, old_column_index,3),Q(old_row_index, old_column_index,4)]);
    end
    for act=1:4
        Qplot(act,episode) = Q(2,1,act);
    end
end

disp('Training complete!')

end

