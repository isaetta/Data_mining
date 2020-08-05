function plot_spettro(S,aSpec,name_file)
%definizione parametri di stampa
fontsize = 14;
fontname = 'Helvetica';
myscale = 0.8;
g=9.81;

%stampa primo grafico
figure()
set(gcf,'Color',[1 1 1],'Units','centimeters','Position',[0,0,19,19]/myscale)
subplot(3,1,1)
set(gca,'FontSize',fontsize,'FontName',fontname);
hold on
plot(aSpec(:,1),aSpec(:,2),'r', S(:,1), S(:,2),'k-','Markersize',3,'MarkerFaceColor','auto','LineWidth',1);
title([string(name_file)]);
xlabel('T [s]','FontSize',fontsize,'FontName',fontname);
ylabel('S_d [m]','FontSize',fontsize,'FontName',fontname);
xlim([0 S(end,1)])
box on
grid on
legend('Accelerometri','SAP')

%stampa secondo grafico
set(gcf,'Color',[1 1 1],'Units','centimeters','Position',[0,0,19,19]/myscale)
subplot(3,1,2)
set(gca,'FontSize',fontsize,'FontName',fontname);
hold on
plot(aSpec(:,1),aSpec(:,3),'r', S(:,1), S(:,3),'k-','Markersize',3,'MarkerFaceColor','auto','LineWidth',1);
xlabel('T [s]','FontSize',fontsize,'FontName',fontname);
ylabel('S_v [m/s]','FontSize',fontsize,'FontName',fontname);
xlim([0 S(end,1)])
box on
grid on
legend('Accelerometri','SAP')

%stampa terzo grafico
subplot(3,1,3)
set(gca,'FontSize',fontsize,'FontName',fontname);
hold on
plot(aSpec(:,1),aSpec(:,4)/g,'r', S(:,1),S(:,4)/g,'k-','Markersize',3,'MarkerFaceColor','auto','LineWidth',1);
xlabel('T [s]','FontSize',fontsize,'FontName',fontname);
ylabel('S_a [g]','FontSize',fontsize,'FontName',fontname);
xlim([0 S(end,1)])
box on
grid on
legend('Accelerometri','SAP')

%plot file .mat
try cd('fig_file');
catch mkdir('fig_file');
    cd('fig_file');
end
savefig(strcat(string(name_file),'.fig'));
cd ..

%print('-r600','Plotdati.png','-dpng')
end