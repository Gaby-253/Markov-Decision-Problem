%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%                                                               %%%%%%
%%%%%%           Q-Learning Algorithm - Gabriel Gattaux              %%%%%%
%%%%%%                          May 2021                             %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;close all; clc


for world=1:3
    clearvars -except world
    
global Qplot;
global U;
global eps; 


        actions = ['^', '>', 'v', '<'];
        
switch world
    case 1
        MAX_X = 4;
        MAX_Y = 3;
                Q = zeros(MAX_Y,MAX_X,4);
        xT1 = 4;
        yT1 = 3;
        RT1 = 1;
        xT2 = 4;
        yT2 = 2;
        RT2 = -1;
        xF1 = 2;
        yF1 = 2;

        reward = zeros(MAX_Y,MAX_X);
        reward(:,:)=-0.04;
        reward(3,4)=1;
        reward(2,4)=-1;
        reward(2,2)=-1000;
        
        xstart = 1;
        ystart = 1;
        eps = 0.2;
        
    case 2
        MAX_X = 4;
        MAX_Y = 4;
        Q = zeros(MAX_Y,MAX_X,4);
        reward = zeros(MAX_Y,MAX_X);
        reward(:,:)=-1;
        reward(1,4)=100;
        reward(2,3)=-20;
        reward(1,3)=-1000;
        
        xstart = 1;
        ystart = 1;
        eps = 0.02;
        
        case 3
        MAX_X = 4;
        MAX_Y = 4;
                Q = zeros(MAX_Y,MAX_X,4);
        reward = zeros(MAX_Y,MAX_X);
        reward(:,:)=-1;
        reward(1,4)=100;
        reward(2,3)=-20;
        reward(1,3)=-1000;
        
        xstart = 1;
        ystart = 1;
        eps = 0.5;

        
end

new_Q = Simulator(Q,MAX_X,MAX_Y,reward,actions,world);

path = get_shortest_path(1,1,new_Q,MAX_X,MAX_Y,reward,world)


[Qmax,indexaction]=max(new_Q,[],3);

for i=1:MAX_X
    for j=1:MAX_Y
        if Qmax(j,i)==0
            indexaction(j,i)=0;
        end
    end
end

for i=1:MAX_X
    real_Q(:,i)= flip(Qmax(:,i));
end

for i=1:MAX_X
    for j=1:MAX_Y
        if indexaction(j,i)==1
            Policy(j,i)='^';
        elseif indexaction(j,i)==2
            Policy(j,i)='>';
        elseif indexaction(j,i)==3
            Policy(j,i)='v';
        elseif indexaction(j,i)==4
            Policy(j,i)='<';
        elseif indexaction(j,i)==0
            Policy(j,i)='O';
        end
    end
end

charpi = flip(char(Policy));
realU = flip(U);
new_Q = flip(new_Q);

%% DATA
  if world==1      

writematrix(realU,'DATA\Utility_1_q.txt','Delimiter','bar');
disp("print Utility 1 Q :");
type 'DATA\Utility_1_q.txt';
writematrix(charpi,'DATA\Policy_1_q.txt','Delimiter','bar');
disp("print Policy 1 Q :");
type 'DATA\Policy_1_q.txt';
writematrix(new_Q(:,:,2),'DATA\Qvalues_right_1.txt','Delimiter','bar');
disp("print Qvalues right 1 :");
type 'DATA\Qvalues_right_1.txt';

  elseif world==2     

writematrix(realU,'DATA\Utility_2_q.txt','Delimiter','bar');
disp("print Utility 2 Q :");
type 'DATA\Utility_2_q.txt';
writematrix(charpi,'DATA\Policy_2_q.txt','Delimiter','bar');
disp("print Policy 2 Q :");
type 'DATA\Policy_2_q.txt';
writematrix(new_Q(:,:,2),'DATA\Qvalues_right_2.txt','Delimiter','bar');
disp("print Qvalues right 2 :");
type 'DATA\Qvalues_right_2.txt';
  elseif world==3     

writematrix(realU,'DATA\Utility_3_q.txt','Delimiter','bar');
disp("print Utility 3 Q :");
type 'DATA\Utility_3_q.txt';
writematrix(charpi,'DATA\Policy_3_q.txt','Delimiter','bar');
disp("print Policy 3 Q :");
type 'DATA\Policy_3_q.txt';
writematrix(new_Q(:,:,2),'DATA\Qvalues_right_3.txt','Delimiter','bar');
disp("print Qvalues right 3 :");
type 'DATA\Qvalues_right_3.txt';
  end
end