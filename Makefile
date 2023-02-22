NAME = so_long

CC = gcc
CFLAGS = -Wall -Wextra -Werror
RM = rm -rf

SRCS_PATH = src/
SRCS = main.c

OBJS = ${SRCS:%.c=%.o}

LIBFT_PATH = libft
LIBFT_LIB = ${LIBFT_PATH}/libft.a

MLX_PATH = MLX42
MLX_LIB = ${MLX_PATH}/build/libmlx42.a
MLX_INC = -Iinclude -lglfw -L"/Users/${USER}/.brew/opt/glfw/lib/"
MLX_FLAGS = -framework Cocoa -framework OpenGL -framework IOKit

GREEN    = \033[32;1m
CYAN    = \033[36;1m
RED        = \033[0;31m
BOLD    = \033[1m
RESET    = \033[0m
MAGENTA    =\033[0;95m

all: ${NAME}

${NAME}: ${OBJS}
    @make -C ${LIBFT_PATH}
    @${CC} ${CFLAGS} ${MLX_FLAGS} ${OBJS} ${MLX_LIB} ${MLX_INC} ${LIBFT_LIB} -o ${NAME} && printf "$(CYAN)\rCompiling: $(basename $(notdir $<)).c$(GREEN)\r\e[35C[OK]\n"
    @echo "$(GREEN)Compilation terminé avec succès !"

clean:
    @make clean -C ${LIBFT_PATH}
    @${RM} ${OBJS}
    @echo "$(RED)$(BOLD)Nettoyage effectué avec succès !"

fclean:    clean
    @make fclean -C ${LIBFT_PATH}
    @${RM} ${NAME}

re: fclean all
    @echo "$(CYAN)Recompilation Terminé !"

.PHONY: all clean fclean re