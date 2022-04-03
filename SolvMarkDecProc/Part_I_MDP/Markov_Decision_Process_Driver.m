close all;clc;

%% Choose of problem
for pb=1:5
    
    clearvars -except pb

switch pb  
 
        case 1   %Point 1 : 4x3Lecture      
%/////////// Environnemement 1  //////////////////////////////////////////
%DEFINE THE 2-D R ARRAY by reading in the appendix.txt

[W,S,P,G,R,F,T]=read_f3("appendix.txt");

MAX_X = W(1); %N
MAX_Y = W(2); %M

xStart = S(1);
yStart = S(2);

gamma = G;

p1=P(1); %Probability to go to good action choosen.
p2=P(2); %Probability to go to the right from the action choosen.
p3=P(3); %Probability to go to the left from the action choosen.

Ra = R; %reward in non-terminal states (used to initialise r[][])

xF =F(1);%X Coordinate of the First Obstacle
yF=F(2);%Y Coordinate of the First Obstacle

%This array stores the coordinates of the R and the 
%Objects in each coordinate
R=Ra*ones(MAX_X,MAX_Y);
Pi=ones(MAX_X,MAX_Y);

%Terminals
%Winning point
xT1=T(1,2);
yT1=T(2,2);
R(xT1,yT1)=T(3,2);%Reward = 100
Pi(xT1,yT1)='+';%Policy

%Loss point
xLos=T(1,1);%X Coordinate of the Loss point
yLos=T(2,1);%Y Coordinate of the Loss point
R(xLos,yLos)=T(3,1);%Reward = -100
Pi(xLos,yLos)='-';%Policy

%Obstacles
R(xF,yF)=0;%Reward = 0
Pi(xF,yF)='#';%Policy


%/////////////////////////////////////////////////////////////////////////
    case 2
%/////////// Environnemement 1  //////////////////////////////////////////
%DEFINE THE 2-D R ARRAY
MAX_X=4;
MAX_Y=4;

gamma = 0.99;

p1=0.8;
p2=0.1;
p3=0.1;

Ra = -1; %reward in non-terminal states (used to initialise r[][])

xF =3;%X Coordinate of the First Obstacle
yF=1;%Y Coordinate of the First Obstacle

xT1=4;
yT1=1;


%This array stores the coordinates of the R and the 
%Objects in each coordinate
R=Ra*ones(MAX_X,MAX_Y);
Pi=ones(MAX_X,MAX_Y);

% Determine Terminals, Obstacles, Start Locations
%Terminals
%Winning point
R(xT1,yT1)=100;%Reward = 100
Pi(xT1,yT1)='+';%Policy


%Loss point
xLos=3;%X Coordinate of the Loss point
yLos=2;%Y Coordinate of the Loss point
R(xLos,yLos)=-20;%Reward = -100
Pi(xLos,yLos)='-';%Policy


%Obstacles
R(xF,yF)=0;%Reward = 0
Pi(xF,yF)='#';%Policy


%Start
xStart=1;%X Coordinate of the Start
yStart=1;%Y Coordinate of the Start
%/////////////////////////////////////////////////////////////////////////

    case 3
%% /////////// Environnemement 3  //////////////////////////////////////////
%DEFINE THE 2-D R ARRAY
MAX_X=4;
MAX_Y=4;

gamma = 0.99;

p1=0.8;
p2=0.1;
p3=0.1;

Ra = -40; %reward in non-terminal states (used to initialise r[][])

xF =3;%X Coordinate of the First Obstacle
yF=1;%Y Coordinate of the First Obstacle

xT1=4;
yT1=1;


%This array stores the coordinates of the R and the 
%Objects in each coordinate
R=Ra*ones(MAX_X,MAX_Y);
Pi=ones(MAX_X,MAX_Y);

% Determine Terminals, Obstacles, Start Locations
%Terminals
%Winning point
R(xT1,yT1)=100;%Reward = 100
Pi(xT1,yT1)='+';%Policy


%Loss point
xLos=3;%X Coordinate of the Loss point
yLos=2;%Y Coordinate of the Loss point
R(xLos,yLos)=-20;%Reward = -100
Pi(xLos,yLos)='-';%Policy


%Obstacles
R(xF,yF)=0;%Reward = 0
Pi(xF,yF)='#';%Policy


%Start
xStart=1;%X Coordinate of the Start
yStart=1;%Y Coordinate of the Start
%/////////////////////////////////////////////////////////////////////////
    case 4
%% /////////// Environnemement 4  ////////////////////////////////////////

%DEFINE THE 2-D R ARRAY
MAX_X=4;
MAX_Y=4;

gamma = 0.99;

p1=0.10;
p2=0.60;
p3=0.30;

Ra = -1; %reward in non-terminal states (used to initialise r[][])

xF =3;%X Coordinate of the First Obstacle
yF=1;%Y Coordinate of the First Obstacle

xT1=4;
yT1=1;


%This array stores the coordinates of the R and the 
%Objects in each coordinate
R=Ra*ones(MAX_X,MAX_Y);
Pi=ones(MAX_X,MAX_Y);

