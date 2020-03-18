function [sys, x0, str, ts] = myfunc3(t,x,u,flag)
switch flag
    case 0
        [sys,x0,str,ts]=mdlIntializeSizes;
    case 1
        sys=mdlDerivatives(x,u,t);
    case 3
        sys=mdlOutputs(x,u,t);
    case {2, 4, 9}
        sys=[];
    otherwise
        error(['Unhandled flag = ', num2str(flag)]);
end
end

function [sys, x0, str, ts] = mdlIntializeSizes
sizes=simsizes;

sizes.NumContStates=1;
sizes.NumOutputs = 1;
sizes.NumInputs = 0;

sizes.NumDiscStates=0;
sizes.DirFeedthrough=0;
sizes.NumSampleTimes=1;
sys=simsizes(sizes);
str=[];
ts=[0 0];
x0= -0.1;
end

    function sys=mdlDerivatives(x,u,t)
        sys= nthroot(x,3);
        
    end
    function sys=mdlOutputs(x,u,t)
        sys=x;
    end





