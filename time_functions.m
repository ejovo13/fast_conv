% Certain timing facilities

x = 10;
y = 20;

times_xy = @() mult(x, y);
times_xy_conv = @() poly_mult_slow(x, y);

% Now I want to make a graph of the timing data


N = logspace(1, 5, 5);
prod_timing = time_replicates(times_xy, N);
conv_timing = time_replicates(times_xy_conv, N);

% Now I want to plot these values

plot(N, prod_timing, 'r-')
hold on
plot(N, conv_timing, 'k--')



% I want to


function t_data = time_replicates(fn, n_array) 

    t_data = zeros(1, length(n_array));

    for i = 1:length(n_array)
        t_data(i) = time_replicate(fn, n_array(i));
    end

end

% I want a function that takes in a fn, and n, the number of times to repeat it, then measure the total time that it takes to call the function n times

function t = time_replicate(fn, n)

    call_fn_n_times = @() replicate(fn, n);
    t = timeit(call_fn_n_times);

end

function prod = mult(x, y)
    prod = x * y;
end

function [] = replicate(fn, n)
%  Call a fn n times
    for i = 1:n
        fn();
    end
end