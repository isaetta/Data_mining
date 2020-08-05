function spettro=fun_spettro_v2_temporanea(uppg,Dt,Tmax,flagplot,nosc)  

%------------------------LEGENDA-------------------------
%uppg       Vettore riga-Accelerazione terreno          [m/s]
%Dt         Scalare-Time step acceleraioni              [s]   
%Tmax       Scalare-Massimo periodo (4s)                [s]   
%flagplot   Binario (0-1)-1 stampa gli spettri          [-]   
%nosc       Scalare-Numero di punti di campionamento    [-]   

%-------------------------DATI---------------------------
xi=0.05;    %Smorzamento dello spettro          (5%)
Tmin=0;     %Punto di partenza dello spettro    (0 s)

%--------------------INIZIALIZZAZIONI---------------------
n=length(uppg);
t=0:Dt:(n-1)*Dt;
uppg=[t',uppg'];
Sd=NaN(nosc,4);
DT=((Tmax-Tmin)/(nosc)^4)^0.25;     %campionamento più fitto a periodi bassi


for l=1:nosc
    %Risolve il problema dell'oscillatore lineare smorzato
    T=Tmin+(l*DT)^4;
    omega=2*pi/T;
    [u]=differenze_interpolate(uppg,Dt,n,xi,omega,0);
    
    Sd(l,1)=T;                      %Periodo
    Sd(l,2)=max(abs(u(:,2)));       %Spostamento
    Sd(l,3)=Sd(l,2)*(2*pi/T);       %Pseudo-velocità
    Sd(l,4)=Sd(l,2)*(2*pi/T)^2;     %Pseudo-accelerazione
end

Tout=Sd(:,1);
Sdisp=Sd(:,2);
Svel=Sd(:,3);
Sacc=Sd(:,4);

%********************STAMPA E CONTROLLI DELLA SOLUZIONE********************
if flagplot==1
    plot_spettro(Sd,fSpec)
end

spettro=[Tout,Sdisp,Svel,Sacc];

end