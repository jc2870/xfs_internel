# Makefile for compiling all .c files into a binary named xfs_i

# Compiler and flags
CC = gcc
CFLAGS = -Wall -g -Wextra -std=c11

# 查找所有的.c文件并生成对应的.o文件列表
SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

# 目标二进制文件
TARGET = xfs_i

# 默认目标
all: $(TARGET)

# 链接所有.o文件生成目标二进制
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# 编译每个.c文件为.o文件
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# 清理生成的文件
clean:
	rm -f $(OBJS) $(TARGET)

# 声明为伪目标
.PHONY: all clean
