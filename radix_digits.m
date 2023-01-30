function n = radix_digits(x, radix)

    %RADIX_DIGITS Determine the number of base-radix digits needed 
    % to represent the stored value x

    n = floor(logbase(radix, x)) + 1;

end

