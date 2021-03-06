% Perform Bezier interpolation between two quaternions Q1 and Q2 at step size du

function qu=Q1Q2_interpolation(Q1,Q2,a,b,du)
j=1;

    q_new=slerp(a,b,du);
    q_new=slerp(slerp(slerp(Q1,a,du),q_new,du),slerp(q_new,slerp(b,Q2,du),du),du);
    if (j>1)
        q1=qu(j-1,:)*q_new';
        if (q1>0)
            qu(j,:)=q_new;
        else
            qu(j,:)=[-1 -1 -1 1].*q_new;
        end
    else
        qu(j,:)=q_new;
    end
    j=j+1;

