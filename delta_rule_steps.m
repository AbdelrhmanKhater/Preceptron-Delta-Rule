function [] = delta_rule_steps(inp, out, beta)
[m n] = size(inp);
w = [];
s = -1;
sth = -1;
for (i = 1:n)
    w(i) = rand(1);
end
e = 1;
while (e == 1)
    e = 0;
    for (i = 1:m)
        y = 0;
        for (j = 1:n)
            y = y + inp(i,j) * w(j);
        end
        s = y;
        if (s > 0)
            sth = 1;
        else
            sth = 0;
        end
        if (sth ~= out(i))
            error = out(i) - s;
            for (j = 1:n)
                w(j) = w(j) + beta * error * inp(i, j);
            end
        end
    end
    for (i = 1:m)
        y = 0;
        for (j = 1:n)
            y = y + inp(i,j) * w(j);
        end
        s = y;
        if (s > 0)
            sth = 1;
        else
            sth = 0;
        end
        if (sth ~= out(i))
          e = 1; 
        end
    end 
end
t = -2:0.0001:2;
y = -1 * (w(1)/w(2)).* t;
figure
hold
plot(t, y);     
plot(inp(:,1), inp(:,2), 'rx');
xlim([-2 2]);
ylim([-2 2]);