% Determine Terminals, Obstacles, Start Locations
%Terminals
%Winning point
R(xT1,yT1)=100;%Reward = 100
Pi(xT1,yT1)='+';%Policy


%Loss point
xLos=3;%X Coordinate of the Loss point
yLos=2;%Y Coordinate of the Loss point
R(xLos,yLos)=-20;%Reward = -100
Pi(xLos,yLos)='-';%Policy


%Obstacles
R(xF,yF)=0;%Reward = 0
Pi(xF,yF)='#';%Policy


%Start
xStart=1;%X Coordinate of the Start
yStart=1;%Y Coordinate of the Start
%/////////////////////////////////////////////////////////////////////////
    case 5
%% /////////// Environnemement 5  ////////////////////////////////////////

        %DEFINE THE 2-D R ARRAY
MAX_X=4;
MAX_Y=4;

gamma = 0.80;

p1=0.8;
p2=0.10;
p3=0.10;

Ra = -1; %reward in non-terminal states (used to initialise r[][])

xF =3;%X Coordinate of the First Obstacle
yF=1;%Y Coordinate of the First Obstacle

xT1=4;
yT1=1;


%This array stores the coordinates of the R and the 
%Objects in each coordinate
R=Ra*ones(MAX_X,MAX_Y);
Pi=ones(MAX_X,MAX_Y);

% Determine Terminals, Obstacles, Start Locations
%Terminals
%Winning point
R(xT1,yT1)=100;%Reward = 100
Pi(xT1,yT1)='+';%Policy


%Loss point
xLos=3;%X Coordinate of the Loss point
yLos=2;%Y Coordinate of the Loss point
R(xLos,yLos)=-20;%Reward = -100
Pi(xLos,yLos)='-';%Policy


%Obstacles
R(xF,yF)=0;%Reward = 0
Pi(xF,yF)='#';%Policy


%Start
xStart=1;%X Coordinate of the Start
yStart=1;%Y Coordinate of the Start
%/////////////////////////////////////////////////////////////////////////
end %endswitch

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                              ALGORITHM                                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 10000; %max number of iterations of Value Iteration

deltaMin = 1e-4; %convergence criterion for iteration
delta = 0;

POINTS_COUNT= MAX_X * MAX_Y;
POINTS=[POINTS_COUNT,6];

%Put all the points in list with their rewards and initial UP and U
%POINTS 
%LIST |X val |Y val |Reward |Uprime |Utility |Policy

k=1;%Dummy counter
for i=1:MAX_X
    for j=1:MAX_Y
          POINTS(k,1)=i; %X
          POINTS(k,2)=j; 
          POINTS(k,3)=R(i,j);
          POINTS(k,4)=0;
          POINTS(k,5)=0;
          POINTS(k,6)=Pi(i,j);

          k=k+1;
    end
end

R=POINTS(:,3);%instantaneous reward
Up=POINTS(:,4);%UPrime, used in updates
U=POINTS(:,5);%long-term utility
Pi=POINTS(:,6);%policy


n=0;

%while((delta < deltaMin) && (n < N))
while 1
    
    POINTS(:,5)=POINTS(:,4);%U=Up
    U=Up;
    
    n=n+1;
    
    delta = 0;
    
    for i=1:MAX_X
        for j=1:MAX_Y
            upPi=ValueIteration(i,j,POINTS,Ra,gamma,p1,p2,p3);
            Up=upPi(:,1);
            Pi=upPi(:,2);
            POINTS(:,4)=Up;
            POINTS(:,6)=Pi;
            
            Conv(:,n)=U;
            
            k=find(POINTS(:,1)==i & POINTS(:,2)==j);
            %k=k(1);

            diff=abs(Up(k)-U(k));

            Ua(i*j,n)=Up(i*j);
            
            if diff > delta
                delta = diff;
            end

        end
                    
    end
    
    if (delta < deltaMin || n > N)
        break;
    end
    
end

charPi=char(Pi);

%% Plotting
switch pb
       case 1
t = 1:n;
figure()
hold on;
grid on;
title(['Convergence Plot - Number of iterations : ',num2str(n) ]);
xlabel('Numbers of iterations');
ylabel('Utility estimate');
axis
for i=1:12
plot(t,Conv(i,:))
end
legend('(1,1)','(1,2)','(1,3)','(2,1)','(2,2)','(2,3)','(3,1)','(3,2)','(3,3)','(4,1)','(4,2)','(4,3)')
ylim([-1.5 1.5])
print('Plot\Convergenceplot_1_World_1','-dpng')

M = reshape(charPi, MAX_Y, MAX_X)';
for i=1:MAX_X
E(:,i)=M(i,:);
Policy(:,i)= flip(E(:,i));
end

X = reshape(U, MAX_Y, MAX_X)';
for i=1:MAX_X
I(:,i)=X(i,:);
Utility(:,i)= flip(I(:,i));
end


