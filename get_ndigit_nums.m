function nums = get_ndigit_nums(n_digits, n_nums, optionalRadix)

    if (nargin < 3) 
        radix = 10;
    else 
        radix = optionalRadix;
    end

    nums = zeros(1, n_nums);
    for i = 1:n_nums
        nums(i) = get_ndigit_num(n_digits, radix);
    end

end