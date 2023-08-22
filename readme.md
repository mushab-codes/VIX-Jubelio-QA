Persyaratan
Sebelum Anda memulai, pastikan Anda memiliki hal-hal berikut diinstal di sistem Anda:

Ruby: Pastikan Anda telah menginstal Ruby di komputer Anda. Anda dapat mengunduh dan menginstalnya dari ruby-lang.org.

Bundler: Bundler adalah alat manajemen dependensi Ruby. Anda dapat menginstalnya dengan perintah berikut:

gem install bundler

Browser Driver: Untuk menjalankan tes di browser, Anda perlu mengunduh dan menginstal driver yang sesuai (seperti Chromedriver untuk Chrome atau Geckodriver untuk Firefox).

Langkah-langkah

Clone Repositori: Clone repositori ini ke komputer Anda.

Install Dependensi: Buka terminal/command prompt, arahkan ke direktori repositori yang baru saja Anda clone, dan jalankan perintah berikut untuk menginstal dependensi yang diperlukan:

bundle install
Edit Skenario: Buka file .rb yang berisi skenario tes Anda dan sesuaikan dengan halaman web yang ingin Anda uji.

Menjalankan Tes: Dalam terminal, jalankan perintah berikut untuk menjalankan tes menggunakan RSpec:

Copy code
rspec nama_file_spec.rb
Ganti nama_file_spec.rb dengan nama file spesifikasi RSpec Anda.

Lihat Hasil: RSpec akan menjalankan tes dan memberikan laporan hasil di terminal. Anda dapat melihat apakah tes berhasil atau gagal.
