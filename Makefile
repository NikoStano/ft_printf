# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/07 01:38:02 by nistanoj          #+#    #+#              #
#    Updated: 2025/04/15 20:19:49 by nistanoj         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	libftprintf.a

CC				=	gcc
CFLAGS			=	-Wall -Wextra -Werror -I.
COMPILE			=	$(CC) $(CFLAGS)
HEADER			=	/*.h
DIR_OBJ			=	obj

SRCS 			=	ft_printf.c ft_putchar.c ft_putstr.c ft_putnbr.c \
					ft_putptr.c ft_puthex.c
BONUS			=	ft_printf_bonus.c ft_parser_bonus.c ft_format_utils_bonus.c \
					ft_handle_char_bonus.c ft_handle_str_bonus.c ft_handle_int_bonus.c \
					ft_handle_uint_bonus.c ft_handle_ptr_bonus.c ft_handle_hex_bonus.c

OBJ				=	$(SRCS:%.c=$(DIR_OBJ)/%.o)
BONUS_OBJ		=	$(BONUS:%.c=$(DIR_OBJ)/%.o)

all				:	$(NAME)

$(NAME)			:	$(OBJ)
	@ar rc $@ $^
	@ranlib $@

$(DIR_OBJ)/%.o	:	%.c $(HEADER)
	@mkdir -p $(DIR_OBJ)
	@$(COMPILE) -o $@ -c $<
	@echo "$(notdir $<) Compiled"

bonus			:	$(NAME) $(BONUS_OBJ)
	@ar rcs $(NAME) $(BONUS_OBJ)
	@ranlib $(NAME)
	@echo "Bonus Compilé avec succès dans $(NAME) !"

clean			:
	@rm -f $(OBJ) $(BONUS_OBJ)
	@rm -rf $(DIR_OBJ)

fclean			:	clean
	@rm -f $(NAME)

re				:	fclean all

.PHONY			:	all clean fclean re

