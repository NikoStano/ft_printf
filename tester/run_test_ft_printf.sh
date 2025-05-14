#!/bin/sh

###########################################################
#                         COLORS                          #
###########################################################
BGREEN='\033[1;32m'
GREEN='\033[0;32m'
BRED='\033[1;31m'
RED='\033[0;31m'
GBLUE='\033[1;34m'
BLUE='\033[0;34m'
NC='\033[0m'

###########################################################
#                      MAIN CREATION                      #
###########################################################

MAIN_FILE="main_test_ft_printf.c"
EXEC_FILE="test_printf"

echo "${BGREEN}=== [0] Génération de $MAIN_FILE ===${NC}"

cat <<EOF > $MAIN_FILE
#include <stdio.h>
#include "ft_printf.h"

#define GREEN	"\033[0;32m"
#define RED		"\033[0;31m"
#define BBLUE	"\033[1;34m"
#define BLUE	"\033[0;34m"
#define NC	"\033[0m"

#define SHOW(title) \
	printf(BBLUE "==== TEST %s ====" NC "\n", title)
#define PRINT_RET(ft, sys) \
	printf((ft == sys) ? GREEN "ret: ft_=%d, sys=%d\n\n" NC \
					   : RED "ret: ft_=%d, sys=%d\n\n" NC, \
		ft, sys)
//#define SHOW(title) \
//	printf("==== TEST %s ====\n", title)
//#define PRINT_RET(ft, sys) \
//	printf("ret: ft_=%d, sys=%d\n\n", ft, sys)

int	main(void)
{
	int		ret_ft;
	int		ret_sys;
	char	*str_null = NULL;
	char	*str = "42";

	SHOW("%c");
	ret_ft = ft_printf("ft_ : [%c]\n", 'A');
	ret_sys = printf("sys : [%c]\n", 'A');
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%s");
	ret_ft = ft_printf("ft_ : [%s]\n", "Bonjour");
	ret_sys = printf("sys : [%s]\n", "Bonjour");
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%s NULL");
	ret_ft = ft_printf("ft_ : [%s]\n", str_null);
	ret_sys = printf("sys : [%s]\n", str_null);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%p");
	ret_ft = ft_printf("ft_ : [%p]\n", str);
	ret_sys = printf("sys : [%p]\n", str);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%p NULL");
	ret_ft = ft_printf("ft_ : [%p]\n", (void *)0);
	ret_sys = printf("sys : [%p]\n", (void *)0);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%p MIN");
	ret_ft = ft_printf("ft_ : [%p]\n", (void *)-1);
	ret_sys = printf("sys : [%p]\n", (void *)-1);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%p MAX");
	ret_ft = ft_printf("ft_ : [%p]\n", (void *)0xFFFFFFF);
	ret_sys = printf("sys : [%p]\n", (void *)0xFFFFFFF);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%d et %i");
	ret_ft = ft_printf("ft_ : [%d] [%i]\n", 42, -42);
	ret_sys = printf("sys : [%d] [%i]\n", 42, -42);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%u");
	ret_ft = ft_printf("ft_ : [%u]\n", 4294967295U);
	ret_sys = printf("sys : [%u]\n", 4294967295U);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%u MIN");
	ret_ft = ft_printf("ft_ : [%u]\n", -2147483647);
	ret_sys = printf("sys : [%u]\n", -2147483647);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%u NULL");
	ret_ft = ft_printf("ft_ : [%u]\n", 0);
	ret_sys = printf("sys : [%u]\n", 0);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%u NEG");
	ret_ft = ft_printf("ft_ : [%u]\n", -1);
	ret_sys = printf("sys : [%u]\n", -1);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%x et %X");
	ret_ft = ft_printf("ft_ : [%x] [%X]\n", 0xdead, 0xdead);
	ret_sys = printf("sys : [%x] [%X]\n", 0xdead, 0xdead);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%x et %X NEG");
	ret_ft = ft_printf("ft_ : [%x] [%X]\n", -0xdead, -0xdead);
	ret_sys = printf("sys : [%x] [%X]\n", -0xdead, -0xdead);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%% pourcentage");
	ret_ft = ft_printf("ft_ : ""%%");
	printf("\n");
	ret_sys = printf("sys : ""%%");
	printf("\n");
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%% pourcentage");
	ret_ft = ft_printf("ft_ : Coucou %%");
	printf("\n");
	ret_sys = printf("sys : Coucou %%");
	printf("\n");
	PRINT_RET(ret_ft, ret_sys);

	SHOW("%% pourcentage");
	ft_printf("ft_ : ");
	ret_ft = ft_printf("%%");
	printf("\nsys : ");
	ret_sys = printf("%%");
	printf("\n");
	PRINT_RET(ret_ft, ret_sys);

	SHOW("Mix complet");
	ret_ft = ft_printf("ft_ : [%c %s %p %d %i %u %x %X %%]\n", 'Z', "test", str, 1, -1, 42u, 0x42, 0x42);
	ret_sys = printf("sys : [%c %s %p %d %i %u %x %X %%]\n", 'Z', "test", str, 1, -1, 42u, 0x42, 0x42);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("Mix complet");
	ret_ft = ft_printf("Multiple: c=%c, s=%s, d=%d, u=%u, x=%x, p=%p, pourcent=%%!\n",'Z', "Hello", 2147483647, 4294967295U, 0xdeadbeef, &str_null);
	ret_sys = printf("Multiple: c=%c, s=%s, d=%d, u=%u, x=%x, p=%p, pourcent=%%!\n",'Z', "Hello", 2147483647, 4294967295U, 0xdeadbeef, &str_null);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("INT MAX");
	ret_ft = ft_printf("ft_ : [%d]\n", INT_MAX);
	ret_sys = printf("sys : [%d]\n", INT_MAX);
	PRINT_RET(ret_ft, ret_sys);

	SHOW("Unsigned MAX");
	ret_ft = ft_printf("ft_ : [%u]\n", UINT_MAX);
	ret_sys = printf("sys : [%u]\n", UINT_MAX);
	PRINT_RET(ret_ft, ret_sys);

	// TEST SANS FLAG
	
	//SHOW("retour -1 invalide format");
	//ret_ft = ft_printf("%", 9);
	//ret_sys = printf("%", 9);
	//PRINT_RET(ret_ft, ret_sys);

	//SHOW("retour -1 NULL format");
	//const char *fmt, *fmt1 = NULL;
	//int	ret1 = ft_printf(fmt);
	//int ret2 = printf(fmt1);
	//PRINT_RET(ret1, ret2);

	return (0);
}
EOF


