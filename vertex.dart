class Graph {
  List<List<int>> adjList;
  List<bool> visited;

  Graph(int numVertices)
      : adjList = List.generate(numVertices, (_) => []),
        visited = List.filled(numVertices, false);

  // Adding edge
  void addEdge(int src, int dest) {
    adjList[src].add(dest);
    adjList[dest].add(src);
  }

  // Brute force DFS traversal
  void traverse(int vertex) {
    visited[vertex] = true;
    print('Visited vertex: $vertex');
    adjList[vertex].forEach((adj) {
      if (!visited[adj]) {
        print('Connecting vertex $vertex to $adj');
        traverse(adj);
      }
    });
  }

  bool allVisited() => visited.every((v) => v);
}

void main() {
  Graph g = Graph(5);
  g.addEdge(0, 1);
  g.addEdge(0, 4);
  g.addEdge(1, 2);
  g.addEdge(2, 3);
  g.addEdge(3, 4);

  g.traverse(0);
  print(g.allVisited() ? "All vertices visited!" : "Some vertices unvisited.");
}
