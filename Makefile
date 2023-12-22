# GUI APP MAKE FILE


buildP = build
includeP = include
srcP = src

executable = $(buildP)/final

source = $(wildcard $(srcP)/*.c) main.c

objects = $(addprefix  $(buildP)/, $(addsuffix .o , $(basename $(notdir $(source)))))

flagsI = -Wall
flagsF = -I ./$(includeP)

cc = gcc

$(buildP)/%.o : %.c
	$(cc) $(flagsI) -c $< -o $@ $(flagsF)

$(buildP)/%.o : $(srcP)/%.c
	$(cc) $(flagsI) -c $< -o $@ $(flagsF)

$(executable) : $(objects)
	$(cc) $(flagsI) $(objects) -o $(executable)
clear:
	rm -r build/*
	@echo build folder is clean 

all: $(executable)
	@echo $(objects)

