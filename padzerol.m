function out = padzerol(in, n)

    % Pad the input array in with n zeros to the left.
    % If the input is a 2-dimensional matrix, pad with columns of zeros

    [nrows, ~] = size(in);

    out = [zeros(nrows, n) in];

end