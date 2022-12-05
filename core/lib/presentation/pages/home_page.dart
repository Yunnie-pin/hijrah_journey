import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:core/core.dart';

class HijrahHomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HijrahHomePageState createState() => _HijrahHomePageState();
}

class _HijrahHomePageState extends State<HijrahHomePage> with RouteAware {
  User? _user = FirebaseAuth.instance.currentUser;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {
    var menu = [
      {
        "nama": "Al-Qur'an",
        "deskripsi": "Fitur Membaca Al-Qur'an",
        "pict": "images/quran.png",
        "routes": "",
      },
      {
        "nama": "Hadist",
        "deskripsi": "Fitur Hadist",
        "pict": "images/tasbih.png",
        "routes": "",
      },
      {
        "nama": "Waktu Sholat",
        "deskripsi": "Fitur Notifikasi Sholat dan Melihat waktu sholat",
        "pict": "images/sujud.png",
        "routes": "/waktu-sholat",
      }
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Hijrah Journey App'),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 20.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                child: Text('Assalamualaikum, ${_user?.displayName}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            Expanded(
                child: CardHomeMenu(menu: menu)),
          ],
        ));
  }
}
