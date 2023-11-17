import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/moduls/Quran/Quran_view.dart';

class Quranditails extends StatefulWidget {
  static const String routeName = "Quranditails";

  const Quranditails({super.key});

  @override
  State<Quranditails> createState() => _QuranditailsState();
}

class _QuranditailsState extends State<Quranditails> {
  String Content = "";
  List<String> allVerses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetails;
    if (Content.isEmpty) readfiles(args.suraNumber);
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"))),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("إسلامي"),
          ),
          body: Container(
            margin: const EdgeInsets.only(
                left: 30, right: 30, top: 30, bottom: 120),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            width: mediaQuery.width,
            height: mediaQuery.height,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.8),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("سورة  ${args.suraName}",
                        style: theme.textTheme.bodyLarge),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.play_circle,
                      color: Colors.black,
                    )
                  ],
                ),
                Divider(
                  color: theme.primaryColor,
                  indent: 50,
                  endIndent: 50,
                  thickness: 1.2,
                ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    Content,
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  itemCount: 1,
                ))
              ],
            ),
          ),
        ));
  }

  readfiles(String index) async {
    String text = await rootBundle.loadString("assets/files/$index.txt");
    Content = text;
    setState(() {
      allVerses = Content.split("\n");
    });
  }
}
