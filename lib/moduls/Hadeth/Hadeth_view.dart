import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/moduls/Hadeth/Hadeth_detalisview.dart';

import 'Hadethdetalis.dart';

class Hadethview extends StatefulWidget {
  const Hadethview({super.key});

  @override
  State<Hadethview> createState() => _HadethviewState();
}

class _HadethviewState extends State<Hadethview> {
  List<Hadethcontent> allhdethcontent = [];

  @override
  Widget build(BuildContext context) {
    if (allhdethcontent.isEmpty) readfiles();
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/images/ahadeth_image.png"),
        Divider(
          indent: 10,
          endIndent: 10,
          thickness: 1.5,
          color: theme.primaryColor,
        ),
        Text(
          "الاحاديث",
          style: theme.textTheme.bodyMedium,
        ),
        Divider(
          indent: 10,
          endIndent: 10,
          thickness: 1.5,
          color: theme.primaryColor,
        ),
        Expanded(
            child: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Hadethdetalis.routeName,
                    arguments: Hadethcontent(
                        title: allhdethcontent[index].title,
                        content: allhdethcontent[index].content));
              },
              child: Text(
                allhdethcontent[index].title,
                textAlign: TextAlign.center,
              )),
          separatorBuilder: (context, index) => Divider(
            indent: 80,
            endIndent: 80,
            thickness: 1.5,
            color: theme.primaryColor,
            height: 10,
          ),
          itemCount: allhdethcontent.length,
        ))
      ],
    );
  }

  readfiles() async {
    String text = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allhadeth = text.split("#");
    for (int i = 0; i < allhadeth.length; i++) {
      String singlehadeth = allhadeth[i].trim();
      int indexoffirstline = singlehadeth.indexOf("\n");
      String title = singlehadeth.substring(0, indexoffirstline);
      String content = singlehadeth.substring(indexoffirstline + 1);
      Hadethcontent hadethcontent =
          Hadethcontent(title: title, content: content);
      allhdethcontent.add(hadethcontent);
      setState(() {});
    }
  }
}

class Hadethcontent {
  final String title;
  final String content;

  Hadethcontent({required this.title, required this.content});
}
