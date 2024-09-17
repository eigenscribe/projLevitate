%% Part1 - Create Graph
nodes = {'Keter' 'Chochma' 'Binah' 'Chesed' 'Gevurah' ...
    'Tiferet' 'Netzach' 'Hod' 'Yesod' 'Malchut'}';

A = [0 1 1 0 1 0 0 0 0 0; ...
     1 0 1 0 1 1 0 0 0 0; ...
     1 1 0 1 1 0 0 0 0 0; ...
     0 0 1 0 1 1 0 1 0 0; ...
     1 1 1 1 0 1 1 1 1 0; ...
     0 1 0 1 1 0 1 0 0 0; ...
     0 0 0 0 1 1 0 1 1 1; ...
     0 0 0 1 1 0 1 0 1 1; ...
     0 0 0 0 1 0 1 1 0 1; ...
     0 0 0 0 0 0 1 1 1 0];

[V,D]=eig(A);

G_nodes = graph(A,nodes);
G = graph(A)

[cycles,edgecycles] = cyclebasis(G);
figure
tiledlayout flow
for k = 1:length(cycles)
    nexttile
    highlight(plot(G),cycles{k},'Edges',edgecycles{k},'EdgeColor','r','NodeColor','r')
    title("Cycle " + k)
end

figure
whitebg([1 1 1])
set(gcf,'inverthardcopy','off')
h = plot(G);
colormap cool
nColors = degree(G);
h.NodeCData= nColors;
h.MarkerSize = 10;

%% Part 2 - Implement Kuramoto Model

N = length(A); %number of oscillators
% a1 = 2;  
% b1 = 2; 
% W = (betarnd(a1,b1,1,N));
W = linspace(2*pi/10,2*pi,10);
W = [0.6283    0.6283    4.3982    1.8850    3.1416    1.8850    2.5133    1.8850  1.8850    2.5133];
% [~,idx] = sort(rand(size(W)));
% for i = 1:N
%  
%     W(idx==i) = W(i);
% end
% disp(W);
% out = abc(sub2ind(size(W),idx,ones(size(W,1),1)*(1:size(W,2))));

 a2 = 1;
 b2 = 1;
 P0 = (2*pi*betarnd(a2,b2,1,N)) - pi; 

figure
subplot(2,1,1)
h_W = histogram(W);
grid on
h_W.FaceColor = [0, 0.4470, 0.7410];
title('Intrinsic Frequency Distribution','Interpreter',"latex")
xlabel('$g(\omega)$','Interpreter',"latex");

subplot(2,1,2)
h_P0 = histogram(P0,(-pi:2*pi/20:pi));
grid on
h_P0.FaceColor = [0.4940, 0.1840, 0.5560];
title('Initial Phase Conditions','Interpreter',"latex")
xlabel('$\theta(0)_i$','Interpreter',"latex")

K = 1; %coupling constant
Kn = K/N; %coupling strength
tmax = 500; 

dPdt = @(P,W,A) W'+(1./N).*sum((A).* sin(meshgrid(P)-(meshgrid(P)')),2);
[T,P] = ode45(@(t,p)dPdt(p,W,A),[0 tmax],P0);

P2 = mod(P,2*pi); %rewrite P matrix entries in mod P
q = exp(1i*P); 
q_sum = sum(q,2)/N;
r_sum = abs(sum(q,2)/N); 

figure
rows = size(P,1);
for idx = 1:rows %length(P)

    subplot(2,2,1)
    colormap cool 
    scatter(cos(P(idx,:)), sin(P(idx,:)), 250, 1:N,'.');
    grid on
    xlabel('$cos(\theta_i$)','Interpreter','latex');
    ylabel('$sin(\theta_i$)','Interpreter','latex');
    xlim([-1.5 1.5]); 
    ylim([-1.5 1.5]);

    subplot(2,2,2)
    scatter(T(idx)*ones(size(P(idx,:))), P(idx, :), 250, 1:N, '.'); 
    hold on
    grid on
    xlabel('time $t$','Interpreter','latex');
    ylabel('$\theta_i(t)$','Interpreter','latex');

    subplot(2,2,3)
    t = 0:pi/50:2*pi;
    R = 1;
    x = R.*cos(t);
    y = R.*sin(t);
    plot(x,y,'color',[0.8500, 0.3250, 0.0980])
    grid on
    hold on
    xlim([-1.5 1.5])
    ylim([-1.5 1.5])
    plot(q_sum(idx),'o','color',[0, 0.4470, 0.7410]); 
    xlabel('$e^{i\theta_j}$', 'interpreter', 'latex')
    ylabel('$\sum{e^{i\theta_j}}/N$', 'interpreter', 'latex')

    subplot(2,2,4)
    plot(T(idx), r_sum(idx),'o','color',[0, 0.4470, 0.7410]);
    grid on
    hold on
    xlabel('time $t$','Interpreter',"latex");
    ylabel('$R = |\sum{e^{i\theta_j(t)}}/N|$', 'interpreter', 'latex')
    ylim([0 1.5]);

    drawnow; 
    pause(0.1); 
end
