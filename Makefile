##
## EPITECH PROJECT, 2018
## asm
## File description:
## 
##

SRC_ASM	=	$(addprefix src/asm/,	\
		strlen.asm	\
		strchr.asm	\
		memset.asm	\
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

$(NAME):	$(OBJ)
	$(CC) -shared -o $(LIB) $(OBJ_ASM)
	$(CC) $(OBJ_C) -o $(NAME) $(CCFLAGS)

clean:
	rm -f $(OBJ)

fclean:	clean
	rm -f $(NAME)

re:	fclean all

%.o: %.asm
	$(ASM) $< $(ASMFLAGS)
