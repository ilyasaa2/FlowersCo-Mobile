import 'dart:math';
import 'package:flutter/material.dart';

// DATA TANAMAN
class PlantData {
  static final List<Map<String, dynamic>> allPlants = [
    // --- BUNGA POTONG ---
    {
      "name": "Mawar Merah",
      "latinName": "Rosa hybrida",
      "category": "bunga_potong",
      "difficulty": "Menengah",
      "light": "Tinggi",
      "water": "2 Hari",
      "imageUrl":
          "https://outerbloom.com/cdn/shop/articles/7_Arti_Bunga_Mawar_Sebagai_Kado_Valentine_1024x1024.jpg?v=1507889224",
      "description":
          "Mawar adalah ratu segala bunga. Di Indonesia, mawar tumbuh subur di dataran tinggi seperti Malang dan Bandung. Bunga ini melambangkan cinta dan keanggunan, menjadikannya pilihan utama untuk rangkaian buket.",
      "benefits": [
        "Simbol cinta dan penghargaan",
        "Aroma alami sebagai aromaterapi",
        "Air mawar bisa digunakan sebagai toner kulit",
        "Kelopak bisa dibuat teh herbal",
      ],
      "careSteps": [
        "Potong batang 45° dan letakkan segera di air bersih",
        "Ganti air setiap 2 hari sekali",
        "Jauhkan dari paparan sinar matahari langsung",
        "Tambahkan nutrisi bunga potong di air vas",
        "Buang daun yang terendam air agar tidak busuk",
      ],
      "funFact":
          "Indonesia adalah salah satu produsen mawar terbesar di Asia Tenggara, dengan pusat produksi di Malang, Jawa Timur.",
    },
    {
      "name": "Bunga Matahari",
      "latinName": "Helianthus annuus",
      "category": "bunga_potong",
      "difficulty": "Mudah",
      "light": "Sangat Tinggi",
      "water": "3 Hari",
      "imageUrl":
          "https://media.dekoruma.com/article/2020/12/29124328/sekumpulan-bunga-matahari-di-kebun-rumah.jpg?fit=300%2C200&ssl=1",
      "description":
          "Bunga matahari adalah simbol keceriaan dan optimisme. Batangnya yang tegak dan mahkotanya yang besar berwarna kuning cerah selalu berhasil mengangkat suasana hati. Sangat populer sebagai hadiah wisuda dan ulang tahun.",
      "benefits": [
        "Bijinya kaya nutrisi dan bisa dimakan",
        "Minyak biji bunga matahari baik untuk kesehatan jantung",
        "Melambangkan kebahagiaan dan semangat",
        "Daya tahan cukup lama sebagai bunga potong",
      ],
      "careSteps": [
        "Potong batang bawah dan langsung masukkan ke air",
        "Letakkan di tempat terang tapi tidak panas langsung",
        "Ganti air setiap 3 hari",
        "Singkirkan daun di bawah garis air",
        "Batang bisa dipangkas ulang untuk memperpanjang usia",
      ],
      "funFact":
          "Bunga matahari muda selalu mengikuti arah matahari — fenomena ini disebut heliotropisme. Setelah dewasa, bunga menghadap ke timur secara permanen.",
    },
    {
      "name": "Anggrek Bulan",
      "latinName": "Phalaenopsis amabilis",
      "category": "bunga_potong",
      "difficulty": "Menengah",
      "light": "Parsial",
      "water": "5 Hari",
      "imageUrl":
          "https://media.istockphoto.com/id/1503679321/id/video/bunga-anggrek-phalaenopsis-mekar-di-musim-semi-dekorasi-keindahan-alam-anggrek-liar-langka.jpg?s=640x640&k=20&c=3Zuv-uTmsS0aBNpenEuxZInJ6I8xq1Eeh4yFHJhdTxY=",
      "description":
          "Anggrek Bulan adalah bunga nasional Indonesia dan kebanggaan nusantara. Kelopaknya yang putih bersih seperti sayap kupu-kupu menjadikannya salah satu bunga paling elegan di dunia. Tahan lama dan cocok untuk segala momen.",
      "benefits": [
        "Bunga nasional Indonesia yang membanggakan",
        "Tahan lama hingga 2–3 bulan jika dirawat",
        "Cocok untuk dekorasi pernikahan mewah",
        "Nilai estetika sangat tinggi",
      ],
      "careSteps": [
        "Jangan siram akar yang menempel di pot media — cukup semprotkan air",
        "Letakkan di tempat dengan cahaya terang tidak langsung",
        "Hindari angin AC langsung",
        "Beri pupuk khusus anggrek sekali sebulan",
        "Setelah berbunga, potong tangkai di ruas ke-2 dari bawah",
      ],
      "funFact":
          "Anggrek Bulan (Phalaenopsis amabilis) adalah satu dari tiga bunga nasional Indonesia, bersama Melati dan Padma Raksasa.",
    },
    {
      "name": "Melati Putih",
      "latinName": "Jasminum sambac",
      "category": "bunga_potong",
      "difficulty": "Mudah",
      "light": "Tinggi",
      "water": "2 Hari",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/7/7f/Jasminum_sambac_2.jpg",
      "description":
          "Melati adalah bunga puspa bangsa Indonesia yang mewakili kesucian dan ketulusan. Wanginya yang khas sangat familiar dalam budaya Jawa, sering digunakan dalam upacara pernikahan adat dan pembuatan teh melati.",
      "benefits": [
        "Bunga puspa bangsa Indonesia",
        "Aroma terapi alami yang menenangkan",
        "Digunakan dalam teh herbal untuk relaksasi",
        "Simbol kesucian dalam pernikahan adat",
      ],
      "careSteps": [
        "Petik di pagi hari saat masih kuncup untuk aroma terbaik",
        "Rendam dalam air dingin untuk menjaga kesegaran",
        "Simpan di tempat sejuk, hindari panas",
        "Gunakan dalam 1–2 hari untuk aroma optimal",
        "Kelopak yang layu bisa dikeringkan sebagai potpourri",
      ],
      "funFact":
          "Melati adalah salah satu komponen utama dalam pembuatan teh melati, minuman favorit jutaan orang Indonesia setiap harinya.",
    },
    {
      "name": "Bougenville",
      "latinName": "Bougainvillea spectabilis",
      "category": "bunga_potong",
      "difficulty": "Mudah",
      "light": "Sangat Tinggi",
      "water": "4 Hari",
      "imageUrl":
          "https://cdn-jpr.jawapos.com/images/18/2025/08/20/WhatsApp-Image-2025-08-15-at-184245-451176705.jpeg",
      "description":
          "Bougenville adalah bunga tropis yang warna-warni dan sangat tahan panas. Di Indonesia, tanaman ini sangat populer sebagai tanaman hias pekarangan. Warnanya yang mencolok — ungu, merah, putih, oranye — menjadikannya dekorasi visual yang memukau.",
      "benefits": [
        "Sangat tahan panas dan cuaca tropis Indonesia",
        "Warna mencolok untuk dekorasi acara outdoor",
        "Tumbuh cepat dan mudah diperbanyak",
        "Bisa dijadikan bonsai dekoratif",
      ],
      "careSteps": [
        "Letakkan di area yang mendapat sinar matahari penuh",
        "Ganti air setiap 3–4 hari",
        "Potong batang miring untuk penyerapan air lebih baik",
        "Kombinasikan beberapa warna untuk tampilan lebih meriah",
        "Hindari tempat yang terlalu lembap",
      ],
      "funFact":
          "Bagian yang kita kira sebagai kelopak bunga bougenville sebenarnya adalah daun (bract) yang berubah warna. Bunga sesungguhnya sangat kecil di tengahnya.",
    },

    // --- TANAMAN INDOOR ---
    {
      "name": "Sirih Gading",
      "latinName": "Epipremnum aureum",
      "category": "tanaman_indoor",
      "difficulty": "Sangat Mudah",
      "light": "Rendah",
      "water": "5 Hari",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/8/8e/Epipremnum_aureum_1.jpg",
      "description":
          "Sirih gading adalah tanaman hias paling populer di Indonesia karena nyaris tidak bisa mati! Daunnya yang hijau mengkilap berbentuk hati sangat dekoratif dan bisa merambat di mana saja. Cocok untuk pemula.",
      "benefits": [
        "Membersihkan udara dari racun formaldehida dan benzena",
        "Sangat mudah dirawat, tidak perlu banyak perhatian",
        "Tumbuh baik di tempat minim cahaya sekalipun",
        "Bisa dirambatkan sebagai dekorasi dinding",
      ],
      "careSteps": [
        "Siram setiap 5–7 hari atau saat tanah terasa kering",
        "Tidak perlu cahaya matahari langsung",
        "Bersihkan daun dari debu dengan kain lembap",
        "Pupuk sebulan sekali dengan pupuk daun cair",
        "Pangkas ujung sulur yang terlalu panjang",
      ],
      "funFact":
          "NASA mencantumkan sirih gading sebagai salah satu tanaman terbaik untuk memurnikan udara dalam ruangan. Satu pot bisa menyerap berbagai polutan berbahaya.",
    },
    {
      "name": "Sri Rejeki",
      "latinName": "Aglaonema commutatum",
      "category": "tanaman_indoor",
      "difficulty": "Sangat Mudah",
      "light": "Rendah",
      "water": "7 Hari",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/0/07/Aglaonema_commutatum2.jpg",
      "description":
          "Sri Rejeki atau Aglaonema adalah tanaman hias favorit masyarakat Indonesia yang dipercaya membawa keberuntungan. Motif daunnya yang unik — dari merah muda, hijau, hingga perak — menjadikannya dekorasi rumah yang cantik.",
      "benefits": [
        "Dipercaya membawa keberuntungan dan rejeki",
        "Memurnikan udara dalam ruangan",
        "Tahan di tempat minim cahaya",
        "Tersedia dalam ratusan varietas warna yang cantik",
      ],
      "careSteps": [
        "Siram seminggu sekali, jangan sampai tergenang",
        "Cocok untuk ruangan ber-AC dengan cahaya tidak langsung",
        "Bersihkan daun setiap 2 minggu",
        "Ganti pot setiap 2 tahun atau saat akar sudah keluar",
        "Hindari paparan sinar matahari langsung agar daun tidak terbakar",
      ],
      "funFact":
          "Indonesia adalah salah satu pusat pengembangan varietas Aglaonema baru. Para breeder lokal berhasil menciptakan ratusan varietas unik yang diminati kolektor dunia.",
    },
    {
      "name": "Kaktus",
      "latinName": "Cactaceae",
      "category": "tanaman_indoor",
      "difficulty": "Sangat Mudah",
      "light": "Sangat Tinggi",
      "water": "14 Hari",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/8/8f/Cactus.jpg",
      "description":
          "Kaktus adalah tanaman paling tangguh yang bisa kamu rawat. Berasal dari gurun, kaktus menyimpan air di batangnya sehingga bisa bertahan lama tanpa disiram. Sempurna untuk kamu yang sering lupa menyiram tanaman!",
      "benefits": [
        "Tidak butuh banyak perhatian dan perawatan",
        "Duri unik memberikan tampilan estetik industrial",
        "Bisa hidup bertahun-tahun tanpa banyak perawatan",
        "Cocok untuk meja kerja dan ruang sempit",
      ],
      "careSteps": [
        "Siram hanya setiap 2 minggu, lebih sedikit di musim hujan",
        "Letakkan di dekat jendela yang mendapat sinar matahari",
        "Gunakan pot dengan lubang drainase yang baik",
        "Gunakan media tanam khusus kaktus (pasir + tanah)",
        "Jangan biarkan air menggenang di pot",
      ],
      "funFact":
          "Kaktus tidak memiliki daun sejati — duri-durinya sebenarnya adalah daun yang telah berevolusi untuk mengurangi penguapan air di gurun.",
    },
    {
      "name": "Lidah Mertua",
      "latinName": "Sansevieria trifasciata",
      "category": "tanaman_indoor",
      "difficulty": "Sangat Mudah",
      "light": "Rendah",
      "water": "10 Hari",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/f/fb/Sansevieria_trifasciata.jpg",
      "description":
          "Lidah Mertua atau Snake Plant adalah tanaman yang hampir mustahil untuk dimatikan. Daunnya yang tegak dan bermotif indah sangat dekoratif. Uniknya, tanaman ini menghasilkan oksigen di malam hari — sempurna diletakkan di kamar tidur!",
      "benefits": [
        "Menghasilkan oksigen di malam hari (unik!)",
        "Menyerap karbon dioksida dan racun udara",
        "Sangat tahan banting dan sulit dimatikan",
        "Cocok diletakkan di kamar tidur untuk kualitas udara lebih baik",
      ],
      "careSteps": [
        "Siram setiap 10–14 hari, kurangi frekuensi di musim hujan",
        "Toleran terhadap cahaya rendah maupun tinggi",
        "Hindari genangan air di pot — akarnya mudah busuk",
        "Tidak perlu pupuk sering, cukup 2 kali setahun",
        "Bersihkan debu di permukaan daun agar tetap mengkilap",
      ],
      "funFact":
          "NASA memasukkan Lidah Mertua dalam daftar 50 Tanaman Terbaik Pembersih Udara. Satu tanaman dewasa bisa memurnikan udara ruangan berukuran 18 m².",
    },
    {
      "name": "Lidah Buaya",
      "latinName": "Aloe vera",
      "category": "tanaman_indoor",
      "difficulty": "Sangat Mudah",
      "light": "Tinggi",
      "water": "10 Hari",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/5/5c/Aloe_vera_2.jpg",
      "description":
          "Lidah Buaya adalah tanaman ajaib yang sudah digunakan sejak ribuan tahun lalu. Gel di dalam daunnya mengandung ratusan senyawa aktif yang bermanfaat untuk kesehatan kulit, rambut, dan pencernaan. Wajib ada di setiap rumah!",
      "benefits": [
        "Gel menyembuhkan luka bakar dan iritasi kulit",
        "Bahan alami untuk masker dan pelembap wajah",
        "Menjaga kelembapan rambut dan kulit kepala",
        "Jus lidah buaya baik untuk pencernaan",
        "Anti-inflamasi dan antibakteri alami",
      ],
      "careSteps": [
        "Siram setiap 10–14 hari, biarkan tanah mengering dulu",
        "Letakkan di tempat terang tapi tidak terkena matahari langsung",
        "Gunakan pot terracotta dengan lubang drainase",
        "Hindari genangan air — akar mudah busuk",
        "Pisahkan tunas anakan untuk memperbanyak tanaman",
      ],
      "funFact":
          "Cleopatra, Ratu Mesir yang terkenal cantik, konon menggunakan gel lidah buaya sebagai bagian dari ritual kecantikan hariannya. Manfaat lidah buaya telah dikenal selama lebih dari 6.000 tahun!",
    },
    {
      "name": "Monstera",
      "latinName": "Monstera deliciosa",
      "category": "tanaman_indoor",
      "difficulty": "Mudah",
      "light": "Parsial",
      "water": "4 Hari",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/3/3f/Monstera_deliciosa2.jpg",
      "description":
          "Monstera adalah ikon tanaman hias modern. Daunnya yang besar berlubang-lubang unik menjadikannya sangat ikonik dalam dunia dekorasi interior. Di alam liar, lubang pada daun membantu angin melewati dan mengurangi kerusakan saat hujan lebat.",
      "benefits": [
        "Ikon estetika dekorasi interior modern",
        "Daunnya yang besar menciptakan nuansa tropis",
        "Memurnikan udara dari polutan VOC",
        "Tumbuh cepat dan memberikan kepuasan merawat",
      ],
      "careSteps": [
        "Siram setiap 4–5 hari, saat lapisan atas tanah mulai kering",
        "Letakkan di ruangan dengan cahaya terang tidak langsung",
        "Seka daun setiap 2 minggu agar tetap mengkilap",
        "Berikan penyangga (moss pole) agar bisa tumbuh menjulang",
        "Pupuk sebulan sekali saat musim tumbuh aktif",
      ],
      "funFact":
          "Lubang pada daun Monstera bukan cacat — ini adalah adaptasi evolusioner! Lubang memungkinkan lebih banyak cahaya mencapai daun di bawahnya di hutan hujan tropis yang rimbun.",
    },
    {
      "name": "Jahe Merah",
      "latinName": "Zingiber officinale var. rubrum",
      "category": "tanaman_indoor",
      "difficulty": "Mudah",
      "light": "Parsial",
      "water": "3 Hari",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/5/5c/Zingiber_officinale0.jpg",
      "description":
          "Jahe Merah adalah rempah ajaib asli Indonesia yang memiliki khasiat kesehatan luar biasa. Kandungan gingerol dan shogaol di dalamnya jauh lebih tinggi dari jahe biasa, menjadikannya pilihan utama untuk minuman herbal dan obat tradisional.",
      "benefits": [
        "Meningkatkan imunitas tubuh secara alami",
        "Menghangatkan tubuh dan meredakan masuk angin",
        "Anti-inflamasi kuat untuk nyeri sendi",
        "Membantu mengatasi mual dan gangguan pencernaan",
        "Bisa ditanam sendiri di pot di rumah",
      ],
      "careSteps": [
        "Tanam rimpang jahe merah di pot dengan media tanam subur",
        "Siram setiap 2–3 hari, jaga tanah tetap lembap tapi tidak tergenang",
        "Letakkan di tempat dengan cahaya tidak langsung",
        "Beri pupuk organik sebulan sekali",
        "Panen setelah 8–10 bulan atau saat daun mulai menguning",
      ],
      "funFact":
          "Jahe Merah mengandung gingerol 3x lebih tinggi dibanding jahe biasa. Rempah ini sudah digunakan dalam pengobatan Ayurveda dan jamu Jawa selama lebih dari 2.000 tahun.",
    },
    {
      "name": "Kunyit",
      "latinName": "Curcuma longa",
      "category": "tanaman_indoor",
      "difficulty": "Mudah",
      "light": "Parsial",
      "water": "3 Hari",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/7/7b/Curcuma_longa_roots.jpg",
      "description":
          "Kunyit adalah rempah emas Indonesia yang terkenal di seluruh dunia. Warna kuning cerahnya berasal dari kurkumin, senyawa anti-inflamasi terkuat yang ada di alam. Kunyit adalah bahan utama jamu kunyit asam yang sangat populer di Jawa.",
      "benefits": [
        "Kurkumin adalah anti-inflamasi alami terkuat",
        "Bahan utama jamu kunyit asam untuk kesehatan wanita",
        "Pewarna alami makanan yang aman",
        "Membantu menjaga kesehatan hati dan pencernaan",
        "Bisa ditanam di pot dengan mudah",
      ],
      "careSteps": [
        "Tanam rimpang kunyit di pot besar dengan tanah yang gembur",
        "Siram setiap 2–3 hari, tanah harus selalu sedikit lembap",
        "Cocok di tempat dengan cahaya terang tidak langsung",
        "Beri pupuk kandang atau kompos setiap 2 bulan",
        "Panen rimpang setelah 9–12 bulan saat daun mulai mengering",
      ],
      "funFact":
          "Kurkumin dalam kunyit membutuhkan lemak dan piperin (dari lada hitam) untuk diserap tubuh secara optimal. Itulah kenapa dalam masakan India, kunyit selalu dipasangkan dengan lada dan minyak!",
    },
    {
      "name": "Serai",
      "latinName": "Cymbopogon citratus",
      "category": "tanaman_indoor",
      "difficulty": "Sangat Mudah",
      "light": "Tinggi",
      "water": "4 Hari",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/1/1c/Cymbopogon_citratus.jpg",
      "description":
          "Serai atau sereh adalah tanaman aromatik serbaguna asli Asia Tenggara. Aromanya yang segar dan khas digunakan dalam masakan Indonesia, aromaterapi, hingga pengusir nyamuk alami. Sangat mudah tumbuh dan bisa dipanen berulang kali.",
      "benefits": [
        "Pengusir nyamuk alami yang efektif",
        "Bahan masakan esensial masakan Indonesia",
        "Minyak atsirinya digunakan dalam aromaterapi",
        "Teh serai membantu relaksasi dan tidur lebih nyenyak",
        "Mudah tumbuh dan dipanen berulang kali",
      ],
      "careSteps": [
        "Tanam dari batang serai segar — rendam pangkalnya di air hingga berakar",
        "Siram setiap 3–4 hari",
        "Letakkan di tempat yang mendapat sinar matahari minimal 4 jam sehari",
        "Tidak perlu pupuk khusus, tumbuh subur di tanah biasa",
        "Panen dengan memotong batang, sisakan pangkal untuk tumbuh kembali",
      ],
      "funFact":
          "Serai bisa digunakan sebagai lilin aromaterapi alami! Celupkan sumbu ke dalam batang serai yang dilubangi, dan nyalakan — aromanya akan mengusir serangga sekaligus mewangikan ruangan.",
    },
  ];

