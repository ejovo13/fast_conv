function fc = fast_conv(x, y) 

    % Perform a fast convolution of two vectors x and y 
    % using the FFT and the IFFT
    length_out = length(x) + length(y) - 1;
    
    x_right = fill_right(x, length_out);
    y_right = fill_right(y, length_out);
    
    fc = round(ifft(fft(x_right) .* fft(y_right)));

end