%% Ruthvik Bommena
% February 9th, 2023
% Function to calculate Stumpff function S(z)

function S = stumpffS(z)

    if z>0
        S = (sqrt(z)-sin(sqrt(z)))/(sqrt(z))^3;
    elseif z<0
        S = (sinh(sqrt(-z))-sqrt(-z))/(sqrt(-z))^3;
    else
        S = 1/6;
    end

end