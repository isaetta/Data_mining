%Risolve le equazioni del moto con il metodo dell'interpolazione della
%sollecitazione
%RIFERIMENTO-Chopra cap5.2

function [u]=differenze_interpolate(uppg,Dt,n,xi,omega,tini)

%HP: m=1, c varia, k=m*omega^2
%********************COSTANTI********************
omegaD=omega*(1-xi^2)^(0.5);
cradq=(1-xi^2)^0.5;
cexp=exp(-xi*omega*Dt);
csin=sin(omegaD*Dt);
ccos=cos(omegaD*Dt);
k=omega^2;

A=cexp*((xi/cradq*csin+ccos));
B=cexp*(csin/omegaD);
C=1/k*(2*xi/(omega*Dt)+cexp*( ((1-2*xi^2)/(omegaD*Dt)-xi/cradq)*csin-(1+2*xi/(omega*Dt))*ccos));
D=1/k*(1-2*xi/(omega*Dt)+cexp*((2*xi^2-1)/(omegaD*Dt)*csin+2*xi/(omega*Dt)*ccos));
Ap=-cexp*csin*omega/cradq;
Bp=cexp*(ccos-xi/cradq*csin);
Cp=1/k*(-1/Dt+cexp*((omega/cradq+xi/(Dt*cradq))*csin+1/Dt*ccos));
Dp=1/(k*Dt)*(1-cexp*(xi/cradq*csin+ccos));

%********************INIZIALIZZAZIONE********************
u=NaN(n,2);           %Tempo-Posizione
up=NaN(n,2);

%********************SOLUZIONE********************
%CONDIZIONI INIZIALI
u(1,1)=tini;
u(1,2)=0;
up(1,1)=tini;
up(1,2)=0;
%SOLUZIONE
for i=0:n-2
    k=i+1;
    ui=u(k,2);
    upi=up(k,2);
    pi=-uppg(k,2);      
    pi1=-uppg(k+1,2); 
    u(k+1,1)=tini+i*Dt;
    up(k+1,1)=tini+i*Dt;
    u(k+1,2)=A*ui+B*upi+C*pi+D*pi1;
    up(k+1,2)=Ap*ui+Bp*upi+Cp*pi+Dp*pi1;
end

end
