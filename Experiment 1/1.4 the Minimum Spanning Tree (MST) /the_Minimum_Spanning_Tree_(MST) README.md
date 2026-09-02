## Problem Statement

Write a C program to construct the Minimum Spanning Tree (MST) of a connected, weighted, undirected graph using Kruskal’s Algorithm.


---

## Algorithm
1.Initialize each vertex as a separate set.
2.Set edges = 0 and minCost = 0.
3.Repeat until V - 1 edges are selected:
 - Find the minimum-cost edge (u, v) from the adjacency matrix.
 - Find the roots of u and v.
- If their roots are different:
 - Include the edge in the MST.
- Join the two sets.
 - Add its cost to minCost.
 - Increment edges.
 - Mark the selected edge as processed by setting its cost to 9999.
4.Print all selected edges and the minimum total cost.
5.The selected V-1 edges form the Minimum Spanning Tree (MST).

---

##Code##
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
void kruskalMST(int **cost, int V) {
	int parent[V];

	// Initialize disjoint sets
	for (int i = 0; i < V; i++)
		parent[i] = i;

	int edges = 0, minCost = 0, edgeNo = 0;

	while (edges < V - 1) {
		int min = 9999;
		int u = -1, v = -1;

		// Find the minimum weight edge
		for (int i = 0; i < V; i++) {
			for (int j = i + 1; j < V; j++) {
				if (cost[i][j] < min) {
					min = cost[i][j];
					u = i;
					v = j;
				}
			}
		}

		// Find roots of u and v
		int ru = u;
		while (parent[ru] != ru)
		ru = parent[ru];

		int rv = v;
		while (parent[rv] != rv)
			rv = parent[rv];

		// If they belong to different sets, include the edge
		if (ru != rv) {
			parent[rv] = ru;

			printf("Edge %d:(%d, %d) cost:%d\n",
					edgeNo++, u, v, min);

			minCost += min;
			edges++;
		}

		// Remove the processed edge
		cost[u][v] = cost[v][u] = 9999;
	}

	printf("Minimum cost= %d\n", minCost);
}





int main() {
    int V;
    printf("No of vertices: ");
    scanf("%d", &V);

    int **cost = (int **)malloc(V * sizeof(int *));
    for (int i = 0; i < V; i++)
        cost[i] = (int *)malloc(V * sizeof(int));

    printf("Adjacency matrix:\n");
    for (int i = 0; i < V; i++)
        for (int j = 0; j < V; j++)
            scanf("%d", &cost[i][j]);

    kruskalMST(cost, V);

    for (int i = 0; i < V; i++)
        free(cost[i]);
    free(cost);

    return 0;
}
