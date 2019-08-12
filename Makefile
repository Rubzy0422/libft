# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rcoetzer <rcoetzer@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/05/29 07:34:13 by rcoetzer          #+#    #+#              #
#    Updated: 2019/08/12 19:51:08 by rcoetzer         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

_mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
I := $(patsubst %/,%,$(dir $(_mkfile_path)))

ifneq ($(words $(MAKECMDGOALS)),1)
.DEFAULT_GOAL = all
%:
	@$(MAKE) $@ --no-print-directory -rRf $(firstword $(MAKEFILE_LIST))
else
ifndef ECHO
T := $(shell $(MAKE) $(MAKECMDGOALS) --no-print-directory \
      -nrRf $(firstword $(MAKEFILE_LIST)) \
      ECHO="COUNTTHIS" | grep -c "COUNTTHIS")
N := x
C = $(words $N)$(eval N := x $N)
ECHO = python $(I)/prog.py --stepno=$C --nsteps=$T
endif

NAME =libft.a
FLAGS = -Wall -Werror -Wextra
CC= gcc
SRC = ft_memset.c\
	ft_bzero.c\
	ft_memcpy.c\
	ft_memccpy.c\
	ft_memmove.c\
	ft_memchr.c\
	ft_memcmp.c\
	ft_strlen.c\
	ft_strdup.c\
	ft_strcpy.c\
	ft_strncpy.c\
	ft_strcat.c\
	ft_strncat.c\
	ft_strlcat.c\
	ft_strchr.c\
	ft_strrchr.c\
	ft_strstr.c\
	ft_strnstr.c\
	ft_strcmp.c\
	ft_strncmp.c\
	ft_atoi.c\
	ft_isalpha.c\
	ft_isdigit.c\
	ft_isalnum.c\
	ft_isascii.c\
	ft_isprint.c\
	ft_toupper.c\
	ft_tolower.c\
	ft_memalloc.c\
	ft_memdel.c\
	ft_strnew.c\
	ft_strdel.c\
	ft_strclr.c\
	ft_striter.c\
	ft_striteri.c\
	ft_strmap.c\
	ft_strmapi.c\
	ft_strequ.c\
	ft_strnequ.c\
	ft_strsub.c\
	ft_strjoin.c\
	ft_strtrim.c\
	ft_strsplit.c\
	ft_itoa.c\
	ft_putchar.c\
	ft_putstr.c\
	ft_putendl.c\
	ft_putnbr.c\
	ft_putchar_fd.c\
	ft_putstr_fd.c\
	ft_putendl_fd.c\
	ft_putnbr_fd.c\
	ft_lstnew.c\
	ft_lstdelone.c\
	ft_lstdel.c\
	ft_lstadd.c\
	ft_lstiter.c\
	ft_lstmap.c\
	ft_pow.c\
	ft_lststrsplit.c\
	ft_lstprint.c\
	ft_wordc.c\
	ft_lstcount.c\
	get_next_line.c\
	ft_del.c\
	ft_atof.c\
	ft_freearr.c\
	ft_strjoin_free.c\
	ft_hyperbole.c\
	ft_realloc.c\
	ft_swap.c

INC = -I ./includes
SRC_DIR = src
OBJ_DIR = obj
OBJ			= $(SRC:.c=.o)
SRCS		=	$(addprefix $(SRC_DIR)/, $(SRC))
OBJS		=	$(addprefix $(OBJ_DIR)/, $(SRC:.c=.o))

all: directory $(NAME)

$(NAME): $(OBJ_DIR) $(OBJS)
	@ar -rc $(NAME) $(OBJS)
	@printf "\e[33m[COMPILED] \e[32m%41s\e[39m\n" "$(NAME)"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(CC) $(FLAGS) -c $^ -o $@ $(INC)
	@$(ECHO) $@

directory: $(OBJ_DIR)

$(OBJ_DIR):
	@printf "\e[33m[COMPILING] \e[32;1m%40s\n\e[39m"  "$(NAME)"
	@mkdir -p $(OBJ_DIR)

clean:
	@printf "\e[31m %30s \e[39m\n" "[CLEANING]" 
	@rm -rf $(OBJ)
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -f $(NAME)

re: fclean all

.PHONY: clean all re fclean directory

endif