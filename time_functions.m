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

% Now I want to develop functions that will time how long it takes to compute 
% the multiplication of two n-digit numbers
% However, I guess this script is really timing the difference between normal multiplication and
% convolution multiplication. The problem is I am severely limited by the number of digits that I can use with normal 
% multiplication.

% I've been working with double representations but I need to actually drop that and work exclusively with 
% polynomials. The problem then becomes that I cannot accurately verify the results of the computation.
% But I can if I decide to use a really small base. Hmm.

function t_data = time_replicates(fn, n_array) 

    t_data = zeros(1, length(n_array));

    for i = 1:length(n_array)
        t_data(i) = time_replicate(fn, n_array(i));
    end

end

% I want a function that takes in a fn, and n, the number of times to repeat it, then measure the total time that it takes to call the function n times

function prod = mult(x, y)
    prod = x * y;
end
