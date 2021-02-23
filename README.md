Versão Flex: flex 2.6.4

Versão GCC: gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04)

Instruções de compilação:

flex -o lex.yy.c lang.l
gcc lex.yy.c -o lang.out

Instruções de execução:

./lang.out examples/test_1.txt
./lang.out examples/test_2.txt
./lang.out examples/test_3.txt
./lang.out examples/test_4.txt
./lang.out examples/test_5_error.txt
./lang.out examples/test_6_error.txt