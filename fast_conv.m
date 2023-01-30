function fc = fast_conv(x, y) 

    % Perform a fast convolution using the FFT
    length_out = length(x) + length(y) - 1;
    
    x_right = fill_right(x, length_out);
    y_right = fill_right(y, length_out);
    
    fc = round(ifft(fft(x_right) .* fft(y_right)));

end

function out = fill_right(x, len) 

    diff = len - length(x);
    out = padzeror(x, diff);

end