%%
%data
x = load('data.txt');
x1 = load('data1.txt');
in = x(:,[2 3]);
out = x(:, 4);
in1 = x1(:, 2);
out1 = x1(:, 3);
%%
%classification
preceptron_func(in, out);
delta_rule_steps(in, out, 0.2);
%%
%prediction
delta_rule_steps_predict(in1, out1, 0.3);
delta_rule_batch(in1, out1, 0.2);