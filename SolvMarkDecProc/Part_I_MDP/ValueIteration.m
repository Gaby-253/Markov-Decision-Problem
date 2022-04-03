function new_up_pi = ValueIteration(xval,yval,POINTS,Ra,gamma,p1,p2,p3)

actions=[];

R=POINTS(:,3);
Up=POINTS(:,4);
U=POINTS(:,5);
Pi=POINTS(:,6);

sink=find(POINTS(:,3)==0);%row no. of sink point in POINTS
xSink=POINTS(sink(1),1);
ySink=POINTS(sink(1),2);

Xmax=max(POINTS(:,1));
Ymax=max(POINTS(:,2));

for k=1:size(POINTS,1)
    if (POINTS(k,1)==xval && POINTS(k,2)==yval)
        if R(k)~=Ra %If at a sink state or unreachable state 'terminals' , use that value
            Up(k)=R(k);
        else %use Bellman equation  "computed using U(s), not U'(s))"
            aN= aNorth(xval,yval,xSink,ySink,Ymax,U,POINTS,k);
            aS= aSouth(xval,yval,xSink,ySink,U,POINTS,k);
            aW= aWest(xval,yval,xSink,ySink,U,POINTS,k);
            aE= aEast(xval,yval,xSink,ySink,U,Xmax,POINTS,k);
                      
            actions(1)= aN*p1 + aW*p2 + aE*p3;
            actions(2)= aS*p1 + aW*p2 + aE*p3;
            actions(3)= aW*p1 + aS*p2 + aN*p3;
            actions(4)= aE*p1 + aS*p2 + aN*p3;
            
            best= maxindex(actions);
            
            Up(k)= R(k) + gamma*actions(best);
                       
            %-------Update Pi 'Policy'
            if best==1
               Pi(k)='^';
            else if best==2
                    Pi(k)='v'; 
                else if best==3
                        Pi(k)='<';
                    else
                        Pi(k)='>';
                    end
                end
            end
            %-------
            
        end
        
    end
end

new_up_pi=[Up,Pi];

end

