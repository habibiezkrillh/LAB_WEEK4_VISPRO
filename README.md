# Visual Programming - Lab (Week 4)
## Penjelasan lengkap:
1. Class Graph
   - Fungsi: Class `Graph` ini gunanya untuk membuat dan mengelola graph. Graph direpresentasikan sebagai adjacency list, yang dimana untuk memetakan vertex (simpul/node) ke tetangganya.
   - Class ini juga memiliki list `visited` untuk melacak apakah vertex (simpul/node) tersebut telah di kunjungi selama traversal

2. **List<List<int>> adjList**
   - Fungsi: `adjList` merupakan list dua dimensi yang dimana berfungsi sebagai adjacency list untuk menyimpan semua tetangga dari setiap vertexnya. Setiap elemen `adjList[i]` menyimpan daftar vertex yang berhubungan langsung dengan vertex `i`
  
3. **List<bool> visited**
   - Fungsi: List ini digunakan untuk melacak apakah suatu vertex telah dikunjungi apa belum. Setiap elemen `visited[i]` akan bernilai `true` jika vertex `i` telah dikunjungi, maka `false`.
  
4. **Graph(int numVertices)**
   - Fungsi: Constructor `Graph` ini menerima jumlah vertex (`numVertices`) dan menginisialisasi dua list yaitu `adjList` untuk menyimpan hubungan antar vertex dan `visited` untuk melacak apakah vertex sudah dikunjungi
   - `adjList` diinisialisasi dengan `List.generate(numVertices, (_) => [])`, yang berarti bahwa setiap vertex akan memiliki daftar tetangga yang kosong sejak awal.
   - `visited` diinisialisasi sebagai list boolean dengan semua nilainya `false` (belum dikunjungi).
  
5. **void addEdge(int src, int dest)**
   - Fungsi: method ini digunakan untuk menambahkan edge (sisi) antara dua vertex, `src` sebagai sumber dan `dest` sebagai tujuan. Karena graph ini dianggap undirected (tidak berarah), edge akan ditambahkan di kedua arah:
     A). `adjList[src].add(dest)`: Menambahkan vertex tujuan ke daftar tetangga vertex sumber.
     B). `adjList[dest].add(src)`: Menambahkan vertex sumber ke daftar tetangga vertex tujuan
