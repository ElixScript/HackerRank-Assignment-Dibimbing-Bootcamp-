# Advanced SQL Queries – HackerRank Case Study

Repository ini berisi kumpulan solusi SQL untuk **Assignment Case Study – Advanced SQL Queries**.  
Setiap soal dikerjakan menggunakan pendekatan **query modular** dengan fokus pada **readability**, **deterministic ordering**, dan penerapan **teknik SQL lanjutan** seperti CTE, conditional logic, agregasi bertingkat, serta window function.

---

## Objectives

Assignment ini bertujuan untuk melatih kemampuan mahasiswa dalam:

- Menggunakan **CTE (WITH clause)** untuk memecah query kompleks menjadi langkah yang terstruktur
- Menerapkan **JOIN berbasis rentang nilai**
- Menggunakan **CASE WHEN** untuk conditional logic
- Melakukan **agregasi tunggal dan bertingkat** (MIN, MAX, COUNT, SUM)
- Menggunakan **window function** untuk seleksi baris optimal per grup
- Menulis query yang **readable, efisien, dan deterministik**

---

## Daftar Soal

### 1. The Report
Link soal:  
https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true  

**Deskripsi:**  
Soal ini meminta pembuatan laporan siswa dengan memetakan nilai (marks) ke grade berdasarkan rentang nilai tertentu. Terdapat aturan khusus mengenai penampilan nama siswa dan pengurutan hasil.

**Tujuan Belajar:**
- Range join antara tabel `Students` dan `Grades`
- Pemetaan grade menggunakan `CASE WHEN`
- Pengurutan multi-kolom secara deterministik

**Konsep Kunci:**
- JOIN menggunakan `BETWEEN`
- `CASE WHEN grade < 8 THEN NULL`
- `ORDER BY grade DESC, name ASC, marks ASC`

---

### 2. Weather Observation Station 18
Link soal:  
https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true  

**Deskripsi:**  
Soal ini berfokus pada perhitungan jarak Manhattan menggunakan nilai minimum dan maksimum latitude serta longitude dari tabel cuaca.

**Tujuan Belajar:**
- Agregasi global menggunakan fungsi MIN dan MAX
- Perhitungan numerik
- Formatting hasil numerik

**Konsep Kunci:**
- `MIN(lat_n)`, `MAX(lat_n)`
- `MIN(long_w)`, `MAX(long_w)`
- Perhitungan jarak Manhattan
- `CAST(... AS DECIMAL(10,4))`

---

### 3. Top Competitors
Link soal:  
https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true  

**Deskripsi:**  
Menentukan hacker yang memperoleh skor maksimum pada lebih dari satu challenge.

**Tujuan Belajar:**
- Join multi-tabel
- Agregasi per hacker
- Filtering menggunakan HAVING

**Konsep Kunci:**
- Penentuan skor maksimum per challenge
- `COUNT()` submission dengan skor maksimum
- `HAVING COUNT(*) > 1`
- `ORDER BY count DESC, hacker_id ASC`

---

### 4. Ollivander's Inventory
Link soal:  
https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true  

**Deskripsi:**  
Soal ini meminta pemilihan wand termurah untuk setiap kombinasi usia dan kekuatan, dengan syarat wand tidak bersifat jahat.

**Tujuan Belajar:**
- Penggunaan window function
- Seleksi baris optimal per grup

**Konsep Kunci:**
- Join tabel `Wands` dan `Wands_Property`
- Filter `is_evil = 0`
- `MIN(coins_needed) OVER (PARTITION BY age, power)`
- Filtering berdasarkan hasil window function

---

### 5. Contest Leaderboard
Link soal:  
https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true  

**Deskripsi:**  
Menyusun leaderboard berdasarkan total skor maksimum yang diperoleh hacker dari setiap challenge.

**Tujuan Belajar:**
- Agregasi bertingkat (nested aggregation)
- Penyusunan leaderboard

**Konsep Kunci:**
- `MAX(score)` per `(hacker_id, challenge_id)`
- `SUM(max_score)` per hacker
- `HAVING SUM(score) > 0`
- `ORDER BY total_score DESC, hacker_id ASC`

---

## Catatan

- Setiap solusi ditulis dengan alias yang konsisten dan struktur query yang mudah dibaca
- Penggunaan CTE dilakukan untuk meningkatkan keterbacaan dan kemudahan pengujian query
- Urutan hasil dibuat deterministik sesuai dengan ketentuan masing-masing soal
- Repository ini ditujukan untuk tujuan pembelajaran dan penguatan konsep SQL lanjutan

---

## Tools
- HackerRank
- SQL (MySQL / PostgreSQL)
- Git dan GitHub
