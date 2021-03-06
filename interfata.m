function interfata(R,C,T,E,N,D)

figure('Name','Grafic circuit RC de derivare',...
    'Units','normalized',...
    'Position',[0.05 0.05 0.8 0.8],...
    'NumberTitle','off');

set(gcf,'color', [0.9290, 0.6940, 0.1250]);
  
% Chenare

Group1=uibuttongroup('BackgroundColor',[.61 .51 .74] ,...
        'Title','Parametrii circuitului',...
        'FontWeight','b',...
        'FontSize',10,...
        'Position',[0.77 0.48 0.23 0.52],...
        'TitlePosition','centertop',...
        'Tag','radiobutton');
    
%Rezistenta

uicontrol('Style','Text',...
          'Units','Normalized',...
          'Position',[0.25,0.9,0.5,0.08],...
          'BackgroundColor','r',...
          'FontSize',10,...
          'FontWeight','b',...
          'String','Rezistenta',...
          'Parent',Group1);

uicontrol('Style','Edit',...
    'Units','Normalized',...
    'Position',[0.25,0.82,0.5,0.08],...
    'FontSize',10,...
    'String',R,...
    'Callback',['R=','str2num(get(gco,''String'')),close,interfata(R,C,T,E,N,D)'],...
    'Parent',Group1);

%Capacitatea 
 

uicontrol('Style','Text',...
    'Units','Normalized',...
    'Position',[0.25,0.73,0.5,0.08],...
    'BackgroundColor','r',...
    'FontSize',10,...
    'FontWeight','b',...
    'String','Capacitatea',...
    'Parent',Group1);

uicontrol('Style','Edit',...
    'Units','Normalized',...
    'Position',[0.25,0.65,0.5,0.08],...
    'FontSize',10,...
    'String',C,...
    'Callback',['C=','str2num(get(gco,''String'')),close,interfata(R,C,T,E,N,D)'],...
    'Parent',Group1);

%T

uicontrol('Style','Text',...
    'Units','Normalized',...
    'Position',[0.25,0.56,0.5,0.08],...
    'BackgroundColor','r',...
    'FontSize',10,...
    'FontWeight','b',...
    'String','T',...
    'Parent',Group1);

uicontrol('Style','Edit',...
    'Units','Normalized',...
    'Position',[0.25,0.48,0.5,0.08],...
    'FontSize',10,...
    'String',T,...
    'Callback',['T=','str2num(get(gco,''String'')),close,interfata(R,C,T,E,N,D)'],...
    'Parent',Group1);
%N

uicontrol('Style','Text',...
    'Units','Normalized',...
    'Position',[0.25,0.39,0.5,0.08],...
    'BackgroundColor','r',...
    'FontSize',10,...
    'FontWeight','b',...
    'String','Frecventa',...
    'Parent',Group1);

uicontrol('Style','Edit',...
    'Units','Normalized',...
    'Position',[0.25,0.31,0.5,0.08],...
    'FontSize',10,...
    'String',N,...
    'Callback',['N=','str2num(get(gco,''String'')),close,interfata(R,C,T,E,N,D)'],...
    'Parent',Group1);


%E

uicontrol('Style','Text',...
    'Units','Normalized',...
    'Position',[0.25,0.22,0.5,0.08],...
    'BackgroundColor','r',...
    'FontSize',10,...
    'FontWeight','b',...
    'String','Amplitudine',...
    'Parent',Group1);

uicontrol('Style','Edit',...
    'Units','Normalized',...
    'Position',[0.25,0.16,0.5,0.08],...
    'FontSize',10,...
    'String',E,...
    'Callback',['E=','str2num(get(gco,''String'')),close,interfata(R,C,T,E,N,D)'],...
    'Parent',Group1);

%D

uicontrol('Style','Text',...
    'Units','Normalized',...
    'Position',[0.25,0.07,0.5,0.08],...
    'BackgroundColor','r',...
    'FontSize',10,...
    'FontWeight','b',...
    'String','Perioada',...
    'Parent',Group1);

uicontrol('Style','Edit',...
    'Units','Normalized',...
    'Position',[0.25,0.0,0.5,0.08],...
    'FontSize',10,...
    'String',D,...
    'Callback',['D=','str2num(get(gco,''String'')),close,interfata(R,C,T,E,N,D)'],...
    'Parent',Group1);

%INAPOI

uicontrol('Style','pushbutton',...      
          'Units','normalized',...
          'Position',[0.92 0.02 0.08 0.08],...
          'backgroundcolor','g',...
          'foregroundcolor','black',...
          'String','INAPOI',...
          'FontName','Times New Roman',...
          'FontSize',16,...
          'Callback','close;start;');


      
Tc=D.*T;
y=0; %conditiile initiale,
for j=1:N
    d(j)=min(y); %conditiile initiale,

 [t,y]=ode45('F1',[(j-1).*T (j-1).*T+Tc],(d(j)),[],E,R,C);
 i=(E-y)./R;
 a(j)=max(y); %conditiile initiale,

 subplot('position',[0.1 0.55 0.6 0.3]);
 plot(t,y,'r');hold on;grid on;
 subplot(212);
 plot(t,i,'r');hold on;grid on;

 [t,y]=ode45('F2',[(j-1).*T+Tc j.*T],[a(j)],[],E,R,C);
 i=(-y)./R;
 subplot('position',[0.1 0.55 0.6 0.3]);
 plot(t,y,'b');hold on;
 subplot(212);
 plot(t,i,'b');hold on;
end
subplot('position',[0.1 0.55 0.6 0.3]);
ylabel('uc [V]');
xlabel('timp [s]');
subplot(212);
ylabel('ic [A]');
xlabel('timp [s]');


 
 for k=1:N 
V1=E;
V2=E;
 %creare linie orizontala (U=0)
       
        t1=[(k-1)*T,(k-1)*T+Tc];
        V1=[0,0];
 
 %creare linie orizontala (U)
       
       t2=[((k-1)*T+Tc),((k*T))]; 
       V2=[E,E] ;

 
 %creare linii vertricale
        V=[0,E];
        t3=[(k-1)*T+Tc,(k-1)*T+Tc];
        t4=[(k-1)*T;(k-1)*T];
 
 %grafic
 title('Reprezentare grafica')
  subplot('position',[0.1 0.55 0.6 0.3]); 
  plot(t1,V1,'b',t2,V2,'b',t3,V,'b',t4,V,'b');hold on;grid on;

end