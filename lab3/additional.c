#include <stdio.h>
#include <stdlib.h>
#define _GNU_SOURCE
#include <linux/sched.h>
#include <sys/types.h>
#include <sys/wait.h>

void sum(int *array) {
	int answer = 0;
	int size = array[0];
	for (int i = 1; i <= size; i++) {
		answer += array[i];
	}
	array[size + 1] = answer;
}

int main() {
	int number;
	scanf("%d", &number);
	int array[number + 2];
	array[0] = number;
	for (int i = 1; i <= number; i++) {
		scanf("%d", &(array[i]));	
	}
	void* stack = malloc(1024); 
	pid_t pid = clone(sum, stack + 1024, CLONE_VM | SIGCHLD, array);
	int signal;
	waitpid(pid, &signal, 1);
	printf("%d\n", array[number + 1]);
	return 0;
}
