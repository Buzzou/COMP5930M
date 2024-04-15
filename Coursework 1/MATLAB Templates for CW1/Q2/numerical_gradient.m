% 定义梯度函数
function g = numerical_gradient(f, x, beta, k, G)
    n = length(x);
    g = zeros(n, 1);
    epsilon = 1e-6; % 微小增量
    f_base = feval(f, x, beta, k, G); % 计算基准函数值
    f_plus = feval(f, x + epsilon, beta, k, G);
    g = (f_plus - f_base) / epsilon;
end
