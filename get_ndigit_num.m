function int = get_ndigit_num(n, optionalRadix)

    if (nargin == 1) 
        radix = 10;
    else 
        radix = optionalRadix;
    end

    % If n = 3, Then I want a number between 100 and 999
    % the spread would be 899 then.
    % randi(899) returns a number in [1, 899]

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