  // Tips Hari Ini — dipilih secara random per sesi login
  static final List<Map<String, dynamic>> dailyTips = [
    {
      "title": "Rahasia Mawar\nTetap Segar\nSepanjang Minggu",
      "shortDesc":
          "Mawar sangat sensitif terhadap suhu. Ganti air setiap pagi dengan air bersuhu ruangan dan potong batang secara diagonal untuk hasil terbaik.",
      "fullContent": """
**Mengapa Mawar Cepat Layu?**
Mawar layu bukan karena kualitasnya buruk, tapi karena teknik perawatan yang kurang tepat. Batang bunga bisa tersumbat gelembung udara dan bakteri dalam hitungan jam setelah dipotong.

**Langkah 1: Potong Batang dengan Benar**
Segera setelah mendapat mawar, potong 2–3 cm bagian bawah batang dengan gunting tajam pada sudut 45 derajat. Lakukan ini di bawah air mengalir untuk mencegah gelembung udara masuk. Gelembung udara adalah musuh utama kesegaran bunga!

**Langkah 2: Air Bersih Setiap Hari**
Ganti air vas setiap pagi dengan air bersuhu ruangan. Air dingin dari kulkas bisa membuat sel batang mengejang dan menghambat penyerapan. Air suhu ruangan adalah pilihan terbaik.

**Langkah 3: Jauhkan dari Panas**
Hindari meletakkan mawar di dekat jendela yang kena matahari langsung, buah-buahan (menghasilkan etilen yang mempercepat penuaan), AC langsung, atau elektronik yang panas.

**Langkah 4: Nutrisi Rahasia**
Tambahkan satu sachet nutrisi bunga ke dalam air, atau gunakan alternatif rumahan: 1 sendok teh gula + 1/4 sendok teh pemutih (untuk mencegah bakteri). Campuran ini bisa memperpanjang usia mawar hingga 5 hari lebih lama!

**Langkah 5: Rawat Daun**
Buang semua daun yang akan terendam air. Daun yang membusuk di dalam vas menghasilkan bakteri yang menyumbat pembuluh batang.

Dengan perawatan ini, mawar potong bisa bertahan 10–14 hari!
      """,
      "category": "Bunga Potong",
      "readTime": "3 menit",
    },
    {
      "title": "5 Manfaat Bunga\nMatahari yang\nJarang Diketahui",
      "shortDesc":
          "Lebih dari sekadar bunga cantik, bunga matahari menyimpan segudang manfaat dari biji hingga minyaknya yang sudah digunakan selama ribuan tahun.",
      "fullContent": """
**Bunga Matahari Bukan Sekadar Hiasan**
Bunga matahari (Helianthus annuus) adalah salah satu tanaman paling bermanfaat di dunia. Setiap bagiannya — dari kelopak hingga biji — punya kegunaan tersendiri.

**Manfaat 1: Biji yang Kaya Nutrisi**
Biji bunga matahari mengandung vitamin E, magnesium, selenium, dan lemak sehat. Segenggam biji bunga matahari per hari cukup untuk memenuhi kebutuhan vitamin E harianmu.

**Manfaat 2: Minyak Terbaik untuk Memasak**
Minyak bunga matahari memiliki titik asap tinggi dan kaya asam lemak tak jenuh tunggal, menjadikannya salah satu minyak paling sehat untuk memasak di suhu tinggi.

**Manfaat 3: Kelopak sebagai Pewarna Alami**
Kelopak bunga matahari bisa dikeringkan dan digunakan sebagai pewarna alami kuning untuk kain atau makanan. Nenek moyang suku Native American sudah menggunakannya selama berabad-abad.

**Manfaat 4: Fitoremediasi Tanah**
Bunga matahari terkenal mampu menyerap logam berat dari tanah yang terkontaminasi. Setelah bencana nuklir Chernobyl, bunga matahari ditanam di kolam pendingin untuk menyerap cesium dan strontium radioaktif!

**Manfaat 5: Sebagai Bunga Potong Awet**
Sebagai bunga potong, bunga matahari bisa bertahan 6–12 hari jika batang dipotong setiap 2 hari dan air diganti secara rutin. Letakkan di tempat terang, hindari langsung di bawah AC.

Mulai sekarang, pandang bunga matahari bukan hanya sebagai hiasan — ini adalah tanaman luar biasa yang layak ada di rumahmu!
      """,
      "category": "Bunga Potong",
      "readTime": "4 menit",
    },
    {
      "title": "Cara Membuat\nKaktus Berbunga\ndi Rumah",
      "shortDesc":
          "Kaktus bisa berbunga cantik jika mendapat perawatan yang tepat! Kuncinya ada di siklus istirahat dan paparan cahaya yang benar.",
      "fullContent": """
**Siapa Bilang Kaktus Tidak Bisa Berbunga?**
Kaktus yang berbunga adalah pemandangan luar biasa — bunganya bisa sangat besar dan warna-warni. Ini rahasianya!

**Cahaya Adalah Kunci**
Kaktus butuh minimum 6 jam cahaya matahari langsung per hari. Letakkan di ambang jendela yang menghadap ke selatan atau timur. Kaktus yang kurang cahaya tidak akan pernah berbunga.

**Periode Istirahat Musim Dingin**
Di iklim tropis Indonesia, simulasikan musim dingin dengan mengurangi penyiraman drastis selama bulan Juli–Agustus. Biarkan tanah benar-benar kering selama 4–6 minggu. Ini memicu kaktus untuk bersiap berbunga.

**Pupuk Khusus Kaktus**
Beri pupuk dengan kandungan fosfor (P) tinggi — bukan nitrogen. Nitrogen membuat batang tumbuh, tapi fosfor mendorong pembungaan. Pupuk sekali di awal musim tumbuh (September–Oktober).

**Pot yang Tepat**
Gunakan pot terracotta (tanah liat) yang lebih kecil dari yang terlihat perlu. Kaktus yang sedikit "stres" akibat pot kecil justru lebih mudah berbunga — ini naluri bertahan hidupnya!

**Sabar adalah Segalanya**
Kaktus bisa membutuhkan waktu 3–5 tahun sebelum pertama kali berbunga. Tapi ketika itu terjadi, bunga yang muncul biasanya sangat besar dan indah — sebanding dengan penantian panjangmu!
      """,
      "category": "Tanaman Indoor",
      "readTime": "4 menit",
    },
    {
      "title": "Jahe Merah:\nObat Alami\ndi Pot Rumahmu",
      "shortDesc":
          "Jahe merah bukan hanya rempah dapur — ini adalah apotek mini yang bisa kamu tanam sendiri di rumah dengan sangat mudah.",
      "fullContent": """
**Mengapa Jahe Merah Istimewa?**
Jahe merah mengandung gingerol dan shogaol tiga kali lebih tinggi dibanding jahe biasa. Inilah yang membuatnya lebih pedas, lebih harum, dan jauh lebih berkhasiat untuk kesehatan.

**Manfaat Kesehatan Jahe Merah**
Jahe merah telah terbukti secara ilmiah membantu meningkatkan imunitas, meredakan nyeri sendi dan otot, mengatasi mual (termasuk mual kehamilan), menghangatkan tubuh di musim hujan, dan membantu meredakan gejala masuk angin.

**Cara Menanam di Pot**
Pilih rimpang jahe merah yang segar dan gemuk dari pasar. Rendam semalaman dalam air hangat. Tanam horizontal di pot berisi campuran tanah dan kompos (1:1), tutup dengan tanah setinggi 3 cm. Siram secukupnya.

**Perawatan Harian**
Siram setiap 2–3 hari, pastikan tanah selalu lembap tapi tidak tergenang. Letakkan di tempat yang mendapat cahaya terang tidak langsung — jahe tidak suka sinar matahari langsung yang terik.

**Cara Panen dan Menggunakan**
Panen pertama bisa dilakukan setelah 8–10 bulan. Cukup gali sebagian rimpang, biarkan sisanya tumbuh kembali. Untuk konsumsi: parut langsung ke minuman hangat dengan madu dan jeruk nipis — minuman herbal terbaik untuk imunitas!

**Resep Minuman Jahe Merah Sederhana**
Parut 2 cm jahe merah, rebus dengan 300 ml air selama 10 menit. Saring, tambahkan madu secukupnya dan irisan jeruk nipis. Minum selagi hangat sebelum tidur.
      """,
      "category": "Tanaman Bermanfaat",
      "readTime": "5 menit",
    },
    {
      "title": "Serai: Pengusir\nNyamuk Alami\ndi Rumahmu",
      "shortDesc":
          "Serai bukan hanya bumbu masak — aromanya yang khas terbukti mengusir nyamuk secara alami. Dan menanamnya sangat mudah, bahkan dari batang sisa dapur!",
      "fullContent": """
**Serai: Tanaman Serbaguna yang Sering Diabaikan**
Hampir setiap dapur Indonesia punya serai — tapi jarang yang tahu bahwa tanaman ini bisa ditanam ulang dari sisa masak dan memberikan manfaat jauh lebih dari sekadar bumbu!

**Cara Tumbuhkan dari Batang Sisa**
Ambil batang serai segar dari pasar, pastikan pangkalnya masih utuh (bukan dipotong terlalu pendek). Rendam pangkal batang dalam segelas air selama 1–2 minggu hingga akar putih kecil mulai muncul. Setelah berakar, pindahkan ke pot berisi tanah.

**Sebagai Pengusir Nyamuk Alami**
Minyak sitronela dalam serai adalah bahan aktif dalam sebagian besar lilin pengusir nyamuk komersial. Letakkan beberapa pot serai di sudut ruangan atau dekat jendela untuk mengusir nyamuk secara alami tanpa bahan kimia.

**Teh Serai untuk Relaksasi**
Rebus 3–4 batang serai yang sudah dimemarkan dengan 500 ml air selama 10 menit. Tambahkan jahe dan madu untuk rasa yang lebih kaya. Minum malam hari untuk membantu relaksasi dan tidur lebih nyenyak.

**Tips Panen**
Potong batang dari pangkal, sisakan 5 cm untuk tumbuh kembali. Satu rumpun serai bisa dipanen setiap 3–4 bulan tanpa perlu ditanam ulang.

**Kombinasi Terbaik**
Tanam serai berdampingan dengan kunyit dan jahe merah di pot terpisah — ketiganya punya kebutuhan tumbuh yang mirip dan bersama-sama membentuk apotek herbal mini di rumahmu!
      """,
      "category": "Tanaman Bermanfaat",
      "readTime": "4 menit",
    },
    {
      "title": "Kunyit di Pot:\nSuperfood yang\nBisa Kamu Tanam",
      "shortDesc":
          "Kunyit adalah superfood dengan senyawa anti-inflamasi terkuat di alam. Dan kamu bisa menanamnya sendiri di pot kecil di rumah dengan sangat mudah!",
      "fullContent": """
**Kunyit: Emas dari Dapur Nusantara**
Kurkumin dalam kunyit adalah senyawa anti-inflamasi yang sedang diteliti oleh ratusan lembaga penelitian dunia untuk manfaatnya melawan berbagai penyakit degeneratif.

**Cara Menanam Kunyit di Pot**
Beli rimpang kunyit segar di pasar tradisional. Pilih yang gemuk dan masih ada tunas hijaunya. Tanam di pot berdiameter minimal 30 cm dengan campuran tanah subur dan kompos. Tutup dengan tanah 3–5 cm, siram lembut.

**Perawatan Mudah**
Siram setiap 2–3 hari, jaga tanah tetap lembap. Kunyit cocok di tempat dengan sinar matahari pagi (sebelum jam 10) dan teduh di siang hari. Di Indonesia, kunyit tumbuh sangat baik di iklim tropis lembap.

**Cara Panen yang Benar**
Panen pertama setelah 9–12 bulan saat daun mulai menguning dan mengering secara alami. Gali hati-hati dengan tangan, ambil rimpang besar, dan tanam kembali rimpang kecil untuk panen berikutnya.

**Cara Menggunakan Kunyit Segar**
Parut langsung ke masakan, jus, atau minuman. Untuk manfaat maksimal, konsumsi bersama lada hitam (mengandung piperin yang meningkatkan penyerapan kurkumin hingga 2000%) dan sedikit lemak seperti santan atau minyak kelapa.

**Resep Jamu Kunyit Asam**
Parut 3 cm kunyit segar, rebus dengan 500 ml air, tambahkan 2 sendok makan asam jawa dan gula aren secukupnya. Saring dan minum hangat atau dingin. Ini adalah minuman kesehatan wanita paling populer di Jawa!
      """,
      "category": "Tanaman Bermanfaat",
      "readTime": "4 menit",
    },
    {
      "title": "Manfaat Lidah\nBuaya yang Jarang\nDiketahui",
      "shortDesc":
          "Lebih dari sekadar obat luka bakar — lidah buaya menyimpan ratusan manfaat untuk kecantikan dan kesehatan yang bisa kamu manfaatkan langsung dari rumah.",
      "fullContent": """
**Apotek Alami dalam Satu Tanaman**
Gel bening di dalam daun lidah buaya mengandung lebih dari 75 senyawa aktif termasuk vitamin A, C, E, B12, asam folat, kolin, 8 enzim, 4 asam lemak, dan 20 mineral!

**Untuk Wajah**
Gel lidah buaya segar adalah pelembap alami terbaik untuk kulit berminyak. Oleskan langsung ke wajah sebelum tidur. Efeknya terasa di pagi hari: kulit lebih lembap, pori-pori terasa lebih bersih. Tidak menyumbat pori karena teksturnya ringan.

**Untuk Rambut**
Campurkan gel lidah buaya dengan sedikit minyak kelapa, oleskan ke kulit kepala selama 30 menit, lalu bilas. Ini adalah kondisioner alami yang mengurangi kerontokan dan membuat rambut lebih berkilau.

**Untuk Luka dan Sunburn**
Lidah buaya mengandung aloin yang mempercepat regenerasi sel kulit. Oleskan gel segar langsung ke area yang terbakar matahari — rasakan efek dinginnya seketika! Ini lebih efektif dari banyak krim after-sun komersial.

**Untuk Pencernaan**
Jus lidah buaya (hanya bagian gel bening) bisa membantu masalah pencernaan seperti asam lambung dan sembelit. Campurkan dengan madu dan air jeruk nipis untuk rasa lebih enak.

**Cara Panen Gel yang Benar**
Ambil daun terbesar di bagian luar (daun tua). Potong di pangkal. Iris kulit hijau dengan pisau, ambil gel bening di dalamnya. Jangan gunakan lapisan kuning (lateks) — itu bersifat laksatif kuat. Simpan sisa gel di kulkas dalam wadah tertutup, tahan 1 minggu.
      """,
      "category": "Tanaman Bermanfaat",
      "readTime": "5 menit",
    },
    {
      "title": "Anggrek Bulan\nSelesai Berbunga?\nIni yang Harus Dilakukan",
      "shortDesc":
          "Jangan buang anggrek yang sudah selesai berbunga! Dengan perawatan tepat, anggrek bisa berbunga kembali 2–3 kali dalam setahun.",
      "fullContent": """
**Jangan Dibuang Dulu!**
Banyak orang membuang anggrek setelah bunganya gugur — padahal anggrek bisa berbunga lagi berkali-kali jika dirawat dengan benar. Anggrek bisa hidup puluhan tahun!

**Langkah 1: Pangkas Tangkai Bunga**
Setelah semua bunga gugur, periksa tangkainya. Jika tangkai masih hijau, potong tepat di atas ruas kedua dari bawah — mungkin akan tumbuh tunas baru di sana. Jika tangkai sudah cokelat dan kering, potong rata dengan pangkalnya.

**Langkah 2: Perubahan Suhu Malam**
Kunci merangsang anggrek berbunga kembali adalah perbedaan suhu siang-malam minimal 8–10°C. Di Indonesia, taruh anggrek di luar ruangan saat malam hari selama 3–4 minggu (pastikan tidak hujan).

**Langkah 3: Atur Penyiraman**
Kurangi penyiraman menjadi sekali seminggu. Biarkan akar sedikit mengering di antara penyiraman. Akar yang sehat berwarna hijau saat basah dan perak/putih saat kering.

**Langkah 4: Pupuk yang Tepat**
Setelah tangkai bunga dipangkas, beri pupuk nitrogen tinggi (untuk pertumbuhan daun). Setelah 2 bulan, ganti dengan pupuk fosfor tinggi untuk mendorong pembungaan.

**Bersabar 3–6 Bulan**
Proses berbunga kembali membutuhkan waktu. Biasanya 3–6 bulan setelah perawatan yang benar, tunas bunga baru akan muncul!

Anggrek bisa hidup dan berbunga selama puluhan tahun jika dirawat dengan cinta dan konsistensi.
      """,
      "category": "Bunga Potong",
      "readTime": "4 menit",
    },
  ];
}

