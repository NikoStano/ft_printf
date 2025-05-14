# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/07 01:38:02 by nistanoj          #+#    #+#              #
#    Updated: 2025/05/14 03:46:48 by nistanoj         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	libftprintf.a

CC				=	gcc
CFLAGS			=	-Wall -Wextra -Werror
COMPILE			=	$(CC) $(CFLAGS)
HEADER			=	ft_printf.h
DIR_OBJ			=	obj

SRCS 			=	ft_printf.c ft_putchar.c ft_putstr.c ft_putnbr.c \
					ft_putptr.c ft_puthex.c
OBJ				=	$(SRCS:%.c=$(DIR_OBJ)/%.o)

all				:	$(NAME)

$(NAME)			:	$(OBJ)
	@ar rc $@ $^
	@ranlib $@

$(DIR_OBJ)/%.o	:	%.c $(HEADER)
	@mkdir -p $(DIR_OBJ)
	@$(COMPILE) -o $@ -c $<
	@echo "$(notdir $<) Compiled"

clean			:
	@rm -f $(OBJ) $(BONUS_OBJ)
	@rm -rf $(DIR_OBJ)

fclean			:	clean
	@rm -f $(NAME)

re				:	fclean all

.PHONY			:	all clean fclean re

