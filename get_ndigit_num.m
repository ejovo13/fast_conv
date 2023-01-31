function int = get_ndigit_num(n, optionalRadix)

    % Return a random number in the range [radix ^ (n - 1), (radix ^ n) - 1]
    % 
    % Ex: get_ndigit_num(3, 10) returns a uniformly distributed random integer between 100 and 999
    %

    % Deal with optional argument
    if (nargin == 1) 
        radix = 10;
    else 
        radix = optionalRadix;
    end

    if (n == 1) 
        lower_bound = 0;
    else
        lower_bound = radix ^ (n - 1);
    end

    upper_bound = (radix ^ n) - 1;
    spread = upper_bound - lower_bound;
    offset = randi(spread + 1) - 1;

    int = lower_bound + offset;
    
end