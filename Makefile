# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/27 16:32:33 by nistanoj          #+#    #+#              #
#    Updated: 2025/05/17 16:02:25 by nistanoj         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libftprintf.a
HEADER		=	ft_printf.h

CC			=	cc
CFLAGS		=	-Wall -Werror -Wextra
COMPILE		=	$(CC) $(CFLAGS)

SRCS		=	ft_printf.c ft_putchar.c ft_putstr.c ft_putnbr.c ft_print_ptr.c \
				ft_print_hex.c

OBJS		=	$(SRCS:.c=.o)

all		:	$(NAME)

$(NAME)	:	$(OBJS)
	@ar -rcs $@ $^

%.o		:	%.c
	$(COMPILE) -o $@ -c $<

clean	:
	@rm -f $(OBJS)

fclean	:	clean
	@rm -f $(NAME)

re		:	fclean all

.PHONY	:	all clean fclean re
