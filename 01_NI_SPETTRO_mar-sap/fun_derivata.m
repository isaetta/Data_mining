function derValue=fun_derivata(valMarker)  

timeStep = 1/200;

for ii=2:(length(valMarker)-1)
    derValue(ii) = ((valMarker(ii+1) + valMarker(ii-1) - 2*valMarker(ii)) / timeStep^2) *10^(-3);
end

derValue(1) = 0;
derValue(ii+1) = 0;

% [m/s^2]