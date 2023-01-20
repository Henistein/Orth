
# Orth
#### A compiled stack-based language based on Forth using OCaml.

---

## How to use

The use of our application is accessible by invoking the **Makefile** in the `orth` directory by the `make` command. This will compile the necessary files generating the `orth` executable, it then executes the `test.exp` file present in the directory using the `orth` executable generating the corresponding `test.s`. It is also possible to test an entire test suite present in the `./tests/` directory using *Python3*'s *script* `test.py`.

```bash
.
├── orth           // Ficheiros src
|   ├── orth
|	├── test.exp
|	├── test.s
|	├── Makefile
|	└── ...
├── tests
|   ├── bad        //  Bad tests              (<name>.exp)
|   ├── good       // Good tests              (<name>.exp)
|	├── compiled   // Ficheiros de compilação
|	│   ├── bad    //  Bad tests              (<name>.s / <name>.out)
|	│   └── good   // Good tests              (<name>.s / <name>.out)
|   ├── results    // Ficheiros de Output     (good_<name>.out / bad_<name>.out)
|   └── solutions  // Soluções                (good_<name>.out / bad_<name>.out)
├── test.py
└── ...
```

To add a test to the test battery, the following steps are required:
1. Add an `*.exp` file in the directory:
	* `./tests/bad/` - if the test is supposed to fail;
	* `./tests/good/` - if the test is supposed to pass;

2. Add a `good_*.out` or `bad_*.out` file (respectively to the previous step) in the `./tests/solutions` directory.

3. Run in the `.` directory the command:
	```bash
	python3 test.py
	```
---

## Language features:

* **Use of the *Stack*:**
	Because ***Orth*** is a stack-based language, it uses a stack to store values temporarily during program execution.
	
	```Orth
	4 2 +
	```
	In the previous program, the values `4` and `2` are stacked on the stack, then a `+` operation is performed. On execution, both values are taken from the stack and added together, resulting in the value `6` stacked on the stack.

<br>

*  **Manipulating the *Stack***:
	You can manipulate the stack using the following commands:
	
	 * `dup` - duplicates the element at the top of the stack. Example:
		```
		2 1 dup
		
		Stack -> 2 1 1
		```
	* `swap` - swaps two elements on top of the stack. Example:
		```
		2 1 swap
		
		Stack -> 1 2
		```
	* `drop` - deletes the element on top of the stack. Example:
		```
		2 1 drop
		
		Stack -> 2
		```
	* `over` - copies the element at the bottom of the stack to the top of the stack. Example:
		```
		2 1 over
		
		Stack -> 2 1 2
		```
	* `rot` - rotation of the three elements on top of the stack. Example:
		```
		1 2 3 rot
		
		Stack -> 3 1 2
		```

<br>

* **Variable Assignment:**
	```orth
	1 x let
	```
	Where `x` is an identifier and `1` is an example expression.

<br>

* **Access variables:**
	```orth
	x @
	```
	Where `x` is an identifier. The value of the variable is added to the top of the stack.

<br>

* **While cicle:**
	```orth
	0 while dup 10 < in
		dup printi
		1 +
	end
	drop
	```
	Where `dup 10 <` represents the Boolean expression delimiting the number of iterations in which the body occurs. The body is `dup printi` and `1 +`. After the while execution, it is necessary to use `drop` to empty the stack in order to exit the program.

<br>

* **If then else:**
	```orth
	true if
		1 1 + 
		printi
	else
		2 3 +
		printi
	end

	true if
		1 1 +
		printi
	end
	```
	Here `true` represents the Boolean condition for deciding which body is executed. The true case body is `1 1 + printi`, while the false case is `2 3 + printi`. It is also possible to exclude the use of `else`. 
	**Note**: The stack of types before and after the execution of `if` must be the same.

<br>

* **Define function:**
	```orth
	foo proc
		1 printi
	end
	
	foo ?
	```
	where `foo` is an identifier and `1 printi` is an example expression. When the identifier `foo` is used with `?` the identifier procedure `foo` is called whose *output* is the value `1`.
	**Note**: The stack of types before and after the execution of `proc` must be the same.
