<?php

namespace Database\Seeders;

use \App\Models\User;
use App\Models\Review;
use App\Models\TempatWisata;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {

        $tw1 = array(
            'name' => "Trans Studio Bandung",
            'city' => "Bandung",
            'price' => "200000",
            'description' => "Trans Studio Bandung adalah sebuah mal sekaligus taman bermain indoor terbesar pertama di Indonesia yang terletak di Kota Bandung, Jawa Barat. Trans Studio Bandung dibangun di lahan seluas 17 hektar. Wahana yang terdapat didalamnya menawarkan petualangan dan sensasi untuk para penyuka adrenalin.",
            "pictureUrl" => "https://i.imgur.com/LB2c1FF.png"
        );

        $tw2 = array(
            'name' => "Kawah Putih Ciwidey",
            'city' => "Bandung",
            'price' => "35000",
            'description' => "Kawah Putih adalah sebuah tempat wisata di Jawa Barat yang terletak di Desa Alam Endah, Kecamatan Rancabali, Kabupaten Bandung Jawa Barat yang terletak di kaki Gunung Patuha. Kawah putih merupakan sebuah danau yang terbentuk dari letusan Gunung Patuha. Tanah yang bercampur belerang di sekitar kawah ini berwarna putih, lalu warna air yang berada di kawah ini berwarna putih kehijauan, yang unik dari kawah ini adalah airnya kadang berubah warna. Danau Kawah Putih sendiri berada pada ketinggian 2194 m tapi luas total Danau Kawah Putih 25 ha yang dipakai wisata 5 ha dan lokasi kawah sendiri 3 ha.",
            "pictureUrl" => "https://i.imgur.com/mbAm8u1.jpg"
        );

        $tw3 = array(
            'name' => "Ranca Upas",
            'city' => "Bandung",
            'price' => "40000",
            'description' => "Ranca Upas atau Kampung Cai Ranca Upas adalah salah satu bumi perkemahan di Bandung, Jawa Barat, Indonesia. Terletak di Jalan Raya Ciwidey Patenggang KM. 11, Alam Endah, Ciwidey Kabupaten Bandung, dengan jarak sekitar 50 km dari pusat Kota Bandung.Memiliki luas area sekitar 215 Hektar, berada pada 1700 meter di atas permukaan laut, dengan suhu udara sekitar 17 °C - 20 °C. Sekitar area, oleh hutan lindung dengan beragam flora seperti Pohon Huru, Hamirug, Jamuju, Kihujan, Kitambang, Kurai, Pasang dan Puspa. Sedangkan fauna terdiri dari beragam jenis burung, serta beberapa satwa jinak lainnya.",
            "pictureUrl" => "https://i.imgur.com/2YIBBqs.jpg"
        );

        $tw4 = array(
            'name' => "Dufan",
            'city' => "Jakarta",
            'price' => "300000",
            'description' => "Dufan atau disebut juga Dunia Fantasi adalah sebuah theme park yang terletak di kawasan Taman Impian Jaya Ancol, Jakarta Utara, Indonesia yang diresmikan dan dibuka untuk umum pada tanggal 29 Agustus 1985.",
            "pictureUrl" => "https://i.imgur.com/ezdEdrn.jpg"
        );

        $tw5 = array(
            'name' => "Monumen Nasional (Monas)",
            'city' => "Jakarta",
            'price' => "15000",
            'description' => "Monumen Nasional atau yang disingkat dengan Monas atau Tugu Monas adalah monumen peringatan setinggi 132 meter (433 kaki) yang terletak tepat di tengah Lapangan Medan Merdeka, Jakarta Pusat. Monas didirikan untuk mengenang perlawanan dan perjuangan rakyat Indonesia dalam merebut kemerdekaan dari pemerintahan kolonial Hindia Belanda. Pembangunan dimulai pada 17 Agustus 1961 di bawah perintah presiden Soekarno dan diresmikan sehingga dibuka untuk umum pada 12 Juli 1975. Tugu ini dimahkotai lidah api yang dilapisi lembaran emas yang melambangkan semangat perjuangan yang menyala-nyala dari rakyat Indonesia.",
            "pictureUrl" => "https://i.imgur.com/2kbQh3A.jpg"
        );

        $tw6 = array(
            'name' => "Snowbay Waterpark TMII",
            'city' => "Jakarta",
            'price' => "75000",
            'description' => "SnowBay Waterpark yang terletak di Taman Mini Indonesia Indah (TMII) dapat menjadi salah satu pilihan wahana ketika kamu mengunjungi Taman Mini Indonesia Indah. Ada berbagai wahana air yang bisa kamu coba dan rasakan keseruannya di sini. Desainnya yang unik karena bertema salju dapat melengkapi agenda seru-seruan! Rasakan sensasi berseluncur dengan kecepatan tinggi di Everslide, kesegaran guyuran ember raksasa di Giant Bucket, dan wahana bermain air lainnya.",
            "pictureUrl" => "https://i.imgur.com/iBU26Ax.jpg"
        );

        $tw7 = array(
            'name' => "Pulau Biawak",
            'city' => "Indramayu",
            'price' => "400000",
            'description' => "Kepulauan Biawak adalah sebuah kepulauan yang terletak di Laut Jawa di Kabupaten Indramayu Jawa Barat. Kepulauan Biawak terletak di sebelah utara semenanjung Inrdamayu sekitar 40 kilometer dari pantai utara Indramayu, dan secara administratif termasuk ke dalam wilayah kecamatan Indramayu, Kabupaten Indramayu.",
            "pictureUrl" => "https://i.imgur.com/7ZMsHez.jpg"
        );

        $tw8 = array(
            'name' => "Kamojang",
            'city' => "Garut",
            'price' => "15000",
            'description' => "Gunung Kamojang (dikenal luas dengan nama Kawah Kamojang) merupakan sumber panas bumi yang terletak di Jawa Barat, Indonesia. Dalam sejarahnya, dikenal sebagai gunung berapi yang bernama Gunung Guntur, tetapi kawah ini dikelompokkan dalam gunung berapi aktif karena aktivitas panas bumi.",
            "pictureUrl" => "https://i.imgur.com/Bezzfyl.jpg"
        );

        $tw9 = array(
            'name' => "Transera Waterpark",
            'city' => "Bekasi",
            'price' => "95000",
            'description' => "Satu-satunya arena rekreasi air yang menyediakan 2 zona berbeda di kawasan Kota Harapan Indah, Bekasi. Transera Waterpark dirancang khusus sebagai arena rekreasi air dan taman bermain kelas dunia yang hadir dengan konsep nuansa alam Afrika yang eksotis. Tersedia beragam atraksi dan wahana air yang menarik, unik, menantang, dan penuh petualangan yang dapat menjadi pilihan anak-anak, remaja, maupun orang dewasa. Kunjungi Transera Waterpark dan dapatkan pengalaman seru yang tak terlupakan sepanjang hidup!",
            "pictureUrl" => "https://i.imgur.com/XssmFGI.jpg"
        );

        $tw10 = array(
            'name' => "Highland Park Resort",
            'city' => "Bogor",
            'price' => "1500000",
            'description' => "Terletak di kaki Gunung Salak, resor santai ini berjarak 6 km dari Desa Budaya Sindang Barang. Akomodasi kamar berkisar dari teepee, tenda bergaya Mongolia dengan langit-langit kain, hingga bungalo rumah pohon. Semua kamar dilengkapi TV layar datar, kamar mandi dalam, dan fasilitas pembuat teh dan kopi. Room service tersedia. Fasilitas meliputi restoran, bar, dan kolam renang outdoor. Berbagai kegiatan, seperti menunggang kuda, golf mini, dan zipline ditawarkan. Layanan pijat tersedia dengan biaya tambahan.",
            "pictureUrl" => "https://i.imgur.com/yZg2MaM.jpg"
        );

        $tw11 = array(
            'name' => "Candi Borobudur",
            'city' => "Yogyakarta",
            'price' => "50000",
            'description' => "Kamu berencana liburan ke Jawa Tengah? Pastikan kamu berkunjung ke Candi Borobudur, ya! Kemegahan dan pengalaman tempat wisata di Indonesia yang bersejarah ini pasti akan membuat perjalananmu lebih berkesan!
            // Dibangun pada abad kedelapan oleh Dinasti Syailendra, Candi Borobudur merupakan candi Buddha terbesar di dunia. Dengan harga tiket masuk Candi Borobudur yang terjangkau, kamu bisa menyaksikan keindahan situs Warisan Dunia UNESCO ini yang menakjubkan.",
            "pictureUrl" => "https://i.imgur.com/TGKG3AM.jpeg"
        );


        TempatWisata::create($tw1);
        TempatWisata::create($tw2);
        TempatWisata::create($tw3);
        TempatWisata::create($tw4);
        TempatWisata::create($tw5);
        TempatWisata::create($tw6);
        TempatWisata::create($tw7);
        TempatWisata::create($tw8);
        TempatWisata::create($tw9);
        TempatWisata::create($tw10);
        TempatWisata::create($tw11);

        //User::factory(50)->create();
        //TempatWisata::factory(50)->create();
        //Review::factory(50)->create();
    }
}
