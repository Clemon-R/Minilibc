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
		strcasecmp.asm	\
		strpbrk.asm	\
		strcspn.asm	\
		strstr.asm	\
		memset.asm	\
		memmove.asm	\
		memcpy.asm	\
		rindex.asm	\
		write.asm	\
		read.asm	\
		)

OBJ_ASM	=	$(SRC_ASM:.asm=.o)

OBJ	=	$(OBJ_ASM)

NAME	=	libasm.so

ASM	=	nasm

ASMFLAGS	=	-felf64

all:	$(NAME)

$(NAME):	$(OBJ_ASM)
	ld -shared -o $(NAME) $(OBJ_ASM)

clean:
	rm -f $(OBJ)

fclean:	clean
	rm -f $(LIB)

re:	fclean all

%.o: %.asm
	$(ASM) $< $(ASMFLAGS)
