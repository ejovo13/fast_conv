function int = vec2int(vec)

    % VEC2INT Convert a polynomial to it's integer representation

    % Ex: vec2int([1 2 3]) -> 123
    int = 0;
    n_digits = length(vec);

    for i = 0:(n_digits - 1)
        int = int + vec(n_digits - i) * (10 ^ i);
    end

end