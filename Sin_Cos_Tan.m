clc
a = 2:20;
b = [0 1/6 1/4 1/3 1/2 2/3 1 2 0.429 0.683];
x = pi.*b;
cosx_values  = zeros(10,19);
sinx_values  = zeros(10,19);
tanx_values  = zeros(10,19);

for i = 1:19
    cosx_values(1,i) = Cosx(x(1),i);
    cosx_values(2,i) = Cosx(x(2),i);
    cosx_values(3,i) = Cosx(x(3),i);
    cosx_values(4,i) = Cosx(x(4),i);
    cosx_values(5,i) = Cosx(x(5),i);
    cosx_values(6,i) = Cosx(x(6),i);
    cosx_values(7,i) = Cosx(x(7),i);
    cosx_values(8,i) = Cosx(x(8),i);
    cosx_values(9,i) = Cosx(x(9),i);
    cosx_values(10,i) = Cosx(x(10),i);
end

for i = 1:19
    sinx_values(1,i) = Sinx(x(1),i);
    sinx_values(2,i) = Sinx(x(2),i);
    sinx_values(3,i) = Sinx(x(3),i);
    sinx_values(4,i) = Sinx(x(4),i);
    sinx_values(5,i) = Sinx(x(5),i);
    sinx_values(6,i) = Sinx(x(6),i);
    sinx_values(7,i) = Sinx(x(7),i);
    sinx_values(8,i) = Sinx(x(8),i);
    sinx_values(9,i) = Sinx(x(9),i);
    sinx_values(10,i) = Sinx(x(10),i);
end

for i = 1:19
    tanx_values(1,i) = Tanx(x(1),i);
    tanx_values(2,i) = Tanx(x(2),i);
    tanx_values(3,i) = Tanx(x(3),i);
    tanx_values(4,i) = Tanx(x(4),i);
    tanx_values(5,i) = Tanx(x(5),i);
    tanx_values(6,i) = Tanx(x(6),i);
    tanx_values(7,i) = Tanx(x(7),i);
    tanx_values(8,i) = Tanx(x(8),i);
    tanx_values(9,i) = Tanx(x(9),i);
    tanx_values(10,i) = Tanx(x(10),i);
end

figure;
hold on
grid on
plot(a,cosx_values(1,:),'b');
plot(a,cosx_values(2,:),'k');
plot(a,cosx_values(3,:),'r');
plot(a,cosx_values(4,:),'m');
plot(a,cosx_values(5,:),'g');
xlabel('No. of terms used in Taylor Series')
ylabel('Cos Values for each x values')
title('Calculating Cosx values using Taylor Series:')
legend('x=0','x=π/6','x=π/4','x=π/3','x=π/2')

figure;
hold on
grid on
plot(a,cosx_values(6,:),'b');
plot(a,cosx_values(7,:),'k');
plot(a,cosx_values(8,:),'r');
plot(a,cosx_values(9,:),'m');
plot(a,cosx_values(10,:),'g');
xlabel('No. of terms used in Taylor Series')
ylabel('Cos Values for each x values')
title('Calculating Cosx values using Taylor Series:')
legend('x=2π/3','x=π','x=2π','x=0.429π','x=0.683π')

figure;
hold on
grid on
plot(a,sinx_values(1,:),'b');
plot(a,sinx_values(2,:),'k');
plot(a,sinx_values(3,:),'r');
plot(a,sinx_values(4,:),'m');
plot(a,sinx_values(5,:),'g');
xlabel('No. of terms used in Taylor Series')
ylabel('Sin Values for each x values')
title('Calculating Sinx values using Taylor Series:')
legend('x=0','x=π/6','x=π/4','x=π/3','x=π/2')

figure;
hold on
grid on
plot(a,sinx_values(6,:),'b');
plot(a,sinx_values(7,:),'k');
plot(a,sinx_values(8,:),'r');
plot(a,sinx_values(9,:),'m');
plot(a,sinx_values(10,:),'g');
xlabel('No. of terms used in Taylor Series')
ylabel('Sin Values for each x values')
title('Calculating Sinx values using Taylor Series:')
legend('x=2π/3','x=π','x=2π','x=0.429π','x=0.683π')

figure;
hold on
grid on
plot(a,tanx_values(1,:),'b');
plot(a,tanx_values(2,:),'k');
plot(a,tanx_values(3,:),'r');
plot(a,tanx_values(4,:),'m');
plot(a,tanx_values(5,:),'g');
xlabel('No. of terms used in Taylor Series')
ylabel('Tan Values for each x values')
title('Calculating Tanx values using Taylor Series:')
legend('x=0','x=π/6','x=π/4','x=π/3','x=π/2')
axis([2 20 -10 10])

figure;
hold on
grid on
plot(a,tanx_values(6,:),'b');
plot(a,tanx_values(7,:),'k');
plot(a,tanx_values(8,:),'r');
plot(a,tanx_values(9,:),'m');
plot(a,tanx_values(10,:),'g');
xlabel('No. of terms used in Taylor Series')
ylabel('Tan Values for each x values')
title('Calculating Tanx values using Taylor Series:')
legend('x=2π/3','x=π','x=2π','x=0.429π','x=0.683π')

function cosx_value = Cosx(x,n)
     cosx=0;
     for i = 0:n
         cosx = cosx +  ((-1)^i)*(x^(2*i))/(factorial((2*i)));
     end
     cosx_value = cosx;
end

function sinx_value = Sinx(x,n)
     sinx=0;
     for i = 0:n
         sinx = sinx +  ((-1)^i)*(x^(2*i+1))/(factorial((2*i+1)));
     end
     sinx_value = sinx;
end

function tanx_value = Tanx(x,n)
     tanx_value = Sinx(x,n)/Cosx(x,n);
end

function fact = factorial(a)
   if (a <= 0)
       fact = 1;
   else 
       fact = factorial(a-1) * a;
   end
end