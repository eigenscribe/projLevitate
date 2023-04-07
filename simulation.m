clc
clear
close all

%% Parameters
N = 10; %number of oscillators

%Create a beta distribution of intrinsic frequrencies for each oscillator 
    a1 = 2;  
    b1 = 2; 
    W = (betarnd(a1,b1,1,N));
%Create beta distribution of initial conditions for oscillator position
    a2 = 1;
    b2 = 1;
    P0 = (2*pi*betarnd(a2,b2,1,N)) - pi; 
    
K = 2; %coupling constant
Kn = K/N; %coupling strength
tmax = 500; 

%% Plot the PDFs for the intrinsic frequencies and the initial conditions
figure
reset(gcf)
whitebg([1 1 1])
subplot(2,1,1)
h_W = histogram(W);
grid on
h_W.FaceColor = [0, 0.4470, 0.7410];
xlabel('Intrinsic Frequency Distribution (g(\omega))');

subplot(2,1,2)
h_P0 = histogram(P0,[-pi:2*pi/20:pi]);
grid on
h_P0.FaceColor = [0.4940, 0.1840, 0.5560];
xlabel('Initial Conditions for \theta_i')

%% Create Graph Object
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
 figure
 G = graph(A,nodes);
 h = plot(G);
    h.MarkerSize = 10;
    
