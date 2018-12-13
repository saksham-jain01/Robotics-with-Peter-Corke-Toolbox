function tool_offset = getToolOffset(Encoders)

%convert encoder values to angles using bias and gain
bias = [-2048 -2654 -2048];
gain = [2*pi()/4915 2*pi()/4096 2*pi()/4915];
Angle = (Encoders' + bias).*gain;

% convert the angle to the positive rotation convention defined
% by DH parameters
pos_rot = [-1 1 1];
joint_offset = [0 -(40-180)*pi/180 0];
Joint456 = Angle.*pos_rot + joint_offset;

%pick off theta4 and theta5
theta4 = Joint456(1);
theta5 = Joint456(2);

% The orientation of the tool offset matrix is given two successive
% rotations about x and z axis. 
RotZ = [cos(theta5) -sin(theta5) 0; sin(theta5) cos(theta5) 0; 0 0 1];
RotX = [1 0 0; 0 cos(theta4) -sin(theta4); 0 sin(theta4) cos(theta4)];
R = RotX*RotZ; % R is the rotation matrix of the tool offset matrix with respect to frame 3

% with respect to frame 3, the tool is 0.039m in the x-direction. Convert
% this vector to tool frame coordinates
tool_pos =R * [.039; 0; 0];

%create a Tool_offset transformation matrix. Use Identity matrix for
%rotation to show that the end effector frame and frame 3 are always
%aligned
I = [1 0 0; 0 1 0; 0 0 1];
tool = cat(2,I,tool_pos);
tool_offset = cat(1,tool,[0 0 0 1]);

