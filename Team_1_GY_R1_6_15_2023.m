%%
close all;clear all;clc;

g=9.81;
h=10;
fvx=100;
fvy=100;
fb=1000;
dt=0.01;
m=50;

t=0:dt:3; %%시간

flag=0;
kt=1;
threshold=0.1;


while flag==0
    x_a(kt)=0;
    y_a(kt)=h-0.5*g*t(kt)^2;% h부터 0까지 높이 변화
    v_x_a(kt)=0;
    v_y_a(kt)=-g*t(kt);
    if abs(y_a(kt)) < threshold
        flag=1;
    else
        kt=kt+1;
    end
end

t_a=t(1:kt);% 시간에서 1열부터 kt열까지 t_a에 저장


%%
% 10 ~ 0 구간
figure(1)
for k=1:length(t_a)

subplot(1,2,1) %% 공 낙하 
plot(x_a(k), y_a(k),'or','markersize',20);
xlim([-10 10]); ylim([-h 2*h]);

subplot(1,2,2)%% 시간에 따른 높이 변화
plot(t_a(k), y_a(k),'-xk','LineWidth',2);
hold on; grid on;
xlim([0 3]); ylim([-h 2*h]);
pause(0.01);

end
%%



v_ox=v_x_a(kt);
v_oy=v_y_a(kt);
t_b=0:dt:100;

flag2=0;
k2=1;


threshold2=0.1;
while flag2==0

    x_b(k2)=v_ox*t_b(k2)-0.5*fvx/m*t_b(k2)^2;
    y_b(k2)=v_oy*t_b(k2)+0.5*((fvy+fb)/m-g)*t_b(k2)^2; % 0부터 수면까지 높이 변화
    disp(y_b);
    if y_b(k2) > 0
        flag2=1;
    else
        k2=k2+1;
    end
end



%%
figure(1)

for k=1:k2
subplot(1,2,1) %% 공 낙하 
plot(x_b(k), y_b(k),'or','markersize',20);
xlim([-10 10]); ylim([-h 2*h]);


subplot(1,2,2)%% 시간에 따른 높이 변화
plot(t_b(k), y_b(k),'-xk','LineWidth',2);%이어서 시간변화 생각해야 할
hold on; grid on;
xlim([0 3]); ylim([-h 2*h]);
pause(0.01);
end
%%