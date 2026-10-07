## Problem Statement ##
Write a C program to implement and perform a Depth-First Search (DFS) on a directed graph represented using an adjacency list. The program should print all vertices reachable from a given starting vertex in the order they are visited by DFS.


## Algorithm##

1.Start
2. Read the number of vertices N and initialize all vertices as unvisited.
3. Read the number of edges E.
4. For each edge, read the source and destination vertices and create the adjacency list.
5. Read the starting vertex v.
6. Mark v as visited and insert it into the queue.
7.Repeat while the queue is not empty:
    - Delete a vertex from the front of the queue.
    - Print the vertex.
     - Traverse all adjacent vertices.
     - If an adjacent vertex is unvisited:
     - Mark it as visited.
     - Insert it into the queue.
8.Continue until the queue becomes empty.
9. Stop.

## Code ##

#include <stdio.h>
#include <stdlib.h>
#define MAX 99

struct node {
    int vertex;
    struct node* next;
};
typedef struct node* GNODE;

GNODE graph[20];
int visited[20];
int queue[MAX], front = -1, rear = -1;
int n;

void insertQueue(int vertex) {
    if (rear == MAX - 1)
        printf("Queue Overflow.\n");
    else {
        if (front == -1)
            front = 0;
        rear++;
        queue[rear] = vertex;
    }
}

int isEmptyQueue() {
    return (front == -1 || front > rear);
}

int deleteQueue() {
    if (isEmptyQueue()) {
        printf("Queue Underflow\n");
        exit(1);
    }
    return queue[front++];
}

void BFS(int v) {
     GNODE p;
    int queue[100];
    int front = 0, rear = 0;

    visited[v] = 1;
    queue[rear++] = v;

    while (front < rear) {
        v = queue[front++];
        printf("\n%d", v);

        p = graph[v];

        while (p != NULL) {
            if (visited[p->vertex] == 0) {
                visited[p->vertex] = 1;
                queue[rear++] = p->vertex;
            }
            p = p->next;
        }
	}
}

void main() {
    int N, E, s, d, i, v;
    GNODE p, q;

    printf("Enter the number of vertices: ");
    scanf("%d", &N);
    n = N;

    for (i = 0; i < N; i++) {
        graph[i] = NULL;
        visited[i] = 0;
    }

    printf("Enter the number of edges: ");
    scanf("%d", &E);
    for (i = 1; i <= E; i++) {
        printf("Enter source: ");
        scanf("%d", &s);
        printf("Enter destination: ");
        scanf("%d", &d);

        q = (GNODE)malloc(sizeof(struct node));
        q->vertex = d;
        q->next = NULL;

        if (graph[s] == NULL) {
            graph[s] = q;
        } else {
            p = graph[s];
            while (p->next != NULL)
                p = p->next;
            p->next = q;
        }
    }

    printf("Enter Start Vertex for BFS: ");
    scanf("%d", &v);
    printf("BFS of graph: ");
    BFS(v);
    printf("\n");
}
