% 定义目标函数
function f = nonlinear_equations_for_question_e(x, beta, k, G)
    n = length(x);
    f = zeros(n, 1);
    for i = 2:n
        f(i) = beta * x(i)^2 + x(i) - x(i-1);
    end
    f(1) = G - x(1);
end

% 定义梯度函数