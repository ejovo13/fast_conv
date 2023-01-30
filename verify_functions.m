% This script verifies that the functions int2vec and vec2int behave as expected

% ===================== int2vec ============================
x_int = 1234567;
x_vec_10 = [1 2 3 4 5 6 7];

assert(all(int2vec(x_int) == x_vec_10))

x_int = 1024;
x_vec_2 = [1 0 0 0 0 0 0 0 0 0 0];
x_vec_8 = [2 0 0 0];
x_vec_10 = [1 0 2 4];
x_vec_16 = [4 0 0];

assert(all(int2vec(x_int, 2)  == x_vec_2))
assert(all(int2vec(x_int, 8)  == x_vec_8))
assert(all(int2vec(x_int, 10) == x_vec_10))
assert(all(int2vec(x_int, 16) == x_vec_16))

% ====================== vec2int ========================
assert(all(vec2int(x_vec_2, 2)   == x_int))
assert(all(vec2int(x_vec_8, 8)   == x_int))
assert(all(vec2int(x_vec_10, 10) == x_int))
assert(all(vec2int(x_vec_16, 16) == x_int))

% ================== int2vec(vec2int) ===================
assert(all(x_vec_2  == int2vec(vec2int(x_vec_2, 2), 2)))
assert(all(x_vec_8  == int2vec(vec2int(x_vec_8, 8), 8)))
assert(all(x_vec_10 == int2vec(vec2int(x_vec_10, 10), 10)))
assert(all(x_vec_16 == int2vec(vec2int(x_vec_16, 16), 16)))

% ================== vec2int(int2vec) ===================
assert(x_int == vec2int(int2vec(x_int)))
assert(x_int == vec2int(int2vec(x_int, 10), 10))
assert(x_int == vec2int(int2vec(x_int, 5), 5))
assert(x_int == vec2int(int2vec(x_int, 256), 256))

test = @(x, base) assert(x == vec2int(int2vec(x, base), base));

x_int = 18293525;

test(x_int, 10)
test(x_int, 16)
test(x_int, 20)
test(x_int, 100)
test(x_int, 1024)
test(x_int, 256)
test(x_int, 58)
test(x_int, 13)


disp("All assertions successful")