writematrix(Utility,'DATA\Utility_1.txt','Delimiter','bar');
disp("Utility 1 :");
type 'DATA\Utility_1.txt';
writematrix(Policy,'DATA\Policy_1.txt','Delimiter','tab');
disp("Policy 1 :");
type 'DATA\Policy_1.txt';


    case 2       

t = 1:n;
figure()
hold on;
grid on;
title(['Convergence Plot - Number of iterations : ',num2str(n) ]);
xlabel('Numbers of iterations');
ylabel('Utility estimate')
for i=1:12
plot(t,Conv(i,:))
end
legend('(1,1)','(1,2)','(1,3)','(2,1)','(2,2)','(2,3)','(3,1)','(3,2)','(3,3)','(4,1)','(4,2)','(4,3)')
print('Plot\Convergenceplot_2_World_2','-dpng')

M = reshape(charPi, MAX_Y, MAX_X)';
for i=1:MAX_X
E(:,i)=M(i,:);
Policy(:,i)= flip(E(:,i));
end

X = reshape(U, MAX_Y, MAX_X)';
for i=1:MAX_X
I(:,i)=X(i,:);
Utility(:,i)= flip(I(:,i));
end


writematrix(Utility,'DATA\Utility_2.txt','Delimiter','bar');
disp("Utility 2 :");
type 'DATA\Utility_2.txt';
writematrix(Policy,'DATA\Policy_2.txt','Delimiter','tab');
disp("Policy 2 :");
type 'DATA\Policy_2.txt';

           
        case 3 

t = 1:n;
figure()
hold on;
grid on;
title(['Convergence Plot - Number of iterations : ',num2str(n) ]);
xlabel('Numbers of iterations');
ylabel('Utility estimate')
for i=1:12
plot(t,Conv(i,:))
end
legend('(1,1)','(1,2)','(1,3)','(2,1)','(2,2)','(2,3)','(3,1)','(3,2)','(3,3)','(4,1)','(4,2)','(4,3)')
print('Plot\Convergenceplot_3_World_2','-dpng')

M = reshape(charPi, MAX_Y, MAX_X)';
for i=1:MAX_X
E(:,i)=M(i,:);
Policy(:,i)= flip(E(:,i));
end

X = reshape(U, MAX_Y, MAX_X)';
for i=1:MAX_X
I(:,i)=X(i,:);
Utility(:,i)= flip(I(:,i));
end


writematrix(Utility,'DATA\Utility_3.txt','Delimiter','bar');
disp("Utility 3 :");
type 'DATA\Utility_3.txt';
writematrix(Policy,'DATA\Policy_3.txt','Delimiter','tab');
disp("Policy 3 :");
type 'DATA\Policy_3.txt';
case 4       


t = 1:n;
figure()
hold on;
grid on;
title(['Convergence Plot - Number of iterations : ',num2str(n) ]);
xlabel('Numbers of iterations');
ylabel('Utility estimate')
for i=1:12
plot(t,Conv(i,:))
end
legend('(1,1)','(1,2)','(1,3)','(2,1)','(2,2)','(2,3)','(3,1)','(3,2)','(3,3)','(4,1)','(4,2)','(4,3)')
print('Plot\Convergenceplot_4_World_2','-dpng')

M = reshape(charPi, MAX_Y, MAX_X)';
for i=1:MAX_X
E(:,i)=M(i,:);
Policy(:,i)= flip(E(:,i));
end

X = reshape(U, MAX_Y, MAX_X)';
for i=1:MAX_X
I(:,i)=X(i,:);
Utility(:,i)= flip(I(:,i));
end

writematrix(Utility,'DATA\Utility_4.txt','Delimiter','bar');
disp("Utility 4 :");
type 'DATA\Utility_4.txt';
writematrix(Policy,'DATA\Policy_4.txt','Delimiter','tab');
disp("Policy 4 :");
type 'DATA\Policy_4.txt';

    case 5
        
t = 1:n;
figure()
hold on;
grid on;
title(['Convergence Plot - Number of iterations : ',num2str(n) ]);
xlabel('Numbers of iterations');
ylabel('Utility estimate')
for i=1:12
plot(t,Conv(i,:))
end
legend('(1,1)','(1,2)','(1,3)','(2,1)','(2,2)','(2,3)','(3,1)','(3,2)','(3,3)','(4,1)','(4,2)','(4,3)')
print('Plot\Convergenceplot_5_World_2','-dpng')

M = reshape(charPi, MAX_Y, MAX_X)';
for i=1:MAX_X
E(:,i)=M(i,:);
Policy(:,i)= flip(E(:,i));
end

X = reshape(U, MAX_Y, MAX_X)';
for i=1:MAX_X
I(:,i)=X(i,:);
Utility(:,i)= flip(I(:,i));
end

writematrix(Utility,'DATA\Utility_5.txt','Delimiter','bar');
disp("Utility 5 :");
type 'DATA\Utility_5.txt';
writematrix(Policy,'DATA\Policy_5.txt','Delimiter','tab');
disp("Policy 5 :");
type 'DATA\Policy_5.txt';

end %endswitch
end
