function [pos,rot]    = ForwardKinematics(q,tool_offset)
% This block supports the Embedded MATLAB subset.
% See the help menu for details. 

% Link lengths
L1 = .132;
L2 = .132;

%Define A-matrices
%A1= DH(theta ,d ,a ,alpha)
A1 = DH(q(1), 0, 0, -pi()/2);
A2 = DH(q(2), 0, L1, 0);
A3 = DH(q(3)-pi/2, 0, L2, 0);

%Define T Matrices
T01=A1;
T02=T01*A2;
T03=T02*A3;

%tool_offset given with respect to frame 3.
T_tool=T03*tool_offset;
rot=T_tool(1:3,1:3);
pos=T_tool(1:3,4);


end

function A = DH(theta, d, a, alpha)

A_R_z = [cos(theta) -sin(theta) 0 0;
         sin(theta) cos(theta) 0 0;
         0 0 1 0;
         0 0 0 1];

A_T_z = [1 0 0 0;
         0 1 0 0;
         0 0 1 d;
         0 0 0 1];
     
  

A_T_x = [1 0 0 a;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];

A_R_x = [1 0 0 0;
         0 cos(alpha) -sin(alpha)  0;
         0 sin(alpha) cos(alpha) 0;
         0 0 0 1];

A = A_R_z*A_T_z*A_T_x*A_R_x;

end