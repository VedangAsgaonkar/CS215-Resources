function Y_N = Avg_M_distribution(M , N)
    for i = 1:N
        if i==1 
            Y_N = M_distribution(M);
        else 
            Y_N = Y_N + M_distribution(M);
        end
    end
    Y_N = Y_N/ N;
end