function [] = delta_rule_batch(inp, out, beta)
[m n] = size(inp);
w = [];
s = -1;
for (i = 1:n)
    w(i) = rand(1);
end
e = 0;
errors = [];
while (e < 100)
    for (i = 1:m)
        y = 0;
        for (j = 1:n)
            y = y + inp(i,j) * w(j);
        end
        s = y;
        errors(i) = out(i) - s;
    end
    error = 0;
    for (i = 1:m)
        error = error + (errors(i) * inp(i));
    end
    for (i = 1:n)
            w(i) = w(i) + (beta / m) * error;
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