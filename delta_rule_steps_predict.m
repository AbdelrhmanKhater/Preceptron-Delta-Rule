function [] = delta_rule_steps_predict(inp, out, beta)
[m n] = size(inp);
w = [];
s = -1;
for (i = 1:n)
    w(i) = rand(1);
end
e = 0;
while (e < 100)
    for (i = 1:m)
        y = 0;
        for (j = 1:n)
            y = y + inp(i,j) * w(j);
        end
        s = y;
        error = out(i) - s;
        for (j = 1:n)
            w(j) = w(j) + beta * error * inp(i, j);
        end
    end
e = e + 1; 
end
t = -5:0.0001:5;
y =  w(1).* t;
figure
hold
plot(t, y);     
plot(inp, out, 'rx');
xlim([-5 5]);
ylim([-5 5]);