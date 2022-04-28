%{
Gauss Elimination Method

Theory:
Gauss Elimination consists of 2 main steps.
    1. Forward Elimination:
        (AB_i+1,j)-(a_i+1,j/a_ii)(AB_ij)
    2. Backward Substitution:
        x_i=(AB_i,n-sum(AB_i,j,j not equal i or n))/AB_i,i
%}
gr_n=input('Enter Group Number ');
%coefficient matrix
a= [1 1 1;
    1 2 3;
    1 3 2;];
%unknown matrix
x=zeros(3,1);
%right hand side matrix
b=[gr_n;
    0;
    3];

%AB=[a|b]  matrix
AB=[a b]
[n,col]= size(AB); % n gets the row count and col gets the columns count
% step 1: Forward Elimination
for i=1:n-1
    for j=i+1:n
       c=AB(j,i)/AB(i,i);
       AB(j,:)=AB(j,:)-c*AB(i,:);
    end
end
AB %matrix after forward elimination

%step2: Backward Substitution
x(n)=(AB(n,col))/AB(n,n); %x_n result
for i=length(x)-1:-1:1
    sumc= (AB(i,1:col-1)*x);
    x(i)=(AB(i,col)-sumc)/AB(i,i);
end

%result printing
x