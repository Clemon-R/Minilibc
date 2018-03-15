##
## EPITECH PROJECT, 2018
## asm
## File description:
## 
##

SRC_ASM	=	$(addprefix src/asm/,	\
		strlen.asm	\
		strchr.asm	\
		strcmp.asm	\
		strncmp.asm	\
		memset.asm	\
		memmove.asm	\
		memcpy.asm	\
		)

SRC_C	=	$(addprefix src/c/,	\
		main.c	\
		)

OBJ_C	=	$(SRC_C:.c=.o)

OBJ_ASM	=	$(SRC_ASM:.asm=.o)

OBJ	=	$(OBJ_C)	\
		$(OBJ_ASM)

LIB	=	libasm.so

NAME	=	a.out

CC	=	gcc

CCFLAGS	+=	-L. -lasm

ASM	=	nasm

ASMFLAGS	=	-felf64

all:	$(NAME)

$(NAME):	$(OBJ_ASM)
	ld -shared -o $(LIB) $(OBJ_ASM)

clean:
	rm -f $(OBJ)

fclean:	clean
	rm -f $(NAME)
	rm -f $(LIB)

re:	fclean all

test:	fclean all $(OBJ_C)
	@$(CC) $(OBJ_C) -o $(NAME) $(CCFLAGS)
	./$(NAME)

%.o: %.asm
	$(ASM) $< $(ASMFLAGS)

.PHONY:	test
