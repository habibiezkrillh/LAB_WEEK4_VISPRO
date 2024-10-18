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
   -  `adjList[src].add(dest)`: Menambahkan vertex tujuan ke daftar tetangga vertex sumber.
   -  `adjList[dest].add(src)`: Menambahkan vertex sumber ke daftar tetangga vertex tujuan.

6. **void traverse(int vertex)**
   - Fungsi: Method ini melakukan traversal menggunakan algoritma DFS (Depth First Search) dengan pendekatan brute-force.
   - Proses:
     - Pertama, vertex yang dilewati akan ditandai sebagai (`visited[vertex] = true`).
     - Lalu, kita mencetak vertex yang sedang dikunjungi (`print('Visited vertex: $vertex)'`).
     - Setelah itu, kita mengiterasi semua tetangga vertex tersebut dengan menggunakan `forEach`. Jika tetangganya belum dikunjungi, kita menghubungkan vertex saat ini ke tetangganya dan melakkan rekursi untuk mengunjungi tetangganya tersebut (`traverse(adj)`)

7. **bool allVisited()**
   - Fungsi: Fungsi ini memeriksa apakah semua vertex dalam graph telah dikunjungi. Metode `every` dari list digunakan untuk memastikan bahwa semua elemen dalam `visited` bernilai `true`.
   - Jika semua vertex telah di visited, fungsi ini akan mengembalikan `true`, jika tidak maka `false`.
  
8. **void main()**
   - Fungsi: Fungsi utama ini digunakan untuk mengeksekusi program.

## Langkah-langkah menjalankan program (void main)
1. Membuat Graf: objek graf`g` dibuat dengan 5 vertex (`Graph(5)`)
2. Menambahkan Edge: Koneksi (edges) ditambahkan antara vertex sesuai dengan gambar (graf adjacency). Contoh: `g.addEdge(0, 1)` yang menghubungkan vertex 0 (A) dengan vertex 1 (B)
3. Trav
