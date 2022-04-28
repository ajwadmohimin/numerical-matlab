%{ 
Langrange's Interpolation Method

Theory:
f(x)=sum of ((prod(x-xj)*yi/(prod(xi-xj)) ; j not = i
%}
%Data Collection Section
gr_n=input('Group Number ');
x=[5 6 9 11];
y=[12 13 14 gr_n];
xq=input('Enter the X-coordinate of query point ');
%Langrange Interpolation Section
sum=0;
for i=1:length(x)
    n=1; %for numerator terms
    d=1; %for denominator terms
    for j=1:length(x)
        if  i ~=j % in the formula the term when i becomes = j is skipped.
            n=n*(xq-x(j)); 
            d=d*(x(i)-x(j));
        end
    end
    sum= sum+ (n*y(i)/d); %this is the result
end
%Result Printing
fprintf("\ny(%4.2f) = %4.2f\n",xq,sum);