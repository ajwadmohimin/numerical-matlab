%{
Runge-Kutta Second Order Method

Theory:
y_i+1=y_i+h*(k1+k2)/2
here, k1=f(xi,yi)
      k2=f(xi+h,yi+k1h)
Here, one thing to notice that, if we start our calculation with
yi, after single step we are getting value of y_i+1. That means,
if we start with x0, after that step we are getting the value
of f(x(0+h)) not f(x0).
%}

gr_n=input('Enter group number ');
f=@(x,y)(-2.2067*10^(-12)*(y^4-gr_n*10^8)); % defined function
x0=0; %initial time
y0=1200; %initial temperature
xf=480; %final time
h=240; %step size
fprintf("x\ty\n")
fprintf("%4.2f\t%4.2f\n",x0,y0);
while x0<xf
    k1=f(x0,y0);
    k2=f(x0+h,y0+k1*h);
    y0=y0+h*(k1+k2)/2;
    x0=x0+h;
    fprintf("%4.2f\t%4.2f\n",x0,y0);    
end
%{
In the while loop above, the condition statement is x0<xf 
instead of x0<=xf. This is because, when we are calculating 
with x=240 we are getting the value of f(x=240+h=480).
Calculation with x=480 would yield f(x=480+h).
%}
fprintf("Result, y(%4.4f) = %4.4f\n",xf,y0)