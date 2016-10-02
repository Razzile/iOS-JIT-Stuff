#include <sys/mman.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <stdio.h>

uint8_t shell[] = {0x80, 0x0C, 0x80, 0xD2, 0xC0, 0x03, 0x5F, 0xD6}; // return 100

void *make_map() {
	void *map = mmap(NULL, 4096, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_ANON | MAP_JIT | MAP_PRIVATE, -1, 0);

    if (map == (void*)-1) {
        perror(NULL);
        return NULL;
    }
	return map;
}

int main(int argc, char **argv, char **envp) {
	void *map = make_map();
	if (map) {
		memcpy(map, shell, sizeof(shell));
		typedef int (*shell_func)();
		shell_func func = (shell_func)map;
		return func();
	}
	return 0;
}

// vim:ft=objc
