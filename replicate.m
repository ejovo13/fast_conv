function replicate(fn, n)
    %  Call a fn n times
    for i = 1:n
        fn();
    end
end