% This script verifies that the functions int2vec and vec2int behave as expected

x_int = 1234567;
x_vec_10 = [1 2 3 4 5 6 7];

assert(all(int2vec(x_int) == x_vec_10))

x_int = 1024;
x_vec_2 = [1 0 0 0 0 0 0 0 0 0 0];
x_vec_8 = [2 0 0 0];
x_vec_10 = [1 0 2 4];
x_vec_16 = [4 0 0];

assert(all(int2vec(x_int, 2) == x_vec_2))
assert(all(int2vec(x_int, 8) == x_vec_8))
assert(all(int2vec(x_int, 10) == x_vec_10))
assert(all(int2vec(x_int, 16) == x_vec_16))

disp("All assertions successful")