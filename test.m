clear all;
clc;
close all;

f = @(x, y) sin(2*pi*x).*sin(2*pi*y);

Np = 100;
xp = linspace(0, 1, Np);
yp = linspace(0, 1, Np);
[X, Y] = meshgrid(xp, yp);
Z = f(X, Y);

figure(1)
subplot(1, 3, 1)
mesh(X, Y, Z)
zlim([-1 1])

Ns = 50;
RBFtype = 'CP_C6';
R = 2.5;
xs = [rand(Ns, 1), rand(Ns, 1)];
ys = sin(2*pi*xs(:, 1)).*sin(2*pi*xs(:, 2));

N = 70;
XX = reshape(X, Np*Np, 1);
YY = reshape(Y, Np*Np, 1);

%%x = [rand(N, 1), rand(N, 1)];

y = RBFinterp(xs, ys, [XX, YY], RBFtype, R);
z = reshape(y, Np, Np);

%tr = delaunay(x(:, 1), x(:, 2));
figure(1)
subplot(1, 3, 2)
mesh(X, Y, z)
zlim([-1 1])
%trisurf(tr, x(:, 1), x(:, 2), y)

error = z-Z;
subplot(1, 3, 3)
mesh(X, Y, error)


f2 = @(x) sin(20*pi*x);
xs = rand(Ns, 1);
xs = linspace(0, 1, Ns)';
xs = sort(xs);
ys = f2(xs);

x = linspace(0, 1, N)';
y = RBFinterp(xs, ys, x, RBFtype, R);

xss = linspace(0, 1, 1000)';
yss = f2(xss);

figure(2)
plot(xss, yss, 'r')
hold on
plot(xs, ys, 'ro')
plot(x, y, 'b')

