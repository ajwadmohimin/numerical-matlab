%{
Simpson's 1/3 Integration Method

Theory:
For a function f(x), its integral will be
=h/3((y0+yn)+(4*(sum of y_odd)+2*(sum of y_even)))
where, h= (b-a)/n
       b= upper limit
        a= lower limit
        n= segment count; needs to be an even number.
%}

gr_n=input('Enter group number ');
f=@(t)((2000*log(140000/(140000-gr_n*t)))-(9.8*t)); %defined function
a=8; %lower limit
b=30; %upper limit
%n=input('Number of segment.Should be Even Number ');
n=10; %n= number of segments; needs to be an even number.
h=(b-a)/n; % increment of the points or x.
x=a:h:b; % array of the points or x.
%odd calculation
f_odds=0; %summation of odd terms
for i=3:2:length(x)-1
    f_odds=f_odds+f(x(i));
end
%even calculation
f_evens=0; %summation of even term
for i=2:2:length(x)-1
    f_evens=f_evens+f(x(i));
end
%total integral
%{
 In our textbooks, indexing starts from 0.
 But in case of MATLAB, it starts from 1. So, there'll be a shift
 in the indices. The summation of the odd indices in total integral formula
 of the textbook will turn into summation of even indices here.
 Our code has been adapted to this.
%}
f_int=(h/3)*(f(a)+f(b)+2*f_odds+4*f_evens)