SHELL := /bin/bash
.PHONY:run

run:
	@echo compile and run
	erl -make
	erl  -pa ../ebin -s my_file_server start "."