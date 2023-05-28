import 'package:flutter/material.dart';
import 'package:flutter_habiskerja_note_app/pages/home_page.dart';
import 'package:flutter_habiskerja_note_app/utils/user_shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController nameController;
  late TextEditingController pinController;
  bool isPinExist = false;
  String? _pin;

  @override
  void initState() {
    // variabelnya harus dideklarasikan terlebih dahulu karena diatas pakai 'late'
    nameController = TextEditingController();
    pinController = TextEditingController();
    String? pin = UserSharedPreferences.getPin();
    if (pin != null){
      setState(() {
        isPinExist = true;
        _pin = pin;
      });
    }
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    nameController.dispose(); // artinya jika apk nya ditutup maka semua controller akan di clear supaya performa hp nya lebih maksimal
    pinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // ngebuat posisinya jd ditengah tengah (antara atas dan bawah)
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const Center( // kalo dibungkus sm center jd tulisannya ketengah (antara kanan dan kiri)
              child: Text(
                'Buku Catatan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Nama',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32, 
                vertical: 8,
              ),
              child: TextField(
                controller: nameController,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.all(0),
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
             const Text(
              'PIN',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100, 
                vertical: 8,
              ),
              child: TextField(
                controller: pinController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.all(0),
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async{ // dikasih async karena akan ada proses ke local storage , shared preferences tadi
                await UserSharedPreferences.setName(
                  name: nameController.text, // jadi ketika nanti diisi keluarnya akan ada isinya juga
                  pin: pinController.text
                );
                Navigator.of(context).push( // sintak untuk berpindah ke page selanjutnya
                  MaterialPageRoute(
                    builder: (context){
                      return const HomePage();
                    },
                  ),
                );
              }, 
              child: const Text(
                'Masuk',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}