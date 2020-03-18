
%% Initialization
clear
if (libisloaded('mattest'))
    unloadlibrary('mattest');
end

addpath('./build/bin');

loadlibrary('mattest', 'mattest.h');

test1();
test2();
test3(); % Does not run
% test4(); % Crashes MATLAB

%% Test 1 - Using a null pointer
function test1
    fprintf("Test 1 - ");
    p = libpointer('mattest_opaquePtrPtr');
    result = calllib('mattest', 'mattest_create', p, 1);
    if result == 2
        fprintf("Success!\n");
    else
        fprintf("Failure (return code %d)\n", result);
    end
end

%% Test 2 - Create a single opaque struct
function test2
    fprintf("Test 2 - ");
    p = libpointer('mattest_opaquePtrPtr', struct());
    result = calllib('mattest', 'mattest_create', p, 1);
    if result ~= 0
       fprintf("Failure (mattest_create returned %d)\n", result);
       return
    end
    result = calllib('mattest', 'mattest_get_value', p);
    if result == 42
        fprintf("Success!\n");
    else
        fprintf("Failure (get_value returned %d)\n", result);
    end
end

%% Test 3 - Multiple structs A
function test3    
    fprintf("Test 3 - ");
    for i = 1:10
       structs(i) = struct();
    end
    ls = libstruct('mattest_opaquePtr', structs);
    result = calllib('mattest', 'mattest_create', ls, 10);
    if result ~= 0
       fprintf("Failure (mattest_create returned %d)\n", result);
       return
    end
    for i = 1:10
        result = calllib('mattest', 'mattest_get_value', pointers(i));
        if result ~= 41 + i
            fprintf("Failure (get_value for pointers(%d) returned %d)\n", i, result);
        end
    end
    fprintf("Success!\n");
end

%% Test 4 - Multiple structs B
function test4    
    fprintf("Test 4 - ");
    for i = 1:10
       structs(i) = struct();
    end
    ls = libstruct('mattest_opaque', structs);
    result = calllib('mattest', 'mattest_create', ls, 10);
    if result ~= 0
       fprintf("Failure (mattest_create returned %d)\n", result);
       return
    end
    for i = 1:10
        result = calllib('mattest', 'mattest_get_value', pointers(i));
        if result ~= 41 + i
            fprintf("Failure (get_value for pointers(%d) returned %d)\n", i, result);
        end
    end
    fprintf("Success!\n");
end

%% References

% - https://www.mathworks.com/matlabcentral/answers/56769-array-of-user-defined-types-with-external-libraries#answer_68728
% - https://www.mathworks.com/matlabcentral/answers/83405-how-do-i-manipulate-multilayer-pointers-in-calllib-calls-what-is-the-proper-syntax