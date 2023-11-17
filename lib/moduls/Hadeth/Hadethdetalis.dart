import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/moduls/Hadeth/Hadeth_view.dart';
import 'package:untitled3/moduls/Quran/Quran_view.dart';

class Hadethdetalis extends StatefulWidget {
  static const String routeName = "Hadethdetalis";

  const Hadethdetalis({super.key});

  @override
  State<Hadethdetalis> createState() => _QuranditailsState();
}

class _QuranditailsState extends State<Hadethdetalis> {
  String Content = "";
  List<String> allVerses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadethcontent;
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
                    Text(args.title, style: theme.textTheme.bodyLarge),
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
                  itemBuilder: (context, index) =>
                      Text(args.content, style: theme.textTheme.bodySmall),
                  itemCount: 1,
                ))
              ],
            ),
          ),
        ));
  }
}
