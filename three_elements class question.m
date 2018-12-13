for i = 1:3
   disp('first row then column');
   for j = 1:2
       A(i,j) = input('enter value');
   end
   value(i) = input('enter element value');
end
syms a11 a12 a13 b21 b22 b23 c31 c32 c33;
r = [a11 a12 a13; b21 b22 b23; c31 c32 c33];
for i = 1:3
    r(A(i,1),A(i,2)) = value(i);
end
