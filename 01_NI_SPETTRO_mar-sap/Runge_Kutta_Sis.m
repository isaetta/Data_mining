%FUNZIONE Runge-Kutta di IV per equazioni del moto con accelerazione
%imposta

function [y,v]= Runge_Kutta_Sis(f,g,x,y,v,h,k)

%------------------------LEGENDA-------------------------
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