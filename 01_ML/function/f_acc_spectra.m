function [out] = f_acc_spectra(t,acc,disp_in,vel_in) 
% t         [Nx1] time vector
% acc       [Nx1] acc vector
% disp_in   [1x1]
% vel_in    [1x1]
[y_raw,v_raw,acc_raw] = integrazione_accelerogramma(t,acc,disp_in,vel_in);
    y=y_raw;
    v=v_raw;
    acc=acc_raw;
    Tmax = 4; % period max 4 s
plot_accelerogramma(t,y,v,acc)
[Tout,Sdisp,Svel,Sacc] = spettro([t';acc']',length(acc),Tmax,1,400);   

out.T = Tout;
out.Sdisp = Sdisp;
out.Svel = Svel;
out.Sacc = Sacc;
out.acc = acc;
out.vel = v;
out.disp = y;

%% INTEGRAZIONE
function [y,v,vp]=integrazione_accelerogramma(t,acc,y0,v0)
%Integra accelerogramma con Runge Kutta
%t      -vettore    -tempo
%acc    -vettore    -accelerazioni
yp= inline('v','t','x','v');
vp=acc;
n=length(acc);
dt=t(2)-t(1);
y(1:n)= y0;
v(1:n)= v0;
    for k=1:n-1
        [y(:,k+1),v(:,k+1)]= Runge_Kutta_Sis(yp,vp,t,y(:,k),v(:,k), dt,k);
    end 
end
%% RUNGE KUTTA
function [y,v]= Runge_Kutta_Sis(f,g,x,y,v,h,k)
%FUNZIONE Runge-Kutta di IV per equazioni del moto con accelerazione
%imposta
%f= Prima funzione al secondo membro
%g= Seconda funzione al secondo membro
%x= variabile indipendente
%y= Soluzione in output per f
%v= Soluzione in output per g
%h= Passo
           K0= h*f(x,y,v);
           M0= h*g(k);
           K1= h*f(x+h/2,y+K0/2,v+M0/2);
           M1= h*((g(k)+g(k+1))/2);
           K2= h*f(x+h/2,y+K1/2, v+M1/2);
           M2= h*((g(k)+g(k+1))/2);           
           K3= h*f(x,y+K2,v+M2);
           M3= h*g(k);
           y= y+(K0+2*K1+2*K2+K3)/6;
           v= v+(M0+2*M1+2*M2+M3)/6;
end
%% SPETTRO
function [Tout,Sdisp,Svel,Sacc]=spettro(uppg,n,Tmax,flagplot,nosc)
xi=0.05;
Tmin=0;                             %Estensione
Dt=uppg(2,1)-uppg(1,1);

DT=((Tmax-Tmin)/(nosc)^4)^0.25;
Sd=NaN(nosc,4);

for l=1:nosc
    T=Tmin+(l*DT)^4;
    omega=2*pi/T;
    [u]=differenze_interpolate(uppg,Dt,n,xi,omega,0);
    %         if T>=Tplot && T<Tplot+2*DT
    %             plot_spost(u,'t [s]','x(t) [m]',T)
    %         end
    Sd(l,1)=T;
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
    plot_spectra(Sd)
end
end
%% Integrazione con differenze Chopra
function [u]=differenze_interpolate(uppg,Dt,n,xi,omega,tini)
%Risolve le equazioni del moto con il metodo dell'interpolazione della
%sollecitazione
%Chopra cap5.2

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

%% Plot time history
function plot_accelerogramma(t,y,v,vp)

fontsize = 14;
fontname = 'Helvetica';
myscale = 0.9;

figure(1)
set(gcf,'Color',[1 1 1],'Units','centimeters','Position',[0,0,19,19]/myscale)
subplot(3,1,1)
set(gca,'FontSize',fontsize,'FontName',fontname);
hold on
plot(t,y,'k-','LineWidth',1)
xlabel('Time [s]','FontSize',fontsize,'FontName',fontname);
ylabel('Displacement [m]','FontSize',fontsize,'FontName',fontname);
xlim([0,t(end)])
box on
grid on
subplot(3,1,2)
set(gca,'FontSize',fontsize,'FontName',fontname);
hold on
plot(t,v,'k-','LineWidth',1)
xlabel('Time [s]','FontSize',fontsize,'FontName',fontname);
ylabel('Velocity [m/s]','FontSize',fontsize,'FontName',fontname);
xlim([0,t(end)])
box on
grid on
subplot(3,1,3)
set(gca,'FontSize',fontsize,'FontName',fontname);
hold on
plot(t,vp,'k-','LineWidth',1)
xlabel('Time [s]','FontSize',fontsize,'FontName',fontname);
ylabel('Acceleration [m/s^2]','FontSize',fontsize,'FontName',fontname);
xlim([0,t(end)])
box on
grid on

end

%% Plot spectra
function plot_spectra(S)
global g
%definizione parametri di stampa
fontsize = 14;
fontname = 'Helvetica';
myscale = 0.9;

%stampa primo grafico
figure()
set(gcf,'Color',[1 1 1],'Units','centimeters','Position',[0,0,19,19]/myscale)
subplot(3,1,1)
set(gca,'FontSize',fontsize,'FontName',fontname);
hold on
plot(S(:,1), S(:,2),'k-','Markersize',3,'MarkerFaceColor','auto','LineWidth',1);
xlabel('T [s]','FontSize',fontsize,'FontName',fontname);
ylabel('S_d [m]','FontSize',fontsize,'FontName',fontname);
xlim([0 S(end,1)])
box on
grid on
%stampa secondo grafico
set(gcf,'Color',[1 1 1],'Units','centimeters','Position',[0,0,19,19]/myscale)
subplot(3,1,2)
set(gca,'FontSize',fontsize,'FontName',fontname);
hold on
plot(S(:,1), S(:,3),'k-','Markersize',3,'MarkerFaceColor','auto','LineWidth',1);
xlabel('T [s]','FontSize',fontsize,'FontName',fontname);
ylabel('S_v [m/s]','FontSize',fontsize,'FontName',fontname);
xlim([0 S(end,1)])
box on
grid on
%stampa terzo grafico
subplot(3,1,3)
set(gca,'FontSize',fontsize,'FontName',fontname);
hold on
plot(S(:,1),S(:,4)/g,'k-','Markersize',3,'MarkerFaceColor','auto','LineWidth',1);
xlabel('T [s]','FontSize',fontsize,'FontName',fontname);
ylabel('S_a [g]','FontSize',fontsize,'FontName',fontname);
xlim([0 S(end,1)])
box on
grid on
%print('-r600','Plotdati.png','-dpng')
end
end