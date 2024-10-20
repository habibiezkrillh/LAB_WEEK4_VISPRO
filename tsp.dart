import 'dart:io';
import 'dart:math';

// Node dalam linked list
class PointNode {
  String name;
  PointNode? nextPoint;
  PointNode(this.name);
}

// Linked list untuk daftar poin
class PointList {
  PointNode? firstPoint;

  void addPoint(String name) {
    if (firstPoint == null) {
      firstPoint = PointNode(name);
    } else {
      PointNode current = firstPoint!;
      while (current.nextPoint != null) current = current.nextPoint!;
      current.nextPoint = PointNode(name);
    }
  }

  void showPoints() {
    PointNode? current = firstPoint;
    while (current != null) {
      print(current.name);
      current = current.nextPoint;
    }
  }
}

// Graf untuk menyelesaikan TSP
class DistanceGraph {
  List<List<int>> distanceMatrix;
  List<String> pointNames;

  DistanceGraph(this.distanceMatrix, this.pointNames);

  int findDistance(String start, String destination) {
    int startIdx = pointNames.indexOf(start);
    int destIdx = pointNames.indexOf(destination);
    return (startIdx == -1 || destIdx == -1)
        ? -1
        : distanceMatrix[startIdx][destIdx];
  }

  int solveTSP(List<int> route, int pos, int visited, int count, int totalDist,
      int shortestDist) {
    if (count == distanceMatrix.length && distanceMatrix[pos][0] > 0) {
      return min(shortestDist, totalDist + distanceMatrix[pos][0]);
    }

    for (int i = 0; i < distanceMatrix.length; i++) {
      if ((visited & (1 << i)) == 0 && distanceMatrix[pos][i] > 0) {
        visited |= (1 << i);
        route.add(i);
        shortestDist = solveTSP(route, i, visited, count + 1,
            totalDist + distanceMatrix[pos][i], shortestDist);
        visited &= ~(1 << i);
        route.removeLast();
      }
    }
    return shortestDist;
  }

  void findOptimalRoute() {
    int shortestDistance = solveTSP([0], 0, 1, 1, 0, 100000000);
    print("Jarak minimum TSP: $shortestDistance");
  }
}

void main() {
  PointList pointCollection = PointList();
  ['A', 'B', 'C', 'D', 'E'].forEach(pointCollection.addPoint);

  print('Poin:');
  pointCollection.showPoints();

  List<List<int>> distances = [
    [0, 8, 3, 4, 10],
    [8, 0, 5, 2, 7],
    [3, 5, 0, 1, 6],
    [4, 2, 1, 0, 3],
    [10, 7, 6, 3, 0]
  ];

  DistanceGraph pointGraph =
      DistanceGraph(distances, ['A', 'B', 'C', 'D', 'E']);

  while (true) {
    print(
        '\nMasukkan poin yang ingin disambungkan (contoh: A B), ketik "exit" untuk keluar:');
    String? userInput = stdin.readLineSync();
    if (userInput == null || userInput.toLowerCase() == 'exit') {
      print('Terima Kasih');
      break;
    }

    List<String> selectedPoints = userInput.split(' ');
    if (selectedPoints.length == 2) {
      int distance =
          pointGraph.findDistance(selectedPoints[0], selectedPoints[1]);
      if (distance != -1) {
        print(
            'Jarak dari ${selectedPoints[0]} ke ${selectedPoints[1]} adalah $distance.');
      }
    } else {
      print('Error, silahkan input ulang');
    }
  }
}
