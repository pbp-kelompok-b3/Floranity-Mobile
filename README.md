# Floranity Mobile

**Floranity** dirancang bagi para penggemar tanaman hias yang ingin mempraktikkan perawatan tanaman yang penuh perhatian dan berkelanjutan. Pada intinya, Floranity bertujuan untuk mengurangi risiko matinya tanaman akibat kesalahan perawatan, menghemat air, serta menumbuhkan hubungan yang lebih mendalam dan menenangkan antara manusia dan ruang hijau yang mereka ciptakan.

Aplikasi mobile ini dibangun menggunakan **Flutter** sebagai pengembangan lintas platform dari situs web **Floranity** pada Proyek Tengah Semester. Seluruh data aplikasi tersimpan secara terpusat pada basis data situs web Django (PWS) dan diakses secara asinkron melalui *web service* yang dibangun menggunakan **Django REST Framework (DRF)**.

---

## Tautan Penting

* **Tautan Deployment Web (PWS):** [Floranity Web (PWS)](https://pws.cs.ui.ac.id/rama.sanjaya/floranity)
* **Tautan Desain Figma:** [Figma Floranity UI/UX](https://www.figma.com/design/qbUWPRG2hfBVHtiduK0h2W/Floranity---UI-UX?node-id=0-1&t=jYRySARAl85jCrX0-1)
* **Tautan Unduh APK (GitHub Release):** 
* **Tautan Unduh APK (Bitrise):** 
* **Tautan Video Promosi:** 
---

## Anggota Kelompok - B03

| Nama Lengkap | NPM | Modul |
| :--- | :--- | :--- |
| **Aksara Putra Fachruddin** | 2506597284 | Forum dan Observasi Komunitas (`forum`) |
| **Rama Sanjaya** | 2506604421 | Koleksi dan Katalog Tanaman (`koleksi`) |
| **Syabil Wafi Ahdi** | 2506657371 | Jadwal dan Log Perawatan (`journal`) |
| **Fatih Naufal Habibilah** | 2506586394 | Autentikasi dan Profil Pengguna (`akun`) |

---

## Deskripsi dan Fungsi Aplikasi

Setiap jenis tanaman memiliki karakteristik dan rutinitas perawatan yang berbeda. Kesalahan umum seperti siklus penyiraman yang tidak tepat (*overwatering* maupun *underwatering*), pemberian pupuk yang keliru, hingga kurangnya pencatatan perkembangan tanaman sering kali menghambat tumbuh kembang tanaman.

**Floranity Mobile** hadir untuk menjawab permasalahan tersebut melalui empat fungsi utama dalam genggaman pengguna:
1. **Manajemen Koleksi & Katalog Tanaman:** Mencatat koleksi tanaman pribadi beserta jurnal pertumbuhannya secara kronologis, dilengkapi referensi perawatan spesies (kebutuhan cahaya, air, dan tingkat kesulitan) dari basis data botani eksternal.
2. **Pencatatan Log & Rekomendasi Perawatan Berbasis Cuaca:** Mencatat aktivitas perawatan harian (menyiram, memupuk, memangkas, *repotting*) dan memantau status kesehatan tanaman dengan dukungan data cuaca mikro lokal.
3. **Forum Diskusi & Observasi Komunitas:** Ruang berbagi pengalaman, tanya jawab, *showcase* tanaman, serta eksplorasi observasi biodiversitas urban di sekitar lokasi pengguna.
4. **Manajemen Akun & Profil Pengguna:** Sistem autentikasi terintegrasi dan pengelolaan identitas profil pecinta tanaman yang tersinkronisasi antara situs web dan aplikasi mobile.

---

## Daftar Modul dan Pembagian Kerja

Setiap anggota kelompok mengimplementasikan satu modul yang mencakup pembangunan *endpoint* API menggunakan **Django REST Framework** (serializer dan view/viewset) pada repositori web Django, perancangan widget layout & input di Flutter, *event handling*, pemanggilan HTTP asinkron, serta pengolahan respons JSON.

### 1. Koleksi dan Katalog Tanaman (`koleksi`)
* **Penanggung Jawab (PiC):** Rama Sanjaya (2506604421)

### 2. Jadwal dan Log Perawatan (`journal`)
* **Penanggung Jawab (PiC):** Syabil Wafi Ahdi (2506657371)

### 3. Forum dan Observasi Komunitas (`forum`)
* **Penanggung Jawab (PiC):** Aksara Putra Fachruddin (2506597284)

### 4. Autentikasi dan Profil Pengguna (`akun`)
* **Penanggung Jawab (PiC):** Fatih Naufal Habibilah (2506586394)

---

## Peran atau Aktor Pengguna Aplikasi

1. **Pengguna Belum Terautentikasi (*Guest* / Tamu)**
   * Melihat halaman pengenalan (*onboarding* / *landing*) aplikasi Floranity.
   * Menjelajahi katalog referensi spesies tanaman hias.
   * Membaca unggahan diskusi publik di Forum Komunitas dan melihat profil publik pengguna lain.
   * Melakukan pendaftaran akun baru (*Register*) atau masuk ke akun yang sudah ada (*Login*).

2. **Pengguna Terautentikasi (*Registered User* / Penggiat Tanaman)**
   * Memiliki seluruh hak akses *Guest*.
   * **Modul Koleksi:** Menambah, melihat, mengedit, dan menghapus tanaman pada koleksi pribadi, serta mengelola jurnal pertumbuhan tiap tanaman.
   * **Modul Jadwal & Log Perawatan:** Mencatat, memperbarui, dan menghapus log perawatan tanaman serta memantau rekomendasi perawatan berdasarkan kondisi cuaca.
   * **Modul Forum:** Membuat, mengedit, dan menghapus *post* diskusi milik sendiri, menulis komentar, serta memberikan *like* dan menyimpan *bookmark* pada unggahan komunitas.
   * **Modul Profil:** Mengelola informasi profil pribadi (nama tampilan, bio, foto profil) dan menghapus akunnya sendiri.

3. **Administrator (*Admin*)**
   * Mengelola seluruh entitas basis data, memantau aktivitas pengguna, serta melakukan moderasi terhadap konten forum dan komentar melalui *Django Admin Panel* pada situs web utama (PWS).

---

## Alur Pengintegrasian Data (Flutter ↔ Django REST Framework ↔ PWS)

Integrasi data antara aplikasi mobile **Floranity** (Flutter) dan situs web **Floranity** yang dideploy di PWS dilakukan menggunakan arsitektur client-server berbasis RESTful API dengan tahapan sebagai berikut:
```
+----------------------------------------------------+
|              APLIKASI MOBILE FLUTTER               |
|  - UI Widgets (Material) & Event Handling          |
|  - Dart Models (fromJson / toJson)                 |
|  - State & Auth Session (Provider & CookieRequest) |
+----------------------------------------------------+
                   |                      ^
      HTTP Request | (GET/POST/PUT/DEL)   | HTTP Response
   + Cookies/JSON  | secara Asinkron      | (Payload JSON)
                   v                      |
+----------------------------------------------------+
|         WEB SERVICE DJANGO REST FRAMEWORK          |
|  - CORS & Session Middleware (django-cors-headers) |
|  - Routing & Endpoint API (urls.py)                |
|  - APIView / ViewSet & Permissions (views.py)      |
|  - Data Validation & Serialization (serializers.py)|
+----------------------------------------------------+
                   |                      ^
         Query ORM |                      | Objek Model
      & Integrasi  v                      | & Data API
+----------------------------------------------------+
|        BASIS DATA PWS & LAYANAN EKSTERNAL          |
|  - Database PostgreSQL PWS (Data Terpusat Web/App) |
|  - API Eksternal (Perenual, OpenWeather, dsb.)     |
+----------------------------------------------------+
```

1. **Penyediaan Web Service dengan Django REST Framework (DRF) di Sisi Server (PWS):**
   * Pada proyek Django dari Proyek Tengah Semester, setiap modul (`koleksi`, `journal`, `forum`, `akun`) mendefinisikan **Serializer** (`serializers.py`) menggunakan `ModelSerializer` / `Serializer` dari DRF untuk mengubah objek model Django menjadi format **JSON** (serialisasi) serta memvalidasi data JSON yang masuk dari klien (deserialisasi).
   * Setiap modul mengekspos *endpoint* API melalui `APIView` atau `ViewSet` pada `views.py` dan mendaftarkan rutenya di `urls.py` dengan menerapkan izin akses (*permission classes* seperti `IsAuthenticated` atau `IsAuthenticatedOrReadOnly`) agar keamanan dan kepemilikan data tetap terjaga.

2. **Manajemen Autentikasi dan Sesi Lintas Platform:**
   * Aplikasi Flutter menggunakan paket `pbp_django_auth` (`CookieRequest`) dan `provider` untuk mengelola *state* autentikasi dan menyimpan *session cookie* pada perangkat mobile setelah pengguna berhasil login melalui *endpoint* autentikasi DRF.
   * Setiap permintaan HTTP berikutnya ke *endpoint* yang membutuhkan otorisasi akan menyertakan kredensial sesi tersebut secara otomatis.

3. **Pemanggilan Asinkron dari Aplikasi Flutter:**
   * Ketika pengguna berinteraksi dengan antarmuka Flutter (misalnya membuka halaman koleksi, mengirim formulir tambah tanaman, mencatat log penyiraman, atau mempublikasikan *post* forum), *event handler* pada Flutter memicu fungsi asinkron (`async`/`await`).
   * Fungsi tersebut mengirimkan permintaan HTTP (`GET`, `POST`, `PUT`/`PATCH`, atau `DELETE`) menuju *endpoint* DRF di server PWS.

4. **Pengolahan Data JSON dan Pembaruan Antarmuka (UI):**
   * Server Django memproses permintaan melalui ORM ke basis data PostgreSQL (dan ke API eksternal seperti Perenual, OpenWeather, atau iNaturalist bila diperlukan), lalu mengembalikan respons berformat **JSON** beserta kode status HTTP yang sesuai.
   * Aplikasi Flutter mengurai (*parse*) respons JSON tersebut ke dalam kelas model **Dart** (`fromJson` / `toJson`), lalu memperbarui tampilan widget secara reaktif menggunakan `FutureBuilder`, `setState`, atau `Provider`. Dengan demikian, setiap perubahan data yang dilakukan di aplikasi mobile akan langsung terlihat di situs web PWS, begitu pula sebaliknya.

---

## Panduan Instalasi dan Menjalankan Aplikasi Secara Lokal

1. **Pastikan Flutter SDK telah terpasang:**
   ```bash
   flutter doctor
   ```
2. **Clone repositori ini:**
   ```bash
   git clone https://github.com/pbp-kelompok-b3/floranity.git
   cd floranity-mobile
   ```
3. **Unduh seluruh dependensi paket Flutter:**
   ```bash
   flutter pub get
   ```
4. **Jalankan aplikasi pada emulator atau perangkat fisik:**
   ```bash
   flutter run
   ```