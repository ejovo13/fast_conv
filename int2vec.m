function int_as_vec = int2vec(int, optionalRadix)

    %INT2VEC Convert an integer to its polynomial representation

    if (nargin == 1) 
        radix = 10;
    else 
        radix = optionalRadix;
    end
        
    % The simplest method is to keep these numbers in base ten
    n_digits = floor(log10(int)) + 1;
    int_as_vec = zeros(1, n_digits);


    for i = 0:(n_digits - 1)

        rem = mod(int, 10);
        int = (int - rem) / 10;

        int_as_vec(n_digits - i) = rem;
    end


end

