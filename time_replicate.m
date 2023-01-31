function t = time_replicate(fn, n)

    call_fn_n_times = @() replicate(fn, n);
    t = timeit(call_fn_n_times);

end