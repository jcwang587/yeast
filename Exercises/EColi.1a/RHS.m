%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DFBAlab: Dynamic Flux Balance Analysis laboratory                       %
% Process Systems Engineering Laboratory, Cambridge, MA, USA              %
% July 2014                                                               %
% Written by Jose A. Gomez and Kai H�ffner                                %
%                                                                         % 
% This code can only be used for academic purposes. When using this code  %
% please cite:                                                            %
%                                                                         %
% Gomez, J.A., H�ffner, K. and Barton, P. I. (2014).                      %
% DFBAlab: A fast and reliable MATLAB code for Dynamic Flux Balance       %
% Analysis. BMC Bioinformatics, 15:409                                    % 
%                                                                         %
% COPYRIGHT (C) 2014 MASSACHUSETTS INSTITUTE OF TECHNOLOGY                %
%                                                                         %
% Read the LICENSE.txt file for more details.                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [lb,ub] = RHS( t,y,INFO )

% This subroutine updates the upper and lower bounds for the fluxes in the
% exID arrays in main. The output should be two matrices, lb and ub. The lb matrix
% contains the lower bounds for exID{i} in the ith row in the same order as
% exID. The same is true for the upper bounds in the ub matrix.
% Infinity can be used for unconstrained variables, however, it should be 
% fixed for all time. 

% Y1 = Volume (L)
% Y2 = Biomass EColi (gDW/L)
% Y3 = Glucose (g/L)
% Y4 = Xylose (g/L)
% Y5 = O2 (mmol/L)
% Y6 = Ethanol (g/L)
% Y7 = Penalty
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EColi
% Glucose
if (y(3)<0)
    lb(1,1) = 0;
else
    lb(1,1) = -(10.5*y(3)/(0.0027 + y(3)))*1/(1+y(6)/20);
end
ub(1,1) = 0;

% Xylose
if (y(4)<0)
    lb(1,2) = 0;
else
    lb(1,2) = -(6*y(4)/(0.0165 + y(4)))*1/(1+y(6)/20)*1/(1+y(3)/0.005);
end
ub(1,2) = 0;

% O2
lb(1,3) = -(15*y(5)/(0.024 + y(5)));
ub(1,3) = 0;

% Ethanol
lb(1,4) = 0;
ub(1,4) = Inf;
end