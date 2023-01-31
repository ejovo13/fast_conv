function out = fill_right(x, len) 

    diff = len - length(x);
    out = padzeror(x, diff);

end