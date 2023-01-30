function prod = poly_mult_slow(x, y, optionalRadix)

    % Multiply two integers by first converting them into polynomials, then
    % convoluting the two polynomials
    if (nargin < 2) 
        error("Need to pass at x and y parameters")
    end

    if (nargin == 2) 
        radix = 10;
    else 
        radix = optionalRadix;
    end

    x_poly = int2vec(x, radix);
    y_poly = int2vec(y, radix);

    prod = vec2int(conv(x_poly, y_poly), radix);


end