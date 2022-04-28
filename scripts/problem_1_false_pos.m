%{
False position Method

author: Md. Ajwad Mohimin
contact: ajwadmohimin@gmail.com

Theory:
1. Choose xL xU such that f(xL)f(xU)<0
2. Estimate root using
    xM= (xU*f(xL)-xL*f(xU))/(f(xL)-f(xU))
3. Now check and repeat step 2:
    a) if f(xL)*f(xM)<0:
        xL=xL, xU=xM
    b) if f(xL)*f(xM)>0:
        xL=xM, xU=xU
    c) if f(xL)*f(xM)=0 or <tolerance:
       xM is the root

%}

gr_n=input('Enter Group Number '); %to get group number
f=@(x)(x^3-gr_n); %given function 
%error tolerance
e=10^(-5);
%max iteration declaration. Default 999.
itr_max=999;
% to use custom max iteration number just uncomment following line
%itr_max=input('Max Iteration Number');

% take input for the Lower x and Upper x guess
xL= input('Input Guess for x1 ');
xU= input('Input Guess for x2 ');
%check for the validity of the guesses
invalid= true;
while invalid
    %fprintf("f(x1)\t f(x2) \t f(x1)f(x2) \n %4.4f \t %4.4f \t %4.4f \n",...
        %f(xL),f(xU),f(xL)*f(xU))
    if f(xL)*f(xU)>0
        fprintf("Guess Invalid.\nChoose such that f(xL)f(xU)<0 \n")
        xL= input('Input Guess for x1 ');
        xU= input('Input Guess for x2 ');
    else
        invalid= false;
    end
end

% now enter false position method loop
run= true;
itr=0; %iteration initialization
while run
    xM= (xU*f(xL)-xL*f(xU))/(f(xL)-f(xU));
    itr=itr+1;
    if f(xL)*f(xM)<0
        xU=xM;
    elseif f(xL)*f(xM)>0
        xL=xM;
    elseif abs(f(xL)*f(xM))==0
        run= false;
        converged= true;
    end
    if abs(f(xM))<e
        run= false;
        converged= true;
    end
    if itr>=itr_max
        converged=false;
        run=false;
    end
end

%result printing section
if converged==true
    fprintf("Solution Converged.\nFound root\t%10.4f\n",xM)
    fprintf("Iteration Number: %d \n",itr)    
elseif converged==false
    fprintf("Max Iteration Reached. Solution Not Converged.\nFound root \t %4.4f\n",xM)
    fprintf("Iteration Number: %d \n",itr)    
end