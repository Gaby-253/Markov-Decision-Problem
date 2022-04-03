function [W,S,P,G,R,F,T]=read_f3(filename)

fid = fopen(filename);
i = 0;
while ~feof(fid)
    
    tline = fgetl(fid);
    a = findstr(tline,'W');
    if ~isempty(a)
        W(1) = str2num(tline(a+1:a+2));
        W(2) = str2num(tline(a+3:a+4));
    end
    
    a = findstr(tline,'S');
    if ~isempty(a)
        S(1) = str2num(tline(a+1:a+2));
        S(2) = str2num(tline(a+3:a+4));
    end
    
    a = findstr(tline,'P');
    if ~isempty(a)
        P(1) = str2num(tline(a+1:a+4));
        P(2) = str2num(tline(a+5:a+8));
        P(3) = str2num(tline(a+9:a+12));
    end
    
    a = findstr(tline,'G');
    if ~isempty(a)
        G = str2num(tline(a+1:a+4));
    end
    
    a = findstr(tline,'R');
    if ~isempty(a)
        R = str2num(tline(a+1:a+6));
    end
    
    a = findstr(tline,'F');
    if ~isempty(a)
        F(1) = str2num(tline(a+1:a+2));
        F(2) = str2num(tline(a+3:a+4));
    end
    
    a = findstr(tline,'T');
    
    if ~isempty(a)
        i=i+1;
        T(1,i) = str2num(tline(a+1:a+2));
        T(2,i) = str2num(tline(a+3:a+4));
        T(3,i) = str2num(tline(a+5:length(tline)));
    end
    
    length(tline);
       
end

fclose(fid);

end