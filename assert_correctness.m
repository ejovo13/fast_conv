function assert_correctness(num_digits, k, optional_radix)

    % ASSERT_CORRECTNESS randomly generate 2 vectors of length num_digits, k times, and compare
    % The results of FAST_CONV with MATLAB's built-in function CONV

    % Default argument
    if (nargin < 3) 
        radix = 10;
    else
        radix = optional_radix;
    end

    % Repeat trials k times
    for i = 1:k 

        % Generate vectors of length num_digits whose elements are in [0, radix - 1]
        x = randi(radix, 1, num_digits) - 1;
        y = randi(radix, 1, num_digits) - 1;

        % Compute the two convolutions
        fconv = fast_conv(x, y);
        sconv = conv(x, y);

        % Assert that every single element is equal for the two convolution results
        assert(all(fconv == sconv));

    end

    disp("correctness of fast_conv successfully verified")

end 

