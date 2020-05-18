clear

p_cr = 20;
tau1 = 10;
p1 = 9;
tau2 = 16;
p2 = 7;
V = 10;
q = 1;

a_1 = p_cr/(tau1*tau1*p1*p1*V*q);
a_2 = p_cr/(tau2*tau2*p2*p2*V*q);
b0 = p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*V*q);
c_1 = (p_cr-p1)/(tau1*p1);
c_2 = (p_cr-p2)/(tau2*p2);

microStep0 = 0.002;

x0=[2; 1];
t_interval = [0 30];

function dXdt = modelcompanies(t,X,a1,a2,b,c1,c2,microStep)

    dx1 = (c1/c1)*X(1) - (a1/c1)*X(1)*X(1) - (b/c1+microStep)*X(1)*X(2);
    dx2 = (c2/c1)*X(2) - (a2/c1)*X(2)*X(2) - (b/c1)*X(1)*X(2);

    dXdt = [dx1; dx2];
end

[t0, X0] = ode45(@(t, X) modelcompanies(t,X,a_1,a_2,b0,c_1,c_2, microStep0), t_interval, x0);

plot(t0,X0(:,1), 'r')
hold on
plot(t0,X0(:,2), 'b')
hold off
