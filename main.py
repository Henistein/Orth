# Stack based language

# Escrever um numero sozinho empurra-o para a stack
# stack: []
42
# stack: [42]


# Stack manipulation
dup   | a -- a a       | duplica o elemento do topo da stack
swap  | a b -- b a     | troca os dois elementos no topo da stack
drop  | a b -- a       | dropa o elemento no topo da stack
print | a b -- a       | printa o elemento no topo da stack
over  | a b -- a b a   | copia o elemento no fundo da stack e coloca-o no topo
rot   | a b c -- b c a | gira os tres elementos do topo da stack

# Comparison

=  | a b -- bool | a == b
!= | a b -- bool | a != b
>  | a b -- bool | a > b
<  | a b -- bool | a < b
>= | a b -- bool | a >= b
<= | a b -- bool | a <= b

# Arithmetic
+   | a b -- (a+b)
-   | a b -- (a-b)
*   | a b -- (a*b)
/   | a b -- (a/b) # divisao inteira
neg | a b -- a -b
mod | a b -- (a%b)
min | a b -- min(a,b)
max | a b -- max(a,b)


# Types
int   -> 64 bit integer
bool  -> boolean
str   -> string

# Bindings:
34 35
let a b in
  a print
  b print
end

# Subroutines:
proc main in
  "Hello, World\n" print
end



proc main in 
  42
end


# Examples:

# loop que printa do 0 ao 10
proc main in
  0 while dup 10 < in
    dup print 
    1 +
  end
end


A B C * +





proc func in
  dup 10 = if
    ...
  else
    ...
  end
end

20
30
10

10
10

true



# fizz buzz
proc main in
  1 while dup 100 < in
    dup 15 mod 0 = if
      "FizzBuzz\n" print
    else dup 3 mod 0 = if
      "Fizz\n" print
    else dup 5 mod 0 = if
      "Buzz\n" print
    else
      dup print
    end
    1 +
  end
end
