# Visual Programming - Lab (Week 4)
## Penjelasan lengkap:
1. Class Graph
   - Fungsi: Class `Graph` ini gunanya untuk membuat dan mengelola graph. Graph direpresentasikan sebagai adjacency list, yang dimana untuk memetakan vertex (simpul/node) ke tetangganya.
   - Class ini juga memiliki list `visited` untuk melacak apakah vertex (simpul/node) tersebut telah di kunjungi selama traversal

2. **List<List<int>> adjList**
   - Fungsi: `adjList` merupakan list dua dimensi yang dimana berfungsi sebagai adjacency list untuk menyimpan semua tetangga dari setiap vertexnya. Setiap elemen `adjList[i]` menyimpan daftar vertex yang berhubungan langsung dengan vertex `i`
