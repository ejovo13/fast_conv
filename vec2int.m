function int = vec2int(vec, optionalRadix)

    % VEC2INT Convert a polynomial to its integer representation

    if (nargin == 1) 
        radix = 10;
    else 
        radix = optionalRadix;
    end


    % Ex: vec2int([1 2 3]) -> 123
    % Ex: vec2int([1 0 1], 2) -> 5
    int = 0;
    n_digits = length(vec);

    for i = 0:(n_digits - 1)
        int = int + vec(n_digits - i) * (radix ^ i);
    end

end