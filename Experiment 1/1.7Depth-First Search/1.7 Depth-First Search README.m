## Problem Statement ##
Write a C program to implement and perform a Depth-First Search (DFS) on a directed graph represented using an adjacency list. The program should print all vertices reachable from a given starting vertex in the order they are visited by DFS.
----

## Algorithm##
1.Start
2.Read the number of rows r1 and columns c1 of matrix A.
3.Read all elements of matrix A.
4.Read the number of rows r2 and columns c2 of matrix B.
5.Check whether c1 == r2.
6.If not equal, print "Invalid input" and stop.
7.Read all elements of matrix B.
8.Initialize the result matrix C with 0.
  For each row i of A:
 For each column j of B:
 Set C[i][j] = 0.
 For k = 0 to c1 - 1, calculate:
 C[i][j] = C[i][j] + A[i][k] × B[k][j]
9.Display the result matrix C.
10.Stop.

----
## Code ##

#include <stdio.h>

int main() {
	int r1, c1, r2, c2;
	int a[100][100], b[100][100], c[100][100];

	scanf("%d %d", &r1, &c1);

	for (int i = 0; i < r1; i++)
		for (int j = 0; j < c1; j++)
			scanf("%d", &a[i][j]);

	scanf("%d %d", &r2, &c2);

	if (c1 != r2) {
		printf("Invalid input");
		return 0;
	}

	for (int i = 0; i < r2; i++)
		for (int j = 0; j < c2; j++)
			scanf("%d", &b[i][j]);

	for (int i = 0; i < r1; i++) {
		for (int j = 0; j < c2; j++) {
			c[i][j] = 0;
			for (int k = 0; k < c1; k++)
				c[i][j] += a[i][k] * b[k][j];
		}
	}

	for (int i = 0; i < r1; i++) {
		for (int j = 0; j < c2; j++)
			printf("%d ", c[i][j]);
		printf("\n");
	}

	return 0;
}
