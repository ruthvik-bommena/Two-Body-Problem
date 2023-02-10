%% Ruthvik Bommena
% February 9th, 2023
% Function to calculate Stumpff function C(z)

function C = stumpffC(z)

    if z>0
        C = (1-cos(sqrt(z)))/-z;
    elseif z<0
        C = (cosh(sqrt(-z))-1)/-z;
    else
        C = 1/2;
    end

end