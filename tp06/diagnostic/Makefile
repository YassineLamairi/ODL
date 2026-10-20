CC = gcc
CFLAGS = -std=c17 -Wall -Wextra -Wpedantic -g -O0
LDLIBS = -lm
SANITIZER_FLAGS = -fsanitize=address,undefined -fno-omit-frame-pointer

PROGRAMS = sphere polynomial range_check years signed_overflow uninitialized_value
EXTRA_PROGRAMS = sumto memory_overflow use_after_free mean_angle sort
EXECUTABLES = $(addprefix build/,$(PROGRAMS))

.PHONY: all extras clean format format-check

all: $(EXECUTABLES)

extras: $(addprefix build/,$(EXTRA_PROGRAMS))

build:
	mkdir -p $@

build/%: src/%.c | build
	$(CC) $(CFLAGS) $< -o $@ $(LDLIBS)

build/%-sanitized: src/%.c | build
	$(CC) $(CFLAGS) $(SANITIZER_FLAGS) $< -o $@ $(SANITIZER_FLAGS) $(LDLIBS)

format:
	clang-format -i $(addprefix src/,$(addsuffix .c,$(PROGRAMS)))

format-check:
	clang-format --dry-run --Werror $(addprefix src/,$(addsuffix .c,$(PROGRAMS)))

clean:
	rm -rf build