###########################################################
#                     COMMANDE SHELL                      #
###########################################################

clean_files_and_exit() {
	echo "${GBLUE}=== [4] Cleaning Files ===${NC}"
	make fclean
	rm -f "$EXEC_FILE" "$MAIN_FILE"
	echo "${BGREEN}=== ✅ [4] ALL FILES CLEANED ! ✅ ===${NC}\n"
	exit 1
}

echo "${GBLUE}=== [1] Compilation avec make re ===${NC}"
make re
if [ $? -ne 0 ]; then
	echo "\033[1;31mErreur lors du make\033[0m"
	clean_files_and_exit
else
	echo "${BGREEN}=== ✅ [1] Librairie compilé avec succès ! ✅ ===${NC}\n"
fi

echo "${GBLUE}=== [2] Compilation du fichier de test ===${NC}"
cc -Wall -Werror -Wextra -g3 $MAIN_FILE libftprintf.a -o $EXEC_FILE
if [ $? -ne 0 ]; then
	echo "\033[1;31mErreur lors de la compilation du test\033[0m"
	clean_files_and_exit
else
	echo "${BGREEN}=== ✅ [2] Test compilé avec succès ! ✅ ===${NC}\n"
fi

echo "${GBLUE}=== [3] Vérification mémoire avec valgrind ===${NC}"
valgrind --leak-check=full --show-leak-kinds=all -s ./$EXEC_FILE


if [ $? -ne 0 ]; then
	echo "\033[1;31mErreur de mémoire\033[0m"
	clean_files_and_exit
else
	echo "\n${BGREEN}=== ✅ [3] TESTS TERMINE ! ✅ ===${NC}\n"
fi

clean_files_and_exit