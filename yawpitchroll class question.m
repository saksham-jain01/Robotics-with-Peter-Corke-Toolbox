disp('enter element row wise');
for i = 1:3
    for j = 1:3
        value(i,j) = input('enter values');
    end
end

phia = atan2(value(2,1),value(1,1));
phia

phio = atan2(-value(3,1),(value(1,1)*cos(phia) + value(2,1)*sin(phia)));
phio

phin = atan2((-value(2,3)*cos(phia) - value(1,3)*sin(phia)),(value(2,2)*cos(phia) - value(3,2)*sin(phia)));
phin