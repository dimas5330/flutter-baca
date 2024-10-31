import 'package:baca_app/blocs/auth/auth_bloc.dart';
import 'package:baca_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkGreyColor,
        // bottomNavigationBar: ClipRRect(
        //   borderRadius: const BorderRadius.only(
        //     topLeft: Radius.circular(25),
        //     topRight: Radius.circular(25),
        //   ),
        //   child: SizedBox(
        //     height: 88,
        //     child: BottomNavigationBar(
        //       type: BottomNavigationBarType.fixed,
        //       backgroundColor: brownColor,
        //       elevation: 0,
        //       selectedItemColor: greyColor,
        //       unselectedItemColor: whiteColor,
        //       showSelectedLabels: true,
        //       showUnselectedLabels: true,
        //       selectedLabelStyle: fustatTextStyle.copyWith(
        //         fontSize: 12,
        //         fontWeight: medium,
        //       ),
        //       unselectedLabelStyle: fustatTextStyle.copyWith(
        //         fontSize: 12,
        //         fontWeight: medium,
        //       ),
        //       items: [
        //         BottomNavigationBarItem(
        //           icon: Image.asset(
        //             'assets/ic_home.png',
        //             width: 18,
        //             color: whiteColor,
        //           ),
        //           label: 'Beranda',
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Image.asset(
        //             'assets/ic_notes.png',
        //             width: 16,
        //           ),
        //           label: 'Catatanku',
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Image.asset(
        //             'assets/ic_series.png',
        //             width: 20,
        //           ),
        //           label: 'Seri Lain',
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Image.asset(
        //             'assets/ic_profile.png',
        //             width: 16,
        //           ),
        //           label: 'Profil',
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        body: ListView(
          children: [
            buildProfile(context),
            buildPerikop(),
            buildFeature(),
          ],
        ),
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat(
      'EEEE, d MMMM yyyy',
      'id_ID',
    );
    final String formatted = formatter.format(now);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Stack(
            children: [
              const Image(
                image: AssetImage(
                  'assets/img_home.png',
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shallom,',
                          style: fustatTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          state.user.name.toString(),
                          style: fustatTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                        ),
                        Text(
                          'Selamat memulai Saat Teduh',
                          style: fustatTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: extraLight,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: state.user.profilePicture == null
                                ? const AssetImage(
                                    'assets/img_profile.jpg',
                                  )
                                : NetworkImage(
                                    state.user.profilePicture!,
                                  ) as ImageProvider,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 250,
                  left: 15,
                  child: Row(
                    children: [
                      Text(
                        'Renungan Hari Ini',
                        style: TextStyle(
                          fontFamily: 'Fustat-Bold',
                          fontSize: 20,
                          color: whiteColor,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        formatted,
                        style: TextStyle(
                          fontFamily: 'Fustat-Light',
                          fontSize: 14,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ))
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget buildPerikop() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [
              0.5,
              0.8,
              0.9,
            ],
            colors: [brownColor, greyColor, brownColor],
          ),
          color: brownColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topRight: Radius.circular(164),
          ),
        ),
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 15,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              child: Text(
                //judul
                'Suatu Hari di Bawah Pohon',
                style: TextStyle(
                    fontFamily: 'Fustat-ExtraBold',
                    fontSize: 36,
                    color: whiteColor),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              //bacaan
              '1 Raja-Raja 19:1-8',
              style: TextStyle(
                  fontFamily: 'Fustat-ExtraBold',
                  fontSize: 16,
                  color: whiteColor),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              //ayat_bacaan
              '1	Ketika Ahab memberitahukan kepada Izebel segala yang dilakukan Elia dan perihal Elia membunuh semua nabi itu dengan pedang,\n\n2	maka Izebel menyuruh seorang suruhan mengatakan kepada Elia: "Beginilah kiranya para allah menghukum aku, bahkan lebih lagi dari pada itu, jika besok kira-kira pada waktu ini aku tidak membuat nyawamu sama seperti nyawa salah seorang dari mereka itu."\n\n3	Maka takutlah ia, lalu bangkit dan pergi menyelamatkan nyawanya; dan setelah sampai ke Bersyeba, yang termasuk wilayah Yehuda, ia meninggalkan bujangnya di sana.\n\n4	Tetapi ia sendiri masuk ke padang gurun sehari perjalanan jauhnya, lalu duduk di bawah sebuah pohon arar. Kemudian ia ingin mati, katanya: "Cukuplah itu! Sekarang, ya TUHAN, ambillah nyawaku, sebab aku ini tidak lebih baik dari pada nenek moyangku."\n\n5	Sesudah itu ia berbaring dan tidur di bawah pohon arar itu. Tetapi tiba-tiba seorang malaikat menyentuh dia serta berkata kepadanya: "Bangunlah, makanlah!"\n\n6	Ketika ia melihat sekitarnya, maka pada sebelah kepalanya ada roti bakar, dan sebuah kendi berisi air. Lalu ia makan dan minum, kemudian berbaring pula.\n\n7	Tetapi malaikat TUHAN datang untuk kedua kalinya dan menyentuh dia serta berkata: "Bangunlah, makanlah! Sebab kalau tidak, perjalananmu nanti terlalu jauh bagimu."\n\n8	Maka bangunlah ia, lalu makan dan minum, dan oleh kekuatan makanan itu ia berjalan empat puluh hari empat puluh malam lamanya sampai ke gunung Allah, yakni gunung Horeb.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Fustat-Light',
                fontSize: 16,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(
                  0xffc4c4c4,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Center(
                child: Text(
                  //ayat_kunci
                  'Ketika ia melihat sekitarnya, maka pada sebelah kepalanya ada roti bakar, dan sebuah kendi berisi air. Lalu ia makan dan minum, kemudian berbaring pula. (ayat 6)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Fustat-Light',
                    fontSize: 16,
                    color: blackColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              //isi_renungan
              'Suatu malam, telinga dan mata Natasya yang nampak sayu untuk bersiap tidur langsung berubah ke mode siaga satu seketika. Natasya yang geli dengan serangga cokelat dengan kekuatan extra bisa terbang itu membuat Natasya terpaksa membuka pintu dan berlari ke ibunya. Ia meminta ibunya untuk mengusir kecoa itu di kamarnya. Namun, siapa sangka ibunya bukan pergi ke kamarnya, namun justru pergi untuk memberikan semprotan serangga pada Natasya.\n\nSebelum potongan kisah masuknya Elia ke padang gurun yang sudah kita baca tadi, akhirnya setelah tahun ketiga masa kekeringan dan kelaparan, oleh perintah Allah Elia muncul dan meminta Ahab untuk mengumpulkan semua nabi Baal (1 Raja-Raja 18:1), 450 orang jumlahnya (1 Raj 18:22). Setelah menumpas 450 nabi baal, ia mendapat ancaman dari Izebel bahwa ia akan dibunuh (19:2). Kondisi Elia yang digambarkan membuat kita menyadari betapa tenaga dan mentalnya terkuras habis-habisan saat itu. Puncaknya, nabi Tuhan itu sempat meminta Allah untuk mengambil nyawanya (19:4). \n\nBagaimana jika kamu berada di posisi Elia saat itu? ketika kamu sedang tenggelam dalam ketakutan, kelelahan, bahkan keputusasaan, Tuhan justru memberikan roti bakar dan air untukmu. Tak disangka, ternyata makanan itu justru menjadi kekuatan untuk meneruskan tanggung jawab yang perlu dikerjakan. \n\nTak hanya terjadi pada Elia, seringkali kita merasa keadaan sekeliling kita begitu memeras keringat dan menguras air mata. Kita merasa Allah tidak mengangkat kita. Kita merasa kita berperang sendirian di sini, sedang Allah di sana. Namun benarkah itu? \n\nSama seperti Elia dan ilustrasi di awal, kita belajar untuk jujur dan mengakui perasaan di hadapan Tuhan, sekalipun itu ketakutan maupun keputusasaan. Emosi adalah bagian dari hidup manusia. Namun, jangan sampai emosi yang kita rasakan menghancurkan iman dan harapan kita pada Tuhan. Boleh lelah, tapi jangan kalah. Dia yang mengerti kebutuhan yang mendalam pada Elia saat itu, adalah Pribadi yang sama yang juga mengerti kebutuhan mendalam diri kita saat ini. Sehingga, pekerjaan Tuhan melalui kita terus bisa dinyatakan dan dituntaskan.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Fustat-Light',
                fontSize: 16,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              decoration: const BoxDecoration(
                color: Color(
                  0xffc4c4c4,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Text(
                //refleksi
                'Renungkan : \nDosa apa yang masih kamu lakukan dan sulit untuk tinggalkan? Apakah kamu sudah berusaha untuk menghindar dan meninggalkannya?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Fustat-Light',
                  fontSize: 16,
                  color: blackColor,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Apa penerapan mu?',
                style: TextStyle(
                  fontFamily: 'Fustat-Light',
                  fontSize: 16,
                  color: whiteColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: greyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      //penerapan1
                      'Saya akan mengambil waktu untuk berdiam diri di hadapan Tuhan dan mengakui segala perasaan yang saya rasakan saat itu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Fustat-Regular',
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: greyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      //penerapan2
                      'Saya akan meminta kekuatan dari Tuhan melalui doa saya agar saya bisa tetap maju dalam mengerjakan tanggung jawab saya',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Fustat-Regular',
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 34,
            ),
            SizedBox(
              width: 250,
              child: Text(
                strutStyle:
                    const StrutStyle(height: 2.75, forceStrutHeight: true),
                //prinsip
                '“ KETIDAKTAATAN ITU MURAH DAN MUDAH, KESETIAAN PADA ALLAH ITU MAHAL NAMUN KEKAL”',
                style: TextStyle(
                    fontFamily: 'Fustat-Bold',
                    color: lightBackgroundColor,
                    fontSize: 20,
                    backgroundColor: darkBrownColor),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              //doa
              'Doa : \nTuhan sertai kami selalu dalam melawan dosa, kami adalah manusia yang lemah dan tidak namun didalam Engkau kami percaya ada kekuatan surga. Ajari kami untuk menjadi murid yang setia, jagalah hati dan pikiran kami sehingga setiap saat kami dihadapkan dosa kami boleh tetap setia. Amin.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Fustat-Regular',
                fontSize: 16,
                color: whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFeature() {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 15,
        right: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: brownColor,
              gradient: LinearGradient(
                colors: [
                  brownColor,
                  greyColor,
                ],
                stops: const [
                  0.1,
                  0.95,
                ],
              ),
            ),
            height: 88,
            width: 172,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Coming Soon',
                  style: TextStyle(
                    fontFamily: 'Fustat-Regular',
                    fontSize: 8,
                    color: whiteColor,
                  ),
                ),
                Text(
                  'Catatanku',
                  style: TextStyle(
                    fontFamily: 'Fustat-Bold',
                    fontSize: 16,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: brownColor,
              gradient: LinearGradient(
                colors: [
                  brownColor,
                  greyColor,
                ],
                stops: const [
                  0.1,
                  0.95,
                ],
              ),
            ),
            height: 88,
            width: 172,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Coming Soon',
                  style: TextStyle(
                    fontFamily: 'Fustat-Regular',
                    fontSize: 8,
                    color: whiteColor,
                  ),
                ),
                Text(
                  'Seri SaTe',
                  style: TextStyle(
                    fontFamily: 'Fustat-Bold',
                    fontSize: 16,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
