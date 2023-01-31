% Script to time the difference between a convolution
% and a fast convolution

% x = [1 2 3 4];
% y = [2 3 4 5];
% n = 1000000; % threshold of 10E5 seconds is where we get a breakthrough in performance
% n = 10000 % 10E4 is faster

N = round(logspace(1, 7, 7));
n_log_n = N .* log(N);
n_1point5 = N .^ 1.5;

data = time_convs(N, 1);
data_sconv = data(1, :);
data_fconv = data(2, :);

% We have discovered that fconv runs in O(nlogn) whereas sconv runs in O(n ^ 1.5)
% let's fit a model with this data, plotting lines alongside the data points

mdl_sconv = fitlm(n_1point5, data_sconv);
mdl_fconv = fitlm(n_log_n, data_fconv);

m_sconv = mdl_sconv.Coefficients{'x1', 1};
m_fconv = mdl_fconv.Coefficients{'x1', 1};

figure; hold on;
a1 = plot(N, data_sconv, 'k*');
a2 = plot(N, data_fconv, 'r.');

plot(N, m_sconv * n_1point5, 'k');
% plot(N, m_fconv * n_log_n, 'r');


legend([a1, a2], ["conv", "fconv"]);

% time_replicate(fn_conv,  k)
% time_replicate(fn_fconv, k)

function T = time_convs(N, numRepetitions) 

    if (nargin == 1) 
        k = 1
    else
        k = numRepetitions
    end


    % Return a 2 x N Matrix where the first row corresponds to timing data for the built in call `conv` 
    % and the second row corresponds to the fast_conv implementation

    T = zeros(2, length(N));

    for trial = 1:k

        for i = 1:length(N)

            x = randi(10, 1, N(i)) - 1;
            y = randi(10, 1, N(i)) - 1;

            % single_sconv = @() conv(x, y);
            single_fconv = @() fast_conv(x, y);

            % fn_sconv = @() replicate(single_sconv, k);
            % fn_fconv = @() replicate(single_fconv);

            % T(1, i) = timeit(fn_sconv) / k;
            T(2, i) = T(2, i) + timeit(single_fconv);

            % assert(all(conv(x, y) == fast_conv(x, y)));

        end

    end

end