// HALAMAN UTAMA PERPUSTAKAAN TANAMAN
class PerpustakaanTanamanPage extends StatefulWidget {
  const PerpustakaanTanamanPage({super.key});

  @override
  State<PerpustakaanTanamanPage> createState() =>
      _PerpustakaanTanamanPageState();
}

class _PerpustakaanTanamanPageState extends State<PerpustakaanTanamanPage> {
  int _selectedTab = 0;
  final List<String> _tabs = [
    "Semua",
    "Bunga Potong",
    "Tanaman Indoor",
    "Favorit",
  ];

  late final Map<String, dynamic> _todayTip;
  final Set<String> _favorites = {};
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    final random = Random();
    _todayTip = PlantData.dailyTips[random.nextInt(PlantData.dailyTips.length)];
  }

  List<Map<String, dynamic>> get _filteredPlants {
    List<Map<String, dynamic>> plants;

    switch (_selectedTab) {
      case 1:
        plants = PlantData.allPlants
            .where((p) => p["category"] == "bunga_potong")
            .toList();
        break;
      case 2:
        plants = PlantData.allPlants
            .where((p) => p["category"] == "tanaman_indoor")
            .toList();
        break;
      case 3:
        plants = PlantData.allPlants
            .where((p) => _favorites.contains(p["name"]))
            .toList();
        break;
      default:
        plants = PlantData.allPlants;
    }

    if (_searchQuery.isNotEmpty) {
      plants = plants
          .where(
            (p) =>
                (p["name"] as String).toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ) ||
                (p["latinName"] as String).toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ),
          )
          .toList();
    }

    return plants;
  }

  void _toggleFavorite(String plantName) {
    setState(() {
      if (_favorites.contains(plantName)) {
        _favorites.remove(plantName);
      } else {
        _favorites.add(plantName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredPlants;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFBC1A6F)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Flowers.co",
          style: TextStyle(
            color: Color(0xFFBC1A6F),
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFFBC1A6F),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER ---
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Perpustakaan Tanaman",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Ensiklopedia tanaman Indonesia lengkap",
                    style: TextStyle(fontSize: 13, color: Colors.black45),
                  ),
                  const SizedBox(height: 14),

                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFEEEEEE)),
                    ),
                    child: TextField(
                      onChanged: (val) => setState(() => _searchQuery = val),
                      decoration: const InputDecoration(
                        hintText: "Cari tanaman favorit Anda...",
                        hintStyle: TextStyle(
                          color: Colors.black38,
                          fontSize: 13,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black38,
                          size: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Tab Pills
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(_tabs.length, (i) {
                        final isSelected = _selectedTab == i;
                        final isFavTab = i == 3;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedTab = i),
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? (isFavTab
                                        ? Colors.red.shade400
                                        : const Color(0xFFBC1A6F))
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.transparent
                                    : Colors.black12,
                              ),
                            ),
                            child: Text(
                              _tabs[i],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black54,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // --- TIPS HARI INI (hanya tab Semua & tidak sedang search) ---
            if (_selectedTab == 0 && _searchQuery.isEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBC1A6F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              " Tips Hari Ini",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              _todayTip["category"],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _todayTip["title"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _todayTip["shortDesc"],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 12,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/detail-tip',
                                arguments: _todayTip,
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                            ),
                            child: const Text(
                              "Baca Selengkapnya →",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "⏱ ${_todayTip['readTime']}",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],

            // HEADER ENSIKLOPEDIA
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedTab == 3
                        ? "Favorit Saya"
                        : "Ensiklopedia\nTanaman",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                  ),
                  Text(
                    "${filtered.length} tanaman",
                    style: const TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // EMPTY STATE
            if (filtered.isEmpty)
              Padding(
                padding: const EdgeInsets.all(40),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        _selectedTab == 3
                            ? Icons.favorite_border
                            : Icons.search_off,
                        size: 64,
                        color: Colors.black12,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _selectedTab == 3
                            ? "Belum ada tanaman favorit"
                            : "Tanaman tidak ditemukan",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _selectedTab == 3
                            ? "Ketuk ikon ❤️ pada kartu tanaman\nuntuk menambahkan ke favorit"
                            : "Coba kata kunci yang berbeda",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: filtered
                      .map((plant) => _buildPlantCard(plant))
                      .toList(),
                ),
              ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantCard(Map<String, dynamic> plant) {
    final isFav = _favorites.contains(plant["name"]);
    final isIndoor = plant["category"] == "tanaman_indoor";

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail-tanaman',
          arguments: {
            'plant': plant,
            'isFavorite': isFav,
            'onFavoriteToggle': () => _toggleFavorite(plant["name"]),
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    plant["imageUrl"],
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => Container(
                      height: 180,
                      color: Colors.pink.shade50,
                      child: const Icon(
                        Icons.local_florist,
                        size: 50,
                        color: Color(0xFFBC1A6F),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isIndoor
                          ? Colors.green.shade700
                          : const Color(0xFFBC1A6F),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isIndoor ? " Indoor" : " Bunga Potong",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => _toggleFavorite(plant["name"]),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : const Color(0xFFBC1A6F),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant["name"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    plant["latinName"],
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black38,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      _buildTag(
                        Icons.star_outline,
                        plant["difficulty"],
                        const Color(0xFFFFF3CD),
                        Colors.orange,
                      ),
                      _buildTag(
                        Icons.wb_sunny_outlined,
                        plant["light"],
                        const Color(0xFFFFF3CD),
                        Colors.orange,
                      ),
                      _buildTag(
                        Icons.water_drop_outlined,
                        plant["water"],
                        const Color(0xFFE3F2FD),
                        Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Lihat Detail →",
                        style: TextStyle(
                          color: Color(0xFFBC1A6F),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(
    IconData icon,
    String label,
    Color bgColor,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: iconColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: iconColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
