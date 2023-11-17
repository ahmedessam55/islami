import 'package:flutter/material.dart';
import 'package:untitled3/moduls/Hadeth/Hadeth_view.dart';
import 'package:untitled3/moduls/Quran/Quran_view.dart';
import 'package:untitled3/moduls/Radio/Radio_view.dart';
import 'package:untitled3/moduls/Sebha/Sebha_view.dart';
import 'package:untitled3/moduls/settings/Settings_view.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Home_layout";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int SelectedIndex = 0;
  List<Widget> Screens = [
    Quranview(),
    Hadethview(),
    Sebhaview(),
    Radioview(),
    Settingsview(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"))),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("إسلامي"),
          ),
          body: Screens[SelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                SelectedIndex = index;
              });
            },
            currentIndex: SelectedIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran.png")),
                  label: "Quran"),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage("assets/images/quran-quran-svgrepo-com.png")),
                  label: "Hadeth"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio.png")),
                  label: "Radio"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "settings"),
            ],
          ),
        ));
  }
}
