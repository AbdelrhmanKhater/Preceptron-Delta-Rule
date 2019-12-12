function [] = preceptron_func(x, y)
    x = [0.3 -0.6 -0.1 0.1; 0.7 0.3 -0.8 -0.45];
    y = [1 0 0 1];
    figure
    plot(x(1,:), x(2,:),'bx');
    net = perceptron;
    net = train(net, x, y);
    figure
    plotpv(x, y);
    plotpc(net.iw{1, 1}, net.b{1});
