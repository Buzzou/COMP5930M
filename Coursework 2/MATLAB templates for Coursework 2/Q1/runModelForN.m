% 定义一个函数，以给定的问题规模 N 运行模型
function runModelForN(N)
    m = N + 2; % 调整网格大小以获得 N 个未知数
    tf = 2;
    nt = 40;
    runModel(m, tf, nt);
end