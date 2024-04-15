% 定义计算雅可比矩阵的函数
function J = calculateJacobian(~, x, ~, fnon, beta, k, G)
    % 使用 MATLAB 提供的 gradient 函数逼近雅可比矩阵
    % x: 当前的状态（列向量）
    % fnon: 非线性系统的函数句柄

    % 计算基准函数值
    f_base = feval(fnon, x, beta, k, G);

    % 预分配雅可比矩阵
    J = zeros(length(f_base), length(x));

    % 计算每个变量的梯度
    for i = 1:length(x)
        x_plus = x;
        x_plus(i) = x_plus(i) + 1e-6; % 使用微小增量
        f_plus = feval(fnon, x_plus, beta, k, G);
        gradient_i = (f_plus - f_base) / 1e-6;
        J(:, i) = gradient_i;
    end
end
